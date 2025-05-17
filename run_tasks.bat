@echo off
REM Windows Batch Script to emulate the Makefile functionality

REM Check for .env file (manual reminder)
IF NOT EXIST .env (
    echo WARNING: .env file is missing. Please create one based on .env.example
    REM You can choose to exit here if it's critical:
    REM echo Exiting...
    REM timeout /t 5 >nul
    REM exit /b 1
)

REM Define CHECK_DIRS (current directory)
SET CHECK_DIRS=.

REM --- Main Menu ---
:menu
echo.
echo Available commands:
echo --------------------------------------------------
echo Docker Operations:
echo   1. ava-build       (Build Docker containers)
echo   2. ava-run         (Run Docker containers in detached mode)
echo   3. ava-stop        (Stop Docker containers)
echo   4. ava-delete      (Remove specific directories and Docker containers/networks)
echo.
echo Formatting and Linting (using uv and ruff):
echo   5. format-fix      (Fix formatting and import sorting issues)
echo   6. lint-fix        (Fix linting issues)
echo   7. format-check    (Check formatting and import sorting)
echo   8. lint-check      (Check linting issues)
echo.
echo   0. Exit
echo --------------------------------------------------
echo.

set /p choice="Enter your choice (0-8): "

IF "%choice%"=="1" GOTO ava-build
IF "%choice%"=="2" GOTO ava-run
IF "%choice%"=="3" GOTO ava-stop
IF "%choice%"=="4" GOTO ava-delete
IF "%choice%"=="5" GOTO format-fix
IF "%choice%"=="6" GOTO lint-fix
IF "%choice%"=="7" GOTO format-check
IF "%choice%"=="8" GOTO lint-check
IF "%choice%"=="0" GOTO exit_script

echo Invalid choice. Please try again.
GOTO menu

REM --- Command Implementations ---

:ava-build
echo Running ava-build...
docker compose build
GOTO end_command

:ava-run
echo Running ava-run...
docker compose up --build -d
GOTO end_command

:ava-stop
echo Running ava-stop...
docker compose stop
GOTO end_command

:ava-delete
echo Running ava-delete...
IF EXIST "long_term_memory" (
    echo Removing long_term_memory directory...
    RMDIR /S /Q "long_term_memory"
)
IF EXIST "short_term_memory" (
    echo Removing short_term_memory directory...
    RMDIR /S /Q "short_term_memory"
)
IF EXIST "generated_images" (
    echo Removing generated_images directory...
    RMDIR /S /Q "generated_images"
)
docker compose down
GOTO end_command

:format-fix
echo Running format-fix...
uv run ruff format %CHECK_DIRS%
uv run ruff check --select I --fix %CHECK_DIRS%
GOTO end_command

:lint-fix
echo Running lint-fix...
uv run ruff check --fix %CHECK_DIRS%
GOTO end_command

:format-check
echo Running format-check...
uv run ruff format --check %CHECK_DIRS%
uv run ruff check -e %CHECK_DIRS%
uv run ruff check --select I -e %CHECK_DIRS%
GOTO end_command

:lint-check
echo Running lint-check...
uv run ruff check %CHECK_DIRS%
GOTO end_command

:end_command
echo.
echo Command finished. Returning to menu or press Ctrl+C to exit.
timeout /t 3 >nul
GOTO menu

:exit_script
echo Exiting script.
exit /b 0