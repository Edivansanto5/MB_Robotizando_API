*** Settings ***

Resource     ../Resources/Api_Resouces.robot

*** Test Case ***

CT01: Realizar uma Requisição GET consultando lista de usuario
    [Documentation]        CARD XXYY
    [Tags]  S01CT01
    Dado que estou conectado na Api      users?page=2
    Quando envio a requisição para consultar usuarios
    Então a Requisição deve ocorrer sucesso  200
    E deve ser retornado a quantidade de registro corretamente    ${6}

CT02: Realizar uma Requisição POST criando um novo usuario
    [Documentation]      CARD XXYY
    [Tags]  S01CT02
    Dado que estou conectado na Api      users
    Quando envio a requisição para criar um novo usuario
    Então a Requisição deve ocorrer sucesso  201

CT03: Realizar uma Requisição DELITE excluindo usuario
    [Documentation]      CARD XXYY
    [Tags]  S01CT03
    Dado que estou conectado na Api      users/2
    Quando envio a requisição para deletar um usuario
    Então a Requisição deve ocorrer sucesso  204

CT04: Realizar uma Requisição PUT alterando job do usuario
    [Documentation]      CARD XXYY
    [Tags]  S01CT04
    Dado que estou conectado na Api      users/2
    Quando envio a requisição para alterar job de um usuario
    Então a Requisição deve ocorrer sucesso  200