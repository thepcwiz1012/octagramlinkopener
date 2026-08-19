@echo off
title Octagram Link Opener
color 0B

:main_menu
cls
echo ========================================================
echo               Octagram.me Profile Opener
echo ========================================================
echo.
echo Valid MBTI Types: INTJ, INTP, ENTJ, ENTP, INFJ, INFP, ENFJ, ENFP
echo                   ISTJ, ISTP, ESTJ, ESTP, ISFJ, ISFP, ESFJ, ESFP
echo.
echo Valid Octagrams : UDJM, UDJF, UDPM, UDPF, SDJM, SDJF, SDPM, SDPF
echo ========================================================
echo.

:mbti_prompt
set /p "MBTI_IN=Enter MBTI type: "
if "%MBTI_IN%"=="" goto mbti_prompt

:: Check if the input matches a valid type and convert to lowercase
set "MBTI="
for %%A in (intj intp entj entp infj infp enfj enfp istj istp estj estp isfj isfp esfj esfp) do (
    if /i "%MBTI_IN%"=="%%A" set "MBTI=%%A"
)

:: If MBTI is still undefined, the input was invalid
if not defined MBTI (
    echo [ERROR] "%MBTI_IN%" is not a valid MBTI type. Please try again.
    echo.
    goto mbti_prompt
)

:octa_prompt
set /p "OCTA_IN=Enter Octagram: "
if "%OCTA_IN%"=="" goto octa_prompt

:: Check if the input matches a valid octagram and convert to lowercase
set "OCTA="
for %%A in (udjm udjf udpm udpf sdjm sdjf sdpm sdpf) do (
    if /i "%OCTA_IN%"=="%%A" set "OCTA=%%A"
)

:: If OCTA is still undefined, the input was invalid
if not defined OCTA (
    echo [ERROR] "%OCTA_IN%" is not a valid Octagram. Please try again.
    echo.
    goto octa_prompt
)

:: Construct the URL and launch the default browser
set "URL=https://octagram.me/%MBTI%-%OCTA%"
echo.
echo Launching: %URL%
start "" "%URL%"

:ask_again
echo.
set /p "CHOICE=Do you want to open another link? (Y/N): "
if /i "%CHOICE%"=="Y" goto main_menu
if /i "%CHOICE%"=="N" exit
echo [ERROR] Invalid choice. Please enter Y or N.
goto ask_again