*** Settings ***
Library        RequestsLibrary

*** Variables ***
${data}    None

*** Keywords ***
Make Request
    [Arguments]    ${url}    ${method}
    ${response} =    Create Session    session_name    http://localhost:5000
    ${data}=    Set Variable    ${None}
    ${response} =    ${method}    ${url}    data=${data}
    Return    ${response}

*** Test Cases ***
Test Is Prime 17
    ${response} =    Run Keyword     Make Request     /is_prime/17    Get
    ${is_prime} =    ${response.json()}
    ${expected} =    "True"
    ${status} =    ${response.status_code}
    ${actual} =    ${response.headers["Content-Type"]}
    Log    ${is_prime}
    Log    ${expected}
    Log    ${status}
    Log    ${actual}
    ${assert} =    Set Variable    ${is_prime} == ${expected}
    Run Keyword If    "${assert}" != "True"    Fail    Expected response is ${expected} but got ${is_prime}
    Run Keyword If    "${status}" != "200"    Fail    Expected status code is 200 but got ${status}
    Run Keyword If    "${actual}" != "application/json"    Fail    Expected content type is application/json but got ${actual}
    Log    PASS

Test Is Prime 36
    ${response} =    Run Keyword     Make Request     /is_prime/36    Get
    ${is_prime} =    ${response.json()}
    ${expected} =    "False"
    ${status} =    ${response.status_code}
    ${actual} =    ${response.headers["Content-Type"]}
    Log    ${is_prime}
    Log    ${expected}
    Log    ${status}
    Log    ${actual}
    ${assert} =    Set Variable    ${is_prime} == ${expected}
    Run Keyword If    "${assert}" != "True"    Fail    Expected response is ${expected} but got ${is_prime}
    Run Keyword If    "${status}" != "200"    Fail    Expected status code is 200 but got ${status}
    Run Keyword If    "${actual}" != "application/json"    Fail    Expected content type is application/json but got ${actual}
    Log    PASS

Test Is Prime 13219
    ${response} =    Run Keyword     Make Request     /is_prime/13219    Get
    ${is_prime} =    ${response.json()}
    ${expected} =    "True"
    ${status} =    ${response.status_code}
    ${actual} =    ${response.headers["Content-Type"]}
    Log    ${is_prime}
    Log    ${expected}
    Log    ${status}
    Log    ${actual}
    ${assert} =    Set Variable    ${is_prime} == ${expected}
    Run Keyword If    "${assert}" != "True"    Fail    Expected response is ${expected} but got ${is_prime}
    Run Keyword If    "${status}" != "200"    Fail    Expected status code is 200 but got ${status}
    Run Keyword If    "${actual}" != "application/json"    Fail    Expected content type is application/json but got ${actual}
    Log    PASS
