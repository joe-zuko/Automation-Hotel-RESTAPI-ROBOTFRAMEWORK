*** Settings ***
Resource            ${CURDIR}/../../services/sites/sites_get.robot
Suite Setup         Conectar a minha API

*** Test Cases ***
When a list all sites
    Sites List
    Status Code  200

When a search one site
    Search a site
    Status Code  200
  
When a site does not exist
    Site does not exist
    Status Code  404
    Message Response   Site not found.