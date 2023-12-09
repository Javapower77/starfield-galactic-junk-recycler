@echo off

REM Get latest 7zip cli from https://www.7-zip.org/download.html (Want x64 7Zip Extras package) see https://documentation.help/7-Zip/syntax.htm for online docs

REM Notepad++/VSCODE needs current working directory to be where Caprica.exe is 
cd "C:\Repositories\Public\Starfield Mods\starfield-galactic-junk-recycler\Tools"

REM Clear Dist DIR
del /q "C:\Users\degre\Downloads\GalacticJunkRecycler.zip"

REM Archive Dist Dir
"D:\Program Files\PexTools\7za.exe" a -tzip "C:\Users\degre\Downloads\GalacticJunkRecycler.zip" "C:\Repositories\Public\Starfield Mods\starfield-galactic-junk-recycler\Dist\*.*"
