*** Settings ***
Library    SeleniumLibrary
Variables    ../../../variables/config.py

*** Variables ***

*** Keywords ***
User Opens the Browser
    [Documentation]    This method consist of the actual robot-selenium method to launch the browser with blank site
    Open Browser	about:blank    browser=${BROWSER}