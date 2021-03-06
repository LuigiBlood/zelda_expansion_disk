//Zelda 64 Dawn & Dusk - Expansion Disk
//By LuigiBlood

//Uses ARM9 bass

//Virtual File Table (DMA Data equivalent)

EZLJ_FILE_TABLE2:
//File Count
dw ((EZLJ_FILE_TABLE2_END - EZLJ_FILE_TABLE2 - 4) / 0x10)

//Main Overlays
n64dd_FileEntry(0x00BB1210, DDHOOK_OVL_KALEIDO_SCOPE2, EZLJ_OVL_KALEIDO_SCOPE2.size, 0)
n64dd_FileEntry(0x00BF4210, DDHOOK_OVL_MAP_MARK_DATA2, EZLJ_OVL_MAP_MARK_DATA2.size, 0)
n64dd_FileEntry(0x00E968C0, DDHOOK_OVL_ENDTITLE2, EZLJ_OVL_ENDTITLE2.size, 0)
n64dd_FileEntry(0x00E458F0, DDHOOK_OVL_BG_JYA_BIGMIRROR2, EZLJ_OVL_BG_JYA_BIGMIRROR2.size, 0)

EZLJ_FILE_TABLE2_END:
namespace EZLJ_FILE_TABLE2 {
    variable size = (EZLJ_FILE_TABLE2_END - EZLJ_FILE_TABLE2)
}
