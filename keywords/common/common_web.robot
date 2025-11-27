*** Keywords ***
Open web browser by url
    [Arguments]        ${url}    ${supported_browser}=${default_browser}    ${headless_mode}=${False}
    Browser.New Browser
    ...    browser=${supported_browser}
    ...    headless=${headless_mode}
    ...    args=["--start-maximized"]
    Browser.New Context    viewport=None
    Browser.New Page       url=${url}
    Browser.Wait For Load State

Gother web setup
    [Arguments]        ${headless_mode}=${False}
    common_web.Open web browser by url    url=${gother_web.url.${LANG.lower()}}    headless_mode=${headless_mode}
    Browser.Set browser timeout     1m 30 seconds

Click accecpt all cookies
    Browser.Click       //button[text() = "Accept All"]
