*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Test Is Prime
    # Create a session to the API
    Create Session  session  http://localhost:5000

    # Test for a prime number (17)
    Test For Number  17  True

    # Test for a non-prime number (36)
    Test For Number  36  False

    # Test for a prime number (13219)
    Test For Number  13219  True

*** Keywords ***
Test For Number
    [Arguments]    ${number}    ${expected_result}
    ${response} =    GET On Session  session  /is_prime/${number}
    Should Be Equal As Strings    ${response.text}    ${expected_result}
