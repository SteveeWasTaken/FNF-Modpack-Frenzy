@echo off
color 0a
cd ..
echo BUILDING GAME
lime build windows -release
echo.
echo done.
title DONE
pause
pwd
cd export\release\windows\bin
"ModpackFrenzy.exe"