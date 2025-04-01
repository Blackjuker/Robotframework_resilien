*** Settings ***
Library           SeleniumLibrary
Resource          ../pages/DepartmentsPage.robot
Resource          ../resources/CSVUtils.robot

*** Test Cases ***
Afficher Tous Les Départements
    [Tags]    departements
    Open Departments Page
    Click Show Departments Button
    ${expected}=    Get Department Names From CSV
    ${actual}=      Get Displayed Departments
    Lists Should Be Equal    ${actual}    ${expected}
    Close Departments Page
