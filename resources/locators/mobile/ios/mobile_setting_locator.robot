*** Variables ***
${mobile_setting_locator.lbl_setting_header}                accessibility_id=${translation_mobile.setting_page.setting_header}
${mobile_setting_locator.btn_setting_2_lang}                xpath=//XCUIElementTypeStaticText[@name="${translation_mobile.setting_page.setting_menu_th}" or @name="${translation_mobile.setting_page.setting_menu_en}"]
${mobile_setting_locator.btn_language_2_lang}               xpath=//XCUIElementTypeStaticText[@name="${translation_mobile.setting_page.language_th}" or @name="${translation_mobile.setting_page.language_en}"]
${mobile_setting_locator.btn_back}                          predicate=type == "XCUIElementTypeButton" AND name == "ic_chevron_left"