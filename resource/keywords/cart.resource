*** Keywords ***
Check Cart Items
    [Documentation]    Get count of items in cart page.
    ...    This keyword is not use to get items qty.
    [Arguments]    ${total}
    ${count}    Get Element Count    ${count_cart_item}
    Should Be Equal    '${count}'    '${total}'
    Log    Item in cart : ${count}

Remove Cart items
    [Documentation]    remove cart items, item need to be visible in cart page.
    [Arguments]    @{remove_item}

    FOR    ${item}    IN    @{remove_item}
        ${cart_box}    common.Change Variable Text    ${cart_item}    [ITEM_NAME]    ${item}
        Click    ${cart_box}${cart_remove}
        Sleep    1
        
    END

Sum Total Price
    [Documentation]    sum the total amount of price in cart page.
    ${total_price}    Set Variable    ${0}
    ${total_item}    Get Element Count    ${count_cart_item}

    FOR    ${counter}    IN RANGE    0    ${total_item}

        ${index}    Evaluate    ${counter}+1
        ${price}    Get Text    xpath=(${count_cart_item}${cart_price})[${index}]
        ${reg_price}    Remove String Using Regexp    ${price}    [$]
        ${total_price}    Evaluate    ${total_price}+${reg_price}
        Sleep    1

    END

    Log    Total price is : ${total_price}
    
    RETURN    ${total_price}