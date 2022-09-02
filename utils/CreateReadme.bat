@echo off
SETLOCAL EnableDelayedExpansion

@echo %cd%

if exist README.md (
    @echo ERROR : README.md already exists
    goto :theEnd
)

set /A row=0
set /A col=0
set "vText="
set hasFile=FALSE

for %%F in (*.png) do (
    set hasFile=TRUE
    set filename=%%~fF
    set fileUrl=!filename:%basePath%=%baseURL%!
    set fileUrl=!fileUrl:\=/!
    set vText=!vText!^| ^^![](!fileUrl!^)
    set /A col=!col!+1
    if !col!==5 (
        set vText=!vText!^|
        echo !vText! >> README.md
        set /A row=!row!+1
        set /A col=0
        set "vText="
        if !row!==1 (
            echo ^|:---:^|:---:^|:---:^|:---:^|:---:^| >> README.md
        )
    )
)
if !hasFile!==FALSE (
    @echo ERROR : No PNG files found
    goto :theEnd
)
if not !col!==5 (
    set vText=!vText! ^|
    echo !vText! >> README.md
)

if !row!==0 (
    @echo ERROR : Insufficient files to create table
    del README.md
    goto :theEnd
)

@echo - README.md created

:theEnd