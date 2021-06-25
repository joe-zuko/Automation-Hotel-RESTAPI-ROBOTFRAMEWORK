*** Settings ***
Resource            user_post.robot

*** Keywords ***
####SETUP E TEARDOWNS
Delete User
    user_post.Registred User

    ${HEADERS}                    Create Dictionary    Authorization=Bearer ${TOKEN}
    ${RESULT}                     Delete On Session    hotelAPI   ${USERS_URI}/${USER_ID}
    ...                           headers=${HEADERS}
    ...                           expected_status=anything

    Set Test Variable             ${RESULT}


