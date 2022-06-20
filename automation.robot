*** Settings ***
Library  SeleniumLibrary    # da aonde eu vou tirar as linguagens
Library  FakerLibrary       # para gerar dadods aleatorios ficticios. (EMAIL, TELEFONE, CEP ETC.)
Test Setup  Open Browser  browser=chrome

#São dados que usamos mais de uma vez. Darei um nome e chamarei pelo nome que for.
*** Variables ***
${SITE}  https://www.google.com.br/
${SITE_TEST}  http://automationpractice.com/index.php



#Area destinadas para executar os tests.
*** Test Cases ***
Scenario 01: Cenario de tests
    ${EMAIL} =   FakerLibrary.Email
    ${ZIPCODE} =  FakerLibrary.Zipcode
    Go To  ${SITE_TEST}
    #Wait Until Element Is Visible  
    Click Element  xpath=//img[@title = 'Faded Short Sleeve T-shirts']
    Click Button   name=Submit
    Wait Until Element Is Visible  xpath=//a[@title = 'Proceed to checkout']
    Click Element  xpath=//a[@title = 'Proceed to checkout']
    Click Element  xpath=//a[@class = 'button btn btn-default standard-checkout button-medium']
    Input Text     id=email_create   ${EMAIL}
    Click Button   id=SubmitCreate
    Wait Until Element Is Visible  id=customer_firstname
    Input Text     id=customer_firstname  Andre
    Input Text     id=customer_lastname  Victor
    Input Text     id=passwd  123456
    Select From List By Value    id=days  14
    Select From List By Value    id=months  4
    Select From List By Value    id=years  1988
    Input Text     id=company  Empiricus
    Input Text     id=address1  Rua Genuino
    Input Text     id=city   Porto Alegre
    Select From List By Label  id=id_state  Texas
    Input Text     id=postcode      ${ZIPCODE}
    Input Text     id=phone_mobile   4128293993
    Click Button   id=submitAccount
    Click Button   name=processAddress
    Select Checkbox  id=cgv
    Click Button     name=processCarrier
    Click Element    class=bankwire 
    Click Button     xpath=//button[@class = 'button btn btn-default button-medium']
    #como usar a linguagem de xpath = $x("//a[@title = 'texto']")