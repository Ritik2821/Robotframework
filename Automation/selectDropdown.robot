*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://www.tutorialspoint.com/selenium/practice/selenium_automation_practice.php
${browser}  chrome
${name}     Ritik Sharma
${email}    ritik1488@gmail.com

*** Test Cases ***
Student Registration Form
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    set selenium speed  2seconds    #THIS command will put wait afer every test step .It will increase execution time
#    Sleep   3
   title should be     Selenium Practice - Student Registration Form
    Input Text    id=name    ${name}
    Input Text    id=email    ${email}

#    SELECTING RADIO BUTTONS
#    Selecting Radio Button
#    select radio button   tab   igottwo
#    sleep   3

#  HANDLING CHECK BOX
#    select checkbox     dob
#    Sleep   3
#     Click Element  xpath://input/following-sibling::label[text()="Reading"]

#   DROP DOWN
    select from list by label     state    NCR
    select from list by index     state    4
#     Sleep  3
    Close Browser