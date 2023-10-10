*** Settings ***
Library    SeleniumLibrary

Suite Setup    Open Headless Chrome    http://localhost:5000/is_prime/    # Use headless mode

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
Open Headless Chrome
    [Arguments]    ${url}
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --headless
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${url}


Close Browser
    Close Browser
