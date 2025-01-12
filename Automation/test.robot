*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# This is a multi-line comment

*** Test Cases ***
Google
    Open Browser    https://www.google.com/     chrome
    sleep   5
    Close Browser

*** Keywords ***
