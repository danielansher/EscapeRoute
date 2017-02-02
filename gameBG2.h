
//{{BLOCK(gameBG2)

//======================================================================
//
//	gameBG2, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 64 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2048 + 2048 = 4608
//
//	Time-stamp: 2016-04-12, 13:43:47
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG2_H
#define GRIT_GAMEBG2_H

#define gameBG2TilesLen 2048
extern const unsigned short gameBG2Tiles[1024];

#define gameBG2MapLen 2048
extern const unsigned short gameBG2Map[1024];

#define gameBG2PalLen 512
extern const unsigned short gameBG2Pal[256];

#endif // GRIT_GAMEBG2_H

//}}BLOCK(gameBG2)
