*** Settings ***
Library           RequestsLibrary


*** Keywords ***

Get Calculation JSON
    [Arguments]    ${x}
    ${resp}=     GET    http://127.0.0.1:5000/is_prime/฿{x}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    [return]    ${resp.json()}


*** Test Cases ***

Test 3 (ฺBefore Using Keywords)

    ${resp}=     GET    http://127.0.0.1:5000/is_prime/3

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    TRY
        ${json_resp}=    Evaluate json.loads('${resp.content}')
    EXCEPT JSONDecodeError
        Log   The response content is not a valid JSON object
    END TRY

    # Verify the response of plus operation
    Should Be Equal    ${json_resp}    "True"
