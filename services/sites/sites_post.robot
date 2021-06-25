*** Settings ***
Resource            ${CURDIR}/../libs/library.robot
Resource            sites_variables.robot
Resource            ${CURDIR}/../app_uri.robot
Resource            ${CURDIR}/../status_code.robot      


*** Keywords ***

New site
    Massa Site

    ${RESULT}    Post On Session  hotelAPI   ${SITE_URI}/${RANDOM_SITE_NAME}
    ...                           expected_status=anything

    
    ${SITE_ID}    Collections.Get From Dictionary    ${RESULT.json()}       site_id
    ${SITE_URL}   Collections.Get From Dictionary    ${RESULT.json()}       url

    Set Test Variable             ${RESULT}
    Set Test Variable             ${SITE_ID}
    Set Test Variable             ${SITE_URL}


Same Site ID
    New site

    ${RESULT}    Post On Session  hotelAPI   ${SITE_URI}/${SITE_URL}
    ...                           expected_status=anything

    Set Test Variable             ${RESULT}
   


