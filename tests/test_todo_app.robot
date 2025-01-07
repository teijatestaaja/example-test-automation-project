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
    [Tags]    title
    Verify Element Text    //h1    todos
    Verify Attribute    ${TODO_INPUT}    placeholder    What needs to be done?
    Verify No Text    All
    Verify No Text    Active
    Verify No Text    Completed

Add New Todo Item
    [Documentation]    Tests that a new todo item can be added.
    [Tags]    add
    Add And Verify Todo Item    Create robot tests
    Verify Text    1 item left

Mark Todo Item
    [Documentation]    Tests that a todo item can be marked as completed.
    [Tags]    mark
    Add And Verify Todo Item    Create robot tests
    Mark Todo Item On Row    1
    Verify Text    0 items left

Unmark Todo Item
    [Documentation]    Tests that a marked todo item can be unmarked.
    [Tags]    unmark
    Add And Verify Todo Item    Create robot tests
    Mark Todo Item On Row    1
    Mark Todo Item On Row    1
    Verify Text    1 item left

Mark All Todo Items At Once
    [Documentation]    Tests that all todo items can be marked as complete at once.
    [Tags]    mark_all
    Add And Verify Todo Item    Create robot tests
    Add And Verify Todo Item    Run robot tests
    Add And Verify Todo Item    Analyse test run results
    Click Element    //*[@id\="toggle-all"]
    Verify Text    0 items left

View Completed Todo Items
    [Documentation]    Tests that completed todo items can be viewed.
    [Tags]    view
    Add And Verify Todo Item    Create robot tests
    Mark Todo Item On Row    1
    Click Text    Active
    Verify No Text    Create robot tests
    Click Text    Completed
    Verify Text    Create robot tests

Clear Completed Todo Items
    [Documentation]    Tests that completed todo items can be cleared.
    [Tags]    clear
    Add And Verify Todo Item    Create robot tests
    Add And Verify Todo Item    Run robot tests
    Verify Text    2 items left
    Mark Todo Item On Row    1
    Click Text    Clear completed
    Verify Text    1 item left
    Click Text    Completed
    Verify No Text    Create robot tests

View Active Todo Items
    [Documentation]    Tests that active todo items can be viewed.
    [Tags]    view
    Add And Verify Todo Item    Create robot tests
    Add And Verify Todo Item    Run robot tests
    Click Text    Completed
    Verify No Text    Create robot tests
    Verify No Text    Run robot tests
    Click Text    Active
    Verify Text    Create robot tests
    Verify Text    Run robot tests

View All Todo Items
    [Documentation]    Tests that all todo items can be viewed.
    [Tags]    view
    Add And Verify Todo Item    Create robot tests
    Add And Verify Todo Item    Run robot tests
    Add And Verify Todo Item    Analyse test run results
    Click Text    Completed
    Click Text    All
    Verify Text    Create robot tests
    Verify Text    Run robot tests
    Verify Text    Analyse test run results
    Verify Text    3 items left

Edit Todo Item
    [Documentation]    Tests that a todo item can be edited by double-clicking it.
    [Tags]    edit
    Add And Verify Todo Item    Test manually
    Click Element    //li/div/label    doubleclick=True
    Type Text    //div[contains(@class, 'view')]/div/input    Run robot tests
    Verify No Text    Test manually
    Verify Text    Run robot tests
    Verify Text    1 item left

Destroy Todo Item
    [Documentation]    Tests that a todo item can be destroyed.
    [Tags]    destroy
    Add And Verify Todo Item    Create robot tests
    Hover Text    Create robot tests
    Click Element    //button[contains(@class, 'destroy')]
    Verify No Text    Create robot tests

Add Multiple Todo Items
    [Documentation]    Tests that 10 todo items can be added.
    [Tags]    add_many
    VAR    @{items}    Test    Automation    Is    Fun    And    Useful    Because    It    Saves    Time
    FOR    ${item}    IN    @{items}
        Add And Verify Todo Item    ${item}
    END
    Verify Text    10 items left
