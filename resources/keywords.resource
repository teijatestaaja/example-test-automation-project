*** Settings ***
Documentation    Keywords for testing Todo app.
Library          QWeb
Resource         variables.resource


*** Keywords ***
Add And Verify Todo Item
    [Documentation]    Adds a given todo item and verifies that it is found last one on the list.
    [Arguments]    ${item}
    Type Text    ${TODO_INPUT}    ${item}
    ${items}=    Get Element Count    //li/div/label
    Verify Element Text    //li[${items}]/div/label    ${item}

Mark Todo Item On Row
    [Documentation]    Marks todo item on a given row. If the item was already marked, unmarks it.
    [Arguments]    ${row}
    ${row}=    Evaluate  ${row}
    ${items}=    Get Element Count    //li/div/label
    IF    ${row} > ${items}    Fail    Please give correct row number!
    Click Element    //li[${row}]/div/input

Setup Browser
    [Documentation]    Sets QWeb to press enter after inputting text to a text field, and opens a browser.
    Set Config    LineBreak    \ue007
