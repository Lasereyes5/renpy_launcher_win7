@echo off
title Lain

REM for older tcc
REM impdef kernel32.dll
windres --preprocessor="tcc -E -xc" renpy_resources.rc -O coff -o renpy_resources.res
tcc -impdef kernel32.dll
tcc launcher3_win.c -o launcher3_win_tcc.exe renpy_resources.res kernel32.def -Wl,-subsystem=gui

REM for gcc
windres renpy_resources.rc -O coff -o renpy_resources.res
gcc -s launcher3_win.c -o launcher3_win_gcc.exe renpy_resources.res -municode -mwindows