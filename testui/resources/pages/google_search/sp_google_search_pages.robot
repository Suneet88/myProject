*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../ui_interactions.robot
Resource    ../../actions/browser/sp_browser_actions.robot

*** Variables ***
${GOOGLE_SEARCH_INPUT_XPATH}    //input[@title]
${GOOGLE_SEARCH_SUBMIT_BUTTON}    //input[contains(@value, 'XXX')]
${GOOGLE_SEARCH_NAVIGATION_BAR}    //h1/following-sibling::*[@role='navigation']
${GOOGLE_SEARCH_RESULT_HEADINGS}    //h3/following-sibling::*/*

*** Keywords ***
User searches the search string
    [Documentation]    This method deals with the search of the given string
    ...    param : ${search_string} - The search string user wants to search on search engine
    ...    param : ${default_behavior} - The parameter to handle the search whether user wants to search or to feel lucky.

    [Arguments]    ${search_string}    ${default_behavior}=simple
    Wait    ${GOOGLE_SEARCH_INPUT_XPATH}
    Input Text    ${GOOGLE_SEARCH_INPUT_XPATH}    ${search_string}
    IF    '${default_behavior}'=='Lucky'
        ${value}=    Set Variable    Feeling Lucky
    ELSE
        ${value}=    Set Variable    Google Search
    END
    ${GOOGLE_SEARCH_SUBMIT_BUTTON}=    Get updated xpath    ${GOOGLE_SEARCH_SUBMIT_BUTTON}    ${value}
    Click    ${GOOGLE_SEARCH_SUBMIT_BUTTON}

User captures the result
    Wait    ${GOOGLE_SEARCH_NAVIGATION_BAR}
    ${actual_result}=    User captures the results
    ${text_result}=    User captures the results text
    [Return]    ${actual_result}    ${text_result}

User captures the results text
    ${count}=    Get Element count    //h3
    ${text_link_list}=    Create list
    FOR    ${i}    IN RANGE    ${count}
        ${text}=    Get Text    (//h3)[${i+1}]
        Append to list    ${text_link_list}    ${text}
    END
    log list    ${text_link_list}
    [Return]    ${text_link_list}


User captures the results
    User verifies the page is loaded
    ${count}=    Get Element count    ${GOOGLE_SEARCH_RESULT_HEADINGS}
    ${ad_link_list}=    Create list
    FOR    ${i}    IN RANGE    ${count}
        ${text}=    Get Text    (${GOOGLE_SEARCH_RESULT_HEADINGS})[${i+1}]
        Append to list    ${ad_link_list}    ${text}
    END
    log list    ${ad_link_list}
    [Return]    ${ad_link_list}

User navigates to given number of links
    [Documentation]    This page method deals with opening the number of links equivalent to the navigation counter
    [Arguments]    ${result}    ${navigation_counter}
    FOR    ${i}    IN RANGE    ${navigation_counter}
        Log    ${result}[${i+1}]
        Click    //*[contains(text(), '${result}[${i+1}]')]    modifier=CTRL
    END
    ${handles}=    get window handles
    ${len}=    get length    ${handles}
    FOR    ${i}    IN RANGE    ${len}
        switch window    ${handles}[${i}]
        User verifies the page is loaded
    END
    ${titles}=    get window titles
    [Return]    ${titles}

