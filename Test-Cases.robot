*** Settings ***
Library    SeleniumLibrary

Suite Setup    Open Browser    http://localhost:5000/is_prime/    chrome

*** Test Cases ***
Test Is Prime Function
    [Tags]    Is Prime
    # Test case for a prime number
    Click Element    name=x
    Input Text    name=x    17
    Click Element    name=submit
    Wait Until Page Contains    True
    Should Be Equal    Get Text    True

    # Test case for a non-prime number
    Click Element    name=x
    Input Text    name=x    36
    Click Element    name=submit
    Wait Until Page Contains    False
    Should Be Equal    Get Text    False

    # Test case for another prime number
    Click Element    name=x
    Input Text    name=x    13219
    Click Element    name=submit
    Wait Until Page Contains    True
    Should Be Equal    Get Text    True

*** Keywords ***
Open Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Close Browser
    Close Browser

