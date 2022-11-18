*** Settings ***
Documentation        Suites de testes de matrículas de alunos
...                  Administrador uma vez logado consegue matricular alunos na academia

Resource    ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno

    #Falcão não mexer
    #Smart
    #10/11/2022

    ${admin}    Create Dictionary
    ...    name=Admin
    ...    email=admin@smartbit.com
    ...    senha=qacademy

    Do Login    ${admin}

    Go To Enrolls
    Go To Enrolls Form
    Select Student    Falcão Não mexer
    Select Plan       Smart
    Fill Start Date

    Sleep    30
