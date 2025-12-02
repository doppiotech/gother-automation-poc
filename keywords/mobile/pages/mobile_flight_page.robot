*** Keywords ***
Select flight type
    [Arguments]     ${type}
    common_mobile.Tap element with replace string       ${mobile_flight_locator.lbl_flight_type}        ${type}

Select origin
    [Arguments]     ${name}
    DobbyAppCommon.Tap element when ready               ${mobile_flight_locator.lbl_origin}
    DobbyAppCommon.Input text to element when ready     ${mobile_flight_locator.txt_search_airport}     ${name}
    common_mobile.Tap element with replace string       ${mobile_flight_locator.lbl_airport}            ${name}

Select destination
    [Arguments]     ${name}
    DobbyAppCommon.Tap element when ready               ${mobile_flight_locator.lbl_destination}
    DobbyAppCommon.Input text to element when ready     ${mobile_flight_locator.txt_search_airport}     ${name}
    common_mobile.Tap element with replace string       ${mobile_flight_locator.lbl_airport}            ${name}

Tap search button
    DobbyAppCommon.Tap element when ready               ${mobile_flight_locator.btn_search}

Select flight by index
    [Arguments]     ${index}=1
    ${new_locator}      common.Replace string           ${mobile_flight_locator.lbl_flight_by_index}    index=${index}
    DobbyAppCommon.Tap element when ready               ${new_locator}

Tap continue button
    DobbyAppCommon.Tap element when ready               ${mobile_flight_locator.btn_continue}

Toggle use as passenger information button
    common_mobile.Swipe to find element                 ${mobile_flight_locator.btn_use_as_passenger_information}
    DobbyAppCommon.Tap element when ready               ${mobile_flight_locator.btn_use_as_passenger_information}

Tap confirm booking button
    DobbyAppCommon.Tap element when ready               ${mobile_flight_locator.btn_confirm_booking}

Verify confirm booking button is displayed
    DobbyAppCommon.Wait until element is visible except stale       ${mobile_flight_locator.btn_confirm_booking}

Verify searching best fare loading popup is displayed
    DobbyAppCommon.Wait until element is visible except stale       ${mobile_flight_locator.lbl_searching_best_fare}

Verify flight selection page is displayed
    DobbyAppCommon.Wait until element is visible except stale       ${mobile_flight_locator.lbl_your_flight}

Verify add-on service is displayed
    DobbyAppCommon.Wait until element is visible except stale       ${mobile_flight_locator.lbl_add_on_service}

Check flight price changed popup and continue
    ${visible}      BuiltIn.Run keyword and return status       DobbyAppCommon.Wait until element is visible except stale       ${mobile_flight_locator.lbl_flight_price_changed}       timeout=5
    BuiltIn.Run keyword if      ${visible}      mobile_flight_page.Tap continue button