*** Keywords ***
Verify Items Price
    [Documentation]    Verify specific items price from product page, to check that the price tag is correct.
    ...    **note: need to use after Get Items Detail keyword.
    [Arguments]    @{item_price}
    # Get length from items that are in [Get Items Detail keyword].
    ${length_of_items_list}    Get Length    ${items}
    ${count}    Set Variable    ${0}

    FOR    ${price}    IN    @{item_price}
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
        ${cur_item}    common.Change Variable Text    ${item_box}    [ITEM_NAME]    ${item}

        # Get item details
        ${i_name}    Get Text    ${cur_item}${item_name}
        ${i_desc}    Get Text    ${cur_item}${item_desc}
        ${i_price}    Get Text    ${cur_item}${item_price}

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
        ${cur_item}    common.Change Variable Text    ${item_box}    [ITEM_NAME]    ${item}
        ${i_btn}    common.Element is Visible    ${cur_item}${item_btn['add']}
        IF    ${i_btn}    Click    ${cur_item}${item_btn['add']}
        Sleep    1
    END

Remove Items from Cart
    [Documentation]    Removing items from cart.
    [Arguments]    @{items_name}

    FOR    ${item}    IN    @{items_name}
        ${cur_item}    common.Change Variable Text    ${item_box}    [ITEM_NAME]    ${item}
        ${i_btn}    common.Element is Visible    ${cur_item}${item_btn['remove']}
        IF    ${i_btn}    Click    ${cur_item}${item_btn['remove']}
        Sleep    1
    END

Sort Product Items
    [Documentation]    A keyword to sort product items from product page.
    ...    have 4 method for sorting [az : 'A to Z' , za : 'Z to A' , lohi : 'Low to High', hilo : 'High to Low']
    [Arguments]    ${method}=az
    ${lower_method}    Convert To Lower Case    ${method}
    IF    '${lower_method}' == 'az'
        Select Options By    ${product_sort}    value    az
    ELSE IF    '${lower_method}' == 'za'
        Select Options By    ${product_sort}    value    za
    ELSE IF    '${lower_method}' == 'lohi'
        Select Options By    ${product_sort}    value    lohi
    ELSE
        Select Options By    ${product_sort}    value    hilo
    END

Verify Sorting Text
    [Documentation]    to verify that text is visible on current time.
    ...    only insert [az : 'A to Z' , za : 'Z to A' , lohi : 'Low to High', hilo : 'High to Low']
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

    ${sort_xpath}    Change Variable Text    ${active_product_sort}    [SORT]    ${sorting}
    common.Element is Visible    ${sort_xpath}
