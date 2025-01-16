*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}               https://www.saucedemo.com
${BROWSER}           chrome
${USERNAME}          standard_user
${PASSWORD}          secret_sauce
@{USERS}             standard_user  performance_glitch_user
${CHECKOUT_SUCCESS_MESSAGE}    Thank you for your order!

*** Test Cases ***
Valid Login Test
    [Tags]    login
    [Documentation]    This test case logs into Sauce Labs demo site using valid credentials.
    FOR    ${USER}    IN    @{USERS}
        Open Browser    ${URL}    ${BROWSER}
        Maximize Browser Window
        Input Text    id=user-name    ${USER}
        Input Text    id=password    ${PASSWORD}
        Click Button    id=login-button
        Sleep   2
        Page Should Contain    Products
        Close Browser
    END

End to end testing(Login->Selectitem->Chekout->VerifysuccessMsg)
    [Documentation]    This test case logs into Sauce Labs demo site, adds a product to the cart, and proceeds to checkout Visible.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button
    Page Should Contain    Products
    ${PRODUCT_NAME}  Set Variable   xpath=//div[@class="inventory_item_name "][text()="Sauce Labs Backpack"]
    Click Element    ${PRODUCT_NAME}
    Sleep   2
    Click Button    xpath=//button[text()='Add to cart']
    Proceed to checkout
    Enter checkout information (Shipping details)
    Verify the success message
    Close Browser

*** Keywords ***
Proceed to checkout
    Sleep   1
    Click Element    id=shopping_cart_container
    Sleep   2
    Page Should Contain    Checkout
    Click Button   xpath=//button[@id='checkout']
    Sleep   2
    Page Should Contain       Checkout: Your Information

Enter checkout information (Shipping details)
    ${FIRST_NAME}   Set Variable    Ritik
    ${LAST_NAME}    Set Variable     Sharma
    ${POSTAL_CODE}  Set Variable   482002
    Input Text    id=first-name    ${FIRST_NAME}
    Input Text    id=last-name     ${LAST_NAME}
    Input Text    id=postal-code   ${POSTAL_CODE}
    Click Button   id=continue
    Page Should Contain     Payment Information:

Verify the success message
    Click Button    id=finish
    Page Should Contain     ${CHECKOUT_SUCCESS_MESSAGE}




