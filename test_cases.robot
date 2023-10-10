*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Test Is Prime :: ตรวจสอบว่าจำนวนเฉพาะหรือไม่
    Create Session    my_api    http://localhost:5000
    ${response} =    Get Request    my_api/is_prime/17
    Should Be Equal    ${response.status_code}    200
    ${json_response} =    Set Variable    ${response.json()}
    Should Be Equal    ${json_response}    True

Test Is Not Prime :: ตรวจสอบว่าจำนวนไม่ใช่จำนวนเฉพาะหรือไม่
    Create Session    my_api    http://localhost:5000
    ${response} =    Get Request    my_api/is_prime/36
    Should Be Equal    ${response.status_code}    200
    ${json_response} =    Set Variable    ${response.json()}
    Should Be Equal    ${json_response}    False

Test Is Prime With Large Number :: ตรวจสอบว่าจำนวนเฉพาะหรือไม่
    Create Session    my_api    http://localhost:5000
    ${response} =    Get Request    my_api/is_prime/13219
    Should Be Equal    ${response.status_code}    200
    ${json_response} =    Set Variable    ${response.json()}
    Should Be Equal    ${json_response}    True
