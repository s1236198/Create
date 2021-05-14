*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Create Class Page
Suite Teardown    Close Browser
Test Setup        Go To Create Class Page
Test Template     Create With Invalid Data Should Fail
Resource          resource.robot

*** Test Cases ***               StartDate             EndDate              TeacherName              difficulty             Instruction
Invalid StartDate And EndDate    invalid               invalid              ${VALID TeacherName}     ${VALID difficulty}    ${VALID Instruction}  
Empty StartDate And EndDate      ${EMPTY}              ${EMPTY}             ${VALID TeacherName}     ${VALID difficulty}    ${VALID Instruction}
Empty TeacherName                ${VALID StartDate}    ${VALID EndDate}     ${EMPTY}                 ${VALID difficulty}    ${VALID Instruction}
Empty difficulty                 ${VALID StartDate}    ${VALID EndDate}     ${VALID TeacherName}     ${EMPTY}               ${VALID Instruction}
Empty Instruction                ${VALID StartDate}    ${VALID EndDate}     ${VALID TeacherName}     ${VALID difficulty}    ${EMPTY}

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]       ${StartDate}             ${EndDate}              ${TeacherName}              ${difficulty}             ${Instruction}
    Input StartDate     ${StartDate}
    Input EndDate       ${EndDate}
    Input TeacherName   ${TeacherName}
    Input difficulty    ${difficulty}
    Input Instruction   ${Instruction}

    Submit Credentials
    Create Class Should Have Failed

Login Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page
