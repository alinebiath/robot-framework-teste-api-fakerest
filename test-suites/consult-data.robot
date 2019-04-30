*** Settings ***

DOCUMENTATION     Praticing concepts: test suite for consult resource (books) using API "FakeRestAPI.Web".

Resource          ../keywords/faker-api.robot

Suite Setup       Connect API
Suite Teardown    Disconnect API

*** Test Case ***

TestCase 01: Searching and Returning a specific book
    [Tags]                                       onebook
    List a specific book ID=                     29
    Check status code and reason                 200         OK

TestCase 02: Searching and Returning all books
    [Tags]                                       allbooks
    List all existing books
    Check status code and reason                 200         OK
    Check size of the book list                  200

TestCase 03: Validating data from a book
    List a specific book ID=                     29
    Check if Title of the book is correct        Book 29
    Check if PageCount of the book is correct    2900



