*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/actions/browser/sp_browser_actions.robot
Resource    ../../resources/actions/google_search/sp_google_search_actions.robot

Suite Setup    User launches the browser
Suite Teardown    User closes the browser

*** Variables ***

*** Keywords ***

*** Test Cases ***
TC-001 Google search for a query and verification
    [Documentation]    This test case deals with the mocking of the user action to search any string on given browser and verify the given conditions.
    [Tags]    test_cases    search    TC-001
    Given User opens the search engine on launched browser
    When User searches the string on the browser
    Then User captures and validates the results    navigation_counter=3