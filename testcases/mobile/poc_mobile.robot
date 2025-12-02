*** Settings ***
Resource        ${CURDIR}/../../resources/import.robot
Variables       ${CURDIR}/../../resources/testdata/mobile/TC_001.yaml
Test Setup      common_mobile.Open application
Test Teardown   common_mobile.Close application

*** Test Cases ***
TC_001
    [Tags]      TC_001      poc_android
    mobile_login_feature.Login with email       ${TC_001.email}     ${TC_001.password}
    common_mobile.Tap menu by menu name         ${translation_mobile.menu.home}
    mobile_home_page.Tap home menu by menu name     ${translation_mobile.home_page.menu.flights}
    mobile_flight_feature.Search flight         ${translation_mobile.flight_page.flight_type.one_way}   ${TC_001.origin}    ${TC_001.destination}
    mobile_flight_feature.Select first flight and continue to payment page
    mobile_payment_feature.Make payment using credit card   ${TC_001.card_number}   ${TC_001.card_name}   ${TC_001.card_expiry_date}   ${TC_001.card_cvv_code}