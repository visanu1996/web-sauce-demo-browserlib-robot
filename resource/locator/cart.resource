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