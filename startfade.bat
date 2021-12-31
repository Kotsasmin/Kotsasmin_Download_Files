if "%fadepoint%"=="start" exit /b
set fadepoint=start

set /a fadetdiff=0
set /a fadeprevtdiff=0
for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do set /a "fadet1=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100"

:loop1
color 07

set /a prevfadetdiff=%fadetdiff%
for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do (
    set /a "fadet2=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100, fadetDiff=fadet2-fadet1, fadetDiff+=((~(fadetDiff&(1<<31))>>31)+1)*8640000, fadet1=fadet2"
)
set /a fadetdiff=%fadetdiff%+%prevfadetdiff%

if %fadetdiff% GEQ 5 (
	set /a fadetdiff=0
	set /a fadeprevtdiff=0
	goto loop2
)
goto loop1

:loop2
color 08

set /a prevfadetdiff=%fadetdiff%
for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do (
    set /a "fadet2=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100, fadetDiff=fadet2-fadet1, fadetDiff+=((~(fadetDiff&(1<<31))>>31)+1)*8640000, fadet1=fadet2"
)
set /a fadetdiff=%fadetdiff%+%prevfadetdiff%

if %fadetdiff% GEQ 5 (
	set /a fadetdiff=0
	set /a fadeprevtdiff=0
	goto loop3
)
goto loop2

:loop3
cls

set /a prevfadetdiff=%fadetdiff%
for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do (
    set /a "fadet2=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100, fadetDiff=fadet2-fadet1, fadetDiff+=((~(fadetDiff&(1<<31))>>31)+1)*8640000, fadet1=fadet2"
)
set /a fadetdiff=%fadetdiff%+%prevfadetdiff%

if %fadetdiff% GEQ 5 (
	set /a fadetdiff=0
	set /a fadeprevtdiff=0
	goto loop4
)
goto loop3

:loop4
set /a prevfadetdiff=%fadetdiff%
for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do (
    set /a "fadet2=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100, fadetDiff=fadet2-fadet1, fadetDiff+=((~(fadetDiff&(1<<31))>>31)+1)*8640000, fadet1=fadet2"
)
set /a fadetdiff=%fadetdiff%+%prevfadetdiff%

if %fadetdiff% GEQ 5 (
	set /a fadetdiff=0
	set /a fadeprevtdiff=0
	exit /b
)
goto loop4
