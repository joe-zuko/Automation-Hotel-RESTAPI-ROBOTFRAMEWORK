*** Settings ***
Resource            hotel_post.robot

*** Keywords ***

Put hotel
    user_post.Registred User    
    sites_post.New site
    hotel_post.New hotel

    ${HEADERS}                     Create Dictionary    Authorization=Bearer ${TOKEN}

    Massa e Paylod Hotel

    Set To Dictionary 	${BODY}    nome=${RANDOM_NAME}  estrelas=${RANDOM_ESTRELAS}  diaria=${RANDOM_DIARIA}  cidade=${RANDOM_CIDADE}  site_id=${SITE_ID}
    
    ${RESULT}      Put On Session  hotelAPI   ${HOTEL_URI}/${HOTEL_ID}
    ...                            data=${BODY}
    ...                            headers=${HEADERS}
    ...                            expected_status=anything
    
    Set Test Variable             ${RESULT}

