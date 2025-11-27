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

Select date by swipe
    [Documentation]     Swipe date, month and year to expected value
    ...                 Arguments
    ...                     - expected_date: Expected date Ex. 16
    ...                     - expected_month: Expected month Ex. December
    ...                     - expected_year: Expected year Ex. 1997
    ...                     - date_locator: Current date value locator Ex. //android.view.View[android.widget.TextView[@text="Choose birthday"]]/following-sibling::android.view.View[1]/android.widget.TextView
    ...                     - month_locator: Current month value locator Ex. //android.view.View[android.widget.TextView[@text="Choose birthday"]]/following-sibling::android.view.View[3]/android.widget.TextView
    ...                     - year_locator: Current year value locator Ex. //android.view.View[android.widget.TextView[@text="Choose birthday"]]/following-sibling::android.view.View[5]/android.widget.TextView
    ...                 Remark: ตอนนี้ไม่มี id หรือ xpath ที่ระบุได้ชัดเจนว่า current value คืออะไร ทำให้มีโอกาสเลื่อนเพี้ยน
    [Arguments]     ${expected_date}     ${expected_month}     ${expected_year}    ${date_locator}     ${month_locator}        ${year_locator}      ${extra_retry}=5
    ${actual_year}      DobbyAppCommon.Get text from element when ready         ${year_locator}
    ${year_dif}         BuiltIn.Evaluate    int(${expected_year}) - int(${actual_year})
    IF      ${year_dif}>=0
        FOR     ${i}    IN RANGE    ${year_dif}
        # FOR     ${i}    IN RANGE    ${year_dif}+${extra_retry}
        #     ${actual_year}      DobbyAppCommon.Get text from element when ready         ${year_locator}
        #     BuiltIn.Exit for loop if        '${actual_year}'=='${expected_year}'
            common_mobile.Swipe up year
        END
    ELSE
        FOR     ${i}    IN RANGE    ${year_dif}         0
        # FOR     ${i}    IN RANGE    ${year_dif}-${extra_retry}      0
            # ${actual_year}      DobbyAppCommon.Get text from element when ready         ${year_locator}
            # BuiltIn.Exit for loop if        '${actual_year}'=='${expected_year}'
            common_mobile.Swipe down year
        END
    END
    ${actual_month}     DobbyAppCommon.Get text from element when ready         ${month_locator}
    ${month_dif}        BuiltIn.Evaluate    int(__import__('datetime').datetime.strptime("${expected_month}".title(), '%B').month) - int(__import__('datetime').datetime.strptime("${actual_month}".title(), '%B').month)
    IF      ${month_dif}>=0
        FOR     ${i}    IN RANGE    ${month_dif}
        # FOR     ${i}    IN RANGE    ${month_dif}+${extra_retry}
            # ${actual_month}     DobbyAppCommon.Get text from element when ready         ${month_locator}
            # BuiltIn.Exit for loop if        '${actual_month}'=='${expected_month}'
            common_mobile.Swipe up month
        END
    ELSE
        FOR     ${i}    IN RANGE    ${month_dif}        0
        # FOR     ${i}    IN RANGE    ${month_dif}-${extra_retry}     0
            # ${actual_month}     DobbyAppCommon.Get text from element when ready         ${month_locator}
            # BuiltIn.Exit for loop if        '${actual_month}'=='${expected_month}'
            common_mobile.Swipe down month
        END
    END
    ${actual_date}      DobbyAppCommon.Get text from element when ready         ${date_locator}
    ${date_dif}         BuiltIn.Evaluate    int(${expected_date}) - int(${actual_date})
    IF      ${date_dif}>=0
        FOR     ${i}    IN RANGE    ${date_dif}
        # FOR     ${i}    IN RANGE    ${date_dif}+${extra_retry}
            # ${actual_date}      DobbyAppCommon.Get text from element when ready         ${date_locator}
            # BuiltIn.Exit for loop if        '${actual_date}'=='${expected_date}'
            common_mobile.Swipe up date
        END
    ELSE
        FOR     ${i}    IN RANGE    ${date_dif}         0
        # FOR     ${i}    IN RANGE    ${date_dif}-${extra_retry}      0
            # ${actual_date}      DobbyAppCommon.Get text from element when ready         ${date_locator}
            # BuiltIn.Exit for loop if        '${actual_date}'=='${expected_date}'
            common_mobile.Swipe down date
        END
    END
    ${actual_date}      DobbyAppCommon.Get text from element when ready         ${date_locator}
    ${actual_month}     DobbyAppCommon.Get text from element when ready         ${month_locator}
    ${actual_year}      DobbyAppCommon.Get text from element when ready         ${year_locator}
    BuiltIn.Should be equal     ${actual_date}          ${expected_date}        msg=Date after swipe not match with expected. "${actual_date}" != "${expected_date}"
    BuiltIn.Should be equal     ${actual_month}         ${expected_month}       msg=Month after swipe not match with expected. "${actual_month}" != "${expected_month}"
    BuiltIn.Should be equal     ${actual_year}          ${expected_year}        msg=Year after swipe not match with expected. "${actual_year}" != "${expected_year}"

Swipe up date
    [Arguments]     ${start_x}=25       ${start_y}=80   ${end_x}=25     ${end_y}=75     ${duration}=0.5s
    AppiumLibrary.Swipe by percent      start_x=${start_x}      start_y=${start_y}      end_x=${end_x}      end_y=${end_y}      duration=${duration}

Swipe down date
    [Arguments]     ${start_x}=25       ${start_y}=70   ${end_x}=25     ${end_y}=75     ${duration}=0.5s
    AppiumLibrary.Swipe by percent      start_x=${start_x}      start_y=${start_y}      end_x=${end_x}      end_y=${end_y}      duration=${duration}

Swipe up month
    [Arguments]     ${start_x}=50       ${start_y}=80   ${end_x}=50     ${end_y}=75     ${duration}=0.5s
    AppiumLibrary.Swipe by percent      start_x=${start_x}      start_y=${start_y}      end_x=${end_x}      end_y=${end_y}      duration=${duration}

Swipe down month
    [Arguments]     ${start_x}=50       ${start_y}=70   ${end_x}=50     ${end_y}=75     ${duration}=0.5s
    AppiumLibrary.Swipe by percent      start_x=${start_x}      start_y=${start_y}      end_x=${end_x}      end_y=${end_y}      duration=${duration}

Swipe up year
    [Arguments]     ${start_x}=75       ${start_y}=80   ${end_x}=75     ${end_y}=75     ${duration}=0.5s
    AppiumLibrary.Swipe by percent      start_x=${start_x}      start_y=${start_y}      end_x=${end_x}      end_y=${end_y}      duration=${duration}

Swipe down year
    [Arguments]     ${start_x}=75       ${start_y}=70   ${end_x}=75     ${end_y}=75     ${duration}=0.5s
    AppiumLibrary.Swipe by percent      start_x=${start_x}      start_y=${start_y}      end_x=${end_x}      end_y=${end_y}      duration=${duration}