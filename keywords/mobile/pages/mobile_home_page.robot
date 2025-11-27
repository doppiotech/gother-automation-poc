*** Keywords ***
Tap home menu by menu name
    [Arguments]     ${menu}
    common_mobile.Tap element with replace string       ${mobile_home_locator.lbl_home_menu}        ${menu}