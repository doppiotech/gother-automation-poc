*** Settings ***
Resource        ${CURDIR}/../../resources/import.robot

Test Setup      common_web.Gother web setup

*** Test Cases ***
Automation POC Test Cases - Book one way flight
    [Tags]      TC_WEB_POC_001
    home_page.Click login or sign up button
    # Login page
    login_feature.Login with email to home page successfully    email=${TC_WEB_POC_001.email}     password=${TC_WEB_POC_001.password}
    # Home page
    home_feature.Select one way and fill in the flight search information
    # Your flights page
    your_flights_page.Select first flight
    your_flights_page.Click continue button
    # Booking information page
    booking_information_page.Verify booking information label is displayed
    BuiltIn.Run Keyword And Ignore Error    booking_information_page.Click ok button in flight price changed modal
    booking_information_page.Click use as passenger information
    booking_information_page.Click confirm information button
    # Add on services page
    add_on_services_page.Verify add on services label is displayed
    add_on_services_page.Click confirm booking
    add_on_services_page.Click no thanks in travel insurance modal
    # Payment page
    payment_page.Verify please select payment method label is displayed
    payment_feature.Select credit card payment option and fill in the credit card details
    ...     card_no=${TC_WEB_POC_001.credit_card_payment.card_no}
    ...     card_holder_name=${TC_WEB_POC_001.credit_card_payment.card_holder_name}
    ...     expiry_date=${TC_WEB_POC_001.credit_card_payment.expiry_date}
    ...     cvv=${TC_WEB_POC_001.credit_card_payment.cvv}
    # Payment succes page
    payment_success_page.Verify payment successful is displayed
