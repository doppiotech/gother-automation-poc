*** Keywords ***
Tap log in or sign up button
    DobbyAppCommon.Tap element when ready           ${mobile_login_locator.btn_log_in_sign_up}

Verify log in or sign up page is displayed
    DobbyAppCommon.Wait until element is visible except stale       ${mobile_login_locator.lbl_log_in_sign_up_header}

Select log in or sign up option
    [Arguments]     ${option}
    common_mobile.Tap element with replace string   ${mobile_login_locator.btn_log_in_sign_up_option}   ${option}

Input email
    [Arguments]     ${email}
    DobbyAppCommon.Input text to element when ready     ${mobile_login_locator.txt_email}       ${email}

Input password
    [Arguments]     ${password}
    DobbyAppCommon.Input text to element when ready     ${mobile_login_locator.txt_password}    ${password}

Tap email log in button
    DobbyAppCommon.Tap element when ready           ${mobile_login_locator.btn_email_log_in}

Tap password log in button
    DobbyAppCommon.Tap element when ready           ${mobile_login_locator.btn_password_log_in}