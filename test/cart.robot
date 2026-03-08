*** Settings ***
Resource    ${CURDIR}/../import.robot
Suite Setup    Run Keywords    Open New Browser
...            AND        login_page.Login User    ${username['std']}    ${password}
...            AND        common.Go to Cart Page    

Documentation    Focus on testing cart page.
*** Test Cases ***
TC1-Add Items
    [Documentation]    Add items then count item in cart
    common.Go to Product Page
    product_page.Add Items to Cart    Bike Light    Labs Backpack    Fleece Jacket
    common.Go to Cart Page
    common.Element is Visible    ${CART_H}
    cart_page.Check Cart Items    3
    
TC2-Remove Items
    [Documentation]    Remove items from cart page.
    Sleep    3
    cart_page.Remove Cart items    Labs Backpack
    cart_page.Check Cart Items    2
