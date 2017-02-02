    /*****************************************
    I am making a game where the player
    has to reach the goal line at the end of
    a long scrolling map.

    Eventually, I will have enemies that will
    kill the player, but right now, you can
    only run, jump, and fall off the bottom
    of the screen.
    Currently, the backgrounds remain in
    a fixed location and do not scroll.
    ******************************************/
#include <stdlib.h>
#include "myLib.h"
#include "splash.h"
#include "pause.h"
#include "lose.h"
#include "win.h"
#include "gameBG1.h"

#define SPLASHCREEN 0
#define GAMESCREEN 1
#define PAUSESCREEN 2
#define WINSCREEN 3
#define LOSESCREEN 4

void initialize();
void initSplash();
void splash();
void initGame();
void game();
void draw();
void update();

unsigned int buttons;
unsigned int oldButtons;


int state;
int count; 

int hOff;
int vOff;

int main()
{
	initialize();

    initSplash();

	while(1)
	{
		oldButtons = buttons;
		buttons = BUTTONS;
		switch(state)
		{
			case SPLASHCREEN:
				splash();
				break;
			case GAMESCREEN:
				game();
				break;
			// case PAUSESCREEN:
			// 	pause();
			// 	break;
			// case WINSCREEN:
			// 	win();
			// 	break;
			// case LOSESCREEN:
			// 	lose();
			// 	break;
		}
    }

	return 0;
}

void initialize()
{
	REG_DISPCTL =  MODE0 | BG0_ENABLE | BG1_ENABLE;
	REG_BG0CNT = BG_SIZE1 | SBB(28) | CBB(0);
	REG_BG1CNT = BG_SIZE0 | SBB(27) | CBB(1);
	buttons = BUTTONS;
	hOff = 0;
	vOff = 0;
}

void initSplash()
{

	loadPalette(splashPal);
	DMANow(3, splashTiles, &CHARBLOCKBASE[0], splashTilesLen/2);
	DMANow(3, splashMap, &SCREENBLOCKBASE[28], splashMapLen/2);
	state = SPLASHCREEN;
}

void splash()
{
	if(BUTTON_PRESSED(BUTTON_START))
	{
		initGame();
	}
}

void initGame()
{
	state = GAMESCREEN;
	count = 0;

}

void game()
{
	// fillScreen4(0);
	loadPalette(gameBG1Pal);
	DMANow(3, gameBG1Tiles, &CHARBLOCKBASE[0], gameBG1TilesLen/2);
	DMANow(3, gameBG1Map, &SCREENBLOCKBASE[28], gameBG1MapLen/2);
	if(BUTTON_HELD(BUTTON_LEFT))
	{
		hOff--;
	}
	if(BUTTON_HELD(BUTTON_RIGHT))
	{
		hOff++;
	}
	if(BUTTON_HELD(BUTTON_DOWN)) {
		vOff--;
	}
	if(BUTTON_HELD(BUTTON_UP)) {
		vOff++;
	}
	REG_BG0HOFS = hOff;
	REG_BG0VOFS = vOff;
	waitForVblank();

 //    update();
 // 	draw();

	if(BUTTON_PRESSED(BUTTON_START))
	{
		count++;
		if (count == 1) {
			pause();			
		} else if (count == 2) {
			lose();
		} else if (count == 3) {
			win();
		}

		if (count == 4) { 
			count = 0;
		}

	}
}


void pause() {
	loadPalette(pausePal);
	DMANow(3, pauseTiles, &CHARBLOCKBASE[0], pauseTilesLen/2);
	DMANow(3, pauseMap, &SCREENBLOCKBASE[28], pauseMapLen/2);
}

void lose() {
	loadPalette(losePal);
	DMANow(3, loseTiles, &CHARBLOCKBASE[0], loseTilesLen/2);
	DMANow(3, loseMap, &SCREENBLOCKBASE[28], loseMapLen/2);
}

void win() {
	loadPalette(winPal);
	DMANow(3, winTiles, &CHARBLOCKBASE[0], winTilesLen/2);
	DMANow(3, winMap, &SCREENBLOCKBASE[28], winMapLen/2);
}

void update()
{
}


void draw()
{


}

void loadMap(const unsigned short * map, unsigned short mapLen, unsigned short palIndex, unsigned short sbb)
{
	unsigned short newMap[mapLen];
	int i;
	for(i = 0; i < mapLen; i++)
	{
		// TODO mask the value in the current spot so we don't lose information
		unsigned short maskedNum = map[i] & ~(PALBANK(0xF));

		// TODO make every newMap value = to the old map value
		// with the appropriate palette flag set
		newMap[i] = maskedNum | PALBANK(palIndex);
		
	}
	// TODO DMA in the new map to the appropriate sbb
	DMANow(3, newMap, SCREENBLOCKBASE + sbb, mapLen/2);
}

