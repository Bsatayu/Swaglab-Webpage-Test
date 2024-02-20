*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

# made by Satayu Settakit
*** Test Cases ***
Choose All Filtering
    Open Browser To Login Page
    Input Username    standard_user
    resource.Input Password    secret_sauce
    Submit Credentials
    Welcome Page Should Be Open
    Submit Filtering
    Select Filtering Z-A
    Select Filtering Low-High
    Select Filtering High-Low
    Select Filtering A-Z
    [Teardown]    Close Browser










