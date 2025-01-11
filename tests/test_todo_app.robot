*** Settings ***
Documentation     Example tests for Todo App.
Library           QWeb
Resource          ../resources/variables.resource
Resource          ../resources/keywords.resource
Test Tags         todo_app
Suite Setup       Setup Browser
Test Setup        Open Browser    ${LINK_TO_SUT}    ${BROWSER}
Test Teardown     Close Browser
Suite Teardown    Close All Browsers


*** Test Cases ***
Page Title And Placeholder Should Be Shown
    [Documentation]    FEATURE 1: Tests that page title and placeholder for todo input field are shown.
    [Tags]    smoke
    Verify Element Text    ${TITLE_ELEMENT}    todos
    Verify Attribute    ${TODO_INPUT}    placeholder    What needs to be done?
    Verify No Text    All
    Verify No Text    Active
    Verify No Text    Completed

Add New Todo Item
    [Documentation]    FEATURE 1: Tests that a new todo item can be added.
    [Tags]    add
    Add And Verify Todo Item    Create robot tests
    Verify Text    1 item left

Add Multiple Todo Items
    [Documentation]    FEATURE 1: Tests that 10 todo items can be added.
    [Tags]    add_many
    VAR    @{items}    Test    Automation    Is    Fun    And    Useful    Because    It    Saves    Time
    FOR    ${item}    IN    @{items}
        Add And Verify Todo Item    ${item}
    END
    Verify Text    10 items left

Mark Todo Item
    [Documentation]    FEATURE 2: Tests that a todo item can be marked as completed.
    [Tags]    mark
    Add And Verify Todo Item    Create robot tests
    Mark Todo Item On Row    1
    Verify Text    0 items left

Unmark Todo Item
    [Documentation]    FEATURE 2: Tests that a marked todo item can be unmarked.
    [Tags]    unmark
    Add And Verify Todo Item    Create robot tests
    Mark Todo Item On Row    1
    Mark Todo Item On Row    1
    Verify Text    1 item left

Mark All Todo Items At Once
    [Documentation]    FEATURE 2: Tests that all todo items can be marked as complete at once.
    [Tags]    mark_all
    Add And Verify Todo Item    Create robot tests
    Add And Verify Todo Item    Run robot tests
    Add And Verify Todo Item    Analyse test run results
    Click Element    ${TOGGLE_ALL}
    Verify Text    0 items left

View Completed Todo Items
    [Documentation]    FEATURE 3: Tests that completed todo items can be viewed.
    [Tags]    view
    Add And Verify Todo Item    Create robot tests
    Mark Todo Item On Row    1
    Click Text    Active
    Verify No Text    Create robot tests
    Click Text    Completed
    Verify Text    Create robot tests

View Active Todo Items
    [Documentation]    FEATURE 3: Tests that active todo items can be viewed.
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
    [Documentation]    FEATURE 3: Tests that all todo items can be viewed.
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

Clear Completed Todo Items
    [Documentation]    FEATURE 4: Tests that completed todo items can be cleared.
    [Tags]    clear
    Add And Verify Todo Item    Create robot tests
    Add And Verify Todo Item    Run robot tests
    Verify Text    2 items left
    Mark Todo Item On Row    1
    Click Text    Clear completed
    Verify Text    1 item left
    Click Text    Completed
    Verify No Text    Create robot tests

Edit Todo Item
    [Documentation]    FEATURE 5: Tests that a todo item can be edited by double-clicking it.
    [Tags]    edit
    Add And Verify Todo Item    Test manually
    Click Element    ${TODO_ELEMENT_LABEL}    doubleclick=True
    Type Text    ${TODO_ELEMENT}    Run robot tests
    Verify No Text    Test manually
    Verify Text    Run robot tests
    Verify Text    1 item left

Destroy Todo Item
    [Documentation]    FEATURE 6: Tests that a todo item can be destroyed.
    [Tags]    destroy
    Add And Verify Todo Item    Create robot tests
    Hover Text    Create robot tests
    Click Element    ${CROSS_ICON}
    Verify No Text    Create robot tests
