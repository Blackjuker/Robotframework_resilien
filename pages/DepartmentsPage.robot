*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${DEPT_BUTTON}        xpath=//button[contains(text(), "Afficher départements")]
${DEPT_NAMES_CELLS}   xpath=//table/tbody/tr/td[2]    # 2ème colonne = nom

*** Keywords ***
Open Departments Page
    Open Browser    http://192.168.1.95:3000/    chrome
    Maximize Browser Window

Click Show Departments Button
    Wait Until Element Is Visible    ${DEPT_BUTTON}    timeout=10
    Click Element    ${DEPT_BUTTON}

Get Displayed Departments
    Wait Until Element Is Visible    ${DEPT_NAMES_CELLS}    timeout=10
    ${elements}=    Get WebElements    ${DEPT_NAMES_CELLS}
    ${names}=    Create List
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        Append To List    ${names}    ${text}
    END
    RETURN    ${names}

Close Departments Page
    Close Browser
