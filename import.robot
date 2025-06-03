*** Settings ***
Library    Browser
Library    String
Library    Collections

# config files
Variables    conf/config.yml


# Common Keyword file
Resource    resource/keywords/common.resource


# POM files
Resource    resource/POM/checkout_page.resource
Resource    resource/POM/product_page.resource
Resource    resource/POM/cart_page.resource
Resource    resource/POM/login_page.resource

