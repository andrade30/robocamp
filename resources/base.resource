*** Settings ***
Documentation    Tudo começa aqui

Library    Browser

Resource    ../resources/pages/login.resource
Resource    components/navbar.resource
Resource    components/toast.resource
Resource    pages/login.resource
Resource    pages/enroll.resource

*** Keywords ***
#Helpers
Do login
    [Arguments]    ${user}
    
    Go To Login Page
    Fill Credentials    ${user}[email]   ${user}[senha]
    Submit Credentials
    User Should Be Looged In    ${user}[name]