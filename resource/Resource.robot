*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${BROWSER}   firefox
${URL}       https://www.automationpractice.com/
*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Open Browser  about:blank  ${BROWSER}
Fechar navegador
    Close Browser

#### ACOES
Acessar a página home do site
    Go to       ${URL}
    Title Should be  My Store

Digita o nome do produto "${PRODUCT}" no campo de pesquisa
    Input Text  name=search_query  ${PRODUCT}

Clicar no botao pesquisar
    Click Element  name=submit_search

#### CONFERENCIAS
Conferir se o produto "${PRODUCT}" foi listado no site
    wait until element is visible       css=#center_column > h1
    Title Should be                     Search - My Store
    Page should Contain Image           xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link            xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"Blouse")]

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible       //*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be              //*[@id="center_column"]/p[@class='alert alert-warning']   ${MENSAGEM_ALERTA}
