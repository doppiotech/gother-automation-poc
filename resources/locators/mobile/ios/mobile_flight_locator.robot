*** Variables ***
${mobile_flight_locator.lbl_flight_type}                accessibility_id=@#string@#
${mobile_flight_locator.lbl_origin}                     predicate=type == "XCUIElementTypeButton" AND name == "${translation_mobile.flight_page.origin}"
${mobile_flight_locator.lbl_destination}                predicate=type == "XCUIElementTypeButton" AND name == "${translation_mobile.flight_page.destination}"
${mobile_flight_locator.txt_search_airport}             predicate=type == "XCUIElementTypeTextField"
${mobile_flight_locator.lbl_airport}                    predicate=type == "XCUIElementTypeStaticText" AND name CONTAINS "@#string@#"
${mobile_flight_locator.btn_search}                     predicate=type == "XCUIElementTypeButton" AND name == "${translation_mobile.flight_page.search}"
${mobile_flight_locator.lbl_flight_by_index}            xpath=(//XCUIElementTypeStaticText[@name="${translation_mobile.flight_page.view_details}"]/following-sibling::XCUIElementTypeStaticText)[@#index@#]
${mobile_flight_locator.btn_continue}                   accessibility_id=${translation_mobile.flight_page.continue_button}
${mobile_flight_locator.btn_use_as_passenger_information}       predicate=type == "XCUIElementTypeSwitch"
${mobile_flight_locator.btn_confirm_booking}            accessibility_id=${translation_mobile.flight_page.confirm_booking}
${mobile_flight_locator.lbl_searching_best_fare}        accessibility_id=${translation_mobile.flight_page.searching_best_fare}
${mobile_flight_locator.lbl_your_flight}                accessibility_id=${translation_mobile.flight_page.your_flight}
${mobile_flight_locator.lbl_add_on_service}             accessibility_id=${translation_mobile.flight_page.add_on_service}
${mobile_flight_locator.lbl_flight_price_changed}       accessibility_id=${translation_mobile.flight_page.flight_price_changed}