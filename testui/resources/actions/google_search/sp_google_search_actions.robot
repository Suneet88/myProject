*** Settings ***
Variables    ../../../variables/test_variables.py
Resource    ../../pages/google_search/sp_google_search_pages.robot

*** Variables ***

*** Keywords ***
User opens the search engine on launched browser
    [Documentation]    This is user action method to launch the search engine
    User opens the search engine

User opens the search engine
    [Documentation]    This is user action method to go to the given search engine
    Go To    ${SEARCH_ENGINE}

User searches the string on the browser
    [Documentation]    This is user action method to search the given string on the search engine laoded
    User searches the search string    ${SEARCH_STRING}

User captures and validates the results
    [Documentation]    This  action method deals with the capturing of the links of the result of first page and then
    ...    try to navigate to given number of pages depending on the given counter
    ...    param : ${navigation_counter}    Parameter to accept the number of navigation links to open.

    [Arguments]    ${navigation_counter}=None
    ${result}    ${texts}=    User captures the result
    ${count}=    User validates the count for olx links    ${result}
    should be true    ${count}>0
    IF    ${navigation_counter}>0
        ${titles}=    User navigates to given number of links    ${texts}    ${navigation_counter}
    END
    [Return]    ${titles}

User validates the count for olx links
    [Documentation]    This action method checks the and validates the number of olx links present in result
    [Arguments]    ${result}    ${text}=olx.in
    ${count}=    Set Variable    ${0}
    FOR    ${link}    IN    @{result}
        ${status}=    Run keyword and return status    should contain    ${link}    ${text}
        IF    '${status}'=='True'
            ${count}=    Evaluate    ${count}+${1}
        END
    END
    [Return]    ${count}