*** Keywords ***
Verify please select payment method label is displayed
    Browser.Wait For Elements State        ${payment_locator.lbl_please_select_payment_method}

Select credit card
    Browser.Click       ${payment_locator.rdo_credit_card}

Input card number
    [Arguments]     ${card_no}
    Browser.Fill text       ${payment_locator.txt_card_no}     ${card_no}
    
Input card holder name
    [Arguments]     ${card_holder_name}
    Browser.Fill text       ${payment_locator.txt_card_holder_name}     ${card_holder_name}
    
Input expiry date
    [Arguments]     ${expiry_date}
    Browser.Fill text       ${payment_locator.txt_expiry_date}     ${expiry_date}
    
Input cvv
    [Arguments]     ${cvv}
    Browser.Fill text       ${payment_locator.txt_cvv}    ${cvv}

Click pay now button
    Browser.Click           ${payment_locator.btn_pay_now} 
