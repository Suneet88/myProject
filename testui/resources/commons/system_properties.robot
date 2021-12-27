*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Variables    ../../variables/config.py

*** Keywords ***
Set System Properties
    [Documentation]    Set the system properties required for the test
    Set Browser Driver Path

Set Browser Driver Path
    [Documentation]    Set the path for the driver of respective browser
    ${system}=    Evaluate    platform.system()    platform

    IF    '${system}'=='Windows' and '${BROWSER}'=='chrome'
        Append To Environment Variable    PATH    ${WINDOWS_CHROME_DRIVER_PATH}
    ELSE
        Append To Environment Variable    PATH    ${WINDOWS_FIREFOX_DRIVER_PATH}
    END
    Set Global Variable    ${DOWNLOAD_DIR}    ${WIN_DOWNLOAD_DIR}