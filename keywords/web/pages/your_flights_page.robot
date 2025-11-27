*** Keywords ***
# Verify label we are finding the best flight is displayed
Select first flight
    Browser.Click   ${your_flighs_locator.btn_first_flight} 

Click continue button
    Browser.Click   ${your_flighs_locator.btn_continue} 
