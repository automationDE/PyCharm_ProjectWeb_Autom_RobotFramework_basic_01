*** Settings ***
Resource   ../resource/Resource.robot

Test Setup  Abrir navegador
Test Teardown  Fechar navegador


*** Variables ***
${URL}      https://www.automationpractice.com/
${BROWSER}  chrome

*** Test Case ***
Cenário 01: Pesquisar produto existente
    Dado que eu estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Entao o produto "Blouse" deve ser listado na página de resultado da busca

Cenário 02 Pesquisar produto NAO existente
    Dado que eu estou na página home do site
    Quando eu pesquisar pelo produto "ItemNaoExistente"
    Entao a página deve exibir a mensagem "No results were found for your search "ItemNaoExistente""

*** Keywords ***
Dado que eu estou na página home do site
    Acessar a página home do site

Quando eu pesquisar pelo produto "${PRODUCT}"
    Digita o nome do produto "${PRODUCT}" no campo de pesquisa
    Clicar no botao pesquisar

Entao o produto "${PRODUCT}" deve ser listado na página de resultado da busca
    Conferir se o produto "${PRODUCT}" foi listado no site

Entao a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Conferir mensagem de erro "${MENSAGEM_ALERTA}"