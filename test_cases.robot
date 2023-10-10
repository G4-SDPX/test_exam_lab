*** Settings ***
Library  RequestsLibrary

*** Test Cases ***
Test Is Prime
    [Documentation]  ตรวจสอบว่าจำนวนเฉพาะหรือไม่
    ${x}    Set Variable  17
    ${session}    Create Session  http://localhost:5000
    ${response}    GET On Session  ${session}  /is_prime/${x}
    ${is_prime}    Response Body Get  is_prime
    ${expected}    Set Variable  True
    Should Be Equal  ${is_prime}  ${expected}

Test Is Not Prime
    [Documentation]  ตรวจสอบว่าจำนวนไม่ใช่จำนวนเฉพาะหรือไม่
    ${x}    Set Variable  36
    ${session}    Create Session  http://localhost:5000
    ${response}    GET On Session  ${session}  /is_prime/${x}
    ${is_prime}    Response Body Get  is_prime
    ${expected}    Set Variable  False
    Should Be Equal  ${is_prime}  ${expected}

Test Is Prime With Large Number
    [Documentation]  ตรวจสอบว่าจำนวนเฉพาะหรือไม่
    ${x}    Set Variable  13219
    ${session}    Create Session  http://localhost:5000
    ${response}    GET On Session  ${session}  /is_prime/${x}
    ${is_prime}    Response Body Get  is_prime
    ${expected}    Set Variable  True
    Should Be Equal  ${is_prime}  ${expected}
