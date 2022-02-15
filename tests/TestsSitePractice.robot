*** Settings ***
Resource   ../resource/Resource.robot

Test Setup  Abrir navegador
Test Teardown  Fechar navegador

### SETUP ele roda keyword antes da suite ou antes de um teste
### TEARDOWN ele roda keyword depois de uma suite ou um teste

*** Variables ***


*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
    Acessar a página home do site
    Digita o nome do produto "Blouse" no campo de pesquisa
    Clicar no botao pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto nao existente
    Acessar a página home do site
    Digita o nome do produto "itemNaoExistente" no campo de pesquisa
    Clicar no botao pesquisar
    Conferir mensagem de erro "No results were found for your search "itemNaoExistente""

*** Keywords ***