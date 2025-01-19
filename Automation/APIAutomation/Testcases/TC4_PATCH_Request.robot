*** Settings ***
Library    RequestsLibrary    # Required for HTTP operations
Library    Collections        # Required for dictionary operations

*** Variables ***
${url}    https://reqres.in
${id}     2

*** Test Cases ***

Creating session
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

    # Validation of POST response body
    ${res_body}=    Convert To String    ${post_response.content}
    Should Contain  ${res_body}     "job":"leader"

    # -----------------------------
    # PUT Request to Update User
    # -----------------------------

    # Create a new dictionary with updated data
    ${updated_body}=    Create Dictionary    name=Ritik    job=QA Engineer

    # Send PUT request to update user
    ${put_response}=    PUT On Session    mysession    /api/users/${id}    json=${updated_body}    headers=${header}

    # Log the status code of the PUT request
    Log To Console    ${put_response.status_code}

    # Log the response content to verify the update
    Log To Console    ${put_response.content}

    # Assert that the status code for PUT is 200 (OK)
    Should Be Equal As Numbers    ${put_response.status_code}    200

    # Validation of PUT response body
    ${put_res_body}=    Convert To String    ${put_response.content}
    Should Contain  ${put_res_body}     "name":"Ritik"
    Should Contain  ${put_res_body}     "job":"QA Engineer"

    # -----------------------------
    # PATCH Request to Partially Update User
    # -----------------------------

    # Create a new dictionary with the field to update
    ${patch_body}=    Create Dictionary    job=Senior QA Engineer

    # Send PATCH request to partially update the user's job field
    ${patch_response}=    PATCH On Session    mysession    /api/users/${id}    json=${patch_body}    headers=${header}

    # Log the status code of the PATCH request
    Log To Console    ${patch_response.status_code}

    # Log the response content to verify the update
    Log To Console    ${patch_response.content}

    # Assert that the status code for PATCH is 200 (OK)
    Should Be Equal As Numbers    ${patch_response.status_code}    200

    # Validation of PATCH response body
    ${patch_res_body}=    Convert To String    ${patch_response.content}
    Should Contain  ${patch_res_body}     "job":"Senior QA Engineer"
