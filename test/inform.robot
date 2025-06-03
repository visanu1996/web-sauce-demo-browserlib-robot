*** Settings ***
Resource    ${CURDIR}/../import.robot
Suite Setup    Open New Browser
Documentation    Focus on testing complete order page.
*** Test Cases ***
TC1
    [Documentation]    inform data on checkout page and verify items price.
    login_page.Login User    ${username['std']}    ${password}
    product_page.Add Items to Cart    Bike Light    Fleece
    common.Go to Cart Page
    ${total}    cart_page.Sum Total Price
    common.Check Out Item
    checkout_page.Fill Form    Testing    Automate    10200
    checkout_page.Verify Total Price    ${total}

TC2
    [Documentation]    completed order and verify completed page.
    common.Complete Order
    checkout_page.Verify Completed Order
    Take Screenshot    EMBED