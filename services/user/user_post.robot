*** Settings ***
Resource            ${CURDIR}/../libs/library.robot
Resource            user_variables.robot
Resource            ${CURDIR}/../app_uri.robot
Resource            ${CURDIR}/../status_code.robot    


*** Keywords ***
####SETUP E TEARDOWNS

New user
    user_variables.Massa e Payload User
        
    ${HEADERS}   Create Dictionary    

    ${RESULT}    Post On Session  hotelAPI   ${USER_CREATE_URI}
    ...                           data=${BODY}
    ...                           headers=${HEADERS}
    ...                           expected_status=anything

    Set Test Variable             ${RESULT}


Registred User
    New user

    ${HEADERS}   Create Dictionary 

    ${RESULT}    Post On Session   hotelAPI   ${USER_LOGIN_URI}   
    ...                            data=${BODY}
    ...                            headers=${HEADERS}

    
    ${TOKEN}       Collections.Get From Dictionary    ${RESULT.json()}       access_token
    ${USER_ID}     Collections.Get From Dictionary    ${RESULT.json()}    user_id
    ${USER_EMAIL}  Collections.Get From Dictionary    ${RESULT.json()}   user_email
  
    Set Test Variable             ${RESULT}
    Set Test Variable             ${TOKEN}
    Set Test Variable             ${USER_ID}
    Set Test Variable             ${USER_EMAIL}


User exist
    Registred User

    ${HEADERS}   Create Dictionary 

    ${RESULT}    Post On Session    hotelAPI   ${USER_CREATE_URI}
    ...                             data=${BODY}
    ...                             headers=${HEADERS}
    ...                             expected_status=anything

    Set Test Variable               ${RESULT}

Wrong password
    New user

    ${HEADERS}   Create Dictionary 

    Set To Dictionary 	${BODY} 	senha=${WRONG_PASS}

    ${RESULT}                       Post On Session  hotelAPI   ${USER_LOGIN_URI}   
    ...                             data=${BODY}
    ...                             headers=${HEADERS}
    ...                             expected_status=anything

    Set Test Variable               ${RESULT}

Log Out
    Registred User
   
    ${HEADERS}                      Create Dictionary    Authorization=Bearer ${TOKEN}
    ${RESULT}                       Post On Session  hotelAPI   ${USER_LOGOUT_URI}   
    ...                             headers=${HEADERS} 
    ...                             expected_status=anything


