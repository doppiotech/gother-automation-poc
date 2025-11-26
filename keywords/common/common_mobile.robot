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

Close application
    [Documentation]     Close all opened mobile applications
    BuiltIn.Run keyword and ignore error    AppiumLibrary.Capture page screenshot
    AppiumLibrary.Close all applications