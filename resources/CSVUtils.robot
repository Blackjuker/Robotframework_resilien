*** Settings ***
Library    OperatingSystem
Library    Collections
Library    String
Library    BuiltIn

*** Keywords ***
Get Department Names From CSV
    ${content}=    Get File    ${CURDIR}/../data/departments.csv    encoding=UTF-8
    ${lines}=    Split String    ${content}    \n
    ${departments}=    Create List
    FOR    ${line}    IN    @{lines}[1:]
        ${line}=    Strip String    ${line}
        Run Keyword If    '${line}' == ''    Continue For Loop
        ${fields}=    Split String    ${line}    ,
        Run Keyword If    len(${fields}) < 2    Continue For Loop
        Append To List    ${departments}    ${fields[1]}
    END
    RETURN    ${departments}
