*** Settings ***
Documentation        Elementos e ações da tela de login

Library    AppiumLibrary

*** Variables ***
${API_IP}        192.168.1.68

*** Keywords ***
Do Login
    
    Input Text           xpath=//*[@resource-id="apiIp"]        ${API_IP} 
    Click Element        xpath=//*[@resource-id="signInButton"]
