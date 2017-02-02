/*****************************************
ESCAPE ROUTE: 
	Description: A game where the player is able to control
	his/her military aircraft to escape and safely land
	at homebase. The player must avoid obstacles as well as
	adjust his/her elevation to dodge planes that are in the way
	As the game progresses, more obstacles are generated with more tricks
	as each level progresses.
	
	There are 4 levels to the game and each level spawns varying enemies. 1st level is standard moving down enemies that vary in elevation.
	2nd level is moving up/down enemies and can be elevated randomly. 3rd level is moving up/down enemies and can be elevated or descended. 
	Also, this level has enemies that move from left to right on the screen. The 4th level enemy is a giant aircraft that moves downward AND 
	an aircraft that moves right to left on the screen with random elevation. Sound is enabled and each level up, there is a subtle sound played
	to notify the player. Once you play for a certain amount of time you win. If your aircraft goes below the screen OR you hit another
	aircraft, you lose. 

	Cheat mode is autopilot. This is enabled by pressing the L Button. When you collide with an enemy with this feature set on, 
	your aircraft will automatically switch its elevation thus dodging that enemy. It basically makes you invincible and therefore you
	win the game.


******************************************/

//KNOWN BUGS:
// Collisions are sometimes not accounted for.
// Typo on pause screen - should say "your" instead of "you're"

//************************************************************************************************************************************

//EXTRA CREDIT:

// 2 Backgrounds: One that is larger than the VBA screen to allow for vertical and horizontal scrolling.
	//A second parallax scrolling background was implemented for added effect. Game requirements only required one or the other, not both.
	//SEE game() and initGame()

// Background Priority: If a plane is at normal or low elevation, it will go under the cloud background. 
	//If a plane is at high elevation, it will fly above the clouds. This is true for the player aircraft AND the enemy aircrafts. 
	//SEE updateOAM() and look at attr2

// Paused When Dead: Instead of immediately going to the lose screen, I decided to transition smoother by adding a pause after death.
	// While this may seem trivial, I went over with Kartik the proper way of implementing this for good game design practice. Instead of
	// using a while loop to stop the functionality of the whole game, I added a timer that kept the game looping to keep track of each frame
	// after the player dies.
	//SEE game()

//Custom Made Graphics: Created each screen from scratch using Photoshop except for the purple background. 
	//SEE PSD files in game folder

#include <stdlib.h>
#include "myLib.h"
#include "splash.h"
#include "pause.h"
#include "lose.h"
#include "win.h"
#include "gameBG1.h"
#include "gameBG2.h"
#include "sprites.h"
#include "instructions.h"
#include "OnikuLoop.h"
#include "NoMonkey.h"
#include "levelup.h"
#include "wechampions.h"
#include "explosion.h"
#include "OhGod.h"

#define SPLASHCREEN 0
#define GAMESCREEN 1
#define PAUSESCREEN 2
#define WINSCREEN 3
#define LOSESCREEN 4
#define INSTRUCTIONSCREEN 5

#define ROWMASK 0xFF
#define COLMASK 0x1FF

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
int count3;
int spriteCount;
int level;
int timePlayed;
int autoPilot;
int seed;
volatile int timer;

int Bg0TempH;
int Bg0TempV;
int Bg1TempH;
int Bg1TempV;

SOUND soundA;
SOUND soundB;

int hOff;
int vOff;

int checkCollisionsLvl2;
int checkCollisionsLvl3;
int checkCollisionsLvl4;

OBJ_ATTR shadowOAM[128];

Sprite player;
int playerDead;

Sprite enemy1[3];
int enemy1Size;

//Enemy2
Sprite enemy2[5];
int enemy2Size;

//Enemy3
Sprite enemy3[5];
int enemy3Size;

//Enemy4
Sprite enemy4[3];
int enemy4Size;

Sprite enemy4SecondType[3];
int enemy4SecondTypeSize;

enum { SHIPFRONT = 0, SHIPHALFLEFT = 4, SHIPRIGHT = 12, SHIPLEFT = 20, SHIPHALFRIGHT = 100};

int main()
{
	seed = 0;
	setupSounds();
	setupInterrupts();

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
			case INSTRUCTIONSCREEN:
				instructions();
				break;
			case GAMESCREEN:
				game();
				break;
			case PAUSESCREEN:
				pause();
				break;
			case WINSCREEN:
				win();
				break;
			case LOSESCREEN:
				lose();
				break;
		}
    }

	return 0;
}

void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_TO_BOTH | 
                     DSA_TIMER0 | 
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 | 
                     DSB_OUTPUT_TO_BOTH | 
                     DSB_TIMER1 | 
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void interruptHandler()
{
	REG_IME = 0;
	if(REG_IF & INT_VBLANK)
	{
		if (soundA.isPlaying) {
			if (soundA.vbCount >= soundA.duration) {
				if (soundA.loops) {
					playSoundA(soundA.data, soundA.length, soundA.frequency);
				} else {
        			dma[1].cnt = 0;
        			REG_TM0CNT = 0;
        			soundA.isPlaying = 0;
				}
			}
			soundA.vbCount++;
		}

		if (soundB.isPlaying) {
			if (soundB.vbCount >= soundB.duration) {
				if (soundB.loops) {
					playSoundB(soundB.data, soundB.length, soundB.frequency);
				} else {
        			dma[2].cnt = 0;
        			REG_TM1CNT = 0;
        			soundB.isPlaying = 0;
				}
			}
			soundB.vbCount++;
		}

		REG_IF = INT_VBLANK; 
	}

	REG_IME = 1;
}

void setupInterrupts()
{
	REG_IME = 0;
	REG_INTERRUPT = (unsigned int*)interruptHandler;

	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}

void playSoundA(const unsigned char* sound, int length, int frequency) {
       
		soundA.data = sound;
		soundA.length = length;
		soundA.frequency = frequency;
		soundA.isPlaying = 1;
		soundA.vbCount = 0;
		soundA.duration = ((VBLANK_FREQ*length)/frequency);

        dma[1].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
	
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
        REG_TM0CNT = 0;
	
        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;

         
}

void playSoundB(const unsigned char* sound, int length, int frequency) {

		soundB.data = sound;
		soundB.length = length;
		soundB.frequency = frequency;
		soundB.isPlaying = 1;
		soundB.vbCount = 0;
		soundB.duration = ((VBLANK_FREQ*length)/frequency);

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
	
        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;

}

void pauseSound()
{
	soundA.isPlaying = 0;
	soundB.isPlaying = 0; 
	REG_TM0CNT = 0;
	REG_TM1CNT = 0;	
}

void unpauseSound()
{
	soundA.isPlaying = 1;
	soundB.isPlaying = 1; 
	REG_TM0CNT = TIMER_ON;
	REG_TM1CNT = TIMER_ON;	
}

void stopSound()
{
	dma[1].cnt = 0;
	REG_TM0CNT = 0;
	soundA.isPlaying = 0;
	dma[2].cnt = 0;
	REG_TM1CNT = 0;
	soundB.isPlaying = 0; 
}

void initialize()
{
	soundA.loops = 1;
    playSoundA(Oniku_Loop,ONIKU_LOOPLEN,ONIKU_LOOPFREQ);
	
	REG_DISPCTL =  MODE0 | BG0_ENABLE | BG1_ENABLE;

	REG_BG0CNT = BG_SIZE0 | SBB(27) | CBB(0);
	REG_BG1CNT = BG_SIZE0 | SBB(30) | CBB(1);

	buttons = BUTTONS;
	hOff = 0;
	vOff = 0;
	count = 0;
	count3 = 0;
	spriteCount = 0;
	level = 1;
	timePlayed = 0;
	autoPilot = 0;

	Bg0TempH = 0;
	Bg0TempV = 0;
	Bg1TempH = 0;
	Bg1TempV = 0;

	checkCollisionsLvl2 = 0;
	checkCollisionsLvl3 = 0;
	checkCollisionsLvl4 = 0;

}


void initSplash()
{
	playSoundB(levelup,LEVELUPLEN,LEVELUPFREQ);
	loadPalette(splashPal);
	DMANow(3, splashTiles, &CHARBLOCKBASE[0], splashTilesLen/2);
	DMANow(3, splashMap, &SCREENBLOCKBASE[27], splashMapLen/2);
	state = SPLASHCREEN;

	seed+=3;
}

void splash()
{
	if(BUTTON_PRESSED(BUTTON_START))
	{
		initGame();
	} else if (BUTTON_PRESSED(BUTTON_SELECT)) {
		state = INSTRUCTIONSCREEN;
	}
}

void initGame()
{
	state = GAMESCREEN;
	count = 0;

	REG_DISPCTL =  MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;	
	REG_BG0CNT = BG_SIZE0 | SBB(27) | CBB(3);
	REG_BG1CNT = BG_SIZE0 | SBB(30) | CBB(1) | 1;

	timer = 0;
	playerDead = 0;

	loadPalette(gameBG1Pal);
	DMANow(3, gameBG1Tiles, &CHARBLOCKBASE[1], gameBG1TilesLen/2);
	DMANow(3, gameBG1Map, &SCREENBLOCKBASE[30], gameBG1MapLen/2);

	DMANow(3, gameBG2Tiles, &CHARBLOCKBASE[3], gameBG2TilesLen/2);
	DMANow(3, gameBG2Map, &SCREENBLOCKBASE[27], gameBG2MapLen/2);

 	DMANow(3, spritesTiles, &CHARBLOCKBASE[4], spritesTilesLen/2);
 	DMANow(3, spritesPal, SPRITE_PALETTE, spritesPalLen/2);

 	srand(seed);

	player.row = 90;
	player.col = 100;
	player.position = SHIPFRONT;
	player.active = 1;

	player.bigRow = player.row + vOff;
	player.bigCol = player.col + hOff;
	player.elevation = 0;
	player.direction = 0;

	//Dummy enemy to save array size
	enemy1[0].bigRow = 0;
	enemy1[0].bigCol = 0;
	enemy1[0].position = 0; //From sprite image sheet
	enemy1[0].active = 0;
	enemy1[0].row = 0;
	enemy1[0].col = 0;
	enemy1[0].elevation = 0;
	enemy1[0].direction = 0;
	enemy1[0].hide = 0;
	enemy1Size = sizeof(enemy1) / sizeof(enemy1[0]);

	enemy2[0].bigRow = 0;
	enemy2[0].bigCol = 0;
	enemy2[0].position = 0; //From sprite image sheet
	enemy2[0].active = 0;
	enemy2[0].row = 0;
	enemy2[0].col = 0;
	enemy2[0].elevation = 0;
	enemy2[0].direction = 0;
	enemy2[0].hide = 0;
	enemy2Size = sizeof(enemy2) / sizeof(enemy2[0]);

	enemy3[0].bigRow = 0;
	enemy3[0].bigCol = 0;
	enemy3[0].position = 0; //From sprite image sheet
	enemy3[0].active = 0;
	enemy3[0].row = 0;
	enemy3[0].col = 0;
	enemy3[0].elevation = 0;
	enemy3[0].direction = 0;
	enemy3[0].hide = 0;	
	enemy3Size = sizeof(enemy3) / sizeof(enemy3[0]);


	enemy4[0].bigRow = 0;
	enemy4[0].bigCol = 0;
	enemy4[0].position = 0; //From sprite image sheet
	enemy4[0].active = 0;
	enemy4[0].row = 0;
	enemy4[0].col = 0;
	enemy4[0].elevation = 0;
	enemy4[0].direction = 0;
	enemy4[0].hide = 0;	
	enemy4Size = sizeof(enemy4) / sizeof(enemy4[0]);

	enemy4SecondType[0].bigRow = 0;
	enemy4SecondType[0].bigCol = 0;
	enemy4SecondType[0].position = 0; //From sprite image sheet
	enemy4SecondType[0].active = 0;
	enemy4SecondType[0].row = 0;
	enemy4SecondType[0].col = 0;
	enemy4SecondType[0].elevation = 0;
	enemy4SecondType[0].direction = 0;
	enemy4SecondType[0].hide = 0;	
	enemy4SecondTypeSize = sizeof(enemy4SecondType) / sizeof(enemy4SecondType[0]);

	//Level 1 enemies
	for (int i = 0; i < enemy1Size; i++) {
		int randomElevation = rand() % 3;

	    int randomRow = rand() % 40;
	    int realRandomRow = -randomRow;
	    
	    int randomCol = rand() % 240;
		enemy1[i].bigRow = realRandomRow;
		enemy1[i].bigCol = randomCol;
		enemy1[i].position = 7;
		enemy1[i].active = 1;
		enemy1[i].row = enemy1[i].bigRow - vOff;
		enemy1[i].col = enemy1[i].bigCol - hOff;
		enemy1[i].elevation = randomElevation;
		enemy1[i].direction = 0;
		enemy1[i].hide = 0;
	}

	// Level 2 enemies: Move up & Down and can be elevated
	for (int i = 0; i < enemy2Size; i++) {
		int randDirection = rand() % 3;
		int randomElevation = rand() % 2;
	    int randomRow = rand() % 160;
	    randomRow = -randomRow;
	    int randomCol = rand() % 240;
		enemy2[i].bigRow = randomRow;
		enemy2[i].bigCol = randomCol;
		enemy2[i].position = 0;
		enemy2[i].active = 1;
		enemy2[i].row = enemy2[i].bigRow - vOff;
		enemy2[i].col = enemy2[i].bigCol - hOff;
		enemy2[i].elevation = 0;
		enemy2[i].direction = randDirection;		
		enemy2[i].elevation = randomElevation;
		enemy2[i].hide = 0;
	}

	// Level 3 enemies: Move up & down and can be elevated or descended; Can have enemies moving from left to right part of screen
	for (int i = 0; i < enemy3Size; i++) {
		int randDirection = rand() % 2;
		int randomElevation = rand() % 3;
	    int randomRow = rand() % 160;
	    int randomCol = rand() % 240;
		enemy3[i].bigRow = randomRow;
		enemy3[i].bigCol = randomCol;
		enemy3[i].position = 0;
		enemy3[i].active = 1;
		enemy3[i].row = enemy3[i].bigRow - vOff;
		enemy3[i].col = enemy3[i].bigCol - hOff;
		enemy3[i].direction = randDirection;		
		enemy3[i].elevation = randomElevation;
		enemy3[i].hide = 0;
	}

	// Level 4 Enemies
	for (int i = 0; i < enemy4Size; i++) {
		int randomElevation = rand() % 2;
	    int randomRow = rand() % 160;
	    int randomCol = rand() % 240;
		enemy4[i].bigRow = randomRow;
		enemy4[i].bigCol = randomCol;
		enemy4[i].position = 0;
		enemy4[i].active = 1;
		enemy4[i].row = enemy4[i].bigRow - vOff;
		enemy4[i].col = enemy4[i].bigCol - hOff;
		enemy4[i].elevation = 0;
		enemy4[i].direction = 0;		
		enemy4[i].elevation = randomElevation;
		enemy4[i].hide = 0;
	}

	// Second type of level 4 enemies; can move right to left & be ascended
	for (int i = 0; i < enemy4SecondTypeSize; i++) {
		int randomElevation = rand() % 2;
	    int randomRow = rand() % 160;
	    int randomCol = rand() % 240;
		enemy4SecondType[i].bigRow = randomRow;
		enemy4SecondType[i].bigCol = randomCol;
		enemy4SecondType[i].position = 0;
		enemy4SecondType[i].active = 1;
		enemy4SecondType[i].row = enemy4SecondType[i].bigRow - vOff;
		enemy4SecondType[i].col = enemy4SecondType[i].bigCol - hOff;
		enemy4SecondType[i].elevation = 0;
		enemy4SecondType[i].direction = 0;		
		enemy4SecondType[i].elevation = randomElevation;
		enemy4SecondType[i].hide = 0;
	}



 	hideSprites();
    playSoundA(No_Monkey,NO_MONKEYLEN,NO_MONKEYFREQ);

}

void game()
{
	if (playerDead == 1) {
		waitForVblank();
		timer++;
		if (timer == 100) {
			soundB.loops = 0;
    		playSoundB(OhGod,OHGODLEN,OHGODFREQ);
			initLose();
		}
	} else if (playerDead == 0){
		updateLevel();
		updatePlayerPosition();

		//Moves Player Plane Down Automatically
		count++;
		if (count == 3) {
			if (player.elevation == 0) {
				player.row++;
			} else if (player.elevation == 1) {
				player.row+=2;
			} else if (player.elevation == 2) {
				count3++;
				if (count3 == 2) {
					player.row+=3;	
					count3=0;
				}
			}

			changeEnemyPositions();
			count = 0;
		}

		//Move the screen up all the time
		//Depending on elevation, screen moves faster or slower.
		if (player.elevation == 0) {
			vOff--;
		} else if (player.elevation == 1) {
			vOff-=2;
		} else if (player.elevation == 2) {
			count3++;
			if (count3 == 2) {
				vOff--;
				count3=0;
			}
		}
		

		REG_BG1HOFS = hOff;
		REG_BG1VOFS = vOff;

		REG_BG0HOFS = (hOff * 3) / 2;
		REG_BG0VOFS = (vOff * 3)  / 2;

		adjustRowColVals();
		checkScreenCollisions();
		checkEnemyCollisions();
		updateOAM();
		DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);
		checkPlayerKeys();
		waitForVblank();
	}


}

void updatePlayerPosition() {

	player.position = SHIPFRONT;
	if(BUTTON_HELD(BUTTON_RIGHT)) {
		player.position = SHIPRIGHT;
		player.col+=2;			
	} 
	if (BUTTON_HELD(BUTTON_LEFT)) {
		player.position = SHIPLEFT;
		player.col-=2;
	} 
	if (BUTTON_HELD(BUTTON_UP)) {
		player.position = SHIPFRONT;
		player.row-=2;		
	} 

	if (BUTTON_HELD(BUTTON_RIGHT) && BUTTON_HELD(BUTTON_UP)) {
		player.position = SHIPHALFRIGHT;
		player.col+=2;
		player.row-=2;
	} 
	if (BUTTON_HELD(BUTTON_LEFT) && BUTTON_HELD(BUTTON_UP)) {
		player.position = SHIPHALFLEFT;
		player.col-=2;
		player.row-=2;
	}
}

void updateLevel() {
	timePlayed++;

	if (timePlayed == 500) {
		playSoundB(levelup,LEVELUPLEN,LEVELUPFREQ);
		checkCollisionsLvl2 = 1;
		level = 2;
	} else if (timePlayed == 1500) {
		checkCollisionsLvl3 = 1;
		playSoundB(levelup,LEVELUPLEN,LEVELUPFREQ);
		level = 3;
	} else if (timePlayed == 2000) {
		checkCollisionsLvl4 = 1;
		playSoundB(levelup,LEVELUPLEN,LEVELUPFREQ);
		level = 4;		
	} else if (timePlayed == 3000) {
		initWin();
	}
}

void checkPlayerKeys() {

	//Enable/Disable autopilot (cheat)
	if (BUTTON_PRESSED(BUTTON_L)) {
		autoPilot++;
		if (autoPilot == 2) {
			autoPilot = 0;
		}
	}

	if(BUTTON_PRESSED(BUTTON_B)) {
		togglePlayerElevation();
	}

	if(BUTTON_PRESSED(BUTTON_A))
	{

		Bg0TempH = (hOff * 3) / 2;
		Bg0TempV = (vOff * 3)  / 2;
		Bg1TempH = hOff;
		Bg1TempV = vOff;	
			
		initPause();
	} 
}

void togglePlayerElevation() {
	player.elevation++;
	if (player.elevation == 3) {
		player.elevation = 0;
	}	
}

void adjustRowColVals() {
	player.bigRow = player.row + vOff;
	player.bigCol = player.col + hOff;

	if (level == 1) {
		levelOneEnemies();	
	} else if (level == 2) {
		levelOneEnemies();
		levelTwoEnemies();
	} else if (level == 3) {
		levelOneEnemies();
		levelTwoEnemies();
		levelThreeEnemies();
	} else if (level == 4) {
		levelOneEnemies();
		levelTwoEnemies();
		levelThreeEnemies();
		levelFourEnemies();
	}



}

void levelOneEnemies() {
	for (int i = 0; i < enemy1Size; i++) {
		enemy1[i].row = enemy1[i].bigRow - vOff;
		enemy1[i].col = enemy1[i].bigCol - hOff;

		enemy1[i].hide = (enemy1[i].row < -32 || enemy1[i].row > 160 && enemy1[i].col < -32|| enemy1[i].col > 240) ? 1 : 0; 
		enemy1[i].active = (enemy1[i].row > 160) ? 0 : 1; //To respawn
	}	
}

void levelTwoEnemies() {
	for (int i = 0; i < enemy2Size; i++) {
		enemy2[i].row = enemy2[i].bigRow - vOff;
		enemy2[i].col = enemy2[i].bigCol - hOff;

		enemy2[i].hide = (enemy2[i].row < -40 || enemy2[i].row > 160 && enemy2[i].col < -40 || enemy2[i].col > 240) ? 1 : 0; 
		enemy2[i].active = (enemy2[i].row > 160) ? 0 : 1; //To respawn

	}		
}

void levelThreeEnemies() {
	for (int i = 0; i < enemy3Size; i++) {
		enemy3[i].row = enemy3[i].bigRow - vOff;
		enemy3[i].col = enemy3[i].bigCol - hOff;

		if (enemy3[i].direction == 0) {
			enemy3[i].hide = (enemy3[i].row < -32 || enemy3[i].row > 160 && enemy3[i].col < -32 || enemy3[i].col > 240) ? 1 : 0; 			
		} else if (enemy3[i].direction == 1) {
			enemy3[i].hide = (enemy3[i].row < -24 || enemy3[i].row > 160 && enemy3[i].col < -24|| enemy3[i].col > 240) ? 1 : 0; 				
		}

		enemy3[i].active = (enemy3[i].row > 160) ? 0 : 1; //To respawn

	}		
}

void levelFourEnemies() {
	for (int i = 0; i < enemy4Size; i++) {
		enemy4[i].row = enemy4[i].bigRow - vOff;
		enemy4[i].col = enemy4[i].bigCol - hOff;

		enemy4[i].hide = (enemy4[i].row < -48 || enemy4[i].row > 160 && enemy4[i].col < -48 || enemy4[i].col > 240) ? 1 : 0; 
		enemy4[i].active = (enemy4[i].row > 160) ? 0 : 1; //To respawn
	}
	for (int i = 0; i < enemy4SecondTypeSize; i++) {
		enemy4SecondType[i].row = enemy4SecondType[i].bigRow - vOff;
		enemy4SecondType[i].col = enemy4SecondType[i].bigCol - hOff;

		enemy4SecondType[i].hide = (enemy4SecondType[i].row < -32 || enemy4SecondType[i].row > 160 && enemy4SecondType[i].col < -32|| enemy4SecondType[i].col > 240) ? 1 : 0; 
		enemy4SecondType[i].active = (enemy4SecondType[i].row > 160) ? 0 : 1; //To respawn
	}
}

void changeEnemyPositions() {
	if (level == 1) {
		levelOneEnemiesRespawn();
	} else if (level == 2) {
		levelOneEnemiesRespawn();
		levelTwoEnemiesRespawn();
	} else if (level == 3) {
		levelOneEnemiesRespawn();
		levelTwoEnemiesRespawn();
		levelThreeEnemiesRespawn();		
	} else if (level == 4) {
		levelOneEnemiesRespawn();
		levelTwoEnemiesRespawn();
		levelThreeEnemiesRespawn();
		levelFourEnemiesRespawn();		
	}

}

void levelOneEnemiesRespawn() {
	for (int i = 0; i < enemy1Size; i++) {
		if (!enemy1[i].active) {
			int randomRow = rand() % 500;
			int randomCol = rand() % 256;
			enemy1[i].bigRow = -randomRow + vOff;
			enemy1[i].bigCol = randomCol;		
		} else {
			if (enemy1[i].elevation == 0) {
				enemy1[i].bigRow--;				
			} else if (enemy1[i].elevation == 1) {
				enemy1[i].bigRow++;
			} else if (enemy1[i].elevation == 2) {
				enemy1[i].bigRow+=3;
			}
		}

	}	
}

void levelTwoEnemiesRespawn() {
	for (int i = 0; i < enemy2Size; i++) {
		if (!enemy2[i].active) {
			int randomRow = rand() % 500;
			int randomCol = rand() % 256;
			enemy2[i].bigRow = -randomRow + vOff;
			enemy2[i].bigCol = randomCol;		
		} else {
			if (enemy2[i].direction == 0) {
				enemy2[i].bigRow-=5;				
			} else {
				enemy2[i].bigRow+=3;				
			}
					
		}

	}
}

void levelThreeEnemiesRespawn() {
	for (int i = 0; i < enemy3Size; i++) {
		if (!enemy3[i].active) {
			int randomRow = rand() % 500;
			int randomCol = rand() % 256;
			enemy3[i].bigRow = -randomRow + vOff;
			enemy3[i].bigCol = -randomCol + hOff;		
		} else {
			if (enemy3[i].direction == 0) {
				enemy3[i].bigRow-=5;				
			} else if (enemy3[i].direction == 1) {
				enemy3[i].bigCol+=3;				
			}		
		}
	}
}

void levelFourEnemiesRespawn() {
	for (int i = 0; i < enemy4Size; i++) {
		if (!enemy4[i].active) {
			int randomRow = rand() % 500;
			int randomCol = rand() % 256;
			enemy4[i].bigRow = -randomRow + vOff;
			enemy4[i].bigCol = randomCol;		
		} else {
			enemy4[i].bigRow+=2;	
		}
	}	

	for (int i = 0; i < enemy4SecondTypeSize; i++) {
		if (!enemy4SecondType[i].active) {
			int randomRow = rand() % 500;
			int randomCol = rand() % 256;
			enemy4SecondType[i].bigRow = -randomRow + vOff;
			enemy4SecondType[i].bigCol = -randomCol + hOff;
		} else {
			enemy4SecondType[i].bigCol-=3;
		}
	}
}

void checkEnemyCollisions() {
	//Basic Enemies
	for(int i = 0; i < enemy1Size; i++) {
		if (player.elevation == enemy1[i].elevation) {
			//Top of player ship collision
			if (player.position == SHIPFRONT && 
				(player.bigRow <= enemy1[i].bigRow + 32 && player.bigRow + 32 >= enemy1[i].bigRow) && 
				(player.bigCol + 32 >= enemy1[i].bigCol + 8 && player.bigCol <= enemy1[i].bigCol + 32)) { 
				
				if (!autoPilot) {
					if (!enemy1[i].hide) {
						soundA.loops = 0;
					    playSoundA(explosion,EXPLOSIONLEN,EXPLOSIONFREQ);
						playerDead = 1;
					}

				} else if (autoPilot) {
					togglePlayerElevation();
				}

			//Right or Left of player ship collision
			} else if (
				(player.position == SHIPRIGHT || player.position == SHIPLEFT) && 
				(player.bigRow + 32 >= enemy1[i].bigRow && player.bigRow <= enemy1[i].bigRow + 32) && 
				(player.bigCol + 56 >= enemy1[i].bigCol + 8 && player.bigCol <= enemy1[i].bigCol + 32)) { 
				
				if (!autoPilot) {
					if (!enemy1[i].hide) {
						soundA.loops = 0;
					    playSoundA(explosion,EXPLOSIONLEN,EXPLOSIONFREQ);
						playerDead = 1;
					}			
				} else if (autoPilot) {
					togglePlayerElevation();
				}

			}	
		}
	}

	if (checkCollisionsLvl2) {
		//Level 2 Enemies
		for (int i = 0; i < enemy2Size; i++) {
			if (player.elevation == enemy2[i].elevation) {
				//Top of player ship collision
				if (player.position == SHIPFRONT && 
					(player.bigRow <= enemy2[i].bigRow + 40 && player.bigRow + 32 >= enemy2[i].bigRow) && 
					(player.bigCol + 32 >= enemy2[i].bigCol && player.bigCol <= enemy2[i].bigCol + 40)) { 
					
					if (!autoPilot) {
						if (!enemy2[i].hide) {
							soundA.loops = 0;
						    playSoundA(explosion,EXPLOSIONLEN,EXPLOSIONFREQ);
							playerDead = 1;
						}
					} else if (autoPilot) {
						togglePlayerElevation();
					}


				//Right or Left of player ship collision
				} else if (
					(player.position == SHIPRIGHT || player.position == SHIPLEFT) && 
					(player.bigRow + 32 >= enemy2[i].bigRow && player.bigRow <= enemy2[i].bigRow + 32) && 
					(player.bigCol + 56 >= enemy2[i].bigCol && player.bigCol <= enemy2[i].bigCol + 32)) { 
					
					if (!autoPilot) {
						if (!enemy2[i].hide) {
							soundA.loops = 0;
						    playSoundA(explosion,EXPLOSIONLEN,EXPLOSIONFREQ);
							playerDead = 1;
						}		
					} else if (autoPilot) {
						togglePlayerElevation();
					}
				}
			}		
		}		
	}

	if (checkCollisionsLvl3) {
		// Level 3 Enemies
		for (int i = 0; i < enemy3Size; i++) {
			if (player.elevation == enemy3[i].elevation) {

				//When Enemies are vertical
				if (enemy3[i].direction == 0) {
					//Top of player ship collision
					if (player.position == SHIPFRONT && 
						(player.bigRow >= enemy3[i].bigRow && player.bigRow <= enemy3[i].bigRow + 32) && 
						(player.bigCol + 16 >= enemy3[i].bigCol && player.bigCol + 16 <= enemy3[i].bigCol + 24)) { 
						
						if (!autoPilot) {
							if (!enemy3[i].hide) {

								soundA.loops = 0;
							    playSoundA(explosion,EXPLOSIONLEN,EXPLOSIONFREQ);
								playerDead = 1;
							}			
						} else if (autoPilot) {
							togglePlayerElevation();
						}

					//Right or Left of player ship collision
					} else if (
						(player.position == SHIPRIGHT || player.position == SHIPLEFT) && 
						(player.bigRow + 32 >= enemy3[i].bigRow && player.bigRow <= enemy3[i].bigRow + 32) && 
						(player.bigCol + 56 >= enemy3[i].bigCol && player.bigCol <= enemy3[i].bigCol + 24)) { 
						
						if (!autoPilot) {
							if (!enemy3[i].hide) {
								soundA.loops = 0;
							    playSoundA(explosion,EXPLOSIONLEN,EXPLOSIONFREQ);
								playerDead = 1;
							}				
						} else if (autoPilot) {
							togglePlayerElevation();
						}
					}
				//When enemies are horizontal	
				} else if (enemy3[i].direction == 1) {
					//Top of player ship collision
					if (player.position == SHIPFRONT && 
						(player.bigRow >= enemy3[i].bigRow && player.bigRow <= enemy3[i].bigRow + 24) && 
						(player.bigCol + 16 >= enemy3[i].bigCol && player.bigCol + 16 <= enemy3[i].bigCol + 32)) { 
						
						if (!autoPilot) {
							if (!enemy3[i].hide) {
								soundA.loops = 0;
							    playSoundA(explosion,EXPLOSIONLEN,EXPLOSIONFREQ);
								playerDead = 1;
							}				
						} else if (autoPilot) {
							togglePlayerElevation();
						}

					//Right or Left of player ship collision
					} else if (
						(player.position == SHIPRIGHT || player.position == SHIPLEFT) && 
						(player.bigRow + 32 >= enemy3[i].bigRow && player.bigRow <= enemy3[i].bigRow + 24) && 
						(player.bigCol + 56 >= enemy3[i].bigCol && player.bigCol <= enemy3[i].bigCol + 32)) { 
						
						if (!autoPilot) {
							if (!enemy3[i].hide) {
								soundA.loops = 0;
							    playSoundA(explosion,EXPLOSIONLEN,EXPLOSIONFREQ);
								playerDead = 1;
							}		
						} else if (autoPilot) {
							togglePlayerElevation();
						}
					}
				}

			}	
		}
	}

	if(checkCollisionsLvl4) {
		// Level 4 Enemies
		for (int i = 0; i < enemy4Size; i++) {
			if (player.elevation == enemy4[i].elevation) {
				//Top of player ship collision
				if (player.position == SHIPFRONT && 
					(player.bigRow >= enemy4[i].bigRow && player.bigRow <= enemy4[i].bigRow + 48) && 
					(player.bigCol + 16 >= enemy4[i].bigCol && player.bigCol + 16 <= enemy4[i].bigCol + 56)) { 
					
					if (!autoPilot) {
						if (!enemy4[i].hide) {
							soundA.loops = 0;
						    playSoundA(explosion,EXPLOSIONLEN,EXPLOSIONFREQ);
							playerDead = 1;
						}				
					} else if (autoPilot) {
						togglePlayerElevation();
					}

				//Right or Left of player ship collision
				} else if (
					(player.position == SHIPRIGHT || player.position == SHIPLEFT) && 
					(player.bigRow + 32 >= enemy4[i].bigRow && player.bigRow <= enemy4[i].bigRow + 48) && 
					(player.bigCol + 56 >= enemy4[i].bigCol && player.bigCol <= enemy4[i].bigCol + 56)) { 
					
					if (!autoPilot) {
						if (!enemy4[i].hide) {
							soundA.loops = 0;
						    playSoundA(explosion,EXPLOSIONLEN,EXPLOSIONFREQ);
							playerDead = 1;
						}				
					} else if (autoPilot) {
						togglePlayerElevation();
					}
				}
			}		
		}

		//Level 4 Enemies Second Type
		for (int i = 0; i < enemy4SecondTypeSize; i++) {
			if (player.elevation == enemy4SecondType[i].elevation) {
				//Top of player ship collision
				if (player.position == SHIPFRONT && 
					(player.bigRow >= enemy4SecondType[i].bigRow && player.bigRow <= enemy4SecondType[i].bigRow + 32) && 
					(player.bigCol + 16 >= enemy4SecondType[i].bigCol && player.bigCol + 16 <= enemy4SecondType[i].bigCol + 48)) { 
					
					if (!autoPilot) {
						if (!enemy4SecondType[i].hide) {
							soundA.loops = 0;
						    playSoundA(explosion,EXPLOSIONLEN,EXPLOSIONFREQ);
							playerDead = 1;
						}
					} else if (autoPilot) {
						togglePlayerElevation();
					}

				//Right or Left of player ship collision
				} else if (
					(player.position == SHIPRIGHT || player.position == SHIPLEFT) && 
					(player.bigRow + 32 >= enemy4SecondType[i].bigRow && player.bigRow <= enemy4SecondType[i].bigRow + 32) && 
					(player.bigCol + 56 >= enemy4SecondType[i].bigCol && player.bigCol <= enemy4SecondType[i].bigCol + 48)) { 
					
					if (!autoPilot) {
						if (!enemy4SecondType[i].hide) {
							soundA.loops = 0;
						    playSoundA(explosion,EXPLOSIONLEN,EXPLOSIONFREQ);
							playerDead = 1;
						}		
					} else if (autoPilot) {
						togglePlayerElevation();
					}
				}
			}		
		}
	}

}


void checkScreenCollisions() {

	//TOP SCREEN COLLISION
	if (player.row < 60) {
		player.row = 60;
		vOff--;
	}


	//LEFT SCREEN COLLISION
	if (player.col <= 20 && player.position != SHIPFRONT) {
		player.col = 20;
		if (player.elevation == 0) {
			hOff--;
		} else if (player.elevation == 1) {
			hOff-=2;
		} else if (player.elevation == 2) {
			count3++;
			if (count3 == 2) {
				hOff--;	
				count3=0;
			}
		}
	}

	//RIGHT SCREEN COLLISION
	if (player.col + getCurShipWidth() >= 220) {
		player.col = 220 - getCurShipWidth();
		if (player.elevation == 0) {
			hOff++;
		} else if (player.elevation == 1) {
			hOff+=2;
		} else if (player.elevation == 2) {
			count3++;
			if (count3 == 2) {
				hOff++;	
				count3=0;
			}
		}
	}

	//BOTTOM SCREEN COLLISION
	if(player.row >= 160) {
		soundA.loops = 0;
	    playSoundA(explosion,EXPLOSIONLEN,EXPLOSIONFREQ);
		playerDead = 1;
	}


}

int getCurShipHeight() {
	if (player.position == SHIPLEFT || player.position == SHIPRIGHT) {
		return 32;
	} else if (player.position == SHIPFRONT) {
		return 64;
	} else {
		return 48;
	}
}

int getCurShipWidth() {
	if(player.position == SHIPLEFT || player.position == SHIPRIGHT) {
		return 64;
	} else if (player.position == SHIPFRONT) {
		return 32;
	} else {
		return 48;
	}
}

void hideSprites()
{
    for (int i = 0; i < 128; i++) {
 		shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}

void initPause() {
	pauseSound();
	state = PAUSESCREEN;
	REG_DISPCTL =  MODE0 | BG0_ENABLE;
	REG_BG0CNT = BG_SIZE0 | SBB(27) | CBB(0);
	loadPalette(pausePal);
	DMANow(3, pauseTiles, &CHARBLOCKBASE[0], pauseTilesLen/2);
	DMANow(3, pauseMap, &SCREENBLOCKBASE[27], pauseMapLen/2);	
}

void pause() {

	REG_BG1HOFS = 0;
	REG_BG1VOFS = 0;
	REG_BG0HOFS = 0;
	REG_BG0VOFS = 0;

	if (BUTTON_PRESSED(BUTTON_START)) {
		unpauseInitialize();	
		state = GAMESCREEN;
		unpauseSound();

	} else if (BUTTON_PRESSED(BUTTON_SELECT)) {
		initialize();
    	initSplash();
	}
}


void unpauseInitialize() {

	REG_BG1HOFS = 0;
	REG_BG1VOFS = 0;
	REG_BG0HOFS = 0;
	REG_BG0VOFS = 0;

	REG_DISPCTL =  MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;	
	REG_BG0CNT = BG_SIZE0 | SBB(27) | CBB(3);
	REG_BG1CNT = BG_SIZE0 | SBB(30) | CBB(1) | 1;

	loadPalette(gameBG1Pal);
	DMANow(3, gameBG1Tiles, &CHARBLOCKBASE[1], gameBG1TilesLen/2);
	DMANow(3, gameBG1Map, &SCREENBLOCKBASE[30], gameBG1MapLen/2);

	DMANow(3, gameBG2Tiles, &CHARBLOCKBASE[3], gameBG2TilesLen/2);
	DMANow(3, gameBG2Map, &SCREENBLOCKBASE[27], gameBG2MapLen/2);

 	DMANow(3, spritesTiles, &CHARBLOCKBASE[4], spritesTilesLen/2);
 	DMANow(3, spritesPal, SPRITE_PALETTE, spritesPalLen/2);

 	hideSprites();
 	pauseSound();
}

void initLose() {
	state = LOSESCREEN;
	REG_DISPCTL =  MODE0 | BG0_ENABLE;
	REG_BG0CNT = BG_SIZE0 | SBB(27) | CBB(0);
	loadPalette(losePal);
	DMANow(3, loseTiles, &CHARBLOCKBASE[0], loseTilesLen/2);
	DMANow(3, loseMap, &SCREENBLOCKBASE[27], loseMapLen/2);	

}

void lose() {
	REG_BG1HOFS = 0;
	REG_BG1VOFS = 0;
	REG_BG0HOFS = 0;
	REG_BG0VOFS = 0;


	//Go to splash screen
	if (BUTTON_PRESSED(BUTTON_START)) {
		initialize();
    	initSplash();
	}
}

void initWin() {
	state = WINSCREEN;
	REG_DISPCTL =  MODE0 | BG0_ENABLE;
	REG_BG0CNT = BG_SIZE0 | SBB(27) | CBB(0);
	loadPalette(winPal);
	DMANow(3, winTiles, &CHARBLOCKBASE[0], winTilesLen/2);
	DMANow(3, winMap, &SCREENBLOCKBASE[27], winMapLen/2);
	soundA.loops = 0;
    playSoundA(wechampions,WECHAMPIONSLEN,WECHAMPIONSFREQ);	
}

void win() {

	REG_BG1HOFS = 0;
	REG_BG1VOFS = 0;
	REG_BG0HOFS = 0;
	REG_BG0VOFS = 0;

	if (BUTTON_PRESSED(BUTTON_START)) {
		initialize();
    	initSplash();
	}
}

void instructions() {
	REG_DISPCTL =  MODE0 | BG0_ENABLE;
	REG_BG0CNT = BG_SIZE0 | SBB(27) | CBB(0);
	loadPalette(instructionsPal);
	DMANow(3, instructionsTiles, &CHARBLOCKBASE[0], instructionsTilesLen/2);
	DMANow(3, instructionsMap, &SCREENBLOCKBASE[27], instructionsMapLen/2);

	if (BUTTON_PRESSED(BUTTON_START)) {
		initSplash();
	}
}

void updateOAM() {
	spriteCount = 1;
	switch(player.position)
	{
		case SHIPFRONT:
			if (player.elevation == 1) {
				shadowOAM[spriteCount].attr0 = (ROWMASK & player.row) | ATTR0_TALL;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & player.col);
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(17, 0);
			} else if (player.elevation == 2) {
				shadowOAM[spriteCount].attr0 = (ROWMASK & player.row) | ATTR0_TALL;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & player.col);
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(10, 12) | ATTR2_PRIO(1);									
			} else {
				shadowOAM[spriteCount].attr0 = (ROWMASK & player.row) | ATTR0_TALL;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & player.col);
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(0, 0) | ATTR2_PRIO(1);					
			}

			break;
		case SHIPRIGHT:
			if (player.elevation == 1) {
				shadowOAM[spriteCount].attr0 = (ROWMASK & player.row) | ATTR0_WIDE;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & player.col);
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(5, SHIPRIGHT);
			} else if (player.elevation == 2) {
				shadowOAM[spriteCount].attr0 = (ROWMASK & player.row) | ATTR0_WIDE;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & player.col);
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(26, 0 | ATTR2_PRIO(1));
			} else {
				shadowOAM[spriteCount].attr0 = (ROWMASK & player.row) | ATTR0_WIDE;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & player.col);
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(0, SHIPRIGHT | ATTR2_PRIO(1));						
			}

			break;
		case SHIPHALFLEFT:
			if (player.elevation == 1) {
				shadowOAM[spriteCount].attr0 = (ROWMASK & player.row) | ATTR0_SQUARE;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & player.col);
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(18, 13);	
			} else if (player.elevation == 2) {
				shadowOAM[spriteCount].attr0 = (ROWMASK & player.row) | ATTR0_SQUARE;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & player.col);
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(19, 21 | ATTR2_PRIO(1));						
			} else {
				shadowOAM[spriteCount].attr0 = (ROWMASK & player.row) | ATTR0_SQUARE;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & player.col);
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(0, SHIPHALFLEFT | ATTR2_PRIO(1));						
			}

			break;
		case SHIPLEFT:
			if (player.elevation == 1) {
				shadowOAM[spriteCount].attr0 = (ROWMASK & player.row) | ATTR0_WIDE;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & player.col) | ATTR1_HFLIP;
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(5, SHIPRIGHT);
			} else if (player.elevation == 2) {
				shadowOAM[spriteCount].attr0 = (ROWMASK & player.row) | ATTR0_WIDE;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & player.col) | ATTR1_HFLIP;
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(26, 0 | ATTR2_PRIO(1));
			} else {
				shadowOAM[spriteCount].attr0 = (ROWMASK & player.row) | ATTR0_WIDE;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & player.col) | ATTR1_HFLIP;
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(0, SHIPRIGHT | ATTR2_PRIO(1));						
			}

			break;
		case SHIPHALFRIGHT:
			if(player.elevation == 1) {
				shadowOAM[spriteCount].attr0 = (ROWMASK & player.row) | ATTR0_SQUARE;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & player.col) | ATTR1_HFLIP;
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(18, 13);	
			} else if (player.elevation == 2) {
				shadowOAM[spriteCount].attr0 = (ROWMASK & player.row) | ATTR0_SQUARE;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & player.col) | ATTR1_HFLIP;
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(19, 21 | ATTR2_PRIO(1));						
			} else {
				shadowOAM[spriteCount].attr0 = (ROWMASK & player.row) | ATTR0_SQUARE;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & player.col) | ATTR1_HFLIP;
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(0, SHIPHALFLEFT | ATTR2_PRIO(1));						
			}
	
			break;
	}
	spriteCount++;
	

	if (level == 1) {
		displayLevelOneEnemies();
	} else if (level == 2) {
		displayLevelOneEnemies();
		displayLevelTwoEnemies();
	} else if (level == 3) {
		displayLevelOneEnemies();
		displayLevelTwoEnemies();
		displayLevelThreeEnemies();
	} else if (level == 4) {
		displayLevelOneEnemies();
		displayLevelTwoEnemies();
		displayLevelThreeEnemies();
		displayLevelFourEnemies();
	}

	spriteCount = 0;
}
//0 normal player plane; 1 elevated, 2 descended
void displayLevelOneEnemies() {
	for (int i = 0; i < enemy1Size; i++) {
		if (enemy1[i].elevation == 2) { //descended
			shadowOAM[spriteCount].attr0 = (ROWMASK & enemy1[i].row) | ATTR0_TALL;
	 		if(enemy1[i].hide) shadowOAM[spriteCount].attr0 |= ATTR0_HIDE;
			shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & enemy1[i].col);
			shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(26, 28 | ATTR2_PRIO(1));
			spriteCount++;
		} else if (enemy1[i].elevation == 0) { //normal plane
			shadowOAM[spriteCount].attr0 = (ROWMASK & enemy1[i].row) | ATTR0_TALL;
	 		if(enemy1[i].hide) shadowOAM[spriteCount].attr0 |= ATTR0_HIDE;
			shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & enemy1[i].col);
			shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(9, enemy1[i].position | ATTR2_PRIO(1));
			spriteCount++;
		} else if (enemy1[i].elevation == 1) { //elevated plane
			shadowOAM[spriteCount].attr0 = (ROWMASK & enemy1[i].row) | ATTR0_TALL;
	 		if(enemy1[i].hide) shadowOAM[spriteCount].attr0 |= ATTR0_HIDE;
			shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & enemy1[i].col);
			shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(11, 18);
			spriteCount++;
		}

	}		
}

void displayLevelTwoEnemies() {

	//Enemy 2
	for (int i = 0; i < enemy2Size; i++) {
		// rand () % 10 --> 0 - 9 random number
		if (enemy2[i].elevation == 0) {
			shadowOAM[spriteCount].attr0 = (ROWMASK & enemy2[i].row) | ATTR0_TALL;
	 		if(enemy2[i].hide) shadowOAM[spriteCount].attr0 |= ATTR0_HIDE;
			shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & enemy2[i].col);
			shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(8, 0 | ATTR2_PRIO(1));				
		} else if (enemy2[i].elevation == 1) {
			shadowOAM[spriteCount].attr0 = (ROWMASK & enemy2[i].row) | ATTR0_TALL;
	 		if(enemy2[i].hide) shadowOAM[spriteCount].attr0 |= ATTR0_HIDE;
			shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & enemy2[i].col);
			shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(17, 4);
		}
		spriteCount++;
	}
}

void displayLevelThreeEnemies() {
	for (int i = 0; i < enemy3Size; i++) {
		// rand () % 10 --> 0 - 9 random number
		if (enemy3[i].direction == 1) {

			shadowOAM[spriteCount].attr0 = (ROWMASK & enemy3[i].row) | ATTR0_WIDE;
	 		if(enemy3[i].hide) shadowOAM[spriteCount].attr0 |= ATTR0_HIDE;
			shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & enemy3[i].col);
			shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(5, 24);	

		} else if (enemy3[i].direction == 0){

			if (enemy3[i].elevation == 0) { //normal
				shadowOAM[spriteCount].attr0 = (ROWMASK & enemy3[i].row) | ATTR0_TALL;
		 		if(enemy3[i].hide) shadowOAM[spriteCount].attr0 |= ATTR0_HIDE;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE32 | (COLMASK & enemy3[i].col);
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(0, 20);				
			} else if (enemy3[i].elevation == 1) { //ascended
				shadowOAM[spriteCount].attr0 = (ROWMASK & enemy3[i].row) | ATTR0_TALL;
		 		if(enemy3[i].hide) shadowOAM[spriteCount].attr0 |= ATTR0_HIDE;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE32 | (COLMASK & enemy3[i].col);
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(5, 20 | ATTR2_PRIO(1));
			} else if (enemy3[i].elevation == 2) { //descended
				shadowOAM[spriteCount].attr0 = (ROWMASK & enemy3[i].row) | ATTR0_TALL;
		 		if(enemy3[i].hide) shadowOAM[spriteCount].attr0 |= ATTR0_HIDE;
				shadowOAM[spriteCount].attr1 = ATTR1_SIZE32 | (COLMASK & enemy3[i].col);
				shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(0, 24 | ATTR2_PRIO(1));				
			}				
		}

		spriteCount++;
	}
}

void displayLevelFourEnemies() {
	for (int i = 0; i < enemy4Size; i++) {
		shadowOAM[spriteCount].attr0 = (ROWMASK & enemy4[i].row) | ATTR0_WIDE;
			if(enemy4[i].hide) shadowOAM[spriteCount].attr0 |= ATTR0_HIDE;
		shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & enemy4[i].col);
		shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(11, 23);
		spriteCount++;
	}
	for (int i = 0; i < enemy4SecondTypeSize; i++) {
		shadowOAM[spriteCount].attr0 = (ROWMASK & enemy4SecondType[i].row) | ATTR0_WIDE;
			if(enemy4SecondType[i].hide) shadowOAM[spriteCount].attr0 |= ATTR0_HIDE;
		shadowOAM[spriteCount].attr1 = ATTR1_SIZE64 | (COLMASK & enemy4SecondType[i].col);
		if (enemy4SecondType[i].elevation == 0) {
			shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(27, 10);
		} else if (enemy4SecondType[i].elevation == 1) {
			shadowOAM[spriteCount].attr2 = SPRITEOFFSET16(27, 19);

		}
		spriteCount++;
	}
}

void loadMap(const unsigned short * map, unsigned short mapLen, unsigned short palIndex, unsigned short sbb) {
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

