*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# This is a multi-line comment
${SEARCH_TEXT}    Ritik
${url}  https://www.google.com/
${browser}  chrome

*** Test Cases ***
Google
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    sleep   5
    Input Text    name=q    ${SEARCH_TEXT}
    # Scroll until the search button appears
    Wait Until Element Is Visible    xpath=//input[@value='Google Search']
    Scroll Element Into View    xpath=//input[@value='Google Search']
    Click Element    xpath=//input[@value='Google Search']
    Wait For Page To Load
    Close Browser

*** Keywords ***
Wait For Page To Load
    # Wait for an element that shows the page has loaded (e.g., a search result container).
    Wait Until Element Is Visible    xpath=//button[@type='submit']    timeout=10s