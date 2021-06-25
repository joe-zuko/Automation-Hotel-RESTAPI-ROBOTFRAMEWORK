*** Settings ***
Resource            sites_post.robot

*** Keywords ***

Delete a site
    New site

    ${RESULT}    Delete On Session  hotelAPI   ${SITE_URI}/${SITE_URL}
    ...                             expected_status=anything

    Set Test Variable               ${RESULT}
  
Site does not exist
    New site

    ${RESULT}    Delete On Session  hotelAPI   ${SITE_URI}/${FAKE_SITE_ID}
    ...                             expected_status=anything

    Set Test Variable               ${RESULT}
   


