*** Settings ***
Documentation        Suites de testes de autenticação
...                  Administrador deve acessar o portal de gestão de academias

Resource    ../resources/base.resource

*** Test Cases ***
Login do Administrador
    Go To Login Page
    Fill Credentials    admin@smartbit.com    qacademy
    Submit Credentials
    User Should Be Looged In    Admin

    # Click          text=Entrar no sistema

    # Click          css=button >> text=Entrar no sistema

Email não cadastrado
    Go To Login Page
    Fill Credentials      andrade@smartbit.com    qacademy
    Submit Credentials
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente!

Senha invalida
    Go To Login Page
    Fill Credentials    admin@smartbit.com    abc123
    Submit Credentials
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente!

Email no formato incorreto
    [Tags]    temp
    Go To Login Page
    Fill Credentials    @com.br    abc123
    Submit Credentials
    Field Type Should Be Email

    Sleep    10

Senha em branco
    [Tags]    temp
    Go To Login Page
    Fill Credentials    admin@smartbit.com    ${EMPTY}
    Submit Credentials
    Alert Text Should Be    password    A senha é obrigatória

Email em branco
    [Tags]    temp
    Go To Login Page
    Fill Credentials    ${EMPTY}    qacademy
    Submit Credentials
    Alert Text Should Be     email    O e-mail é obrigatório

Email e Senha são obrigatórios
    Go To Login Page
    Submit Credentials

    Alert Text Should Be    email       O e-mail é obrigatório
    Alert Text Should Be    password    A senha é obrigatória

    

    