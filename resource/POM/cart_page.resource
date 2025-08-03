*** Variables ***
${COUNT_CART_ITEM}    //div[@class="cart_item"]    
${CART_ITEM}    //div[@class="cart_item"][.//*[contains(.,'[ITEM_NAME]')]]
${CART_DESC}    //div[@class='inventory_item_desc']
${CART_NAME}    //div[@class='inventory_item_name']
${CART_QTY}    //div[@class="cart_quantity"]
${CART_PRICE}    //div[@class="inventory_item_price"]

${CART_REMOVE}    //button[.='Remove']

${CART_H}    //*[@class="title"]
${GO_PRODUCT}    id=continue-shoppings

${CHECKOUT}    id=checkout

*** Keywords ***
Check Cart Items
    [Documentation]    Get count of items in cart page.
    ...    This keyword is not use to get items qty.
    [Arguments]    ${total}
    ${count}    Get Element Count    ${COUNT_CART_ITEM}
    Should Be Equal    '${count}'    '${total}'
    Log    Item in cart : ${count}

Remove Cart items
    [Documentation]    remove cart items, item need to be visible in cart page.
    [Arguments]    @{remove_item}

    FOR    ${item}    IN    @{remove_item}
        ${cart_box}    common.Change Variable Text    ${CART_ITEM}    [ITEM_NAME]    ${item}
        Click    ${cart_box}${CART_REMOVE}
        Sleep    1
        
    END

Sum Total Price
    [Documentation]    sum the total amount of price in cart page.
    ${total_price}    Set Variable    ${0}
    ${total_item}    Get Element Count    ${COUNT_CART_ITEM}

    FOR    ${counter}    IN RANGE    0    ${total_item}

        ${index}    Evaluate    ${counter}+1
        ${price}    Get Text    xpath=(${COUNT_CART_ITEM}${CART_PRICE})[${index}]
        ${reg_price}    Remove String Using Regexp    ${price}    [$]
        ${total_price}    Evaluate    ${total_price}+${reg_price}
        Sleep    1

    END

    Log    Total price is : ${total_price}
    
    RETURN    ${total_price}
