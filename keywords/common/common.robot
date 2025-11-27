*** Keywords ***
Replace string
    [Documentation]    Replace string in inputted text (${string})
        ...            Arguments:
        ...                - ${string}: (string) Template string ที่ต้องการแทนที่ด้วย string ใหม่
        ...                - ${replace_string}: (string) ค่าที่จะนำไปแทนที่ '@#string@#' (ค่าเริ่มต้น ${EMPTY})
        ...                - ${index}: (string) ค่าที่จะนำไปแทนที่ '@#index@#' (ค่าเริ่มต้น ${EMPTY})
        ...             Returns:
        ...                - ${string}   (string) String ที่ผ่านการแทนที่ทั้งหมดที่ต้องการแล้ว
    [Arguments]     ${string}
    ...     ${replace_string}=${EMPTY}
    ...     ${index}=${EMPTY}
    IF      '${replace_string}'!='${EMPTY}'
        ${string}   String.Replace string   string=${string}    search_for=@#string@#       replace_with=${replace_string}
    END
    IF      '${index}'!='${EMPTY}'
        ${string}   String.Replace string   string=${string}    search_for=@#index@#        replace_with=${index}
    END
    RETURN      ${string}