*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

# made by Satayu Settakit
*** Test Cases ***
Product Sorting Test
    Open Browser To Login Page
    User Login
    Submit Credentials
    Products Page Should Be Open
    Product Sort
    Close Browser










