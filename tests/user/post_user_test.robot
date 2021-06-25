*** Settings ***
Resource            ${CURDIR}/../../services/user/user_post.robot
Suite Setup         Conectar a minha API

*** Test Cases ***
When create a new user
    [tags]                        newuser
    New user
    Status Code  201
    Message Response   User created successfully!

When successful login
    Registred User
    Status Code  200

When user exist
    User exist
    Status Code  400
    Message Response   The email '${RANDOM_EMAIL}' already exists.

When wrong password
    Wrong password
    Status Code  401
    Message Response   The username or password is incorrect.

When logout
    [tags]                        logout
    Log Out
    Status Code  200