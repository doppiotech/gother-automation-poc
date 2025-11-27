*** Keywords ***
Login with email
    [Arguments]     ${email}    ${password}
    mobile_login_page.Tap log in or sign up button
    mobile_login_page.Select log in or sign up option       ${translation_mobile.login_page.option.email_mobile}
    mobile_login_page.Verify log in or sign up page is displayed
    mobile_login_page.Input email       ${email}
    mobile_login_page.Tap email log in button
    mobile_login_page.Input password    ${password}
    mobile_login_page.Tap password log in button
    common_mobile.Verify menu is displayed      ${translation_mobile.menu.profile}