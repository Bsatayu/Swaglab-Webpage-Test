*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

# made by 620610809

*** Variables ***
${SERVER}         www.saucedemo.com
${BROWSER}        Chrome
${DELAY}          0.4
${VALID USER}     standard_user
${VALID PASSWORD}  secret_sauce
${LOGIN URL}      https://${SERVER}/
${WELCOME URL}    https://${SERVER}/inventory.html
${CART URL}       https://${SERVER}/cart.html
${CHECKOUT URL}   https://${SERVER}/checkout-step-one.html
${CHECKOUT URL2}   https://${SERVER}/checkout-step-two.html
${CHECKOUT URL3}   https://${SERVER}/checkout-complete.html
${PRODUCT ID}     sauce-labs-backpack
${PRODUCT ID2}    sauce-labs-fleece-jacket
${PRODUCT ID3}    sauce-labs-onesie


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Swag Labs

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    user-name    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password   ${password}

Input Firstname
    [Arguments]    ${firstname}
    Input Text    firstName  ${firstname}

Input Lastname
    [Arguments]    ${lastname}
    Input Text    lastName  ${lastname}

Input Postalcode
    [Arguments]    ${postalcode}
    Input Text    postalCode  ${postalcode}

Submit Credentials
    Click Button    login-button

Submit Filtering
    Click Element   class:product_sort_container


Select Filtering A-Z
    
    Click Element  xpath=//*[@id="header_container"]/div[2]/div[2]/span/select/option[1]

Select Filtering Z-A
    
    Click Element  xpath=//*[@id="header_container"]/div[2]/div[2]/span/select/option[2]
    
Select Filtering Low-High
    
    Click Element  xpath=//*[@id="header_container"]/div[2]/div[2]/span/select/option[3]

Select Filtering High-Low
    
    Click Element  xpath=//*[@id="header_container"]/div[2]/div[2]/span/select/option[4]


Add Product 
   Click Button  add-to-cart-${PRODUCT ID}   

Add Multi Product 
   Click Button  add-to-cart-${PRODUCT ID}  
   Click Button  add-to-cart-${PRODUCT ID2}  
   Click Button  add-to-cart-${PRODUCT ID3}  

Continue Shopping

    Click Button  continue-shopping

Product Has Been Removed
    Click Button  remove-${PRODUCT ID}  
    Click Button  remove-${PRODUCT ID2} 
    Click Button  remove-${PRODUCT ID3}   

Checking Out
    Click Button  checkout

Information Confirm
    Click Button  continue

Checkout Finished
    Click Button  finish

Go Back To WELCOME PAGE
    Click Button  back-to-products

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be       Swag Labs

Should Comeback to Login Page
    Location Should Be    ${LOGIN URL} 

Cart Page Should Be Open
    Location Should Be    ${CART URL}

Check Out Page Should Be Open
    Location Should Be    ${CHECKOUT URL}

Next Check Out Page Should Be Open
    Location Should Be    ${CHECKOUT URL2}

Thank You Page Should Be Open
    Location Should Be    ${CHECKOUT URL3}
 
Go To Cart
    Click Element  class:shopping_cart_link

# made by 620610809
    
