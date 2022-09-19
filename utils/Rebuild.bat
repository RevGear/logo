@echo off
SETLOCAL EnableDelayedExpansion

set basePath=%USERPROFILE%\Documents\GitHub\logo
set baseURL=https://raw.githubusercontent.com/RevGear/logo/master


FOR %%P IN (Countries,International,Other) do (
    cd %basePath%\%%P
    call %basePath%\utils\CreateReadme
    for /D %%D in (*) do (
        cd %basePath%\%%P\%%D
        call %basePath%\utils\CreateReadme
    )
)