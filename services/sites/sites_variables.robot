*** Variables ***

${SITE_URI}         /sites
${FAKE_SITE_ID}     xpto

*** Keywords ***

Massa Site
    ${SITE_NAME}            FakerLibrary.Word
    ${RANDOM_SITE_NAME}     Catenate    SEPARATOR=.   www      ${SITE_NAME}      com
      
    Set Test Variable       ${RANDOM_SITE_NAME}

