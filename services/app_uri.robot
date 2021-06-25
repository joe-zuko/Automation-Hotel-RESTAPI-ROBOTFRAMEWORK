*** Variables ***

${URL_API}           http://127.0.0.1:5000
${HEADERS}           Create Dictionary    content-type=application/json

*** Keywords ***

Conectar a minha API
    Create Session        HotelAPI    ${URL_API}
    ${HEADERS}            Create Dictionary    content-type=application/json
    Set Suite Variable    ${HEADERS}