*** Settings ***

Library    RequestsLibrary


*** Variables ***
${URL}    https://reqres.in/api

*** Keywords ***

# --- DADO ---
Dado que estou conectado na Api  
    [Arguments]    ${FINAL_ENDPOINT}
    ${ALIAS}    Create Session    alias=lista_users    url=${URL}/${FINAL_ENDPOINT}
    Session Exists    alias=lista_users
  
# --- QUANDO ---
Quando envio a requisição para consultar usuarios
    ${RESPONSE}    GET On Session    alias=lista_users    url=${URL}/users?pages=2
    Set Test Variable   ${RESPONSE}

Quando envio a requisição para criar um novo usuario
    ${DADOS}    Create Dictionary    name=Miriam    job=QA
    ${RESPONSE}    POST    ${URL}/users/${DADOS}

Quando envio a requisição para deletar um usuario
    ${RESPONSE}    DELETE     url=${URL}/users/2
# --- ENTÃO ---
Então a Requisição deve ocorrer sucesso
    [Arguments]    ${status_code}
    Status Should Be    ${status_code}
# --- E ---
E deve ser retornado a quantidade de registro corretamente 
    [Arguments]    ${qtd_esperada}  
    ${qtd_retornada}    Get Length    ${RESPONSE.json()['data']}
    Should Be Equal    ${qtd_esperada}    ${qtd_retornada} 


