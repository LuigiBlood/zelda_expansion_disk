IF EXIST "EZLJ_Ura.d64" del "EZLJ_Ura.d64"
IF EXIST "EZLJ_Ura.rom" del "EZLJ_Ura.rom"
IF EXIST "EZLJ_Ura.id" del "EZLJ_Ura.id"
IF EXIST "EZLJ_Ura.sys" del "EZLJ_Ura.sys"
bass.exe -d D64=1 ./asm/EZLJ_DISK_Main.asm
ddmaster -cfg EZLJ_disk.cfg -rom EZLJ_Ura.rom -ipladdr 80000400 -iplsize 197200 -o EZLJ_Ura.d64