*** Settings ***
Documentation    Gerenciando a massa de testes através do Banco de Dados

Library    DatabaseLibrary

*** Keywords ***
Connect to Postgres
    Connect To Database  psycopg2  
    ...                  dcojoerv  
    ...                  dcojoerv  
    ...                  7xyhWgxB_ylcnUG_Ti20U_t0QFhfJhyF  
    ...                  babar.db.elephantsql.com  
    ...                  5432

Select Student Where Email
    [Arguments]        ${email}

    ${query}     Set Variable
    ...          SELECT * FROM public.students WHERE email = '${email}';

    ${result}    Query    ${query}

    [return]    ${result}[0]

Delete Enroll By Email
    [Arguments]    ${email}

    ${user}    Select Student Where Email    ${email}

#Query SQL no formato de string
    ${query}    Set Variable
    ...         DELETE FROM public.enrollments WHERE student_id = '${user}[0]';

    Execute Sql String    ${query}

#Helpers
Reset Student Enroll
    [Arguments]    ${email}
    #Palavras chaves que irão limpar o ambiente exatamente pra massa de teste do Falcão antes de logar na aplicação.
    Connect to Postgres
    Delete Enroll By Email    ${email}
    Disconnect From Database