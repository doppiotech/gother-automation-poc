*** Keywords ***
Open application
    [Documentation]     Launch the mobile application with specified capabilities and optional alert handling.
    ...                 Arguments:
    ...                     - ${auto_allow_alert} (boolean, optional): Whether to auto-handle system alerts. Defaults to ${TRUE}.
    ...                     - ${no_reset} (boolean, optional): Whether to preserve app data. Defaults to ${FALSE}.
    [Arguments]    ${auto_allow_alert}=${TRUE}      ${no_reset}=${FALSE}
    BuiltIn.Set Library search order    DobbyAppCommon     AppiumLibrary
    IF      '${doppio_farm}'=='${TRUE}' and '${no_reset}'=='${FALSE}'
        ${pool_to_use}              BuiltIn.Evaluate    ${PABOTEXECUTIONPOOLID}
        ${delay_time}               BuiltIn.Evaluate    ${pool_to_use}*10
        BuiltIn.Sleep               ${delay_time}s
        DobbyAppCommon.Init mobile farm configuration
        ${wdaLocalPort_r}           random_utils.Random with range       ${pool_to_use}
        ${system_port}              BuiltIn.Set variable    ${wdaLocalPort_r}
        ${showXcodeLog}             BuiltIn.Set variable    ${wdaLocalPort_r}
        ${full_reset}               BuiltIn.Set variable    ${true}
    ELSE
        ${full_reset}               BuiltIn.Set variable    ${false}
    END
    IF    ${auto_allow_alert}
        ${value_autoGrantPermissions}    BuiltIn.Set variable    ${TRUE}
        ${value_autoAcceptAlerts}        BuiltIn.Set variable    ${TRUE}
        ${value_autoDismissAlerts}       BuiltIn.Set variable    ${TRUE}
    ELSE
        ${value_autoGrantPermissions}    BuiltIn.Set variable    ${FALSE}
        ${value_autoAcceptAlerts}        BuiltIn.Set variable    ${FALSE}
        ${value_autoDismissAlerts}       BuiltIn.Set variable    ${FALSE}
    END
    &{capability}       BuiltIn.Create dictionary
    ...                 appium:automationName=${automationName}
    ...                 appium:platformName=${platformName}
    ...                 appium:platformVersion=${platformVersion}
    ...                 appium:deviceName=${deviceName}
    ...                 appium:udid=${udid}
    ...                 appium:app=${app}
    ...                 newCommandTimeout=${0}
    ...                 autoGrantPermissions=${value_autoGrantPermissions}
    ...                 noReset=${no_reset}
    ...                 unicodeKeyboard=${FALSE}
    ...                 resetKeyboard=${FALSE}
    ...                 autoAcceptAlerts=${value_autoAcceptAlerts}
    ...                 autoDismissAlerts=${value_autoDismissAlerts}
    ...                 allowInvisibleElements=${TRUE}
    ...                 waitForIdleTimeout=${100}
    ...                 appium:appWaitDuration=${500000}
    ...                 appium:disableWindowAnimation=${TRUE}
    ...                 appium:fullReset=${full_reset}
    ...                 appium:adbExecTimeout=${200000}
    ...                 appium:isHeadless=${FALSE}
    ...                 appium:systemPort=${system_port}
    ...                 appium:uiautomator2ServerInstallTimeout=${90000}
    ...                 appium:uiautomator2ServerLaunchTimeout=${90000}
    IF  '${doppio_farm}'=='True' and '${platformName}'=='ios'
        Collections.Set to dictionary       ${capability}    
        ...     appium:showXcodeLog=${TRUE}
        ...     appium:wdaLocalPort=${system_port}
        ...     appium:usePrebuiltWDA=${TRUE}
    END
    BuiltIn.Log                 ${capability}
    BuiltIn.Log to console      ${capability}
    AppiumLibrary.Close all applications
    FOR     ${i}    IN RANGE    3
        ${is_app_open}      BuiltIn.Run keyword and return status       AppiumLibrary.Open application
        ...                 remote_url=${remote_url}
        ...                 &{capability}
        BuiltIn.Exit for loop if        ${is_app_open}
    END
    BuiltIn.Should be true  ${is_app_open}   msg="Failed to open the app after 3 retry"
    IF    '${no_reset}'=='False'
        common_mobile.Select language
    END

Close application
    [Documentation]     Close all opened mobile applications
    BuiltIn.Run keyword and ignore error    AppiumLibrary.Capture page screenshot
    AppiumLibrary.Close all applications

Tap profile menu without checking language
    [Documentation]     กดเมนูโปรไฟล์โดยไม่สนใจภาษา ใช้สำหรับตอนเปิด application เพื่อเปลี่ยนภาษา
    DobbyAppCommon.Tap element when ready       ${common_mobile_locator.btn_profile_2_lang}

Select language
    [Documentation]    Select a language from the language selection screen based on the configured language variable.
    common_mobile.Tap profile menu without checking language
    mobile_setting_page.Tap setting menu without checking language
    mobile_setting_page.Tap language button without checking language
    common_mobile.Tap menu by menu name     ${translation_mobile.setting_page.language}
    common_mobile.Verify menu is displayed  ${translation_mobile.menu.profile}

Tap element with replace string
    [Arguments]     ${locator}      ${replace_string}
    ${new_locator}      common.Replace string     ${locator}    replace_string=${replace_string}
    DobbyAppCommon.Tap element when ready    ${new_locator}

Verify element visible with replace string
    [Arguments]     ${locator}      ${replace_string}       ${timeout}=${GLOBAL_TIMEOUT}
    ${new_locator}      common.Replace string     ${locator}    replace_string=${replace_string}
    DobbyAppCommon.Wait until element is visible except stale    ${new_locator}    timeout=${timeout}

Tap menu by menu name
    [Arguments]    ${menu_name}
    common_mobile.Tap element with replace string    ${common_mobile_locator.lbl_menu}      ${menu_name}

Verify menu is displayed
    [Arguments]    ${menu_name}
    common_mobile.Verify element visible with replace string    ${common_mobile_locator.lbl_menu}   ${menu_name}

Swipe to find element
    [Documentation]            Swipe up until the specified element is found, or until scroll end.
    ...                        Arguments:
    ...                            - Locator of expected element ${locator}
    ...                            - Time out per swipe: ${timeout}=0.5s
    ...                            - Number of maximum attempts: ${max_attempts}=10
    ...                            - Point of starting swipe x axis (percent):   ${start_x}=50
    ...                            - Point of starting swipe y axis (percent):   ${start_y}=80
    ...                            - Point of ending swipe x axis (percent):     ${end_x}=50
    ...                            - Point of ending swipe y axis (percent):     ${end_y}=20
    ...                            - Duration of swipe (millisecond):            ${duration}=1000
    [Arguments]                ${locator}           ${timeout}=0.5          ${max_attempts}=10
    ...                        ${start_x}=50        ${start_y}=80           ${end_x}=50
    ...                        ${end_y}=20          ${duration}=1s
    ${is_visible}=              BuiltIn.Run keyword and return status      DobbyAppCommon.Wait until element is visible except stale    locator=${locator}     timeout=${timeout}
    FOR    ${i}    IN RANGE    ${max_attempts}
        BuiltIn.Exit for loop if    ${is_visible}
        DobbyAppCommon.Swipe up    ${start_x}    ${start_y}    ${end_x}    ${end_y}    ${duration}
        ${is_visible}=             BuiltIn.Run keyword and return status    DobbyAppCommon.Wait until element is visible except stale    locator=${locator}     timeout=${timeout}
    END
    BuiltIn.Should be true      ${is_visible}       msg=locator '${locator}' not found even after reaching scroll end