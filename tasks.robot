*** Settings ***
Documentation    Template robot main suite.
Library          Collections
Library          RPA.Browser
Library          RPA.Excel.Files
Library          RPA.Hubspot
Resource         keywords/keywords.robot
Variables        variables.py

*** Keywords ***
Read Excel
    Open Workbook        D:\\FHAI\\robot testing\\excel\\Book1.xlsx
    ${List}    Read Worksheet    header=true
   Log To Console    ${List} 
   Close Workbook
    FOR    ${index}    IN    @{List}    
        Search cars    ${index}
    END    
Search cars
    [Arguments]    ${index}
    Go To    https://carvago.com/   
    Maximize Browser Window
    Wait Until Element Is Visible    xpath:/html/body/div[1]/div/main/div[2]/div[1]/div[1]/div/div[1]/form/div[1]/div[1]/div/div/div/div/div[1]/div[2]
    Click Element    xpath:/html/body/div[1]/div/main/div[2]/div[1]/div[1]/div/div[1]/form/div[1]/div[1]/div/div/div/div/div[1]/div[2]
    Press Keys    NONE    ${index}[make]
    Sleep    500ms
    Press Keys    NONE    TAB
    Press Keys    NONE    TAB
    Sleep    500ms
    Press Keys    NONE    ${index}[model]
    Sleep    500ms
    Press Keys    NONE    TAB
    Press Keys    NONE    TAB
    Sleep    500ms
    Press Keys    NONE    ${index}[max_km]
    Sleep    500ms
    Press Keys    NONE    ENTER
    Sleep    3000ms
    # กดปุ่มไม่ติด ไม่รู้ทำไม เลยใช้ enter แทน Click Element  ถ้ากดปุ่มคืออันนี้ >>   xpath:/html/body/div[1]/div/main/div[2]/div[1]/div[1]/div/div[1]/form/div[2]/div[1]/button
    # เลือก recommended กดได้อยู่
    Click Element    xpath:/html/body/div[1]/div/main/div[2]/div[2]/section/div/div[1]/div[3]/div[1]/div/div/div
    # เลือก Lowest price wait untill นี่เติมเอง ลองเลือกแบบ slepp ... ms ก็ไม่หาย
    Sleep    3000ms
    Wait Until Element Is Visible    xpath:/html/body/div[8]/div/div/div/div[2]/div/div[6]/p
    Click Element    xpath:/html/body/div[8]/div/div/div/div[2]/div/div[6]/p
    Sleep    3000ms

*** Tasks ***
Main
    Open Available Browser
    Read Excel
    
