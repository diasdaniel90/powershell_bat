cd c:\
mkdir %USERPROFILE%\AppData\LocalLow\Sun\Java\Deployment\security
echo http://portal:8080/ > %USERPROFILE%\AppData\LocalLow\Sun\Java\Deployment\security\exception.sites
echo "criado excecao de serguranca no java "
rd /s /q %USERPROFILE%\Documentum

echo "definindo home page IE"
REG ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /V "Start Page" /D "http://portal.com.br/" /F

pause