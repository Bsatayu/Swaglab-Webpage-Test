*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           OperatingSystem

# made by Satayu Settakit

*** Variables ***

${SERVER}         www.saucedemo.com
${BROWSER}        Chrome
${DELAY}          0.4
@{USERNAME}       standard_user   locked_out_user   problem_user   performance_glitch_user
@{PASSWORD}       secret_sauce  Abcd886
${LOGIN URL}      https://${SERVER}/
${PRODUCT URL}       https://${SERVER}/inventory.html
${CART URL}       https://${SERVER}/cart.html
${CHECKOUT URL}   https://${SERVER}/checkout-step-one.html
${CHECKOUT URL2}   https://${SERVER}/checkout-step-two.html
${CHECKOUT COMPLETE}   https://${SERVER}/checkout-complete.html
@{PRODUCT_NAME}   sauce-labs-backpack     sauce-labs-bike-light    sauce-labs-bolt-t-shirt    test.allthethings()-t-shirt-(red)    sauce-labs-onesie    sauce-labs-fleece-jacket
@{sort_option}    1  2  3  4




*** Keywords ***

Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Element Should Be Enabled  xpath = //*[@id="root"]/div/div[1]

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Enter Username
     [Arguments]    ${USERNAME}
    Input Text    xpath = //*[@id="user-name"]   ${USERNAME}

Enter Password
    [Arguments]    ${PASSWORD}
    Input Text    xpath = //*[@id="password"]   ${PASSWORD}


User Login
    Enter Username    standard_user
    Enter Password    secret_sauce

Enter Firstname
    [Arguments]    ${firstname}
    Input Text     xpath = //*[@id="first-name"]  ${firstname}

Enter Lastname
    [Arguments]    ${lastname}
    Input Text   xpath = //*[@id="last-name"]  ${lastname}

Enter Postalcode
    [Arguments]    ${postalcode}
    Input Text   xpath = //*[@id="postal-code"]  ${postalcode}

Enter The Informations
    Enter Firstname  Satayu
    Enter Lastname   Settakit
    Enter Postalcode  555555

Enter Informations With Missing Firstname
    Enter Firstname  ${EMPTY}
    Enter Lastname   Settakit
    Enter Postalcode  555555
    

Enter Informations With Missing Lastname
    Enter Firstname  Satayu
    Enter Lastname   ${EMPTY}
    Enter Postalcode  555555
    

Enter Informations With Missing Postalcode
    Enter Firstname  Satayu
    Enter Lastname   Settakit
    Enter Postalcode  ${EMPTY}


Firstname Error Message
    Page Should Contain    Error: First Name is required

Lastname Error Message
    Page Should Contain    Error: Last Name is required

Postal Code Error Message
    Page Should Contain    Error: Postal Code is required

Enter Informations 

Submit Credentials
    Click Button    xpath = //*[@id="login-button"]

Select Product Sorting
    [Arguments]    ${sort_option}
    ${option}=    Set Variable    ${sort_option}[0]
    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span/select
    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span/select/option[${option}]

Product Sort
    FOR    ${option}  IN   @{sort_option}
        Select Product Sorting    ${option}
    END

Add The Product 

   ${random_product} =   Evaluate   random.choice(${PRODUCT_NAME})   modules=random
    Click Element    xpath=//*[@id="add-to-cart-${random_product}"] 

Add Multiple Products
    ${shuffled_products} =    Evaluate    random.sample(${PRODUCT_NAME}, len(${PRODUCT_NAME}))    modules=random
    FOR    ${Product}    IN    @{shuffled_products}
        Click Element    xpath=//*[@id="add-to-cart-${Product}"]
    END

Remove Product
    FOR    ${Product}  IN  @{PRODUCT_NAME}
        Click Element  remove-${Product}
        Element Should Not Be Visible   ${Product}
    END

Continue Shopping
    Click Element  xpath = //*[@id="continue-shopping"]

Checking Out
    Click Element  xpath = //*[@id="checkout"]

Informations Confirm
    Click Element  xpath = //*[@id="continue"]

Checkout Confirm
    Click Element  xpath = //*[@id="finish"]

Products Page Should Be Open
    Location Should Be    ${PRODUCT URL}
    Title Should Be       Swag Labs

User Should Stay in Login Page
    Location Should Be    ${LOGIN URL} 
    Element Should Be Visible   xpath = //*[@id="login_button_container"]/div/form/div[3]

User Will Stay in Check Out Page
    Location Should Be    ${CHECKOUT URL} 
    Element Should Be Visible   xpath = //*[@id="checkout_info_container"]/div/form/div[1]/div[4]


Cancel Checkout
      Click Element  xpath = //*[@id="cancel"]
      Cart Page Should Be Open



Go Back To Shopping Page
    Click Element  xpath = //*[@id="continue-shopping"]
    Products Page Should Be Open
Cart Page Should Be Open
    Location Should Be    ${CART URL}

Check Out Page Should Be Open
    Location Should Be    ${CHECKOUT URL}

Next Check Out Page Should Be Open
    Location Should Be    ${CHECKOUT URL2}

Thank You Page Should Be Open
    Location Should Be    ${CHECKOUT COMPLETE}
 
Go To Cart
    Click Element  xpath = //*[@id="shopping_cart_container"]/a

Go Back to Product Page
    Click Element  xpath = //*[@id="back-to-products"]
    Location Should Be    ${PRODUCT URL}
Logout
    Products Page Should Be Open
    Click Element  xpath = //*[@id="react-burger-menu-btn"]
    Click Element  xpath = //*[@id="logout_sidebar_link"]
    Login Page Should Be Open

# made by Satayu Settakit
