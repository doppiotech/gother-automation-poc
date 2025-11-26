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
