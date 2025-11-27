*** Variables ***
${common_mobile_locator.lbl_menu}                   android=UiSelector().className("android.widget.TextView").text("@#string@#")
${common_mobile_locator.btn_profile_2_lang}         xpath=//android.widget.TextView[@text="${translation_mobile.menu.profile_th}" or @text="${translation_mobile.menu.profile_en}"]