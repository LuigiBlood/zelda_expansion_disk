//Zelda Expansion Disk
//By LuigiBlood

//Uses ARM9 bass

//System Area

print "- Fill System Area...\n  - System Data\n"

macro n64dd_WriteSystemData() {
  if {defined DEV} {
    //Development (Sectors are 192 bytes in the first 14 blocks)

    //Disk Region
    dw 0x00000000	//DEV
    db 0x10
    db 0x10+{DISKTYPE}	//Disk Type
    dh {IPLLOADSIZE}		//IPL Load Size
    db 0x0A, 0x14, 0x1E, 0x28, 0x32, 0x3C, 0x46, 0x50, 0x5A, 0x64, 0x6E, 0x78, 0x82, 0x8C, 0x96, 0xA0
    dw 0xFFFFFFFF
    dw {IPLLOADADDRESS}
    //Disk Defect Data taken from a dev Disk (not recommended to put as is on a real blue disk)
    db 0x10, 0x16, 0x1C, 0x22, 0x28, 0x2E, 0x34, 0x3A, 0x40, 0x93
    db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C
    db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C
    db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x6B
    db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C
    db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C
    db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C
    db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C
    db 0x56, 0x5C, 0x62, 0x68, 0x6E, 0x74, 0x7A, 0x80, 0x86, 0x8C
    db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C
    db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C
    db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x6C
    db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x73
    db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C
    db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C
    db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C
  } else {
    //Retail / D64 (Sectors are 232 bytes)

    //Disk Region
    if {defined D64} {
      dw 0x00000000 //DEV (D64)
      db 0x00
      db {DISKTYPE}	//Disk Type
    } else if {defined USA} {
      dw 0x2263EE56	//USA
      db 0x10
      db 0x10+{DISKTYPE}	//Disk Type
    } else {
      dw 0xE848D316	//JPN
      db 0x10
      db 0x10+{DISKTYPE}	//Disk Type
    }
    dh {IPLLOADSIZE}		//IPL Load Size
    if {defined D64} {
      fill 20
    } else {
      db 0x0C, 0x18, 0x24, 0x30, 0x3C, 0x48, 0x54, 0x60, 0x6C, 0x78, 0x84, 0x90, 0x9C, 0xA8, 0xB4, 0xC0
      dw 0xFFFFFFFF
    }
    dw {IPLLOADADDRESS}
    if {defined D64} {
      //D64 files do not have defect data
      fill 192
      dh 0xFFFF, 0xFFFF, 0xFFFF, 0x0000
    } else {
      //Disk Defect Data taken from a retail Disk (not recommended to put as is on a real retail disk, if even possible)
      db 0x10, 0x16, 0x1C, 0x22, 0x28, 0x2E, 0x34, 0x36, 0x37, 0x40, 0x46, 0x4C
      db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C, 0x54, 0x5C
      db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C, 0x54, 0x5C
      db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C, 0x54, 0x73
      db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C, 0x54, 0x5C
      db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C, 0x54, 0x5C
      db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C, 0x54, 0x92
      db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C, 0x54, 0x6F
      db 0x56, 0x5C, 0x62, 0x68, 0x6E, 0x74, 0x7A, 0x7F, 0x86, 0x8C, 0x92, 0x98
      db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C, 0x54, 0x88
      db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C, 0x54, 0x5C
      db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C, 0x54, 0x5C
      db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C, 0x54, 0x5C
      db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C, 0x54, 0x69
      db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C, 0x54, 0x93
      db 0x04, 0x0C, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x44, 0x4C, 0x54, 0x5C
      
      if ({DISKTYPE} == 0) {
        dh 1417, 1418, 4291
      } else if ({DISKTYPE} == 1) {
        dh 1965, 1966, 4291
      } else if ({DISKTYPE} == 2) {
        dh 2513, 2514, 4291
      } else if ({DISKTYPE} == 3) {
        dh 3061, 3062, 4291
      } else if ({DISKTYPE} == 4) {
        dh 3609, 3610, 4291
      } else if ({DISKTYPE} == 5) {
        dh 4087, 4088, 4291
      } else if ({DISKTYPE} == 6) {
        dh 4291, 4292, 4292
      }
      
      dh 0xFFFF
    }
  }
}

macro n64dd_WriteDiskID(fill) {
  //Game Code
  if {defined USA} {
    db "EZLE"	//USA
  } else {
    db "EZLJ"	//JPN
  }
  db 0	//Version 0
  db 0	//Disk Number 0
  db 0	//Does not use MFS
  db 0	//Disk Use
  db "THIS IS " //Factory Line Number
  db "NOT URA " //Production Time
  db "01"       //Company Code: 01 (Nintendo)
  db "WOAHHH"   //Free Area
  
  if ({fill} == 1) {
    fill 200
  }
}

//System Area
if !{defined D64} {
  //NDD disk image
  seek(0x0)
  //System Data
  define x = 0
  while {x} < 14 {	//14 Blocks
    define y = 0
    while {y} < 85 {	//232 * 85 (85 sectors)
      //Write System Data Sector
      n64dd_WriteSystemData()
      evaluate y = ({y} + 1)
    }
    
    if {defined DEV} {
      fill 3400
    }
    
    evaluate x = ({x} + 1)
  }

  //Disk ID
  print "  - Disk ID\n"

  define x = 14
  while {x} < 24 {
    define y = 0
    while {y} < 85 { //232 * 85
      //Game ID Code
      n64dd_WriteDiskID(1)
      evaluate y = ({y} + 1)
    }
    evaluate x = ({x} + 1)
  }
} else {
  //D64 Master Disk Image
  //System Data
  if {defined USA} {
		output "../EZLE_Ura.sys", create
	} else {
		output "../EZLJ_Ura.sys", create
	}
  seek(0x0)
  n64dd_WriteSystemData()

  //Disk ID
  if {defined USA} {
		output "../EZLE_Ura.id", create
	} else {
		output "../EZLJ_Ura.id", create
	}
  print "  - Disk ID\n"
  seek(0x0)
  n64dd_WriteDiskID(1)

  if {defined USA} {
    db 0x01	//USA
  } else {
    db 0x00	//JPN
  }

  //Create D64 file
  if {defined USA} {
		output "../EZLE_Ura.d64", create
	} else {
		output "../EZLJ_Ura.d64", create
	}

  //Insert User ROM Data
  seek(0x0)
  if {defined USA} {
    insert "../EZLE_Ura.sys"
    seek(0x100)
    insert "../EZLE_Ura.id"
    seek(0x200)
		insert ROMDATA,"../EZLE_Ura.rom"
	} else {
    insert "../EZLJ_Ura.sys"
    seek(0x100)
    insert "../EZLJ_Ura.id"
    seek(0x200)
		insert ROMDATA,"../EZLJ_Ura.rom"
	}

  //Padding
  //Because the mod is small in size, we can assume it will all go in Zone 0 of disk (block size 0x4D08).
  //If the size is more than 5 284 960 bytes then this will be wrong
  define LBAROMSize = (ROMDATA.size / 0x4D08)
  define PaddingMax = (({LBAROMSize} + 1) * 0x4D08)

  while (origin() - {LBA0_OFFSET}) < {PaddingMax} {
    dw 0xFFFFFFFF
  }

  //Add LBA User ROM Area End
  seek(0xE0)
  dh {LBAROMSize} - 1
}