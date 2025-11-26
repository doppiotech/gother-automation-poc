import os
import requests
import base64
from cryptography.fernet import Fernet
from robot.api import logger

class AzkabanSecrets():
    def __init__(self) -> None:
        pass
    def __decrypt_secret_value(self,encMessage,folder_uuid):
        try:
            encrypt_key = str(folder_uuid).replace('-','')
            encrypt_key = encrypt_key.encode('utf-8')
            base64_bytes = base64.b64encode(encrypt_key) 
            fernet = Fernet(base64_bytes)
            decMessage = fernet.decrypt(encMessage)
            return decMessage.decode('utf-8')
        except Exception as e:
            print(e)
            return None

    def __login_to_azkaban(self,url):
        __AZAKABAN_USERNAME = os.environ.get("AZAKABAN_USERNAME")
        __AZAKABAN_PASSWORD = os.environ.get("AZAKABAN_PASSWORD")

        url = f"{url}/login"
        login_payload = {
            "username": __AZAKABAN_USERNAME,
            "password":__AZAKABAN_PASSWORD
        }
        response = requests.post(url, json=login_payload)
        logger.info(f"Login result: {response.json()}")
        access_token_cookie = response.cookies.get('access_token_cookie')
        refresh_token_cookie = response.cookies.get('refresh_token_cookie')
        return response,access_token_cookie,refresh_token_cookie

    def __get_secret_by_secret_key(self,url,access_token_cookie,refresh_token_cookie,folder_uuid,secret_key):
        url = f"{url}/get_secret_by_key"
        params = {
            'folder_uuid': folder_uuid,
            'secret_key': secret_key
        }
        cookies = {
            'access_token_cookie': access_token_cookie,
            'refresh_token_cookie': refresh_token_cookie
        }
            
        response = requests.get(url,params=params,cookies=cookies)

        rsp_json = response.json()
        encrypted_secret_value = rsp_json['secret_value']
        folder_uuid = rsp_json['folder_uuid']
        plain_secret_value = self.__decrypt_secret_value(encMessage=encrypted_secret_value,folder_uuid=folder_uuid)
        rsp_json['secret_value'] = plain_secret_value
        return rsp_json

    def __get_all_secrets_in_project(self,url,access_token_cookie,refresh_token_cookie,project_uuid):
        url = f"{url}/get_all_secrets_in_project"
        params = {
            'project_uuid': project_uuid
        }
        cookies = {
            'access_token_cookie': access_token_cookie,
            'refresh_token_cookie': refresh_token_cookie
        }
            
        response = requests.get(url,params=params,cookies=cookies)
        
        rsp_json = response.json()
        secret_list = rsp_json['secret_list']
        for secret in secret_list:
            all_secret_in_folder = secret['secret_list']
            folder_uuid = secret['folder_uuid']
            for each_secret in all_secret_in_folder:
                encrypted_secret_value = each_secret['secret_value']
                plain_secret_value = self.__decrypt_secret_value(encMessage=encrypted_secret_value,folder_uuid=folder_uuid)
                each_secret['secret_value'] = plain_secret_value
        return rsp_json

    def __get_secret_by_secret_uuid(self,url,access_token_cookie,refresh_token_cookie,secret_uuid):
        url = f"{url}/secret"
        params = {
            'secret_uuid': secret_uuid
        }
        cookies = {
            'access_token_cookie': access_token_cookie,
            'refresh_token_cookie': refresh_token_cookie
        }
            
        response = requests.get(url,params=params,cookies=cookies)
        rsp_json = response.json()

        encrypted_secret_value = rsp_json['secret_value']
        folder_uuid = rsp_json['folder_uuid']
        plain_secret_value = self.__decrypt_secret_value(encMessage=encrypted_secret_value,folder_uuid=folder_uuid)
        rsp_json['secret_value'] = plain_secret_value
        return rsp_json

    def __get_all_secrets_in_folder(self,url,access_token_cookie,refresh_token_cookie,folder_uuid):
        url = f"{url}/folder"
        params = {
            'folder_uuid': folder_uuid
        }
        cookies = {
            'access_token_cookie': access_token_cookie,
            'refresh_token_cookie': refresh_token_cookie
        }
            
        response = requests.get(url,params=params,cookies=cookies)
        rsp_json = response.json()
        secret_list = rsp_json['secret_list']
        folder_uuid = rsp_json['folder_uuid']
        for secret in secret_list:
            encrypted_secret_value = secret['secret_value']
            plain_secret_value = self.__decrypt_secret_value(encMessage=encrypted_secret_value,folder_uuid=folder_uuid)
            secret['secret_value'] = plain_secret_value

        return rsp_json


    def get_secrets_from_azkaban(self,project_uuid=None,folder_uuid=None,secret_uuid=None,secret_key=None):
        logger.info("get_secrets_from_azkaban")
        __AZAKABAN_URL = os.environ.get("AZAKABAN_URL")
        response,access_token_cookie,refresh_token_cookie = self.__login_to_azkaban(__AZAKABAN_URL)
        if response.status_code != 200:
            return "Login failed"
        elif response.status_code == 200:
            if secret_key:
                if not folder_uuid:
                    return "folder_uuid is required when getting secret by key"
                elif folder_uuid:
                    response = self.__get_secret_by_secret_key(__AZAKABAN_URL
                                                ,access_token_cookie=access_token_cookie
                                                ,refresh_token_cookie=refresh_token_cookie
                                                ,folder_uuid=folder_uuid
                                                ,secret_key=secret_key)
                    return response
                
            elif secret_uuid:
                response = self.__get_secret_by_secret_uuid(__AZAKABAN_URL
                                                ,access_token_cookie=access_token_cookie
                                                ,refresh_token_cookie=refresh_token_cookie
                                                ,secret_uuid=secret_uuid)
                return response
            
            elif folder_uuid:
                response = self.__get_all_secrets_in_folder(__AZAKABAN_URL
                                                    ,access_token_cookie=access_token_cookie
                                                    ,refresh_token_cookie=refresh_token_cookie
                                                    ,folder_uuid=folder_uuid)
                return response
            
            elif project_uuid:
                response = self.__get_all_secrets_in_project(__AZAKABAN_URL
                                                    ,access_token_cookie=access_token_cookie
                                                    ,refresh_token_cookie=refresh_token_cookie
                                                    ,project_uuid=project_uuid)
                return response
            else:
                return "project_uuid or folder_uuid or secret_uuid or secret_key is required"