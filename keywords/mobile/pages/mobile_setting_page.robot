*** Keywords ***
Verify setting page is displayed
    DobbyAppCommon.Wait until element is visible except stale            ${mobile_setting_locator.lbl_setting_header}

Tap setting menu without checking language
    DobbyAppCommon.Tap element when ready       ${mobile_setting_locator.btn_setting_2_lang}

Tap language button without checking language
    DobbyAppCommon.Tap element when ready       ${mobile_setting_locator.btn_language_2_lang}