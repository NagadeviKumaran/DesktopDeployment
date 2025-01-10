@echo off
:: Set variables
set TIMESTAMP=%DATE:~-4%%DATE:~4,2%%DATE:~7,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set BACKUP_DIR=E:\KRM\DailyBackup
set DB_NAME=SalarySlip
set DB_USER=postgres
set DB_PASSWORD=kumarandevi
set HOST=localhost
set PORT=5432
set BACKUP_FILE=%BACKUP_DIR%\%DB_NAME%_%TIMESTAMP%.sql

:: Set environment variable for password
set PGPASSWORD=%DB_PASSWORD%

:: Run pg_dump to take a backup
pg_dump -h %HOST% -p %PORT% -U %DB_USER% -F c -b -v -f %BACKUP_FILE% %DB_NAME%

:: Optional: Remove backups older than 7 days
forfiles /p "%BACKUP_DIR%" /s /m *.sql /D -7 /C "cmd /c del @path"

echo Backup completed successfully.
pause
