*** Settings ***
Resource            hotel_post.robot

*** Keywords ***

Get an Hotel
    user_post.Registred User
    sites_post.New site
    hotel_post.New hotel

    ${RESULT}    Get On Session   hotelAPI   ${HOTEL_URI}/${HOTEL_ID}

    Set Test Variable             ${RESULT}

Hotel has wrong ID
    user_post.Registred User
    sites_post.New site
    hotel_post.New hotel

    ${RESULT}    Get On Session   hotelAPI   ${HOTEL_URI}/${WRONG_ID}
    ...                           expected_status=anything

    Set Test Variable             ${RESULT}