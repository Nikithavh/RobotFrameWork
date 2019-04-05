*** Settings ***
Library     SeleniumLibrary    

Suite Setup      Log    This is a suite setup
Suite Teardown   Log   This is a suite teardown
Test Setup    Log   This is a test setup 
Test Teardown   Log   This is a test teardown

# Default Tags       sanity

*** Variables ***
${url}     https://opensource-demo.orangehrmlive.com/
${name}    Admin
${password}    admin123
${url1}     https://www.google.com
${url2}    http://spandana.globaledgesoft.com
  


** Test Cases ***
session
    # [Tags]    smoke   sanity
    Open Browser    ${url}   chrome
    Set Browser Implicit Wait    3
    Maximize Browser Window
    Input Text    id=txtUsername     ${name}
    Input Password   id=txtPassword    ${password}  
    Click Button    id=btnLogin
    Click Element    id=welcome
    Click Link    link=Logout
    Close Browser        
 
Gmail
    # [Tags]    functional
    Open Browser        ${url1}    chrome
    Input Text     name=q    robot framework
    Set Browser Implicit Wait    3
    Press Key    name=q   ENTER  
    Log Location
    sleep   3
    Close Browser
    Set Tags     regression
    
Login    
    # [Tags]    smoke
    Open Browser     ${url2}    chrome
    Input Text    id=username    vh.nikitha
    Input Password    id=password    nikitha22
    Click Button    class=button
    Get Location
    ${text}     Get Text    id=errorMsg         
    Log    ${text}
    sleep     2
    Close Browser  
    