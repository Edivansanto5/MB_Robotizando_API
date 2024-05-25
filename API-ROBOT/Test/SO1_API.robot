*** Settings ***

Resource     ../Resources/Api_Resouces.robot

*** Test Case ***

CT01: Realizar uma Requisição GET consultando lista de usuario
    [Documentation]      Teste de Api
    [Tags]  SO1_API 
    Dado que estou conectado na Api      users?page=2
    Quando envio a requisição para consultar usuarios
    Então a Requisição deve ocorrer GET sucesso  200
    E deve ser retornado a quantidade de registro corretamente    ${6}