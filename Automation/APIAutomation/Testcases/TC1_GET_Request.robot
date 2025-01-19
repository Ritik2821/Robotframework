*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${url}  https://reqres.in
${id}   9

*** Test Cases ***
Create session and fetching data
    Create Session    mysession    ${url}
    ${response}=    GET On Session    mysession    /api/users/${id}              # Give User list
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}

#    VALIDATION

#    Verifying that we are get expected response
    ${status_code}=    Convert To String    ${response.status_code}         #Convert jSON format output to String Fotrmat
    Should Be Equal As Numbers    ${status_code}    200

#    Verifying body contains expected content
    ${body}=    Convert To String    ${response.content}
    Should contain    ${body}     Tobias

#   Verify header
#   Verify the Content-Type of header
    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Log To Console    ${contentTypeValue}
    should be equal     ${contentTypeValue}     application/json; charset=utf-8


