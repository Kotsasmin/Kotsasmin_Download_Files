@echo off
Setlocal Enabledelayedexpansion


FOR %%A In (batbox.exe Getlen.bat Box.bat) DO (IF Not Exist "%%A" (Echo. Button Function, Error... File [%%A] is Missing...))
Set _Ver=2.0



If /i "%~1" == "" (goto :help)
If /i "%~1" == "/?" (goto :help)
If /i "%~1" == "-h" (goto :help)
If /i "%~1" == "help" (goto :help)
If /i "%~1" == "-help" (goto :help)

If /i "%~1" == "ver" (echo.%_Ver%&&goto :eof)


If /i "%~2" == "" (goto :help)
If /i "%~3" == "" (goto :help)
If /i "%~4" == "" (goto :help)
If /i "%~5" == "" (goto :help)
If /i "%~6" == "" (goto :help)
If /i "%~7" == "" (goto :help)


Set _Hover=
Set _Box=
Set _Text=
Set Button_height=3


:Loop_of_button_fn

Set _X=%~1
Set _Y=%~2
set color=%~3
Set _Invert_Color=%Color:~1,1%%Color:~0,1%
set "Button_text=%~4"


if not defined _X (goto :EOF)
if /i "%_X%" == "X" (Goto :End)


Call Getlen "..%button_text%.."
set button_width=%errorlevel%


Set /A _X_Text=%_X% + 2
Set /A _Y_Text=%_Y% + 1
Set /A _X_End=%_X% + %button_width% - 1
Set /A _Y_End=%_Y% + %Button_height% - 1

Call Box %_X% %_Y% %Button_height% %button_width% - - %Color% 0

Set "_Text=!_Text!/g !_X_Text! !_Y_Text! /c 0x!color! /d "!Button_text!" "
Set "_Hover=!_Hover!!_Invert_Color! "
Set "_Box=!_Box!!_X! !_Y! !_X_End! !_Y_End! "

For /L %%A In (1,1,4) Do (Shift /1)
Goto :Loop_of_button_fn

:End
Batbox %_Text% /c 0x07
Endlocal && set "%~2=%_Box%" && set "%~3=%_Hover%"
Goto :EOF

:help

goto :EOF