*** Settings ***
Resource    ${CURDIR}/../import.robot
Suite Setup    common.Open New Browser
Documentation    Focus on testing login page.

*** Test Cases ***
TC1
    [Documentation]    Check error from using wrong username, password.
    ...    Insert wrong username , password
    common.Element is Visible    ${login_logo}
    login_page.Login User    qwerwqr    qwerwqer
    ${err}    login_page.Check Login Error Msg
    Should Contain    ${err}    Username and password do not match
    Take Screenshot    EMBED
    Sleep    5

TC2
    [Documentation]    Check error from using wrong username, password.
    ...    Insert No username
    common.Element is Visible    ${login_logo}
    login_page.Login User    ${EMPTY}    ${password}
    ${err}    login_page.Check Login Error Msg
    Should Contain    ${err}    Username is required
    Take Screenshot    EMBED
    Sleep    5

TC3
        [Documentation]    Check error from using wrong username, password.
    ...    Insert No password
    common.Element is Visible    ${login_logo}
    login_page.Login User    ${username['std']}    ${EMPTY}
    ${err}    login_page.Check Login Error Msg
    Should Contain    ${err}    Password is required
    Take Screenshot    EMBED
    Sleep    5

TC4
    [Documentation]    Login with locked user.
    common.Element is Visible    ${login_logo}
    login_page.Login User    ${username['lck']}    ${password}
    ${err}    login_page.Check Login Error Msg
    Should Contain    ${err}    locked
    Take Screenshot    EMBED
    Sleep    5

TC5 
    [Documentation]    Login with standard user.
    common.Element is Visible    ${login_logo}
    login_page.Login User    ${username['std']}    ${password}
    Take Screenshot    EMBED
    common.Logout
    Sleep    5

TC6
    [Documentation]    Login with problem user.
    common.Element is Visible    ${login_logo}
    login_page.Login User    ${username['prb']}    ${password}
    Take Screenshot    EMBED
    common.Logout
    Sleep    5