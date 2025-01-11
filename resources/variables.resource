*** Settings ***
Documentation    Variables used in tests for Todo App.


*** Variables ***
${LINK_TO_SUT}           https://todomvc.com/examples/react/dist/
${BROWSER}               chrome
${CROSS_ICON}            //button[contains(@class, 'destroy')]
${TITLE_ELEMENT}         //h1
${TODO_INPUT}            //*[@id="todo-input"]
${TODO_ELEMENT_LABEL}    //li/div/label
${TODO_ELEMENT}          //div[contains(@class, 'view')]/div/input
${TOGGLE_ALL}            //*[@id="toggle-all"]
