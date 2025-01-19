*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://www.flipkart.com/
${browser}  chrome

*** Test Cases ***
ValidationTest
    open Browser  ${url}   ${browser}
    wait until page contains   ${url}
    Maximize Browser Window
    title should be     Online Shopping Site for Mobiles, Electronics, Furniture, Grocery, Lifestyle, Books & More. Best Offers!
    Click Element    //span[text()='Login']
    ${inputtext}    set variable    xpath://*[@id="container"]/div/div[3]/div/div[2]/div/form/div[1]/input
    element should be enabled   ${inputtext}
    element should be visible   ${inputtext}
    sleep   3
    Input Text    ${inputtext}    ritik1488@gmail.com
    clear element text  ${inputtext}
    sleep   3
    Close Browser