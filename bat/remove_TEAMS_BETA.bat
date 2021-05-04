taskkill /im OUTLOOK.exe /f 
%USERPROFILE%\AppData\Local\Microsoft\Teams\Update.exe --uninstall
rd /s /q  %USERPROFILE%\AppData\Local\Microsoft\Teams
echo "pasta do teams removida"
pause

