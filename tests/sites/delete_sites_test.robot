*** Settings ***
Resource            ${CURDIR}/../../services/sites/sites_delete.robot
Suite Setup         Conectar a minha API

*** Test Cases ***
When I delete one site
    Delete a site
    Status Code  200
    Message Response   Site deleted.
  
When a site does not exist
    Site does not exist
    Status Code  404
    Message Response   Site not found.