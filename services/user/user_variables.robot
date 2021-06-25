*** Variables ***

${USER_LOGIN_URI}    /login
${USER_LOGOUT_URI}   /logout
${USERS_URI}         /usuarios
${USER_CREATE_URI}   /cadastro
${WRONG_PASS}        xxx
${WRONG_ID}          0

*** Keywords ***
####SETUP E TEARDOWNS

Massa e Payload User
    ${RANDOM_USER}      FakerLibrary.Name
    ${RANDOM_PASS}      FakerLibrary.Password  special_chars=False
    ${RANDOM_EMAIL}     FakerLibrary.Email

    Set Test Variable   ${RANDOM_USER}
    Set Test Variable   ${RANDOM_PASS}
    Set Test Variable   ${RANDOM_EMAIL}

    #PAYLOAD
    ${BODY}      Create Dictionary      login=${RANDOM_USER}  senha=${RANDOM_PASS}  email=${RANDOM_EMAIL}

    Set Test Variable   ${BODY} 