*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

# made by 620610809
*** Test Cases ***
Check Out 
    Open Browser To Login Page
    Input Username    standard_user
    Input Password    secret_sauce
    Submit Credentials
    Welcome Page Should Be Open
    Add Multi Product 
    Go To Cart
    Cart Page Should Be Open
    Checking Out
    Check Out Page Should Be Open
    Input Firstname  HAHA
    Input Lastname   HOHO
    Input Postalcode  555555
    Information Confirm
    Next Check Out Page Should Be Open
    Checkout Finished
    Thank You Page Should Be Open
    Go Back To WELCOME PAGE
    [Teardown]    Close Browser