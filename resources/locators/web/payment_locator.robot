*** Variables ***
${payment_locator.rdo_credit_card}       //input[@id = "CREDIT_RADIO"]
${payment_locator.txt_card_no}           //input[@id = "card_number_input_creditcard"]
${payment_locator.txt_card_holder_name}     //input[@id = "card_name_creditcard"]
${payment_locator.txt_expiry_date}      //input[@id = "expire_of_creditcard_creditcard"]
${payment_locator.txt_cvv}              //input[@id = "securityCode_creditcard"]
${payment_locator.btn_pay_now}          (//button[@id = "confirmBooking2" and text() = "Pay Now"])[1]
${payment_locator.lbl_please_select_payment_method}          //h2[text() = "Please Select Payment Method"]
