# Renpy Launcher Win7
a renpy launcher program compatible with win7.

> modified from [renpy-build/runtime/launcher3_win.c](https://github.com/renpy/renpy-build/blob/master/runtime%2Flauncher3_win.c "renpy-build/runtime/launcher3_win.c")

## Usage

Copy the launcher program file to the root folder of your renpy game (usually with `[game name].py` and `[game name].exe`), delete the original launcher exe and rename the copied launcher exe file to same name, then run it.

## Build

### Resource
`windres renpy_resources.rc -O coff -o renpy_resources.res`

For windres and tcc only :

`windres --preprocessor="tcc -E -xc" renpy_resources.rc -O coff -o renpy_resources.res`

### Program

- For tcc :
	```bash
tcc -impdef kernel32.dll
tcc launcher3_win.c -o launcher3_win_tcc.exe renpy_resources.res kernel32.def -Wl,-subsystem=gui
	```
	
	- For older tcc :
	```bash
	impdef kernel32.dll
	tcc launcher3_win.c -o launcher3_win_tcc.exe renpy_resources.res kernel32.def -Wl,-subsystem=gui
	```
- For gcc : `gcc -s launcher3_win.c -o launcher3_win_gcc.exe renpy_resources.res -municode -mwindows`
