IF EXIST "EZLE_Ura.d64" del "EZLE_Ura.d64"
IF EXIST "EZLE_Ura.rom" del "EZLE_Ura.rom"
IF EXIST "EZLE_Ura.id" del "EZLE_Ura.id"
IF EXIST "EZLE_Ura.sys" del "EZLE_Ura.sys"
bass.exe  -d D64=1 -d USA=1 ./asm/EZLJ_DISK_Main.asm