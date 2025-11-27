*** Keywords ***
Select credit card payment option and fill in the credit card details
    [Arguments]     ${card_no}   ${card_holder_name}     ${expiry_date}      ${cvv}
    payment_page.Select credit card
    payment_page.Input card number      ${card_no}
    payment_page.Input card holder name     ${card_holder_name}
    payment_page.Input expiry date      ${expiry_date}
    payment_page.Input cvv      ${cvv}
    payment_page.Click pay now button
