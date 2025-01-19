*** Settings ***
Library    RequestsLibrary    # Required for HTTP operations
Library    Collections        # Required for dictionary operations

*** Variables ***
${url}    https://reqres.in
${id}     2

*** Test Cases ***
Creating session and Creating new resource
    Create Session    mysession    ${url}

    # Create a dictionary with the request body for POST request
    ${body}=    Create Dictionary    name=Morpheus    job=leader

    # Send GET request to fetch user details (optional)
    ${response}=    GET On Session    mysession    /api/users/${id}

    # Create a header for Content-Type
    ${header}=    Create Dictionary    Content-Type=application/json; charset=utf-8

    # Send POST request with JSON data
    ${post_response}=    POST On Session    mysession    /api/users    json=${body}    headers=${header}

    # Log the status code of the POST request
    Log To Console    ${post_response.status_code}

    # Optionally log the response content to verify the result
    Log To Console    ${post_response.content}

    # Assert that the status code for POST is 201 (Created)
    Should Be Equal As Numbers    ${post_response.status_code}    201

    #Validation
    ${res_body}=    Convert To String    ${post_response.content}
    Should contain  ${res_body}     "job":"leader"


