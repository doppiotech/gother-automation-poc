*** Variables ***
${mobile_payment_locator.rdo_credit_card}           android=UiSelector().resourceId("CREDIT_RADIO")
${mobile_payment_locator.txt_card_number}           android=UiSelector().resourceId("card_number_input_creditcard")
${mobile_payment_locator.txt_card_name}             android=UiSelector().resourceId("card_name_creditcard")
${mobile_payment_locator.txt_card_expiry_date}      android=UiSelector().resourceId("expire_of_creditcard_creditcard")
${mobile_payment_locator.txt_card_cvv}              android=UiSelector().resourceId("securityCode_creditcard")
${mobile_payment_locator.btn_pay_now}               android=UiSelector().resourceId("confirmBooking2")