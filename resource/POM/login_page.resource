*** Variables ***
${LOGIN_LOGO}    xpath=//div[.="Swag Labs"]
${USERNAME_INPUT}    id=user-name
${PASSWORD_INPUT}    id=password
${ERROR_MSG}    xpath=//*[contains(@class,"error-message")]
${SUBMIT_BTN}    id=login-button



*** Keywords ***
Login User
    [Documentation]    login with username and password
    [Arguments]    ${user}    ${pass}
    Fill Text    ${USERNAME_INPUT}    ${user}
    Fill Text    ${PASSWORD_INPUT}    ${pass}
    Sleep    1
    Click    ${SUBMIT_BTN}


Check Login Error Msg
    [Documentation]    to check error message
    ${error}    Get Text    ${ERROR_MSG}
    RETURN    ${error}
