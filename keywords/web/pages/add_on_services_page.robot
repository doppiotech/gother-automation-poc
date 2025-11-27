*** Keywords ***
Verify add on services label is displayed
    Browser.Wait for elements state     ${login_locator.lbl_add_on_services}

Click confirm booking
    Browser.Click       ${login_locator.btn_confirm_booking}

Click no thanks in travel insurance modal
    Browser.Click       ${login_locator.btn_no_thanks_insurance_modal}
