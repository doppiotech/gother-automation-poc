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

# Dobby
Resource    DobbyCommonLibrary/DobbyCommon.robot
Resource    DobbyCommonLibrary/DobbyWebCommon.robot
Resource    DobbyCommonLibrary/DobbyAppCommon.robot

### Setting ###
Variables   ${CURDIR}/settings/setting_web.yaml
Variables   ${CURDIR}/settings/setting_mobile.yaml
Variables   ${CURDIR}/settings/common_setting.yaml

### Mobile config ###
Variables   ${CURDIR}/settings/config/${PLATFORM.lower()}_config.yaml

### Translation ###
Variables   ${CURDIR}/translation/mobile/${LANG.lower()}.yaml
Variables   ${CURDIR}/translation/web/${LANG.lower()}.yaml

### Common ###
Resource    ${CURDIR}/../keywords/common/common.robot
Resource    ${CURDIR}/../keywords/common/common_web.robot
Resource    ${CURDIR}/../keywords/common/common_mobile.robot

### Web Page ###
Resource    ${CURDIR}/../keywords/web/pages/landing_page.robot

### Web Feature ###

### Mobile Page ###
Resource    ${CURDIR}/../keywords/mobile/pages/mobile_setting_page.robot
Resource    ${CURDIR}/../keywords/mobile/pages/mobile_login_page.robot
Resource    ${CURDIR}/../keywords/mobile/pages/mobile_home_page.robot
Resource    ${CURDIR}/../keywords/mobile/pages/mobile_flight_page.robot
Resource    ${CURDIR}/../keywords/mobile/pages/mobile_payment_page.robot

### Mobile Feature ###
Resource    ${CURDIR}/../keywords/mobile/features/mobile_login_feature.robot
Resource    ${CURDIR}/../keywords/mobile/features/mobile_flight_feature.robot
Resource    ${CURDIR}/../keywords/mobile/features/mobile_payment_feature.robot

### Mobile Locator ###
Resource    ${CURDIR}/locators/mobile/${PLATFORM.lower()}/common_mobile_locator.robot
Resource    ${CURDIR}/locators/mobile/${PLATFORM.lower()}/mobile_setting_locator.robot
Resource    ${CURDIR}/locators/mobile/${PLATFORM.lower()}/mobile_login_locator.robot
Resource    ${CURDIR}/locators/mobile/${PLATFORM.lower()}/mobile_home_locator.robot
Resource    ${CURDIR}/locators/mobile/${PLATFORM.lower()}/mobile_flight_locator.robot
Resource    ${CURDIR}/locators/mobile/${PLATFORM.lower()}/mobile_payment_locator.robot