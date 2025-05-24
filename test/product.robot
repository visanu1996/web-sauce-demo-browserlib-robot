*** Settings ***
Resource    ${CURDIR}/../import.robot
Suite Setup    common.Open New Browser
Documentation    Focus on testing product page.
*** Test Cases ***
TC1
    [Documentation]    Get items detail and verify prices
    common.Login User    ${username['std']}    ${password}
    common.Element is Visible    ${product_h}
    &{items_list}    product.Get Items Detail    Bike Light    Labs Backpack    Fleece Jacket
    product.Verify Items Price    9.99    29.99    49.99    

TC2
    [Documentation]    Add items to cart
    common.Element is Visible    ${product_h}
    product.Add Items to Cart    Bike Light    Labs Backpack    Fleece Jacket
    Take Screenshot    EMBED
    Sleep    3
    product.Remove Items from Cart    Labs Backpack
    Take Screenshot    EMBED
    Sleep    3

TC3
    [Documentation]    Sort items from Z to A
    common.Element is Visible    ${product_sort}
    product.Sort Product Items    za
    product.Verify Sorting Text    za    #to cross check that sort span is currently using Z to A
    Take Screenshot    EMBED
    Sleep    3

TC4
    [Documentation]    Sort items from Low to High
    common.Element is Visible    ${product_sort}
    product.Sort Product Items    lohi
    product.Verify Sorting Text    lohi    #to cross check that sort span is currently using low to high
    Take Screenshot    EMBED
    Sleep    3   

TC5
    [Documentation]    Sort items from High to Low
    common.Element is Visible    ${product_sort}
    product.Sort Product Items    hilo
    product.Verify Sorting Text    hilo        #to cross check that sort span is currently using high to low
    Take Screenshot    EMBED
    Sleep    3