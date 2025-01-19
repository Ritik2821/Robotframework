*** Settings ***
Library    RequestsLibrary    # Required for HTTP operations
Library    Collections        # Required for dictionary operations

*** Variables ***
${url}    https://reqres.in
${id}     2

*** Test Cases ***

Creating session and deleting user
    Create Session    mysession    ${url}

    # Send GET request to fetch user details (optional, just for context)
    ${response}=    GET On Session    mysession    /api/users/${id}

    # Log the status code and response content of the GET request
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    # Create a header for Content-Type (optional if required by the server)
    ${header}=    Create Dictionary    Content-Type=application/json; charset=utf-8

    # Send DELETE request to remove the user
    ${delete_response}=    DELETE On Session    mysession    /api/users/${id}    headers=${header}

    # Log the status code of the DELETE request
    Log To Console    ${delete_response.status_code}

    # Assert that the status code for DELETE is 204 (No Content)
    Should Be Equal As Numbers    ${delete_response.status_code}    204

    # Optionally log the response content (DELETE response may not have content)
    Log To Console    ${delete_response.content}

    # Optional: Send a GET request again to ensure the user is deleted
    ${get_response}=    GET On Session    mysession    /api/users/${id}

    # Log the GET response status code
    Log To Console    ${get_response.status_code}
    Log To Console    ${get_response.content}

    # Ensure the response status code is 404 after the deletion
    # Set the expected status code as an integer (no float)
    ${expected_status_code}=    Set Variable    404
    Should Be Equal As Numbers    ${get_response.status_code}    ${expected_status_code}


    ${status_code}=    Convert To String    ${response.status_code}         #Convert jSON format output to String Format
    Should Be Equal As Numbers    ${status_code}    200