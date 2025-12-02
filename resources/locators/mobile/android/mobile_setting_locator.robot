*** Variables ***
${mobile_setting_locator.lbl_setting_header}                android=UiSelector().className("android.widget.TextView").text("${translation_mobile.setting_page.setting_header}")
${mobile_setting_locator.btn_setting_2_lang}                xpath=//android.widget.TextView[@text="${translation_mobile.setting_page.setting_menu_th}" or @text="${translation_mobile.setting_page.setting_menu_en}"]
${mobile_setting_locator.btn_language_2_lang}               xpath=//android.widget.TextView[@text="${translation_mobile.setting_page.language_th}" or @text="${translation_mobile.setting_page.language_en}"]
${mobile_setting_locator.btn_back}                          mock