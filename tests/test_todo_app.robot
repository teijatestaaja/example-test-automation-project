*** Settings ***
Documentation     Example tests for Todo App.
Library           QWeb
Resource          ../resources/variables.resource
Test Tags         smoke
Suite Setup       Open Browser    ${LINK_TO_SUT}    ${BROWSER}
Suite Teardown    Close All Browsers


*** Test Cases ***
Page Title And Placeholder Should Be Shown
    [Documentation]    Tests that page title and placeholder for todo input field are shown.
    Verify Element Text    //h1    todos
    Verify Attribute    //input    placeholder    What needs to be done?
