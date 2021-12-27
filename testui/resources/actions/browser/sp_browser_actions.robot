*** Settings ***
Library    SeleniumLibrary
Variables    ../../../variables/config.py
Resource    ../../pages/browser/sp_browser_pages.robot
*** Variables ***

*** Keywords ***
User launches the browser
    [Documentation]    This action method deals with launching of the browser
    User Opens the Browser
    User sets the window size

User closes the browser
    [Documentation]    This action method deals with the closing of the browser
    close browser

User sets the window size
    [Documentation]    This action method deals with the setting of window size to 1920X1080
    Set Window Size	   1920	   1080

User verifies the page is loaded
    [Documentation]    This method deals whether the page is loaded with the use of Javascript
    FOR    ${i}    IN RANGE    50
        ${result}=    Execute Javascript    return document.readyState
        IF    '${result}'=='complete'
            Log    Page is loaded
            Exit for loop
        ELSE
            Sleep    1s
        END
    END