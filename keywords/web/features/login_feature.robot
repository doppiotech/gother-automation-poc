*** Keywords ***
Login with email to home page successfully
    [Arguments]     ${email}     ${password}
    login_page.Click email or mobile no button
    login_page.Input email      ${email}
    login_page.Click log in button
    login_page.Input password   ${password}
    login_page.Click log in button
