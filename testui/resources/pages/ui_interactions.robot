*** Settings ***
Library    SeleniumLibrary
Library    String
*** Variables ***

*** Keywords ***
Wait
    [Arguments]    ${xpath}    ${timeout}=None
    Wait Until Element is Visible    ${xpath}    timeout=${timeout}

Click
    [Arguments]    ${xpath}    ${timeout}=None    ${modifier}=None
    Wait    ${xpath}    ${timeout}
    Click Element    ${xpath}    modifier=${modifier}

Get updated xpath
    [Arguments]    ${xpath}    ${value}    ${dynamic_string}=XXX
    ${xpath}=    Replace String    ${xpath}    ${dynamic_string}    ${value}
    [Return]    ${xpath}