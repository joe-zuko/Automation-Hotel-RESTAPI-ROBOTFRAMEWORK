*** Settings ***
Resource            user_post.robot

*** Keywords ***
####SETUP E TEARDOWNS
Find User
    user_post.Registred User
   
    ${RESULT}                     Get On Session  hotelAPI   ${USERS_URI}/${USER_ID}  

    Set Test Variable             ${RESULT} 

Does not find User
    user_post.Registred User
   
    ${RESULT}                     Get On Session  hotelAPI   ${USERS_URI}/${WRONG_ID} 
    ...                           expected_status=anything

    Set Test Variable             ${RESULT}



