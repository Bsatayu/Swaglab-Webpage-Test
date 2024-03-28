*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot
Resource    resource.robot

# made by Satayu Settakit
*** Test Cases ***
Check Out Successful Test
    Open Browser To Login Page
    User Login
    Submit Credentials
    Products Page Should Be Open
    Add Multiple Products 
    Go To Cart
    Cart Page Should Be Open
    Checking Out
    Check Out Page Should Be Open
    Enter The Informations
    Informations Confirm
    Next Check Out Page Should Be Open
    Checkout Confirm
    Thank You Page Should Be Open
    Go Back to Product Page
    Products Page Should Be Open
    Close Browser

Check Out Cancelled Test
    Open Browser To Login Page
    User Login
    Submit Credentials
    Products Page Should Be Open
    Add Multiple Products 
    Go To Cart
    Cart Page Should Be Open
    Checking Out
    Check Out Page Should Be Open
    Cancel Checkout
    Close Browser

Check Out Error Test With Missing Firstname
    Open Browser To Login Page
    User Login
    Submit Credentials
    Products Page Should Be Open
    Add Multiple Products 
    Go To Cart
    Cart Page Should Be Open
    Checking Out
    Check Out Page Should Be Open
    Enter Informations With Missing Firstname
    Informations Confirm
    Firstname Error Message
    User Will Stay in Check Out Page
    Close Browser

Check Out Error Test With Missing Lastname
    Open Browser To Login Page
    User Login
    Submit Credentials
    Products Page Should Be Open
    Add Multiple Products 
    Go To Cart
    Cart Page Should Be Open
    Checking Out
    Check Out Page Should Be Open
    Enter Informations With Missing Lastname
    Informations Confirm
    Lastname Error Message
    User Will Stay in Check Out Page
    Close Browser

Check Out Error Test With Missing Postalcode
    Open Browser To Login Page
    User Login
    Submit Credentials
    Products Page Should Be Open
    Add Multiple Products 
    Go To Cart
    Cart Page Should Be Open
    Checking Out
    Check Out Page Should Be Open
    Enter Informations With Missing Postalcode
    Informations Confirm
    Postal Code Error Message
    User Will Stay in Check Out Page
    Close Browser

