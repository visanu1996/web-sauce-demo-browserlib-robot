*** Keywords ***
Element is Visible
    [Documentation]    check that element is Visible
    [Arguments]    ${locator}
    ${is_visible}    Run Keyword And Return Status    Wait For Elements State    ${locator}    Visible    ${wait_time}
    IF    not ${is_visible}    Fail
    RETURN    ${is_visible}

Login User
    [Documentation]    login with username and password
    [Arguments]    ${user}    ${pass}
    Fill Text    ${username_input}    ${user}
    Fill Text    ${password_input}    ${pass}
    Sleep    1
    Click    ${submit_btn}

Check Error Msg
    [Documentation]    to check error message
    ${error}    Get Text    ${error_msg}
    RETURN    ${error}

Logout
    [Documentation]    use this keyword to logout current user.
    Element is Visible    ${burger_menu['burger']}
    Click    ${burger_menu['burger']}
    Sleep    1
    Element is Visible    ${burger_menu['logout']}
    Click    ${burger_menu['logout']}
    
Open New Browser
    [Documentation]    Open Browser and maximize it.
    New Browser    ${browser}    headless=${False}    args=["--start-maximized"]
    New Context    viewport=${None}
    New Page    ${url}

# No need to use in Browser Library because when you do something it will automatically move your view to that locator.
# Scroll to Element if is not Visible
#    [Documentation]    to scroll to element that are on the page but not Visible
#    ${locator}
#    ${is_onPage}    Wait For Elements State    ${locator}    state=attached
#    ${is_visible}    Wait For Elements State    ${locator}    state=visible

#    IF    ${is_onPage} and not ${is_visible}
#        Scroll To    ${locator}
#    END

Change Variable Text
    [Documentation]    change variable text that match specific word.
    ...    Like [ITEM-NAME] to be another word such as Bike Light
    [Arguments]    ${variable}    ${text}    ${tobe_text}
    ${newVar}    Replace String    ${variable}    ${text}    ${tobe_text}
    RETURN    ${newVar}

Go to Cart Page
    [Documentation]    check that cart link is visible or not then go to cart.
    Element is Visible    ${to_cart}
    Click    ${to_cart}

Go to Product Page
    [Documentation]    use in cart page to go back to product page.
    Element is Visible    ${go_product}
    Click    ${go_product}

Check Out Item
    [Documentation]    use in cart page to go to checkout page.
    Element is Visible    ${checkout}
    Click    ${checkout}

Complete Order
    [Documentation]    use in checkout page to complete an order.
    Element is Visible    ${finish_btn}
    Click    ${finish_btn}