*** Variables ***

${HOTEL_URI}    /hoteis
${WRONG_PASS}   xxx
${WRONG_ID}     0

*** Keywords ***

Massa e Paylod Hotel
    
    ${HOTEL_NAME}        FakerLibrary.Word
    ${RANDOM_NAME}       FakerLibrary.Name
    ${RANDOM_ESTRELAS}   FakerLibrary.Random Int     min=0     max=5
    ${RANDOM_DIARIA}     FakerLibrary.Random Int     min=150   max=6000
    ${RANDOM_CIDADE}     FakerLibrary.City
    
    
    Set Test Variable   ${HOTEL_NAME}
    Set Test Variable   ${RANDOM_NAME}
    Set Test Variable   ${RANDOM_ESTRELAS}
    Set Test Variable   ${RANDOM_DIARIA} 
    Set Test Variable   ${RANDOM_CIDADE} 

    #PAYLOAD
    ${BODY}      Create Dictionary      nome=${RANDOM_NAME}  estrelas=${RANDOM_ESTRELAS}  diaria=${RANDOM_DIARIA}  cidade=${RANDOM_CIDADE}  site_id=${SITE_ID}

    Set Test Variable   ${BODY} 
