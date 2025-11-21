*** Keywords ***
Open MCS web
    [Documentation]    This kw will navigate to MCS website
    ...                Argument:
    ...                    - ${headless_mode}    (bool) เปิด Browser ในโหมดไร้หน้าต่าง (No GUI): ${True} or ${False}
    [Arguments]        ${headless_mode}=${headless}
    common.Open web browser by url    url=${mcs_web.url}    headless_mode=${headless_mode}

Close image modal
    [Documentation]    Click button close image modal on MCS website
    Browser.Click      selector=${mcs_locator.btn_close_modal}

Input username
    [Documentation]    Input a username into login textfield
    ...                Arguments:
    ...                    - ${username}    (string)    : automate
    [Arguments]        ${username}
    Browser.Fill text       selector=${mcs_locator.txt_username}     txt=${username}

Input password
    [Documentation]    Input a password into login textfield
    ...                Arguments:
    ...                    - ${password}(string): Password1234
    [Arguments]        ${password}
    Browser.Fill text       selector=${mcs_locator.txt_password}     txt=${password}

Click login button
    [Documentation]    Click login button on MCS website
    Browser.Click      selector=${mcs_locator.btn_login}

Select employer code
    [Documentation]    Select employer code on MCS website
    ...                Arguments:
    ...                    - ${code}    (integer)    : 10
    [Arguments]        ${code}
    Browser.Select options by       selector=${mcs_locator.ddl_employer_code}    attribute=value       values=${code}

Click employer login
    [Documentation]    Click employer login button on MCS website
    Browser.Click      selector=${mcs_locator.btn_employer_login}
