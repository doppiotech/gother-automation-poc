*** Keywords ***
Select credit card payment method
    common_mobile.Find and tap element when ready       ${mobile_payment_locator.rdo_credit_card}

Input card number
    [Arguments]     ${card_number}
    common_mobile.Find and input text to element when ready     ${mobile_payment_locator.txt_card_number}       ${card_number}

Input cardholder name
    [Arguments]     ${name}
    common_mobile.Find and input text to element when ready     ${mobile_payment_locator.txt_card_name}         ${name}

Input card expiry date
    [Arguments]     ${expiry_date}
    IF      '${PLATFORM.lower()}'=='ios'
        ${expiry_date}      String.Replace string       ${expiry_date}      search_for=/    replace_with=${EMPTY}
    END
    common_mobile.Find and input text to element when ready     ${mobile_payment_locator.txt_card_expiry_date}  ${expiry_date}

Input card cvv code
    [Arguments]     ${cvv_code}
    common_mobile.Find and input text to element when ready     ${mobile_payment_locator.txt_card_cvv}          ${cvv_code}

Tap pay now button
    common_mobile.Find and tap element when ready       ${mobile_payment_locator.btn_pay_now}

Verify payment successful message is displayed
    DobbyAppCommon.Wait until element is visible except stale   ${mobile_payment_locator.lbl_payment_successful}