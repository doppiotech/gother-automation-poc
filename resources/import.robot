*** Settings ***
Library    BuiltIn
Library    String
Library    Collections
Library    OperatingSystem
Library    DateTime
Library    Process
Library    Browser
Library    RequestsLibrary
Library    JSONLibrary
Library    DebugLibrary
Library    pabot.PabotLib
Library    DatabaseLibrary
Library    yaml
Library    SeleniumLibrary    run_on_failure=NOTHING
Library    AppiumLibrary    run_on_failure=No Operation

### Setting ###
Variables   ${CURDIR}/settings/setting_web.yaml
# Variables   ${CURDIR}/settings/setting_mobile.yaml

### Translation ###
Variables   ${CURDIR}/translation/mobile/${LANG.lower()}.yaml
Variables   ${CURDIR}/translation/web/${LANG.lower()}.yaml

### Test Data ###
Variables   ${CURDIR}/testdata/web/testdata.yaml

### Common ###
Resource    ${CURDIR}/../keywords/common/common.robot
Resource    ${CURDIR}/../keywords/common/common_web.robot
Resource    ${CURDIR}/../keywords/common/common_mobile.robot

### Web Page ###
Resource    ${CURDIR}/../keywords/web/pages/home_page.robot
Resource    ${CURDIR}/../keywords/web/pages/login_page.robot
Resource    ${CURDIR}/../keywords/web/pages/your_flights_page.robot
Resource    ${CURDIR}/../keywords/web/pages/payment_page.robot
Resource    ${CURDIR}/../keywords/web/pages/booking_information_page.robot
Resource    ${CURDIR}/../keywords/web/pages/add_on_services_page.robot
Resource    ${CURDIR}/../keywords/web/pages/payment_success_page.robot

### Web Feature ###
Resource    ${CURDIR}/../features/web/features/login_feature.robot
Resource    ${CURDIR}/../features/web/features/payment_feature.robot
Resource    ${CURDIR}/../features/web/features/home_feature.robot

### Web Locator ###
Resource    ${CURDIR}/locators/web/home_locator.robot
Resource    ${CURDIR}/locators/web/login_locator.robot
Resource    ${CURDIR}/locators/web/your_flights_locator.robot
Resource    ${CURDIR}/locators/web/payment_locator.robot
Resource    ${CURDIR}/locators/web/booking_information_locator.robot
Resource    ${CURDIR}/locators/web/add_on_services_locator.robot
Resource    ${CURDIR}/locators/web/payment_success_locator.robot
