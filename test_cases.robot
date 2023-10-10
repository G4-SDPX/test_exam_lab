*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    http://localhost:5000

*** Test Cases ***
Test Is Prime API
    [Documentation]    Test the /is_prime endpoint of the Flask app

    ${session}    Create Session    ${BASE_URL}
    
    ${response}    GET On Session    ${session}    /is_prime/17
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()}    "True"

    ${response}    GET On Session    ${session}    /is_prime/36
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()}    "False"

    ${response}    GET On Session    ${session}    /is_prime/13219
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()}    "True"

    Close Session    ${session}
