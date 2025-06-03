*** Variables ***
${login_logo}    xpath=//div[.="Swag Labs"]
${username_input}    id=user-name
${password_input}    id=password
${error_msg}    xpath=//*[contains(@class,"error-message")]
${submit_btn}    id=login-button



*** Keywords ***
Login User
    [Documentation]    login with username and password
    [Arguments]    ${user}    ${pass}
    Fill Text    ${username_input}    ${user}
    Fill Text    ${password_input}    ${pass}
    Sleep    1
    Click    ${submit_btn}


Check Login Error Msg
    [Documentation]    to check error message
    ${error}    Get Text    ${error_msg}
    RETURN    ${error}
