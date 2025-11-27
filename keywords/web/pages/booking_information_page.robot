*** Keywords ***
Verify booking information label is displayed
    Browser.Wait for elements state    ${booking_information_locator.lbl_booking_information}

Click ok button in flight price changed modal
    Browser.Click       ${booking_information_locator.lbl_flight_price_changed}

Click use as passenger information
    Browser.Click       ${booking_information_locator.btn_use_as_passenger_info}

Click confirm information button
    Browser.Click       ${booking_information_locator.btn_flight_booking}

Click accecpt all cookies
    Browser.Click       ${booking_information_locator.btn_accept_all_cookies}