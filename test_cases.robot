*** Settings ***
Library        RequestsLibrary

*** Variables ***
${data}    None

*** Keywords ***
Make Request
    [Arguments]    ${url}    ${method}
    ${response} =    Requests.request    ${method}    ${url}    data=${data}
    Return    ${response}

*** Test Cases ***
Test Is Prime 17
    ${response} =    Run Keyword     Make Request     http://localhost:5000/is_prime/17    GET
    ${is_prime} =    ${response.json()}
    ${expected} =    "True"
    ${status} =    ${response.status_code}
    ${actual} =    ${response.headers["Content-Type"]}
    Log    ${is_prime}
    Log    ${expected}
    Log    ${status}
    Log    ${actual}
    ${assert} =    Set Assertion    ${is_prime} == ${expected}
    ${assert} =    Run Keyword If    ${assert}    Fail    Expected response is ${expected} but got ${is_prime}
    ${assert} =    Run Keyword If    ${status} != 200    Fail    Expected status code is 200 but got ${status}
    ${assert} =    Run Keyword If    ${actual} != "application/json"    Fail    Expected content type is application/json but got ${actual}
    Log    PASS

Test Is Prime 36
    ${response} =    Run Keyword     Make Request     http://localhost:5000/is_prime/36    GET
    ${is_prime} =    ${response.json()}
    ${expected} =    "False"
    ${status} =    ${response.status_code}
    ${actual} =    ${response.headers["Content-Type"]}
    Log    ${is_prime}
    Log    ${expected}
    Log    ${status}
    Log    ${actual}
    ${assert} =    Set Assertion    ${is_prime} == ${expected}
    ${assert} =    Run Keyword If    ${assert}    Fail    Expected response is ${expected} but got ${is_prime}
    ${assert} =    Run Keyword If    ${status} != 200    Fail    Expected status code is 200 but got ${status}
    ${assert} =    Run Keyword If    ${actual} != "application/json"    Fail    Expected content type is application/json but got ${actual}
    Log    PASS

Test Is Prime 13219
    ${response} =    Run Keyword     Make Request     http://localhost:5000/is_prime/13219    GET
    ${is_prime} =    ${response.json()}
    ${expected} =    "True"
    ${status} =    ${response.status_code}
    ${actual} =    ${response.headers["Content-Type"]}
    Log    ${is_prime}
    Log    ${expected}
    Log    ${status}
    Log    ${actual}
    ${assert} =    Set Assertion    ${is_prime} == ${expected}
    ${assert} =    Run Keyword If    ${assert}    Fail    Expected response is ${expected} but got ${is_prime}
    ${assert} =    Run Keyword If    ${status} != 200    Fail    Expected status code is 200 but got ${status}
    ${assert} =    Run Keyword If    ${actual} != "application/json"    Fail    Expected content type is application/json but got ${actual}
    Log    PASS
