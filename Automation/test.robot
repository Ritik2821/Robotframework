*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# This is a multi-line comment
${SEARCH_TEXT}    Ritik

*** Test Cases ***
Google
    Open Browser    https://www.google.com/     chrome
    Maximize Browser Window
    sleep   5
    Input Text    name=q    ${SEARCH_TEXT}
    Click Element    xpath=//input[@class='gNO89b']
    Wait For Page To Load
    Close Browser

*** Keywords ***
Wait For Page To Load
    # Wait for an element that shows the page has loaded (e.g., a search result container).
    Wait Until Element Is Visible    xpath=//button[@type='submit']    timeout=10s