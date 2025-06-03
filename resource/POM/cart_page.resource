*** Variables ***
${count_cart_item}    //div[@class="cart_item"]    
${cart_item}    //div[@class="cart_item"][.//*[contains(.,'[ITEM_NAME]')]]
${cart_desc}    //div[@class='inventory_item_desc']
${cart_name}    //div[@class='inventory_item_name']
${cart_qty}    //div[@class="cart_quantity"]
${cart_price}    //div[@class="inventory_item_price"]

${cart_remove}    //button[.='Remove']

${cart_h}    //*[@class="title"]
${go_product}    id=continue-shopping

${checkout}    id=checkout

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
