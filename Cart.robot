*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

# made by Satayu Settakit
*** Test Cases ***
Add Single Product To Cart
    Open Browser To Login Page
    Input Username    standard_user
    resource.Input Password   secret_sauce
    Submit Credentials
    Welcome Page Should Be Open
    Add Product
    Go To Cart 
    Cart Page Should Be Open
    [Teardown]    Close Browser

Add Multiple Product To Cart
    Open Browser To Login Page
    Input Username    standard_user
    resource.Input Password   secret_sauce
    Submit Credentials
    Welcome Page Should Be Open
    Add Multi Product 
    Go To Cart
    Cart Page Should Be Open
    [Teardown]    Close Browser

Continue To Shopping
    Open Browser To Login Page
    Input Username    standard_user
    resource.Input Password    secret_sauce
    Submit Credentials
    Welcome Page Should Be Open
    Add Multi Product 
    Go To Cart
    Cart Page Should Be Open
    Continue Shopping
    Welcome Page Should Be Open
    [Teardown]    Close Browser

Remove The Product
    Open Browser To Login Page
    Input Username    standard_user
    resource.Input Password    secret_sauce
    Submit Credentials
    Welcome Page Should Be Open
    Add Multi Product 
    Go To Cart
    Cart Page Should Be Open
    Product Has Been Removed
    [Teardown]    Close Browser
