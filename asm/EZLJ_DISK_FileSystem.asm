//Zelda Expansion Disk
//By LuigiBlood

//Uses ARM9 bass

//Filesystem

print "- Insert Game Files...\n"

seekDisk(0)
base 0

seekDisk(0x4D08)
//Error Screens (Hardcoded, do not move them)
insert EZLJ_ERROR_IPL,"../images/error_screens/EZLJ_error_IPL.bin"
insert EZLJ_ERROR_VER,"../images/error_screens/EZLJ_error_version.bin"
insert EZLJ_ERROR_SAV,"../images/error_screens/EZLJ_error_save.bin"
insert EZLJ_RESET,"../images/error_screens/EZLJ_reset.bin"

//Scenes / Rooms
insert EZLJ_SCENE00,"../scene/Deku Tree/Deku Tree.zscene"
insert EZLJ_SCENE00_MAP00,"../scene/Deku Tree/room 0.zmap"
insert EZLJ_SCENE00_MAP01,"../scene/Deku Tree/room 1.zmap"
insert EZLJ_SCENE00_MAP02,"../scene/Deku Tree/room 2.zmap"
insert EZLJ_SCENE00_MAP03,"../scene/Deku Tree/room 3.zmap"
insert EZLJ_SCENE00_MAP04,"../scene/Deku Tree/room 4.zmap"
insert EZLJ_SCENE00_MAP05,"../scene/Deku Tree/room 5.zmap"
insert EZLJ_SCENE00_MAP06,"../scene/Deku Tree/room 6.zmap"
insert EZLJ_SCENE00_MAP07,"../scene/Deku Tree/room 7.zmap"
insert EZLJ_SCENE00_MAP08,"../scene/Deku Tree/room 8.zmap"
insert EZLJ_SCENE00_MAP09,"../scene/Deku Tree/room 9.zmap"
insert EZLJ_SCENE00_MAP10,"../scene/Deku Tree/room 10.zmap"
insert EZLJ_SCENE00_MAP11,"../scene/Deku Tree/room 11.zmap"

insert EZLJ_SCENE01,"../scene/Dodongo's Cavern/Dodongo's Cavern.zscene"
insert EZLJ_SCENE01_MAP00,"../scene/Dodongo's Cavern/room 0.zmap"
insert EZLJ_SCENE01_MAP01,"../scene/Dodongo's Cavern/room 1.zmap"
insert EZLJ_SCENE01_MAP02,"../scene/Dodongo's Cavern/room 2.zmap"
insert EZLJ_SCENE01_MAP03,"../scene/Dodongo's Cavern/room 3.zmap"
insert EZLJ_SCENE01_MAP04,"../scene/Dodongo's Cavern/room 4.zmap"
insert EZLJ_SCENE01_MAP05,"../scene/Dodongo's Cavern/room 5.zmap"
insert EZLJ_SCENE01_MAP06,"../scene/Dodongo's Cavern/room 6.zmap"
insert EZLJ_SCENE01_MAP07,"../scene/Dodongo's Cavern/room 7.zmap"
insert EZLJ_SCENE01_MAP08,"../scene/Dodongo's Cavern/room 8.zmap"
insert EZLJ_SCENE01_MAP09,"../scene/Dodongo's Cavern/room 9.zmap"
insert EZLJ_SCENE01_MAP10,"../scene/Dodongo's Cavern/room 10.zmap"
insert EZLJ_SCENE01_MAP11,"../scene/Dodongo's Cavern/room 11.zmap"
insert EZLJ_SCENE01_MAP12,"../scene/Dodongo's Cavern/room 12.zmap"
insert EZLJ_SCENE01_MAP13,"../scene/Dodongo's Cavern/room 13.zmap"
insert EZLJ_SCENE01_MAP14,"../scene/Dodongo's Cavern/room 14.zmap"
insert EZLJ_SCENE01_MAP15,"../scene/Dodongo's Cavern/room 15.zmap"
insert EZLJ_SCENE01_MAP16,"../scene/Dodongo's Cavern/room 16.zmap"

insert EZLJ_SCENE02,"../scene/Inside Jabu-Jabu's Belly/Inside Jabu-Jabu's Belly.zscene"
insert EZLJ_SCENE02_MAP00,"../scene/Inside Jabu-Jabu's Belly/room 0.zmap"
insert EZLJ_SCENE02_MAP01,"../scene/Inside Jabu-Jabu's Belly/room 1.zmap"
insert EZLJ_SCENE02_MAP02,"../scene/Inside Jabu-Jabu's Belly/room 2.zmap"
insert EZLJ_SCENE02_MAP03,"../scene/Inside Jabu-Jabu's Belly/room 3.zmap"
insert EZLJ_SCENE02_MAP04,"../scene/Inside Jabu-Jabu's Belly/room 4.zmap"
insert EZLJ_SCENE02_MAP05,"../scene/Inside Jabu-Jabu's Belly/room 5.zmap"
insert EZLJ_SCENE02_MAP06,"../scene/Inside Jabu-Jabu's Belly/room 6.zmap"
insert EZLJ_SCENE02_MAP07,"../scene/Inside Jabu-Jabu's Belly/room 7.zmap"
insert EZLJ_SCENE02_MAP08,"../scene/Inside Jabu-Jabu's Belly/room 8.zmap"
insert EZLJ_SCENE02_MAP09,"../scene/Inside Jabu-Jabu's Belly/room 9.zmap"
insert EZLJ_SCENE02_MAP10,"../scene/Inside Jabu-Jabu's Belly/room 10.zmap"
insert EZLJ_SCENE02_MAP11,"../scene/Inside Jabu-Jabu's Belly/room 11.zmap"
insert EZLJ_SCENE02_MAP12,"../scene/Inside Jabu-Jabu's Belly/room 12.zmap"
insert EZLJ_SCENE02_MAP13,"../scene/Inside Jabu-Jabu's Belly/room 13.zmap"
insert EZLJ_SCENE02_MAP14,"../scene/Inside Jabu-Jabu's Belly/room 14.zmap"
insert EZLJ_SCENE02_MAP15,"../scene/Inside Jabu-Jabu's Belly/room 15.zmap"

insert EZLJ_SCENE03,"../scene/Forest Temple/Forest Temple.zscene"
insert EZLJ_SCENE03_MAP00,"../scene/Forest Temple/room 0.zmap"
insert EZLJ_SCENE03_MAP01,"../scene/Forest Temple/room 1.zmap"
insert EZLJ_SCENE03_MAP02,"../scene/Forest Temple/room 2.zmap"
insert EZLJ_SCENE03_MAP03,"../scene/Forest Temple/room 3.zmap"
insert EZLJ_SCENE03_MAP04,"../scene/Forest Temple/room 4.zmap"
insert EZLJ_SCENE03_MAP05,"../scene/Forest Temple/room 5.zmap"
insert EZLJ_SCENE03_MAP06,"../scene/Forest Temple/room 6.zmap"
insert EZLJ_SCENE03_MAP07,"../scene/Forest Temple/room 7.zmap"
insert EZLJ_SCENE03_MAP08,"../scene/Forest Temple/room 8.zmap"
insert EZLJ_SCENE03_MAP09,"../scene/Forest Temple/room 9.zmap"
insert EZLJ_SCENE03_MAP10,"../scene/Forest Temple/room 10.zmap"
insert EZLJ_SCENE03_MAP11,"../scene/Forest Temple/room 11.zmap"
insert EZLJ_SCENE03_MAP12,"../scene/Forest Temple/room 12.zmap"
insert EZLJ_SCENE03_MAP13,"../scene/Forest Temple/room 13.zmap"
insert EZLJ_SCENE03_MAP14,"../scene/Forest Temple/room 14.zmap"
insert EZLJ_SCENE03_MAP15,"../scene/Forest Temple/room 15.zmap"
insert EZLJ_SCENE03_MAP16,"../scene/Forest Temple/room 16.zmap"
insert EZLJ_SCENE03_MAP17,"../scene/Forest Temple/room 17.zmap"
insert EZLJ_SCENE03_MAP18,"../scene/Forest Temple/room 18.zmap"
insert EZLJ_SCENE03_MAP19,"../scene/Forest Temple/room 19.zmap"
insert EZLJ_SCENE03_MAP20,"../scene/Forest Temple/room 20.zmap"
insert EZLJ_SCENE03_MAP21,"../scene/Forest Temple/room 21.zmap"
insert EZLJ_SCENE03_MAP22,"../scene/Forest Temple/room 22.zmap"

insert EZLJ_SCENE04,"../scene/Fire Temple/Fire Temple.zscene"
insert EZLJ_SCENE04_MAP00,"../scene/Fire Temple/room 0.zmap"
insert EZLJ_SCENE04_MAP01,"../scene/Fire Temple/room 1.zmap"
insert EZLJ_SCENE04_MAP02,"../scene/Fire Temple/room 2.zmap"
insert EZLJ_SCENE04_MAP03,"../scene/Fire Temple/room 3.zmap"
insert EZLJ_SCENE04_MAP04,"../scene/Fire Temple/room 4.zmap"
insert EZLJ_SCENE04_MAP05,"../scene/Fire Temple/room 5.zmap"
insert EZLJ_SCENE04_MAP06,"../scene/Fire Temple/room 6.zmap"
insert EZLJ_SCENE04_MAP07,"../scene/Fire Temple/room 7.zmap"
insert EZLJ_SCENE04_MAP08,"../scene/Fire Temple/room 8.zmap"
insert EZLJ_SCENE04_MAP09,"../scene/Fire Temple/room 9.zmap"
insert EZLJ_SCENE04_MAP10,"../scene/Fire Temple/room 10.zmap"
insert EZLJ_SCENE04_MAP11,"../scene/Fire Temple/room 11.zmap"
insert EZLJ_SCENE04_MAP12,"../scene/Fire Temple/room 12.zmap"
insert EZLJ_SCENE04_MAP13,"../scene/Fire Temple/room 13.zmap"
insert EZLJ_SCENE04_MAP14,"../scene/Fire Temple/room 14.zmap"
insert EZLJ_SCENE04_MAP15,"../scene/Fire Temple/room 15.zmap"
insert EZLJ_SCENE04_MAP16,"../scene/Fire Temple/room 16.zmap"
insert EZLJ_SCENE04_MAP17,"../scene/Fire Temple/room 17.zmap"
insert EZLJ_SCENE04_MAP18,"../scene/Fire Temple/room 18.zmap"
insert EZLJ_SCENE04_MAP19,"../scene/Fire Temple/room 19.zmap"
insert EZLJ_SCENE04_MAP20,"../scene/Fire Temple/room 20.zmap"
insert EZLJ_SCENE04_MAP21,"../scene/Fire Temple/room 21.zmap"
insert EZLJ_SCENE04_MAP22,"../scene/Fire Temple/room 22.zmap"
insert EZLJ_SCENE04_MAP23,"../scene/Fire Temple/room 23.zmap"
insert EZLJ_SCENE04_MAP24,"../scene/Fire Temple/room 24.zmap"
insert EZLJ_SCENE04_MAP25,"../scene/Fire Temple/room 25.zmap"
insert EZLJ_SCENE04_MAP26,"../scene/Fire Temple/room 26.zmap"

insert EZLJ_SCENE05,"../scene/Water Temple/Water Temple.zscene"
insert EZLJ_SCENE05_MAP00,"../scene/Water Temple/room 0.zmap"
insert EZLJ_SCENE05_MAP01,"../scene/Water Temple/room 1.zmap"
insert EZLJ_SCENE05_MAP02,"../scene/Water Temple/room 2.zmap"
insert EZLJ_SCENE05_MAP03,"../scene/Water Temple/room 3.zmap"
insert EZLJ_SCENE05_MAP04,"../scene/Water Temple/room 4.zmap"
insert EZLJ_SCENE05_MAP05,"../scene/Water Temple/room 5.zmap"
insert EZLJ_SCENE05_MAP06,"../scene/Water Temple/room 6.zmap"
insert EZLJ_SCENE05_MAP07,"../scene/Water Temple/room 7.zmap"
insert EZLJ_SCENE05_MAP08,"../scene/Water Temple/room 8.zmap"
insert EZLJ_SCENE05_MAP09,"../scene/Water Temple/room 9.zmap"
insert EZLJ_SCENE05_MAP10,"../scene/Water Temple/room 10.zmap"
insert EZLJ_SCENE05_MAP11,"../scene/Water Temple/room 11.zmap"
insert EZLJ_SCENE05_MAP12,"../scene/Water Temple/room 12.zmap"
insert EZLJ_SCENE05_MAP13,"../scene/Water Temple/room 13.zmap"
insert EZLJ_SCENE05_MAP14,"../scene/Water Temple/room 14.zmap"
insert EZLJ_SCENE05_MAP15,"../scene/Water Temple/room 15.zmap"
insert EZLJ_SCENE05_MAP16,"../scene/Water Temple/room 16.zmap"
insert EZLJ_SCENE05_MAP17,"../scene/Water Temple/room 17.zmap"
insert EZLJ_SCENE05_MAP18,"../scene/Water Temple/room 18.zmap"
insert EZLJ_SCENE05_MAP19,"../scene/Water Temple/room 19.zmap"
insert EZLJ_SCENE05_MAP20,"../scene/Water Temple/room 20.zmap"
insert EZLJ_SCENE05_MAP21,"../scene/Water Temple/room 21.zmap"
insert EZLJ_SCENE05_MAP22,"../scene/Water Temple/room 22.zmap"

insert EZLJ_SCENE06,"../scene/Spirit Temple/Spirit Temple.zscene"
insert EZLJ_SCENE06_MAP00,"../scene/Spirit Temple/room 0.zmap"
insert EZLJ_SCENE06_MAP01,"../scene/Spirit Temple/room 1.zmap"
insert EZLJ_SCENE06_MAP02,"../scene/Spirit Temple/room 2.zmap"
insert EZLJ_SCENE06_MAP03,"../scene/Spirit Temple/room 3.zmap"
insert EZLJ_SCENE06_MAP04,"../scene/Spirit Temple/room 4.zmap"
insert EZLJ_SCENE06_MAP05,"../scene/Spirit Temple/room 5.zmap"
insert EZLJ_SCENE06_MAP06,"../scene/Spirit Temple/room 6.zmap"
insert EZLJ_SCENE06_MAP07,"../scene/Spirit Temple/room 7.zmap"
insert EZLJ_SCENE06_MAP08,"../scene/Spirit Temple/room 8.zmap"
insert EZLJ_SCENE06_MAP09,"../scene/Spirit Temple/room 9.zmap"
insert EZLJ_SCENE06_MAP10,"../scene/Spirit Temple/room 10.zmap"
insert EZLJ_SCENE06_MAP11,"../scene/Spirit Temple/room 11.zmap"
insert EZLJ_SCENE06_MAP12,"../scene/Spirit Temple/room 12.zmap"
insert EZLJ_SCENE06_MAP13,"../scene/Spirit Temple/room 13.zmap"
insert EZLJ_SCENE06_MAP14,"../scene/Spirit Temple/room 14.zmap"
insert EZLJ_SCENE06_MAP15,"../scene/Spirit Temple/room 15.zmap"
insert EZLJ_SCENE06_MAP16,"../scene/Spirit Temple/room 16.zmap"
insert EZLJ_SCENE06_MAP17,"../scene/Spirit Temple/room 17.zmap"
insert EZLJ_SCENE06_MAP18,"../scene/Spirit Temple/room 18.zmap"
insert EZLJ_SCENE06_MAP19,"../scene/Spirit Temple/room 19.zmap"
insert EZLJ_SCENE06_MAP20,"../scene/Spirit Temple/room 20.zmap"
insert EZLJ_SCENE06_MAP21,"../scene/Spirit Temple/room 21.zmap"
insert EZLJ_SCENE06_MAP22,"../scene/Spirit Temple/room 22.zmap"
insert EZLJ_SCENE06_MAP23,"../scene/Spirit Temple/room 23.zmap"
insert EZLJ_SCENE06_MAP24,"../scene/Spirit Temple/room 24.zmap"
insert EZLJ_SCENE06_MAP25,"../scene/Spirit Temple/room 25.zmap"
insert EZLJ_SCENE06_MAP26,"../scene/Spirit Temple/room 26.zmap"
insert EZLJ_SCENE06_MAP27,"../scene/Spirit Temple/room 27.zmap"
insert EZLJ_SCENE06_MAP28,"../scene/Spirit Temple/room 28.zmap"

insert EZLJ_SCENE07,"../scene/Shadow Temple/Shadow Temple.zscene"
insert EZLJ_SCENE07_MAP00,"../scene/Shadow Temple/room 0.zmap"
insert EZLJ_SCENE07_MAP01,"../scene/Shadow Temple/room 1.zmap"
insert EZLJ_SCENE07_MAP02,"../scene/Shadow Temple/room 2.zmap"
insert EZLJ_SCENE07_MAP03,"../scene/Shadow Temple/room 3.zmap"
insert EZLJ_SCENE07_MAP04,"../scene/Shadow Temple/room 4.zmap"
insert EZLJ_SCENE07_MAP05,"../scene/Shadow Temple/room 5.zmap"
insert EZLJ_SCENE07_MAP06,"../scene/Shadow Temple/room 6.zmap"
insert EZLJ_SCENE07_MAP07,"../scene/Shadow Temple/room 7.zmap"
insert EZLJ_SCENE07_MAP08,"../scene/Shadow Temple/room 8.zmap"
insert EZLJ_SCENE07_MAP09,"../scene/Shadow Temple/room 9.zmap"
insert EZLJ_SCENE07_MAP10,"../scene/Shadow Temple/room 10.zmap"
insert EZLJ_SCENE07_MAP11,"../scene/Shadow Temple/room 11.zmap"
insert EZLJ_SCENE07_MAP12,"../scene/Shadow Temple/room 12.zmap"
insert EZLJ_SCENE07_MAP13,"../scene/Shadow Temple/room 13.zmap"
insert EZLJ_SCENE07_MAP14,"../scene/Shadow Temple/room 14.zmap"
insert EZLJ_SCENE07_MAP15,"../scene/Shadow Temple/room 15.zmap"
insert EZLJ_SCENE07_MAP16,"../scene/Shadow Temple/room 16.zmap"
insert EZLJ_SCENE07_MAP17,"../scene/Shadow Temple/room 17.zmap"
insert EZLJ_SCENE07_MAP18,"../scene/Shadow Temple/room 18.zmap"
insert EZLJ_SCENE07_MAP19,"../scene/Shadow Temple/room 19.zmap"
insert EZLJ_SCENE07_MAP20,"../scene/Shadow Temple/room 20.zmap"
insert EZLJ_SCENE07_MAP21,"../scene/Shadow Temple/room 21.zmap"
insert EZLJ_SCENE07_MAP22,"../scene/Shadow Temple/room 22.zmap"

insert EZLJ_SCENE08,"../scene/Bottom of the Well/Bottom of the Well.zscene"
insert EZLJ_SCENE08_MAP00,"../scene/Bottom of the Well/room 0.zmap"
insert EZLJ_SCENE08_MAP01,"../scene/Bottom of the Well/room 1.zmap"
insert EZLJ_SCENE08_MAP02,"../scene/Bottom of the Well/room 2.zmap"
insert EZLJ_SCENE08_MAP03,"../scene/Bottom of the Well/room 3.zmap"
insert EZLJ_SCENE08_MAP04,"../scene/Bottom of the Well/room 4.zmap"
insert EZLJ_SCENE08_MAP05,"../scene/Bottom of the Well/room 5.zmap"
insert EZLJ_SCENE08_MAP06,"../scene/Bottom of the Well/room 6.zmap"

insert EZLJ_SCENE09,"../scene/Ice Cavern/Ice Cavern.zscene"
insert EZLJ_SCENE09_MAP00,"../scene/Ice Cavern/room 0.zmap"
insert EZLJ_SCENE09_MAP01,"../scene/Ice Cavern/room 1.zmap"
insert EZLJ_SCENE09_MAP02,"../scene/Ice Cavern/room 2.zmap"
insert EZLJ_SCENE09_MAP03,"../scene/Ice Cavern/room 3.zmap"
insert EZLJ_SCENE09_MAP04,"../scene/Ice Cavern/room 4.zmap"
insert EZLJ_SCENE09_MAP05,"../scene/Ice Cavern/room 5.zmap"
insert EZLJ_SCENE09_MAP06,"../scene/Ice Cavern/room 6.zmap"
insert EZLJ_SCENE09_MAP07,"../scene/Ice Cavern/room 7.zmap"
insert EZLJ_SCENE09_MAP08,"../scene/Ice Cavern/room 8.zmap"
insert EZLJ_SCENE09_MAP09,"../scene/Ice Cavern/room 9.zmap"
insert EZLJ_SCENE09_MAP10,"../scene/Ice Cavern/room 10.zmap"
insert EZLJ_SCENE09_MAP11,"../scene/Ice Cavern/room 11.zmap"

insert EZLJ_SCENE0B,"../scene/Gerudo Training Ground/Gerudo Training Ground.zscene"
insert EZLJ_SCENE0B_MAP00,"../scene/Gerudo Training Ground/room 0.zmap"
insert EZLJ_SCENE0B_MAP01,"../scene/Gerudo Training Ground/room 1.zmap"
insert EZLJ_SCENE0B_MAP02,"../scene/Gerudo Training Ground/room 2.zmap"
insert EZLJ_SCENE0B_MAP03,"../scene/Gerudo Training Ground/room 3.zmap"
insert EZLJ_SCENE0B_MAP04,"../scene/Gerudo Training Ground/room 4.zmap"
insert EZLJ_SCENE0B_MAP05,"../scene/Gerudo Training Ground/room 5.zmap"
insert EZLJ_SCENE0B_MAP06,"../scene/Gerudo Training Ground/room 6.zmap"
insert EZLJ_SCENE0B_MAP07,"../scene/Gerudo Training Ground/room 7.zmap"
insert EZLJ_SCENE0B_MAP08,"../scene/Gerudo Training Ground/room 8.zmap"
insert EZLJ_SCENE0B_MAP09,"../scene/Gerudo Training Ground/room 9.zmap"
insert EZLJ_SCENE0B_MAP10,"../scene/Gerudo Training Ground/room 10.zmap"

insert EZLJ_SCENE0D,"../scene/Inside Ganon's Castle/Inside Ganon's Castle.zscene"
insert EZLJ_SCENE0D_MAP00,"../scene/Inside Ganon's Castle/room 0.zmap"
insert EZLJ_SCENE0D_MAP01,"../scene/Inside Ganon's Castle/room 1.zmap"
insert EZLJ_SCENE0D_MAP02,"../scene/Inside Ganon's Castle/room 2.zmap"
insert EZLJ_SCENE0D_MAP03,"../scene/Inside Ganon's Castle/room 3.zmap"
insert EZLJ_SCENE0D_MAP04,"../scene/Inside Ganon's Castle/room 4.zmap"
insert EZLJ_SCENE0D_MAP05,"../scene/Inside Ganon's Castle/room 5.zmap"
insert EZLJ_SCENE0D_MAP06,"../scene/Inside Ganon's Castle/room 6.zmap"
insert EZLJ_SCENE0D_MAP07,"../scene/Inside Ganon's Castle/room 7.zmap"
insert EZLJ_SCENE0D_MAP08,"../scene/Inside Ganon's Castle/room 8.zmap"
insert EZLJ_SCENE0D_MAP09,"../scene/Inside Ganon's Castle/room 9.zmap"
insert EZLJ_SCENE0D_MAP10,"../scene/Inside Ganon's Castle/room 10.zmap"
insert EZLJ_SCENE0D_MAP11,"../scene/Inside Ganon's Castle/room 11.zmap"
insert EZLJ_SCENE0D_MAP12,"../scene/Inside Ganon's Castle/room 12.zmap"
insert EZLJ_SCENE0D_MAP13,"../scene/Inside Ganon's Castle/room 13.zmap"
insert EZLJ_SCENE0D_MAP14,"../scene/Inside Ganon's Castle/room 14.zmap"
insert EZLJ_SCENE0D_MAP15,"../scene/Inside Ganon's Castle/room 15.zmap"
insert EZLJ_SCENE0D_MAP16,"../scene/Inside Ganon's Castle/room 16.zmap"
insert EZLJ_SCENE0D_MAP17,"../scene/Inside Ganon's Castle/room 17.zmap"
insert EZLJ_SCENE0D_MAP18,"../scene/Inside Ganon's Castle/room 18.zmap"
insert EZLJ_SCENE0D_MAP19,"../scene/Inside Ganon's Castle/room 19.zmap"

//Main Static Files (follows RAM Allocation)
EZLJ_DISK_FS_STATICMAIN_START:

//Text
insert EZLJ_NES_MESSAGE_TABLE,"../text/MessageTableNES.tbl"
insert EZLJ_NES_MESSAGE_DATA_STATIC,"../text/StringDataNES.bin"
insert EZLJ_JPN_MESSAGE_TABLE,"../text/MessageTableJPN.tbl"
insert EZLJ_JPN_MESSAGE_DATA_STATIC,"../text/StringDataJPN.bin"

//Scene Table
include "EZLJ_DISK_SceneList.asm"

EZLJ_DISK_FS_STATICMAIN_END:
constant EZLJ_DISK_FS_STATICMAIN_SIZE = (EZLJ_DISK_FS_STATICMAIN_END-EZLJ_DISK_FS_STATICMAIN_START)

//Virtual File Table Replacement & Patch for each game version
n64dd_Align(16)
include "EZLJ_DISK_FileData0.asm"
include "EZLJ_DISK_FileData1.asm"
include "EZLJ_DISK_FileData2.asm"

//For precaution with 64DD Disk loading on real hardware, all these files will be loaded contiguous to RAM in one go.
//(follows RAM Allocation)
//1.0 Files
n64dd_Align(16)
EZLJ_DISK_FS_STATIC0_START:

insert EZLJ_OVL_KALEIDO_SCOPE0,"../ovl/ovl_kaleido_scope0.zovl"
insert EZLJ_OVL_MAP_MARK_DATA0,"../ovl/ovl_map_mark_data0.zovl"
insert EZLJ_OVL_ENDTITLE0,"../ovl/ovl_End_Title0.zovl"
insert EZLJ_OVL_BG_JYA_BIGMIRROR0,"../ovl/ovl_Bg_Jya_Bigmirror0.zovl"

EZLJ_DISK_FS_STATIC0_END:
constant EZLJ_DISK_FS_STATIC0_SIZE = (EZLJ_DISK_FS_STATIC0_END-EZLJ_DISK_FS_STATIC0_START)

//1.1 Files
n64dd_Align(16)
EZLJ_DISK_FS_STATIC1_START:

insert EZLJ_OVL_KALEIDO_SCOPE1,"../ovl/ovl_kaleido_scope1.zovl"
insert EZLJ_OVL_MAP_MARK_DATA1,"../ovl/ovl_map_mark_data1.zovl"
insert EZLJ_OVL_ENDTITLE1,"../ovl/ovl_End_Title1.zovl"
insert EZLJ_OVL_BG_JYA_BIGMIRROR1,"../ovl/ovl_Bg_Jya_Bigmirror1.zovl"

EZLJ_DISK_FS_STATIC1_END:
constant EZLJ_DISK_FS_STATIC1_SIZE = (EZLJ_DISK_FS_STATIC1_END-EZLJ_DISK_FS_STATIC1_START)

//1.2 Files
n64dd_Align(16)
EZLJ_DISK_FS_STATIC2_START:

insert EZLJ_OVL_KALEIDO_SCOPE2,"../ovl/ovl_kaleido_scope2.zovl"
insert EZLJ_OVL_MAP_MARK_DATA2,"../ovl/ovl_map_mark_data2.zovl"
insert EZLJ_OVL_ENDTITLE2,"../ovl/ovl_End_Title2.zovl"
insert EZLJ_OVL_BG_JYA_BIGMIRROR2,"../ovl/ovl_Bg_Jya_Bigmirror2.zovl"

EZLJ_DISK_FS_STATIC2_END:
constant EZLJ_DISK_FS_STATIC2_SIZE = (EZLJ_DISK_FS_STATIC2_END-EZLJ_DISK_FS_STATIC2_START)
