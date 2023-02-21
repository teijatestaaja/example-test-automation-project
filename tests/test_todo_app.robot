*** Settings ***
Documentation     Example tests for Todo App.
Library           QWeb
Resource          ../resources/variables.resource
Resource          ../resources/keywords.resource
Test Tags         smoke
Suite Setup       Setup Browser
Suite Teardown    Close All Browsers


*** Test Cases ***
Page Title And Placeholder Should Be Shown
    [Documentation]    Tests that page title and placeholder for todo input field are shown.
    Verify Element Text    //h1    todos
    Verify Attribute    ${TODO_INPUT}    placeholder    What needs to be done?

Should Add New Todo Items
    [Documentation]    Tests that new todo items can be added.
    Add And Verify Todo Item    Create robot tests    1
    Add And Verify Todo Item    Run robot tests    2
    Add And Verify Todo Item    Create test documentation    3
    Verify Text    3 items left
