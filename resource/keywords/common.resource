*** Keywords ***
Element is Visible
    [Documentation]    check that element is Visible
    [Arguments]    ${locator}
    ${is_visible}    Run Keyword And Return Status    Wait For Elements State    ${locator}    Visible    ${wait_time}
    IF    not ${is_visible}    Fail
    RETURN    ${is_visible}

    
Open New Browser
    [Documentation]    Open Browser and maximize it.
    New Browser    ${browser}    headless=${False}    args=["--start-maximized"]
    New Context    viewport=${None}
    New Page    ${url}

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
    Element is Visible    ${GO_PRODUCT}
    Click    ${GO_PRODUCT}

Check Out Item
    [Documentation]    use in cart page to go to checkout page.
    Element is Visible    ${CHECKOUT}
    Click    ${CHECKOUT}

Complete Order
    [Documentation]    use in checkout page to complete an order.
    Element is Visible    ${finish_btn}
    Click    ${finish_btn}


Logout
    [Documentation]    use this keyword to logout current user.
    Element is Visible    ${burger_menu['burger']}
    Click    ${burger_menu['burger']}
    Sleep    1
    Element is Visible    ${burger_menu['logout']}
    Click    ${burger_menu['logout']}