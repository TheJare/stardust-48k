s $0BB8
@ $0BB8 label=NoiseLocationInRom
s $168C
@ $168C label=LongRandomSoundLocationInRom
b $4000 Screen Pixel Buffer
@ $4000 label=ScreenPixelBuffer
b $5800 Screen Color Buffer
@ $5800 label=ScreenColorBuffer
b $5b00 Printer
s $5b30 Stack Area
@ $5b30 label=StackArea
b $5c00 System variables
b $5c32 Table
B $5c32,30,6
s $5C50 Decompressed level buffer. Size still unknown.
@ $5C50 label=DecompressedLevelBuffer
b $5E30
b $5E33
t $5E8B
b $5E9B
t $5EBE
b $5ED0
t $5EFC
@ $5F00 label=CharsetGraphics
N $5F00 The actual charset begins 32*8 bytes further ahead, ASCII 0-31 are not renderable
b $5F05
b $6000 Actual character set graphics, 8 bytes per char
b $61D8 Level 1 Data
@ $61D8 label=Level_1_Data
b $62D7 Level 2 Data
@ $62D7 label=Level_2_Data
b $63D4 Level 3 Data
@ $63D4 label=Level_3_Data
b $64D4 Level 4 Data
@ $64D4 label=Level_4_Data
b $65DB Level 5 Data
@ $65DB label=Level_5_Data
b $66EA Level 6 Data
@ $66EA label=Level_6_Data
b $67E4 Level 7 Data
@ $67E4 label=Level_7_Data
b $68FF
b $69A8 Sentinel node graphics. Each node is 3x3x8 bytes
@ $69A8 label=SentinelNodeGraphics
B $69A8,72
b $6D3A
b $6DE0 Level Tile Graphics Data: 111 tiles at 4x32 bytes per tile
@ $6DE0 label=LevelTileGraphics
b $A560 Graphics data for a total of 83 16x16 masked sprites
@ $A560 label=Sprite16x16MaskedGraphics
b $BA20
@ $BA20 label=PlayerDemoInputData
c $BD85
@ $BD85 label=ProgramEntryPoint
c $BDBA Main entry point and global menu loop
@ $BDBA label=GlobalMainLoop
N $BDBD Attract mode menu loop
@ $BDBD label=AttractMenuLoop
N $BE84 Loading screen checksum protection
@ $BE8D label=.chksumlp
c $C00A Check if Pause key is pressed. If so, wait until it is released and any key is pressed again
@ $C00A label=WaitPauseKeyReleased
c $C027 Render current lives and level
@ $C027 label=DrawLivesAndLevel
b $C04B
b $C052 Self-modified absolute jump - JP
@ $C052 label=RunPlayerAI
W $C053 Self-modified absolute jump address
@ $C053 label=CurrentPlayerAIFuncPtr
c $C055 Player AI function 1
@ $C055 label=PlayerAI_1_Func
b $C07E Self-modified call - CALL
@ $C07E label=RunPlayerControl
W $C07F Self-modified call address
@ $C07F label=CurrentPlayerControlFuncPtr
C $C081
c $C0CB Generate new enemy ship
N $C0CB A = ship type
@ $C0CB label=CreateEnemyShip
b $C173
B $C173,2
@ $C173 label=PlayerCoords
S $C175,2
B $C177
@ $C177 label=PlayerShields
c $C178
@ $C178 label=EnemyAI_1_Func
c $C17F
@ $C17F label=EnemyAI_10_Func
c $C19E
@ $C19E label=ReadPlayerDemoInputFunc
c $C1AC
@ $C1AC label=ReadPlayerInputFunc
C $C1D6 Read Player Control Keys
@ $C1D6 label=ReadControlKeys
c $C1F4
c $C311 Draws and advances the starfield
@ $C311 label=DrawStarfield
c $C35C
c $C430
c $C442
c $C447 Render a 16x16 masked sprite
@ $C447 label=Draw16x16MaskedSprite
B $C484 Self-modified relative jump - JR
B $C485 Self-modified relative jump Offset
@ $C485 label=DrawSpriteMaskPixelShiftJump
C $C486
C $C48D
B $C4BB Self-modified relative jump - JR
B $C4BC Self-modified relative jump Offset
@ $C4BC label=DrawSpriteColorPixelShiftJump
C $C4BD
C $C4C4
c $C502 Convert coords in H,L to backbuffer address in HL.
@ $C502 label=CoordsToBackbuffer
c $C514
c $C548
c $C54E
c $C56D
c $C573
c $C59B
c $C5A8 Draw Player explosion - and output random sound
@ $C5A8 label=DrawPlayerExplosion
c $C614 Delete one enemy ship pointed at by IX
@ $C614 label=DeleteEnemyShip
c $C63B Render Sentinel Node (or maybe the entire sentinel, not sure yet)
@ $C63B label=DrawSentinelNode
c $C726
c $C75F
c $C765
c $C76E
c $C795
c $C7D1 Generate random number
@ $C7D1 label=GetRandom
c $C7E8 Clear backbuffer
@ $C7E8 label=ClearBackbuffer
c $C810
c $C832
b $C85B
@ $C85B label=NumEnemies
@ $C85C label=EnemyTable
B $C85C,40,8
s $C884
b $C8A4
B $C8FE
@ $C8FE label=Algo__Num
B $C8FF
b $C91C
@ $C91C label=NumEnemyMissiles
@ $C91D label=EnemyMissilesTable
B $C91D,15,5
b $C92C
B $CA12
@ $CA12 label=MainMenuWait
W $CA13
@ $CA13 label=RandomSeed
B $CA15
B $CA16
@ $CA16 label=NumEnemyShips
B $CA17
t $CA4A
b $CA5D
t $CA68
b $CA86
b $CA8D Starfield vertical positions (index is used for X coordinate)
@ $CA8D label=StarfieldData
b $CABD
b $CABE Enemy Spaceship Table
@ $CABE label=EnemySpaceshipTable
B $CABE,3
W $CAC1
B $CAC3,3
L $CABE,8,6
s $CAEE
c $CAFE Run entity logic (not sure which type of entity yet)
@ $CAFE label=RunEntityLogic
c $CB2A
c $CB6F
c $CC07
c $CC27
c $CC4B
c $CC9F
c $CCC6
c $CCEE
c $CCFA
c $CDDE
@ $CDDE label=EnemyAI_7_Func
c $CE21
c $CE73
c $CE95
c $CF00
c $CF2E
c $CF56
c $CF92
c $CFC0
c $CFD9
c $CFFE
c $D016
c $D035
c $D061
c $D088
c $D09C
c $D0B4
c $D0BC
c $D107
c $D14D
c $D194
c $D1B4
c $D208 Remove one shield
@ $D208 label=RemoveOneShield
c $D214 Remove two shields
@ $D214 label=RemoveTwoShields
c $D244 Player has died
@ $D244 label=PlayerDied
c $D257 Make ship visible on HUD
@ $D257 label=MakeShipVisibleOnHUD
c $D259 Update a ship on the HUD
@ $D259 label=UpdateShipOnHUD
c $D266
c $D2A3
@ $D2A3 label=EnemyAI_8_Func
c $D34D
b $D35C
B $D364
@ $D364 label=Algo_max10_Num
B $D365
W $D366
B $D368
B $D369
s $D36A
w $D36C Temporary storage for SP
@ $D36C label=TempSaveSP
c $D36E Play a sound according to parameters in E and B
@ $D36E label=PlaySimpleSound
c $D385 Play noise taken from ROM (preudo-random) bytes, for a length of C
@ $D385 label=PlayNoise
c $D39B Play a sound according to parameters in HL and BC
@ $D39B label=PlayComplexSound
c $D3D1 Play a sound defined by B bytes at HL
@ $D3D1 label=PlaySoundFromMemory
c $D3E6
@ $D3E6 label=DrawSentinelOnHUD
c $D411
@ $D411 label=NextScreenScanline
c $D420 Render regular string
@ $D420 label=DrawString
c $D43F
c $D476
@ $D476 label=StepLongRandomSound
c $D48D
@ $D48D label=StepLongNoise
c $D4A2
@ $D4A2 label=StepLongSimpleSound
c $D4B7
@ $D4B7 label=StepLongComplexSound
c $D4CF
c $D513 Fill the attributes of the play area of the screen, leaving the HUD intact.
@ $D513 label=FillPlayAreaAttributes
c $D527
@ $D527 label=ResetPlayerShields
c $D551 Render a double-height stippled character
@ $D551 label=DrawDoubleHeightChar
c $D595 Render a double-height stippled string
@ $D595 label=DrawDoubleHeightString
c $D5A3
c $D5DF Dump backbuffer to screen
@ $D5DF label=ShowBackbuffer
c $D625
@ $D625 label=GenerateScreenLinesTable
s $D63E Table with addresses of each backbuffer line in the screen
@ $D63E label=ScreenLinesTable
c $D77E
c $D7AF Show high scores
@ $D7AF label=HighScoresMode
c $D7CA Check keyboard. Return NZ if any key is pressed
@ $D7CA label=IsAnyKeyDown
c $D7D2 Setup and run the Demo
@ $D7D2 label=RunDemo
c $D7E5
c $D815 Wait for a key press and figure out which key it is
@ $D815 label=WaitAndReadKey
c $D82D
c $D85A Render regular char with cursor effect
@ $D85A label=DrawCharWithCursor
c $D8D9 Render regular string with cursor effect
@ $D8D9 label=DrawStringWithCursor
c $D8E5 Tentative - create new enemies randomly
@ $D8E5 label=TENTSpawnNewEnemies
c $D9B1 Run Entity logic (not sure what type of entity yet)
@ $D9B1 label=RunEntityLogic2
c $D9FA
@ $D9FA label=EnemyAI_6_Func
c $DA1F
c $DA2E Enter High Score mode, inserting new score in the table if appropriate
@ $DA2E label=EnterHighScoreMode
c $DB0E Main Gameplay Mode
@ $DB0E label=MainGameplayMode
c $DB84 Inter level activity. Show bonus message and other stuff
@ $DB84 label=InterLevelActivity
c $DBFB Active Wait. Consume some time to create a delay
@ $DBFB label=ActiveWait
c $DC01 Load 2nd Stage
@ $DC01 label=LoadSecondStage
c $DC2B
c $DCAE
c $DCD8
c $DCFF
c $DD03
c $DD3E
@ $DD64 label=LogicStateNOPFunc
c $DD65
c $DDE8
c $DE13 Decompress a block (single tile or id of a tile block)
@ $DE13 label=DecompressLevelBlock
c $DE40 Decompress level
@ $DE40 label=DecompressLevel
c $DE4A
@ $DE4A label=EnemyAI_9_Func
t $DED3 Text preparing the jump to load the 2nd stage
@ $DED3 label=NextStageText
t $DF77 Redefine keys text
@ $DF77 label=RedefineKeysText
t $DFF5 Keyboard map
@ $DFF5 label=KeyboardMap
b $E01D Defined keys data - bit, I/O row pairs
@ $E01D label=DefinedKeysData
B $E01D,14,2
b $E02B
@ $E02B label=LongComplexSoundCounter
b $E02C
@ $E02C label=LongRandomSoundCounter
b $E02D
@ $E02D label=LongNoiseCounter
b $E02E
@ $E02E label=LongSimpleSoundCounter
B $E02F
@ $E02F label=IsKempstonJoystick
W $E030
@ $E030 label=ParamBackbufferDest
t $E032 Main Menu Messages
@ $E032 label=MainMenuText
T $E06C
@ $E06C label=KempstonUnderlineText
T $E07E
@ $E07E label=KeyboardUnderlineText
t $E086 High Score table
@ $E086 label=HighScoreText
t $E0BE Split text to prevent bug in SkoolKit
t $E0FE Current Score
@ $E0FE label=CurrentScoreText
t $E105 High Score Messages
@ $E105 label=HighScoreEnterText
t $E170 Demo Message
@ $E170 label=DemoText
t $E176 Bonus Message
@ $E176 label=BonusMessageText
b $E181 Table pointing to the data for each level
@ $E181 label=LevelDataTable
W $E181
B $E183
L $E181,3,7
b $E196
@ $E196 label=LevelTileBlockDictionary
N $E196 First byte is block length. Then follow N-1 bytes with tile ids, which can themselves be block tiles rather than individual tiles
c $E28D Run enemy missiles
@ $E28D label=RunEnemyMissiles
C $E337
@ $E337 label=RemoveMissile
c $E35A
@ $E35A label=EnemyAI_3_Func
c $E36D
c $E388
@ $E388 label=EnemyAI_4_Func
c $E3B0
@ $E3B0 label=EnemyAI_5_Func
c $E3C3
c $E3E4
c $E417
@ $E417 label=EnemyAI_2_Func
c $E455
c $E47F
b $E4CA
B $E4CD,1
@ $E4CD label=ForceKeyboardInput
B $E4D2,1
@ $E4D2 label=PlayerLivesLeft
B $E4D3,1
@ $E4D3 label=CurrentLevel
W $E4D4,2
@ $E4D4 label=PlayerDemoCurrentInput
c $E9AB
@ $E9AB label=PlayMusic
w $EA34
b $EA54
c $EE70
@ $EE70 label=LoadNextStage
c $EF9C
@ $EF9C label=LoadingClearScreen
c $EFBE
@ $EFBE label=DrawLoadingString
C $EFDF
@ $EFDF label=DrawSearchingNextStage
T $EFE9
@ $EFE9 label=SearchingNextStageText
C $EFF9
@ $EFF9 label=DrawLoadingNextStage
T $F003
@ $F003 label=LoadingNextStageText
C $F013
@ $F013 label=DrawErrorLoading
T $F01D
@ $F01D label=ErrorLoadingText
s $F02C
s $F100
@ $F100 label=Backbuffer
