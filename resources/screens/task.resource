*** Settings ***
Documentation        Elementos e ações da tela de minhas tarefas.

Library    AppiumLibrary

*** Variables ***
${new_task_input}        xpath=//*[contains(@text, "nova tarefa")]
${create_button}         xpath=//*[@resource-id="createTask"]  

*** Keywords ***
Create a new task
    [Arguments]   ${task_name}

    Wait Until Element Is Visible    ${new_task_input}    5
    
    Input Text        ${new_task_input}         ${task_name}
    Click Element     ${create_button}  

Should have task
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    //*[@resource-id="taskText"][@text="${task_name}"]
    ...    5

Remove task by name
    [Arguments]    ${task_name}
    
    Click Element    //*[@text="${task_name}"]/../..//*[@resource-id="removeTask"]
    
    ${button}    Set Variable    //android.widget.Button[@text="SIM"]

    Wait Until Element Is Visible     ${button}   5
    Click Element                     ${button}

    Wait Until Page Does Not Contain    ${task_name}

Finish task
    [Arguments]    ${task_name}

    Click Element    xpath=//*[@text="${task_name}"]/..

task should be done
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    //*[@text="${task_name}"]/..//android.widget.ImageView