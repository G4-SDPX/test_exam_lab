*** Settings ***
Library           RequestsLibrary

*** Keywords ***

Get Calculation JSON
    [Arguments]    ${num1}
    ${resp}=     GET    http://127.0.0.1:5000/is_prime/${num1}
    
    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Parse the response content as JSON, and handle exceptions
    ${json_resp}=    Evaluate    json.loads(response.text)    json
    [return]    ${json_resp}

*** Test Cases ***
Test 17 (After Using Keywords)
    ${json_resp}=    Get Calculation JSON    17
    # Verify the JSON response content
    Should Be Equal    ${json_resp}    True

Test 36 (After Using Keywords)
    ${json_resp}=    Get Calculation JSON    36
    # Verify the JSON response content
    Should Be Equal    ${json_resp}    False

Test 13219 (After Using Keywords)
    ${json_resp}=    Get Calculation JSON    13219
    # Verify the JSON response content
    Should Be Equal    ${json_resp}    True

