tasklist /FI "IMAGENAME eq master.exe" /FO CSV > search.log

FOR /F %%A IN (search.log) DO IF %%~zA EQU 0 GOTO end

start master.exe

:end

del search.log