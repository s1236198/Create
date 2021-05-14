*** Settings ***
Documentation     A test suite with a single test for valid create class.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Create
    Open Browser To Create Class Page
    Input StartDate    2021-05-05
    Input EndDate    2021-05-18
    Input TeacherName    Mary
    Input difficulty    Beginner
    Input Medium of Instruction    Cantonese
    Submit Data
    Create Class Success Page Should Be Open
    [Teardown]    Close Browser
