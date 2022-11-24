*** Settings ***
Documentation    Tudo começa aqui

Library    Browser

Resource    ../resources/pages/login.resource
Resource    components/navbar.resource
Resource    components/toast.resource
Resource    pages/login.resource
Resource    pages/enroll.resource

Resource    database.resource

Library    JSONLibrary

*** Keywords ***
#Helpers
Do login
    [Arguments]    ${user}
    
    Go To Login Page
    Fill Credentials    ${user}[email]   ${user}[senha]
    Submit Credentials
    User Should Be Looged In    ${user}[name]

Get Fixture 
    [Arguments]    ${fixture_file}

    ${fixture}    Load JSON From File    
    ...           ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...           encoding=UTF-8

    [Return]    ${fixture}