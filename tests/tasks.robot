*** Settings ***
Documentation        Suite de testes do cadastro de tarefas

Resource        ${EXECDIR}/resources/base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases *** 
Deve poder cadastrar uma nova tarefa
   
    ${task}    Set Variable    Estudar Python
    Remove task from database    ${task}
    
    Do Login 

    Create a new task    ${task}
    Should have task     ${task}

Deve poder remover uma tarefa indesejada
    [Tags]    remove_task

   # Removendo task na base de dados utilizando library python
    ${task}    Set Variable    Comprar refrigerante
    Remove task from database    ${task}
   
    # Tarefa cadastrada no sistema
    Do Login
    Create a new task    ${task}
    Should have task     ${task}
    
    # Quando faço a exclusão dessa tarefa
    Remove task by name                 ${task}
    
    # Confirmação da exclusão da tarefa na lista de tarefas
    Wait Until Page Does Not Contain    ${task}


Deve poder concluir uma tarefa
    [Tags]    concluir_task

   # Removendo task na base de dados utilizando library python
    ${task}    Set Variable      Estudar Xpath
    Remove task from database    ${task}
   
    # Login na aplicação e criação da tarefa no sistema
    Do Login
    Create a new task    ${task}
    Should have task     ${task}
    
    Finish task           ${task}
    
    task should be done    ${task}

