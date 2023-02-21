*** Settings ***
Documentation     Example tests for Todo App.
Library           QWeb
Resource          ../resources/variables.resource
Resource          ../resources/keywords.resource
Test Tags         smoke
Suite Setup       Setup Browser
Test Setup        Open Browser    ${LINK_TO_SUT}    ${BROWSER}
Test Teardown     Close Browser
Suite Teardown    Close All Browsers


*** Test Cases ***
Page Title And Placeholder Should Be Shown
    [Documentation]    Tests that page title and placeholder for todo input field are shown.
    Verify Element Text    //h1    todos
    Verify Attribute    ${TODO_INPUT}    placeholder    What needs to be done?

Add New Todo Items
    [Documentation]    Tests that new todo items can be added.
    Add And Verify Todo Item    Create robot tests
    Add And Verify Todo Item    Run robot tests
    Add And Verify Todo Item    Analyse test run results
    Verify Text    3 items left

Mark Todo Item
    [Documentation]    Tests that a todo item can be marked.
    Add And Verify Todo Item    Create robot tests
    Mark Todo Item On Row    1
    Verify Text    0 items left

Unmark Todo Item
    [Documentation]    Tests that a marked todo item can be unmarked.
    [Tags]    dev
    Add And Verify Todo Item    Create robot tests
    Mark Todo Item On Row    1
    Mark Todo Item On Row    1
    Verify Text    1 item left
