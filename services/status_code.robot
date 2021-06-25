*** Keywords ***
####SETUP E TEARDOWNS
Status Code
    [Arguments]      ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESULT.status_code}          ${STATUSCODE_DESEJADO}

Message Response 
    [Arguments]      ${MSG}
    Should Be Equal As Strings    ${RESULT.json()["message"]}    ${MSG}

