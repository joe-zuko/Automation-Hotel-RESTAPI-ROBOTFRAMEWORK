*** Settings ***
Resource            ${CURDIR}/../../services/user/user_post.robot
Resource            ${CURDIR}/../../services/user/user_delete.robot
Suite Setup         Conectar a minha API

*** Test Cases ***
When I delete an user
    Delete User
    Status Code  200
    Message Response   User deleted.
    

