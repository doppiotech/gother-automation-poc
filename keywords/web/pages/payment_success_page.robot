*** Keywords ***
Verify payment successful is displayed
    Browser.Wait For Elements State     ${payment_locator.lbl_payment_successful}
