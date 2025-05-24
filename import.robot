*** Settings ***
Library    Browser
Library    String
Library    Collections

Variables    conf/config.yml


# Keyword files
Resource    resource/keywords/common.resource
Resource    resource/keywords/product.resource
Resource    resource/keywords/cart.resource
Resource    resource/keywords/checkout.resource
# Locator files
Resource    resource/locator/login.resource
Resource    resource/locator/products.resource
Resource    resource/locator/cart.resource
Resource    resource/locator/checkout.resource
