*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    http://localhost:5000

*** Keywords ***
Verify Is Prime Result
    [Arguments]    ${number}    ${expected_result}
    ${response}    Get Request    ${BASE_URL}/is_prime/${number}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()}    ${expected_result}

*** Test Cases ***
Test Is Prime API
    [Documentation]    Test the /is_prime endpoint of the Flask app

    Verify Is Prime Result    17    "True"
    Verify Is Prime Result    36    "False"
    Verify Is Prime Result    13219    "True"
