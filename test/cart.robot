*** Settings ***
Resource    ${CURDIR}/../import.robot
Suite Setup    Open New Browser
Documentation    Focus on testing cart page.
*** Test Cases ***
TC1-Go to Cart Page    
    [Documentation]    Verify that you're arrived at cart page.
    common.Login User    ${username['std']}    ${password}
    common.Go to Cart Page    
    common.Element is Visible    ${cart_h}

TC2-Add Items
    [Documentation]    Add items then count item in cart
    common.Go to Product Page
    product.Add Items to Cart    Bike Light    Labs Backpack    Fleece Jacket
    common.Go to Cart Page
    cart.Check Cart Items    3
TC3-Remove Items
    [Documentation]    Remove items from cart page.
    cart.Remove Cart items    Labs Backpack
    cart.Check Cart Items    2
