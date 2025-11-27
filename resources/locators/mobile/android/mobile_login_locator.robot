*** Variables ***
${mobile_login_locator.btn_log_in_sign_up}              android=UiSelector().className("android.widget.TextView").text("${translation_mobile.login_page.log_in_sign_up}")
${mobile_login_locator.lbl_log_in_sign_up_header}       android=UiSelector().className("android.widget.TextView").text("${translation_mobile.login_page.log_in_sign_up}")
${mobile_login_locator.btn_log_in_sign_up_option}       android=UiSelector().className("android.widget.TextView").text("@#string@#")
${mobile_login_locator.txt_email}                       xpath=//android.widget.TextView[@text="${translation_mobile.login_page.email}"]/following-sibling::android.view.View//android.widget.EditText
${mobile_login_locator.txt_password}                    xpath=//android.widget.TextView[@text="${translation_mobile.login_page.password}"]/following-sibling::android.view.View//android.widget.EditText
${mobile_login_locator.btn_email_log_in}                android=UiSelector().className("android.widget.TextView").text("${translation_mobile.login_page.email_log_in}")
${mobile_login_locator.btn_password_log_in}             xpath=//android.widget.TextView[@text="${translation_mobile.login_page.password}"]/following-sibling::android.view.View//android.widget.TextView[@text="${translation_mobile.login_page.password_log_in}"]