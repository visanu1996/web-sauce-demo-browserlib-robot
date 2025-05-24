*** Settings ***
Resource    ${CURDIR}/../import.robot
Suite Setup    Open New Browser
Documentation    Focus on testing complete order page.
*** Test Cases ***
TC1
    [Documentation]    inform data on checkout page and verify items price.
    common.Login User    ${username['std']}    ${password}
    product.Add Items to Cart    Bike Light    Fleece
    common.Go to Cart Page
    ${total}    cart.Sum Total Price
    common.Check Out Item
    checkout.Fill Form    Testing    Automate    10200
    checkout.Verify Total Price    ${total}

TC2
    [Documentation]    completed order and verify completed page.
    common.Complete Order
    checkout.Verify Completed Order
    Take Screenshot    EMBED