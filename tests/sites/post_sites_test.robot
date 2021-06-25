*** Settings ***
Resource            ${CURDIR}/../../services/sites/sites_post.robot
Suite Setup         Conectar a minha API

*** Test Cases ***
When create a new site
    New site
    Status Code  200

When same site ID
    Same Site ID
    Status Code  400
    Message Response   The site '{}' already exists.
