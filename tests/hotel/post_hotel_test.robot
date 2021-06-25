*** Settings ***
Resource            ${CURDIR}/../../services/hotel/hotel_post.robot
Suite Setup         Conectar a minha API

*** Test Cases ***
When create a new hotel
    New hotel
    Status Code  201

When hotel Exist
    Hotel Exist
    Status Code  400
    Message Response   Hotel id '${HOTEL_NAME}' already exists.

When hotel does not Exist
    Hotel does not exist
    Status Code  400
    Message Response   The hotel must be associated to a valid site id.