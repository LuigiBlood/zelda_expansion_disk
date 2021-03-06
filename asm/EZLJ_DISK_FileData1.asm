//Zelda 64 Dawn & Dusk - Expansion Disk
//By LuigiBlood

//Uses ARM9 bass

//Virtual File Table (DMA Data equivalent)

EZLJ_FILE_TABLE1:
//File Count
dw ((EZLJ_FILE_TABLE1_END - EZLJ_FILE_TABLE1 - 4) / 0x10)

//Main Overlays
n64dd_FileEntry(0x00BB1380, DDHOOK_OVL_KALEIDO_SCOPE1, EZLJ_OVL_KALEIDO_SCOPE1.size, 0)
n64dd_FileEntry(0x00BF4290, DDHOOK_OVL_MAP_MARK_DATA1, EZLJ_OVL_MAP_MARK_DATA1.size, 0)
n64dd_FileEntry(0x00E966B0, DDHOOK_OVL_ENDTITLE1, EZLJ_OVL_ENDTITLE1.size, 0)
n64dd_FileEntry(0x00E45790, DDHOOK_OVL_BG_JYA_BIGMIRROR1, EZLJ_OVL_BG_JYA_BIGMIRROR1.size, 0)

EZLJ_FILE_TABLE1_END:
namespace EZLJ_FILE_TABLE1 {
    variable size = (EZLJ_FILE_TABLE1_END - EZLJ_FILE_TABLE1)
}
