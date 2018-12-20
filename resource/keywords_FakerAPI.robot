*** Settings ***

DOCUMENTATION    Practicing concepts: keyword file implementing
...              tests cases to API "fakerestapi"
Library          Collections                                       WITH NAME    collection
Library          RequestsLibrary                                   WITH NAME    request
Library          BuiltIn                                           WITH NAME    std
Library          OperatingSystem                                   WITH NAME    system

*** Variables ***

${URL-API}=      https://fakerestapi.azurewebsites.net/api
${URI}=          Books

*** Keywords ***

#Suite Setup and Teardown
Connect API
    request.Create Session                       fakerapi                                 ${URL-API}                                                                                              disable_warnings=0

Disconnect API
    request.Delete All Sessions

#GET keywords
List a specific book ID=
    [Arguments]                                  ${id_book}
    ${response}=                                 request.Get Request                      fakerapi                                                                                                ${URI}/${id_book}
    std.Log                                      ${response.text}
    std.Set Suite Variable                       ${response}

List all existing books
    std.Log                                      ${URI}
    ${response}=                                 request.Get Request                      fakerapi                                                                                                ${URI}
    std.Log                                      ${response.text}
    std.Set Suite Variable                       ${response}

#POST keywords
Record a new book
    ${headers}                                   std.Create Dictionary                    content-type=application/json                                                                           charset=utf-8
    ${body}=                                     system.Get File                          C:\\exemplos_estudos\\Robot_tests\\curso_basico\\Robot-test_API-Rest\\resource\\body_model_POST.json
    ${response}=                                 request.Post Request
    ...                                          alias=fakerapi
    ...                                          uri=${URI}
    ...                                          data=${body}
    ...                                          headers=${headers}
    std.Log                                      ${response.text}
    std.Set Suite Variable                       ${response}

#PUT keywords
Update data of a existing book ID=
    [Arguments]                                  ${id_book}
    ${headers}                                   std.Create Dictionary                    content-type=application/json                                                                           charset=utf-8
    ${body}=                                     system.Get File                          ../resource/body_model_PUT.json
    ${response}=                                 request.Put Request
    ...                                          alias=fakerapi
    ...                                          uri=${URI}/${id_book}
    ...                                          data=${body}
    ...                                          headers=${headers}
    std.Log                                      ${response.text}
    std.Set Suite Variable                       ${response}

#DELETE keywords
Delete a existing book ID=
    [Arguments]                                  ${id_book}
    ${response}=                                 request.Delete Request
    ...                                          alias=fakerapi
    ...                                          uri=${URI}/${id_book}
    std.Log                                      ${response.text}
    std.Set Suite Variable                       ${response}

#validations keywords
Check status code
    [Arguments]                                  ${status_code_expected}
    std.Should Be Equal As Strings               ${response.status_code}                  ${status_code_expected}
    std.Log                                      ${response.status_code}

Check reason
    [Arguments]                                  ${reason_expected}
    std.Should Be Equal As Strings               ${response.reason}                       ${reason_expected}
    std.Log                                      ${response.reason}

Check size of the book list
    [Arguments]                                  ${lenght}
    std.Length Should Be                         ${response.json()}                       ${lenght}

# uma maneira de checar o valor de uma key na resposta em json usando keywords da collection
Check if Title of the book is correct
    [Arguments]                                  ${title_expected}
    collection.Dictionary Should Contain Item    ${response.json()}                       Title                                                                                                   ${title_expected}
    std.Log                                      ${response.json()["Title"]}

# outra maneira de checar valores de uma key
Check if PageCount of the book is correct
    [Arguments]                                  ${pagecount_expected}
    ${pagecount_expected_convert}                std.Convert To Integer                   ${pagecount_expected}
    std.Should Be Equal As Integers              ${response.json()["PageCount"]}          ${pagecount_expected_convert}
    std.Log                                      ${response.json()["PageCount"]}

Check if Description of the book is correct
    [Arguments]                                  ${description_expected}
    collection.Dictionary Should Contain Item    ${response.json()}                       Description                                                                                             ${description_expected}
    std.Log                                      ${response.json()["Description"]}

Check if book was removed
    collection.Dictionary Should Contain Item    ${response.headers}                      content-length                                                                                          0
    std.Log                                      ${response.headers["content-length"]}
    std.Should Be Empty                          ${response.content}

