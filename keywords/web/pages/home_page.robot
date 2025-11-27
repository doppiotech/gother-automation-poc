*** Keywords ***
Click login or sign up button
    Browser.Click   ${home_locator.btn_log_in_or_sign_up}

Click one way button
    Browser.Click   ${home_locator.btn_one_way}

Click origin
    Browser.Click   ${home_locator.btn_origin}

Click destination
    Browser.Click   ${home_locator.btn_destination}

Click departure date
    Browser.Click   ${home_locator.btn_departure_date}

Click search button
    Browser.Click   ${home_locator.btn_search}

Select departure date
    Browser.Click   ${home_locator.btn_selected_departure_date}

Select origin airport
    Browser.Click   ${home_locator.txt_origin_airport}

Select destination airport
    Browser.Click   ${home_locator.txt_destination_airport}

# Need to verify this after
# User sees “One-way” tab on flights section with the following options : Origin, Destination,
# Change flight icon, Departure date, Passenger and classes, Search button