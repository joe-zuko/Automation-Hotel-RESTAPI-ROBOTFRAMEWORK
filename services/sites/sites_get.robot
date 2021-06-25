*** Settings ***
Resource            sites_post.robot

*** Keywords ***

Sites List
    ${RESULT}    Get On Session   hotelAPI   ${SITE_URI}
    ...                           expected_status=anything

    Set Test Variable             ${RESULT}


Search a site
    New site

    ${RESULT}    Get On Session   hotelAPI   ${SITE_URI}/${SITE_URL}
    ...                           expected_status=anything

    Set Test Variable             ${RESULT}
  
Site does not exist
    New site

    ${RESULT}    Get On Session   hotelAPI   ${SITE_URI}/${FAKE_SITE_ID}
    ...                           expected_status=anything

    Set Test Variable             ${RESULT}
   


