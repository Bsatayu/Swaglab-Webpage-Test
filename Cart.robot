*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

# made by Satayu Settakit
*** Test Cases ***
Add Single Product To Cart Test
    Open Browser To Login Page
    User Login
    Submit Credentials
    Products Page Should Be Open
    Add The Product
    Go To Cart 
    Cart Page Should Be Open
    Close Browser

Add Multiple Product To Cart Test
    Open Browser To Login Page
    User Login
    Submit Credentials
    Products Page Should Be Open
    Add Multiple Products
    Go To Cart
    Cart Page Should Be Open
    Close Browser

Continue To Shopping Test
    Open Browser To Login Page
    User Login
    Submit Credentials
    Products Page Should Be Open
    Add Multiple Products 
    Go To Cart
    Cart Page Should Be Open
    Continue Shopping
    Products Page Should Be Open
    Close Browser

Removing The Product Test
    Open Browser To Login Page
    User Login
    Submit Credentials
    Products Page Should Be Open
    Add Multiple Products 
    Go To Cart
    Cart Page Should Be Open
    Remove Product
    Close Browser
