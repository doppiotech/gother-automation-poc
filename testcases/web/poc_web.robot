*** Settings ***
Resource        ${CURDIR}/../../resources/import.robot

Test Setup      landing_page.Open gother web

*** Test Cases ***
TC_WEB_POC_001
    [Tags]      TC_WEB_POC_001
    log to console    hello
    DEBUG