*** Settings ***
Documentation        Exemplo Robot + Appium

Library        AppiumLibrary

*** Test Cases ***
Deve abrir o app da SmartBit

    Open Application	http://localhost:4723/wd/hub	
    ...                 alias=SmartBit	
    ...                 automationName=UiAutomator2
    ...                 platformName=Android	
    ...                 platformVersion=13.0	
    ...                 deviceName='Android Simulator'	
    ...                 app=${EXECDIR}/app/smartbit-beta.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

    Sleep    5

    Close Application