*** Settings ***
Resource            ${CURDIR}/../../services/hotel/hotel_delete.robot
Suite Setup         Conectar a minha API

*** Test Cases ***
When I delete an Hotel
    Delete an Hotel
    Status Code  200
    Message Response   Hotel deleted.

Hotel has wrong ID
    Hotel has wrong ID
    Status Code  404
    Message Response   Hotel not found.

