*** Settings ***

DOCUMENTATION         Practicing concepts: keyword file implementing
...                   tests cases to API "fakerestapi".

Library               Collections
...                   WITH NAME                                         collection

Library               RequestsLibrary
...                   WITH NAME                                         request

Library               BuiltIn
...                   WITH NAME                                         std

Library               OperatingSystem
...                   WITH NAME                                         system

*** Variables ***

${URL_API}=           https://fakerestapi.azurewebsites.net/api
${URI}=               Books
${BODY_POST_PATH}=    ./other_files/body-model-post.json
${BODY_PUT_PATH}=     ./other_files/body-model-put.json
&{HEADERS}=           content-type=application/json
...                   charset=utf-8

*** Keywords ***

#Suite Setup and Teardown
Connect API
    request.Create Session                       fakerapi
    ...                                          ${URL_API}
    ...                                          disable_warnings=1

Disconnect API
    request.Delete All Sessions

#GET keywords
List a specific book ID=
    [Arguments]                                  ${id_book}

    ${response}=                                 request.Get Request
    ...                                          fakerapi
    ...                                          ${URI}/${id_book}

    std.Log                                      ${response.text}

    std.Set Test Variable                        ${response}

List all existing books
    std.Log                                      ${URI}

    ${response}=                                 request.Get Request
    ...                                          fakerapi
    ...                                          ${URI}

    std.Log                                      ${response.text}

    std.Set Test Variable                        ${response}

#POST keywords
Record a new book
    #getting a JSON body model from a file
    ${body}=                                     system.Get File
    ...                                          ${BODY_POST_PATH}

    ${response}=                                 request.Post Request
    ...                                          alias=fakerapi
    ...                                          uri=${URI}
    ...                                          data=${body}
    ...                                          headers=${HEADERS}

    std.Log                                      ${response.text}

    std.Set Test Variable                        ${response}

#PUT keywords
Update data of a existing book ID=
    [Arguments]                                  ${id_book}
    #getting a JSON body model from a file

    ${body}=                                     system.Get File
    ...                                          ${BODY_PUT_PATH}

    ${response}=                                 request.Put Request
    ...                                          alias=fakerapi
    ...                                          uri=${URI}/${id_book}
    ...                                          data=${body}
    ...                                          headers=${HEADERS}

    std.Log                                      ${response.text}

    std.Set Test Variable                        ${response}

#DELETE keywords
Delete a existing book ID=
    [Arguments]                                  ${id_book}

    ${response}=                                 request.Delete Request
    ...                                          alias=fakerapi
    ...                                          uri=${URI}/${id_book}

    std.Log                                      ${response.text}

    std.Set Test Variable                        ${response}

#validations keywords
Check status code and reason
    [Arguments]                                  ${status_code_expected}
    ...                                          ${reason_expected}

    std.Should Be Equal As Strings               ${response.status_code}
    ...                                          ${status_code_expected}

    std.Should Be Equal As Strings               ${response.reason}
    ...                                          ${reason_expected}

    std.Log                                      ${response.status_code} - ${response.reason}

Check size of the book list
    [Arguments]                                  ${lenght}

    std.Length Should Be                         ${response.json()}
    ...                                          ${lenght}

# one way to check key value from json response using collections keyword
Check if Title of the book is correct
    [Arguments]                                  ${title_expected}

    collection.Dictionary Should Contain Item    ${response.json()}
    ...                                          Title
    ...                                          ${title_expected}

    std.Log                                      ${response.json()["Title"]}

# other way to check key value from json response using builtin's keywords
Check if PageCount of the book is correct
    [Arguments]                                  ${pagecount_expected}

    ${pagecount_expected_convert}                std.Convert To Integer
    ...                                          ${pagecount_expected}

    std.Should Be Equal As Integers              ${response.json()["PageCount"]}
    ...                                          ${pagecount_expected_convert}

    std.Log                                      ${response.json()["PageCount"]}

Check if Description of the book is correct
    [Arguments]                                  ${description_expected}

    collection.Dictionary Should Contain Item    ${response.json()}
    ...                                          Description
    ...                                          ${description_expected}

    std.Log                                      ${response.json()["Description"]}

Check if book was removed
    collection.Dictionary Should Contain Item    ${response.headers}
    ...                                          content-length
    ...                                          0

    std.Log                                      ${response.headers["content-length"]}

    std.Should Be Empty                          ${response.content}

