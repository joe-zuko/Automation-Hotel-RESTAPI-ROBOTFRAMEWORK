*** Settings ***
Resource            ${CURDIR}/../libs/library.robot
Resource            hotel_variables.robot
Resource            ${CURDIR}/../user/user_post.robot
Resource            ${CURDIR}/../sites/sites_post.robot
Resource            ${CURDIR}/../app_uri.robot
Resource            ${CURDIR}/../status_code.robot    


*** Keywords ***

New hotel
    user_post.Registred User
    sites_post.New site
    Massa e Paylod Hotel

    ${HEADERS}                    Create Dictionary    Authorization=Bearer ${TOKEN}    
      
    ${RESULT}    Post On Session   hotelAPI   ${HOTEL_URI}/${HOTEL_NAME}
    ...                            data=${BODY}
    ...                            headers=${HEADERS}
    ...                            expected_status=anything

    ${HOTEL_ID}  Collections.Get From Dictionary    ${RESULT.json()}       hotel_id
    
    Set Test Variable             ${HOTEL_ID}
    Set Test Variable             ${RESULT}

Hotel Exist
    New hotel

    ${HEADERS}                    Create Dictionary    Authorization=Bearer ${TOKEN}
   
    ${RESULT}    Post On Session   hotelAPI   ${HOTEL_URI}/${HOTEL_NAME}
    ...                            data=${BODY}
    ...                            headers=${HEADERS}
    ...                            expected_status=anything

    Set Test Variable             ${RESULT}

Hotel does not exist
    user_post.Registred User
    sites_post.New site
    Massa e Paylod Hotel

    ${HEADERS}                    Create Dictionary    Authorization=Bearer ${TOKEN}
    
    Set To Dictionary 	${BODY}    site_id=${WRONG_ID}

    ${RESULT}    Post On Session   hotelAPI   ${HOTEL_URI}/${HOTEL_NAME}
    ...                            data=${BODY}
    ...                            headers=${HEADERS}
    ...                            expected_status=anything

    
    Set Test Variable             ${RESULT}