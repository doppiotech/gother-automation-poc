*** Keywords ***
Make payment using credit card
    [Arguments]     ${card_number}      ${name}     ${expiry_date}      ${cvv_code}
    mobile_payment_page.Select credit card payment method
    mobile_payment_page.Input card number           ${card_number}
    mobile_payment_page.Input cardholder name       ${name}
    mobile_payment_page.Input card expiry date      ${expiry_date}
    mobile_payment_page.Input card cvv code         ${cvv_code}
    mobile_payment_page.Tap pay now button
    mobile_payment_page.Verify payment successful message is displayed