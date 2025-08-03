*** Variables ***
${CHECKOUT_H}    //*[@class='title']
${F_NAME_INTPUT}    id=first-name
${L_NAME_INTPUT}    id=last-name
${POSTAL}    id=postal-code
${CONTINUE}    id=continue
${SUM_TOTAL}    //*[@class="summary_subtotal_label"]
${FINISH_BTN}    id=finish
${BACK_TO_HOME_BTN}    id=back-to-products

*** Keywords ***
Fill Form
    [Documentation]    Fill form with Firstname , Lastname and postalcode then click continue
    [Arguments]    ${name}    ${surname}    ${postal_code}
    common.Element is Visible    ${CHECKOUT_H}
    Fill Text    ${F_NAME_INTPUT}    ${name}
    Fill Text    ${L_NAME_INTPUT}    ${surname}
    Fill Text    ${POSTAL}    ${postal_code}
    Click    ${CONTINUE}

Verify Total Price
    [Documentation]    to check that total price is correct and match the items.
    [Arguments]    ${expected_price}
    ${ex_price}    Convert To String    ${expected_price}
    common.Element is Visible    ${SUM_TOTAL} 
    ${actual_price}    Get Text    ${SUM_TOTAL}
    Should Contain    ${actual_price}    ${ex_price}

Verify Completed Order
    [Documentation]    Verify completed order then go back to home.
    common.Element is Visible    ${CHECKOUT_H}
    ${status}    Get Text    ${CHECKOUT_H}
    Should Contain    ${status}    Complete
    Take Screenshot    EMBED
    Click    ${BACK_TO_HOME_BTN}