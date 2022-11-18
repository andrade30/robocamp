*** Settings ***
Library    Browser

*** Keywords ***
Go To Login Page
    New Browser    headless=False    browser=chromium
    New Page       http://localhost:3000

Fill Credentials
    [Arguments]       ${email}    ${senha}  
    Fill Text      css=input[placeholder="Seu e-mail"]    ${email}
    Fill Text      css=input[placeholder="Sua Senha"]     ${senha}

Submit Credentials
    # Click          xpath=//button[text()="Entrar no sistema"]
    # Click            text=Entrar no sistema

    Click            css=button >> text=Entrar no sistema

    # Sleep    10

Field Type Should Be Email
    #Verifica se o tipo do campo é e-mail sendo o atributo que faz a validação.
    Get Attribute    css=input[placeholder="Seu e-mail"]
...    type     equal     email

Alert Text Should Be
    [Arguments]   ${field}  ${expected_text}

    Get Text    xpath=//input[@type="${field}"]/..//span
    ...    equal    ${expected_text}