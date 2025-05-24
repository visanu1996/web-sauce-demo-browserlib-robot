*** Variables ***
&{burger_menu}    burger=//div[@class="bm-burger-button"]    all-item=//*[.='All Items']    
...    about=//*[.='About']    logout=//*[.='Logout']    reset_app=//*[.='Reset App State']

${product_h}    //*[.='Products']
${item_box}    //*[@class="inventory_item"][.//div[contains(@class,'inventory_item_name') and contains(.,'[ITEM_NAME]')]]

${item_name}    //*[@class='inventory_item_name ']
${item_desc}    //*[@class='inventory_item_desc']
${item_price}    //*[@class='inventory_item_price']
&{item_btn}    add=//button[contains(.,'Add')]    remove=//button[.='Remove']

${product_sort}    //select[@class='product_sort_container']
${active_product_sort}    //*[@class="active_option" and contains (.,'[SORT]')]
${to_cart}    //a[@class='shopping_cart_link']