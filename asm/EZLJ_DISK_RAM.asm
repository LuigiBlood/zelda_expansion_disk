//Zelda Expansion Disk
//By LuigiBlood

//Uses ARM9 bass

//RAM Usage
constant DDHOOK_CODE0 = (0x800110A0)
constant DDHOOK_CODE1 = (0x800110A0)
constant DDHOOK_CODE2 = (0x800116E0)

n64dd_RamSetAddress(0x80400000)
n64dd_RamDefine(DDHOOK_RAM, 0x10000)		//MAIN DISK CODE
n64dd_RamDefine(DDHOOK_GPRAM, 0)
	n64dd_RamDefine(DDHOOK_ADDRTABLE, 4)				//n64dd Function Table Pointer
	n64dd_RamDefine(DDHOOK_FORCEROM, 4)					//Force ROM Load Flag
	n64dd_RamDefine(DDHOOK_CURRENTSCENEID, 4)			//Current Scene ID
	n64dd_RamDefine(DDHOOK_VERSION, 4)					//VERSION

n64dd_RamDefine(DDHOOK_STATICMAIN, 0)
	n64dd_RamDefine(DDHOOK_TEXTTABLE_NES, EZLJ_NES_MESSAGE_TABLE.size)		//MESSAGE TABLE (ENG)
	n64dd_RamDefine(DDHOOK_TEXTDATA_NES, EZLJ_NES_MESSAGE_DATA_STATIC.size)	//MESSAGE STATIC DATA (ENG)
	n64dd_RamDefine(DDHOOK_TEXTTABLE_JPN, EZLJ_JPN_MESSAGE_TABLE.size)		//MESSAGE TABLE (JPN)
	n64dd_RamDefine(DDHOOK_TEXTDATA_JPN, EZLJ_JPN_MESSAGE_DATA_STATIC.size)	//MESSAGE STATIC DATA (JPN)
	n64dd_RamDefine(DDHOOK_SCENELIST, EZLJ_SCENELIST_SIZE)				//SCENE TABLE

	n64dd_RamDefine(DDHOOK_VFILETABLE, EZLJ_VFILE_TABLE_SIZE)
	
	//Scene Room Buffers
	n64dd_RamDefine(DDHOOK_SCENE_ROOM_TABLE, 0x100+4)					//ROOM POINTER TABLE
	n64dd_RamDefine(DDHOOK_SCENE_ROOM_DATA, 933344)					//ROOM DATA

//805B5000-805FFFE0 = Frame Buffer something? Do not write there
n64dd_RamAddressErrorCheck(0x805B5000)

	//Static Files
n64dd_RamSetAddress(0x80700000)
n64dd_RamDefine(DDHOOK_STATIC_START, 0)
//1.0
	n64dd_RamDefine(DDHOOK_OVL_KALEIDO_SCOPE0, EZLJ_OVL_KALEIDO_SCOPE0.size)
	n64dd_RamDefine(DDHOOK_OVL_MAP_MARK_DATA0, EZLJ_OVL_MAP_MARK_DATA0.size)
	n64dd_RamDefine(DDHOOK_OVL_ENDTITLE0, EZLJ_OVL_ENDTITLE0.size)
	n64dd_RamDefine(DDHOOK_OVL_BG_JYA_BIGMIRROR0, EZLJ_OVL_BG_JYA_BIGMIRROR0.size)
	n64dd_RamAddressErrorCheck(0x80800000)
//1.1
n64dd_RamSetAddress(DDHOOK_STATIC_START)
	n64dd_RamDefine(DDHOOK_OVL_KALEIDO_SCOPE1, EZLJ_OVL_KALEIDO_SCOPE1.size)
	n64dd_RamDefine(DDHOOK_OVL_MAP_MARK_DATA1, EZLJ_OVL_MAP_MARK_DATA1.size)
	n64dd_RamDefine(DDHOOK_OVL_ENDTITLE1, EZLJ_OVL_ENDTITLE1.size)
	n64dd_RamDefine(DDHOOK_OVL_BG_JYA_BIGMIRROR1, EZLJ_OVL_BG_JYA_BIGMIRROR1.size)
	n64dd_RamAddressErrorCheck(0x80800000)
//1.2
n64dd_RamSetAddress(DDHOOK_STATIC_START)
	n64dd_RamDefine(DDHOOK_OVL_KALEIDO_SCOPE2, EZLJ_OVL_KALEIDO_SCOPE2.size)
	n64dd_RamDefine(DDHOOK_OVL_MAP_MARK_DATA2, EZLJ_OVL_MAP_MARK_DATA2.size)
	n64dd_RamDefine(DDHOOK_OVL_ENDTITLE2, EZLJ_OVL_ENDTITLE2.size)
	n64dd_RamDefine(DDHOOK_OVL_BG_JYA_BIGMIRROR2, EZLJ_OVL_BG_JYA_BIGMIRROR2.size)
	n64dd_RamAddressErrorCheck(0x80800000)

//----
n64dd_RamDefine(DDHOOK_FROMROM_START, 0)

n64dd_RamAddressErrorCheck(0x80800000)