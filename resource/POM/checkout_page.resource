*** Variables ***
${checkout_h}    //*[@class='title']
${f_name_input}    id=first-name
${l_name_input}    id=last-name
${postal}    id=postal-code
${continue}    id=continue
${sum_total}    //*[@class="summary_subtotal_label"]
${finish_btn}    id=finish
${back_to_home_btn}    id=back-to-products

*** Keywords ***
Fill Form
    [Documentation]    Fill form with Firstname , Lastname and postalcode then click continue
    [Arguments]    ${name}    ${surname}    ${postal_code}
    common.Element is Visible    ${checkout_h}
    Fill Text    ${f_name_input}    ${name}
    Fill Text    ${l_name_input}    ${surname}
    Fill Text    ${postal}    ${postal_code}
    Click    ${continue}

Verify Total Price
    [Documentation]    to check that total price is correct and match the items.
    [Arguments]    ${expected_price}
    ${ex_price}    Convert To String    ${expected_price}
    common.Element is Visible    ${sum_total} 
    ${actual_price}    Get Text    ${sum_total}
    Should Contain    ${actual_price}    ${ex_price}

Verify Completed Order
    [Documentation]    Verify completed order then go back to home.
    common.Element is Visible    ${checkout_h}
    ${status}    Get Text    ${checkout_h}
    Should Contain    ${status}    Complete
    Take Screenshot    EMBED
    Click    ${back_to_home_btn}