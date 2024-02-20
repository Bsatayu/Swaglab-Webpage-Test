*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

# made by Satayu Settakit
*** Test Cases ***
Normal Login
    Open Browser To Login Page
    Input Username    standard_user
    resource.Input Password    secret_sauce
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser

Lockout Login 
    Open Browser To Login Page
    Input Username    locked_out_user
    resource.Input Password   secret_sauce
    Submit Credentials
    Should Comeback to Login Page
    [Teardown]    Close Browser

Problem Login

     Open Browser To Login Page
     Input Username    problem_user
     resource.Input Password    secret_sauce
     Submit Credentials
     Welcome Page Should Be Open
     [Teardown]    Close Browser

Performance Problem Login

     Open Browser To Login Page
     Input Username    performance_glitch_user
     resource.Input Password    secret_sauce
     Submit Credentials
     Welcome Page Should Be Open
     [Teardown]    Close Browser








