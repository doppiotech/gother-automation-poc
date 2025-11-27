*** Keywords ***
Click email or mobile no button
    Browser.Click       ${login_locator.btn_email_or_mobile}

Click log in button
    Browser.Click       ${login_locator.btn_log_in}

Input email
    [Arguments]     ${email}
    Browser.Fill text       ${login_locator.txt_email}      ${email}

Input password
    [Arguments]     ${password}
    Browser.Fill text       ${login_locator.txt_password}     ${password}
