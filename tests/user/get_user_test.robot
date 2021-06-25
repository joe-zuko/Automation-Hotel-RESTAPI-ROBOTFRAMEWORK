*** Settings ***
Resource            ${CURDIR}/../../services/user/user_post.robot
Resource            ${CURDIR}/../../services/user/user_get.robot
Suite Setup         Conectar a minha API

*** Test Cases ***
When I find an user
    Find User
    Status Code  200
    
When wrong id number
    Does not find User
    Status Code  404
    Message Response   User not found.
