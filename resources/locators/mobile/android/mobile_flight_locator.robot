*** Variables ***
${mobile_flight_locator.lbl_flight_type}                android=UiSelector().className("android.widget.TextView").text("@#string@#")
${mobile_flight_locator.lbl_origin}                     android=UiSelector().className("android.widget.TextView").text("${translation_mobile.flight_page.origin}")
${mobile_flight_locator.lbl_destination}                android=UiSelector().className("android.widget.TextView").text("${translation_mobile.flight_page.destination}")
${mobile_flight_locator.txt_search_airport}             android=UiSelector().className("android.widget.EditText")
${mobile_flight_locator.lbl_airport}                    android=UiSelector().className("android.widget.TextView").textContains("@#string@#")
${mobile_flight_locator.btn_search}                     android=UiSelector().className("android.widget.TextView").text("${translation_mobile.flight_page.search}")
${mobile_flight_locator.lbl_flight_by_index}            xpath=(//android.widget.TextView[@text="${translation_mobile.flight_page.view_details}"]/following-sibling::android.widget.TextView)[@#index@#]
${mobile_flight_locator.btn_continue}                   android=UiSelector().className("android.widget.TextView").text("${translation_mobile.flight_page.continue_button}")
${mobile_flight_locator.btn_use_as_passenger_information}       xpath=//android.widget.TextView[@text="${translation_mobile.flight_page.use_as_passenger_information}"]/preceding-sibling::android.view.View[last()]
${mobile_flight_locator.btn_confirm_booking}            android=UiSelector().className("android.widget.TextView").text("${translation_mobile.flight_page.confirm_booking}")
${mobile_flight_locator.lbl_searching_best_fare}        android=UiSelector().className("android.widget.TextView").text("${translation_mobile.flight_page.searching_best_fare}")
${mobile_flight_locator.lbl_your_flight}                android=UiSelector().className("android.widget.TextView").text("${translation_mobile.flight_page.your_flight}")
${mobile_flight_locator.lbl_add_on_service}             android=UiSelector().className("android.widget.TextView").text("${translation_mobile.flight_page.add_on_service}")
${mobile_flight_locator.lbl_flight_price_changed}       android=UiSelector().className("android.widget.TextView").text("${translation_mobile.flight_page.flight_price_changed}")