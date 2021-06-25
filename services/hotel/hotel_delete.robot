*** Settings ***
Resource            hotel_post.robot

*** Keywords ***

Delete an Hotel
    user_post.Registred User
    sites_post.New site
    hotel_post.New hotel

    ${HEADERS}   Create Dictionary    Authorization=Bearer ${TOKEN}
    ${RESULT}    Delete On Session    hotelAPI   ${HOTEL_URI}/${HOTEL_ID}
    ...                               headers=${HEADERS}

    Set Test Variable                 ${RESULT}

Hotel has wrong ID
    user_post.Registred User
    sites_post.New site
    hotel_post.New hotel

    ${HEADERS}    Create Dictionary    Authorization=Bearer ${TOKEN}
    ${RESULT}     Delete On Session    hotelAPI   ${HOTEL_URI}/${WRONG_ID}
    ...                                headers=${HEADERS}
    ...                                expected_status=anything

    Set Test Variable                  ${RESULT}