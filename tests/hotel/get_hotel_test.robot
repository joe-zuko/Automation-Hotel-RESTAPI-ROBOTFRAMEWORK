*** Settings ***
Resource            ${CURDIR}/../../services/hotel/hotel_get.robot
Suite Setup         Conectar a minha API

*** Test Cases ***
When I get an Hotel
    Get an Hotel
    Status Code  200

Hotel has wrong ID
    Hotel has wrong ID
    Status Code  404
    Message Response   Hotel not found.

