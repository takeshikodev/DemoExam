@echo off
chcp 65001

set API_HOST=localhost
set API_PORT=4444
set DB_HOST=DB_HOST
set DB_NAME=DB_NAME
set DB_USERNAME=DB_USERNAME
set DB_PASSWORD=DB_PASSWORD

.\bin\TransferEmulator.exe --api-host %API_HOST% --api-port %API_PORT% --db-host %DB_HOST% --db-name %DB_NAME% --db-username %DB_USERNAME% --db-password %DB_PASSWORD%

pause
