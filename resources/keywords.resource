*** Settings ***
Documentation    Keywords for testing Todo app.
Library          QWeb
Resource         variables.resource


*** Keywords ***
Setup Browser
    [Documentation]    Sets QWeb to press enter after inputting text to a text field, and opens a browser.
    Set Config    LineBreak    \ue007
    Open Browser    ${LINK_TO_SUT}    ${BROWSER}

Add And Verify Todo Item
    [Documentation]    Adds a given todo item and verifies that it is found in the list on given row.
    [Arguments]    ${item}    ${row}
    Type Text    ${TODO_INPUT}    ${item}
    Verify Element Text    //li[${row}]/div/label    ${item}
