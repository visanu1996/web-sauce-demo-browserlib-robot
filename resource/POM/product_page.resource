*** Variables ***
&{BURGUR_MENU}    BURGUR=//div[@class="bm-burger-button"]    ALL-ITEM=//*[.='All Items']    
...    ABOUT=//*[.='About']    LOGOUT=//*[.='Logout']    RESET_APP=//*[.='Reset App State']

${PRODUCT_H}    //*[.='Products']
${ITEM_BOX}    //*[@class="inventory_item"][.//div[contains(@class,'inventory_item_name') and contains(.,'[ITEM_NAME]')]]

${ITEM_NAME}    //*[@class='inventory_item_name ']
${ITEM_DESC}    //*[@class='inventory_item_desc']
${ITEM_PRICE}    //*[@class='inventory_item_price']
&{ITEM_BTN}    ADD=//button[contains(.,'Add')]    REMOVE=//button[.='Remove']

${PRODUCT_SORT}    //select[@class='product_sort_container']
${ACTIVE_PRODUCT_SORT}    //*[@class="active_option" and contains (.,'[SORT]')]
${TO_CART}    //a[@class='shopping_cart_link']

*** Keywords ***
Verify Items Price
    [Documentation]    Verify specific items price from product page, to check that the price tag is correct.
    ...    **note: need to use after Get Items Detail keyword.
    [Arguments]    @{items_price}
    # Get length from items that are in [Get Items Detail keyword].
    ${length_of_items_list}    Get Length    ${items}
    ${count}    Set Variable    ${0}

    FOR    ${price}    IN    @{items_price}
        ${cur_item}    Get From List    ${items}    ${count}
        ${cur_price}    Get From Dictionary    ${cur_item}    price
        Should Contain    ${cur_price}    ${price}
        Log    item_list price : ${cur_price} should contain ${price}
        ${count}    Evaluate    ${count}+1
    END

Get Items Detail
    [Documentation]    get items price , name and description
    [Arguments]    @{items_name}
    ${items}    Create List
    ${item_count}    Set Variable    ${1}

    FOR    ${item}    IN    @{items_name}
        # change path for each item
        ${cur_item}    common.Change Variable Text    ${ITEM_BOX}    [ITEM_NAME]    ${item}

        # Get item details
        ${i_name}    Get Text    ${cur_item}${ITEM_NAME}
        ${i_desc}    Get Text    ${cur_item}${ITEM_DESC}
        ${i_price}    Get Text    ${cur_item}${ITEM_PRICE}

        # Set detail as a dictionary then append to list
        ${item_detail}    Create Dictionary    name=${i_name}    desc=${i_desc}    price=${i_price}
        Append To List    ${items}    ${item_detail}
        Sleep    1
    END
    # # Set suite variable for later use, much more easier to access with out parsing any params.
    Set Suite Variable    ${items}

Add Items to Cart
    [Documentation]    Adding items to cart.
    [Arguments]    @{items_name}

    FOR    ${item}    IN    @{items_name}
        ${cur_item}    common.Change Variable Text    ${ITEM_BOX}    [ITEM_NAME]    ${item}
        ${i_btn}    common.Element is Visible    ${cur_item}${ITEM_BTN['ADD']}
        IF    ${i_btn}    Click    ${cur_item}${ITEM_BTN['ADD']}
        Sleep    1
    END

Remove Items from Cart
    [Documentation]    Removing items from cart.
    [Arguments]    @{items_name}

    FOR    ${item}    IN    @{items_name}
        ${cur_item}    common.Change Variable Text    ${item_box}    [ITEM_NAME]    ${item}
        ${i_btn}    common.Element is Visible    ${cur_item}${ITEM_BTN['REMOVE']}
        IF    ${i_btn}    Click    ${cur_item}${ITEM_BTN['REMOVE']}
        Sleep    1
    END

Sort Product Items
    [Documentation]    A keyword to sort product items from product page.
    ...    have 4 method for sorting [az : 'A to Z' , za : 'Z to A' , lohi : 'Low to High', hilo : 'High to Low']
    [Arguments]    ${method}=az
    ${lower_method}    Convert To Lower Case    ${method}
    IF    '${lower_method}' == 'az'
        Select Options By    ${PRODUCT_SORT}    value    az
    ELSE IF    '${lower_method}' == 'za'
        Select Options By    ${PRODUCT_SORT}    value    za
    ELSE IF    '${lower_method}' == 'lohi'
        Select Options By    ${PRODUCT_SORT}    value    lohi
    ELSE
        Select Options By    ${PRODUCT_SORT}    value    hilo
    END

Verify Sorting Text
    [Documentation]    to verify that sorting method is on the right track at current time.
    ...    only input [az : 'A to Z' , za : 'Z to A' , lohi : 'Low to High', hilo : 'High to Low'] as ${text}
    [Arguments]    ${text}

    IF    '${text}' == 'az'
        ${sorting}    Set Variable    A to Z
    ELSE IF    '${text}' == 'za'
        ${sorting}    Set Variable    Z to A
    ELSE IF    '${text}' == 'lohi'
        ${sorting}    Set Variable    low to high
    ELSE
        ${sorting}    Set Variable    high to low
    END

    ${sort_xpath}    Change Variable Text    ${ACTIVE_PRODUCT_SORT}    [SORT]    ${sorting}
    common.Element is Visible    ${sort_xpath}
