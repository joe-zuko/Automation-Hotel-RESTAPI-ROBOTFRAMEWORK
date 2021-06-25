*** Settings ***
Resource            ${CURDIR}/../../services/hotel/hotel_put.robot
Suite Setup         Conectar a minha API

*** Test Cases ***
When modify hotel
    Put hotel
    Status Code  200

