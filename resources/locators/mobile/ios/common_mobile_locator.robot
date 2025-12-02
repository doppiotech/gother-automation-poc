*** Variables ***
${common_mobile_locator.lbl_menu}                   accessibility_id=@#string@#
${common_mobile_locator.btn_profile_2_lang}         chain=**/XCUIElementTypeStaticText[`label == "${translation_mobile.menu.profile_th}" OR label == "${translation_mobile.menu.profile_en}"`]