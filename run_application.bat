@echo off
title Starting Services...

REM Step 1: Start PostgreSQL server
echo Starting PostgreSQL server...
cd /d "E:\KRM\Application\PostgreSQL"
pg_ctl.exe start -D "E:\KRM\Application\PostgreSQL\data"

REM Wait for PostgreSQL to initialize (adjust time as needed)
timeout /t 10 /nobreak >nul

REM Step 2: Start the API server
echo Starting API server on port 7261 (HTTPS)...
cd /d "E:\KRM\Application\Api\publish"
start /b "" Bill.exe --urls "https://localhost:7261"

REM Step 3: Serve the UI
echo Starting UI on port 4200...
cd /d "E:\KRM\Application\UI\dist"
start /b "" http-server . --port 4200

REM Open the API URL in the default browser
echo Opening API URL in browser...
start "" "https://localhost:7261"

REM Open the UI URL in the default browser
echo Opening UI URL in browser...
start "" "http://localhost:4200"

echo All services started successfully.


REM Close the batch script window
exit

