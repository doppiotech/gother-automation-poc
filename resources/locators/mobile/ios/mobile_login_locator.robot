*** Variables ***
${mobile_login_locator.btn_log_in_sign_up}              predicate=type == "XCUIElementTypeButton" AND name == "${translation_mobile.login_page.log_in_sign_up}"
${mobile_login_locator.lbl_log_in_sign_up_header}       accessibility_id=${translation_mobile.login_page.log_in_sign_up}
${mobile_login_locator.btn_log_in_sign_up_option}       predicate=type == "XCUIElementTypeButton" AND name == "@#string@#"
${mobile_login_locator.txt_email}                       xpath=//XCUIElementTypeStaticText[@name="${translation_mobile.login_page.email}"]/following-sibling::XCUIElementTypeTextField
${mobile_login_locator.txt_password}                    xpath=//XCUIElementTypeStaticText[@name="${translation_mobile.login_page.password}"]/following-sibling::XCUIElementTypeTextField
${mobile_login_locator.btn_email_log_in}                accessibility_id=${translation_mobile.login_page.email_log_in}
${mobile_login_locator.btn_password_log_in}             accessibility_id=${translation_mobile.login_page.password_log_in}