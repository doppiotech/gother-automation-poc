*** Keywords ***
Search flight
    [Arguments]     ${type}     ${origin}   ${destination}
    mobile_flight_page.Select flight type   ${type}
    mobile_flight_page.Select origin        ${origin}
    mobile_flight_page.Select destination   ${destination}
    mobile_flight_page.Tap search button
    mobile_flight_page.Verify searching best fare loading popup is displayed
    mobile_flight_page.Verify flight selection page is displayed

Select first flight and continue to payment page
    mobile_flight_page.Select flight by index
    mobile_flight_page.Tap continue button
    mobile_flight_page.Verify confirm booking button is displayed
    mobile_flight_page.Toggle use as passenger information button
    mobile_flight_page.Tap confirm booking button
    mobile_flight_page.Verify add-on service is displayed
    mobile_flight_page.Tap confirm booking button