*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot
Resource    resource.robot

# made by Satayu Settakit
*** Test Cases ***

Login test
    FOR    ${USER}    IN    @{USERNAME}
     FOR    ${PASS}    IN    @{PASSWORD}
        Open Browser To Login Page
        Enter Username    ${USER}
        Enter Password     ${PASS}     
        Submit Credentials 
        Run Keyword If  '${USER}' == 'locked_out_user'
        ...    User Should Stay in Login Page
        ...    ELSE IF  '${PASS}' != 'secret_sauce'
        ...    User Should Stay in Login Page
        ...    ELSE   Products Page Should Be Open
        Close Browser
        END
    END



Logout Test
        FOR    ${USER}    IN    @{USERNAME}
            Open Browser To Login Page
            Enter Username   ${USER}
            Enter Password   secret_sauce
            Submit Credentials
            Run Keyword If  '${USER}' == 'locked_out_user'
               ...    User Should Stay in Login Page
               ...  ELSE
               ...    Logout
            Close Browser
        END
        








