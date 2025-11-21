*** Keywords ***
Open and login MCS web with employer code
    [Documentation]    This kw will login into MCS website which required ${account},${employer_code}
    ...                Arguments:
    ...                    - ${username}        (string)        :    autotest
    ...                    - ${password}        (string)        :    Password123
    ...                    - ${employer_code}    (integer)      :    10
    [Arguments]     ${employer_code}    ${username}      ${password}
    mcs_page.Open MCS web
    BuiltIn.Run keyword and ignore error    mcs_page.Close image modal
    mcs_page.Input username                 username=${username}
    mcs_page.Input password                 password=${password}
    mcs_page.Click login button
    mcs_page.Select employer code           code=${employer_code}
    mcs_page.Click employer login
