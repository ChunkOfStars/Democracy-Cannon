
set /p last=<lastreadtweetid.txt

:mainloop



ping 1.1.1.1 -n 1 -w 39000 > nul
goto mainloop
