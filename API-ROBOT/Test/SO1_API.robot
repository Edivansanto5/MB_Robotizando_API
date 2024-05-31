*** Settings ***

Resource     ../Resources/Api_Resouces.robot

*** Test Case ***

CT01: Realizar uma Requisição GET consultando lista de usuario
    [Documentation]        CARD XXYY
    [Tags]  SO1_CT01
    Dado que estou conectado na Api      users?page=2
    Quando envio a requisição para consultar usuarios
    Então a Requisição deve ocorrer GET sucesso  200
    E deve ser retornado a quantidade de registro corretamente    ${6}

CT02: Realizar uma Requisição PUT criando um novo usuario
    [Documentation]      CARD XXYY
    [Tags]  SO1_CT02
    Dado que estou conectado na Api      users
    Quando envio a requisição para criar um novo usuario
    Então a Requisição deve ocorrer GET sucesso  201