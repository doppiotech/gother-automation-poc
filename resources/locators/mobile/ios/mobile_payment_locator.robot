*** Variables ***
${mobile_payment_locator.rdo_credit_card}           predicate=type == "XCUIElementTypeStaticText" AND name == "${translation_mobile.payment_page.payment_method.credit_debit}"
${mobile_payment_locator.txt_card_number}           predicate=type == "XCUIElementTypeTextField" AND name == "${translation_mobile.payment_page.txt_card_number}"
${mobile_payment_locator.txt_card_name}             predicate=type == "XCUIElementTypeTextField" AND name == "${translation_mobile.payment_page.txt_card_name}"
${mobile_payment_locator.txt_card_expiry_date}      predicate=type == "XCUIElementTypeTextField" AND name == "${translation_mobile.payment_page.txt_card_expiry_date}"
${mobile_payment_locator.txt_card_cvv}              predicate=type == "XCUIElementTypeSecureTextField" AND name == "${translation_mobile.payment_page.txt_card_cvv}"
${mobile_payment_locator.btn_pay_now}               accessibility_id=${translation_mobile.payment_page.pay_now}
${mobile_payment_locator.lbl_payment_successful}    accessibility_id=${translation_mobile.payment_page.payment_successful}
