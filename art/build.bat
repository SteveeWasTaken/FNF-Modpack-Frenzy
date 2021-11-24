@echo off
color 0a
cd..
echo Version of the game? [x64/x32/html]
set /p version=""
echo Debug or Release? [Debug/Release]
set /p edition=""
echo Building...
if /i %VERSION%==x64 (goto 64)
if /i %VERSION%==x32 (goto 32)
if /i %VERSION%==html (goto html) else (goto fail)

:64
title x64
if /i %EDITION%==debug (goto 64debug)
if /i %EDITION%==release (goto 64release) else (goto fail)

:64debug
title x64 Debug
lime build windows -debug
cd export\debug\windows\bin
title DONE
pause
title Running...
"ModpackFrenzy.exe"
exit

:64release
title x64 Release
lime build windows -release
cd export\release\windows\bin
title DONE
pause
title Running...
"ModpackFrenzy.exe"
exit

:32
title x32
if /i %EDITION%==debug (goto 32debug)
if /i %EDITION%==release (goto 32release) else (goto fail)

:32debug
title x32 Debug
lime build windows -32 -release -D 32bits
cd export\32bit\windows\bin
title DONE
pause
title Running...
"ModpackFrenzy.exe"
exit

:32release
title x32 Release
lime build windows -32 -release -D 32bits
cd export\32bit\windows\bin
title DONE
pause
title Running...
"ModpackFrenzy.exe"
exit

:html
title HTML
if /i %EDITION%==debug (goto htmldebug)
if /i %EDITION%==release (goto htmlrelease) else (goto fail)

:htmldebug
title HTML Debug
lime test html5 -debug
exit

:htmlrelease
title HTML Release
lime test html5 -release
exit