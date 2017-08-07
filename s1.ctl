b $4000 Screen Pixel Buffer
@ $4000 label=ScreenPixelBuffer
@ $4000 equ=NoiseLocationInRom=$0BB8
@ $4000 equ=LongRandomSoundLocationInRom=$168C
@ $4000 equ=Backbuffer=$F100
b $5800 Screen Color Buffer
@ $5800 label=ScreenColorBuffer
b $5b00 Printer
s $5b30 Stack Area
@ $5b30 label=StackArea
b $5c00 System variables
b $5c32 Level buffer, with pre-build space above
@ $5c32 label=LevelBuffer
S $5c33
@ $5c33 label=LevelBuffer_plus_1
S $5C50 Decompressed level buffer.
@ $5C50 label=DecompressedLevelBuffer
b $5E30 unknown
@ $5F00 label=CharsetGraphics
N $5F00 The actual charset begins 32*8 bytes further ahead, ASCII 0-31 are not renderable
b $6000 Actual character set graphics, 8 bytes per char, 59 chars
@ $6000 label=ActualCharsetGraphics
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
b $69A8 Sentinel node graphics. Each node is 3x3x8 bytes, 15 nodes
@ $69A8 label=SentinelNodeGraphics
B $69A8,72 Sentinel graphic
L $69A8,72,15
b $6DE0 Level Tile Graphics Data: 111 tiles at 4x32 bytes per tile, 111 tiles
@ $6DE0 label=LevelTileGraphics
B $6DE0,128 Tile graphic
L $6DE0,128,111
b $A560 Graphics data for a total of 83 16x16 masked sprites
@ $A560 label=Sprite16x16MaskedGraphics
B $A560,64 Sprite
L $A560,64,83
b $BA20 Data for player input in the demo, one byte per frame
@ $BA20 label=PlayerDemoInputData
c $BD85 Entry Point
@ $BD85 label=ProgramEntryPoint
c $BD8A Main function
@ $BD8A label=Main
c $BDBA Main entry point and global menu loop
@ $BDBA label=GlobalMainLoop
N $BDBD Attract mode menu loop
@ $BDBD label=AttractMenuLoop
@ $BE01 label=ResetMainMenu
@ $BE06 label=MainMenuLoop
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
N $C0CB B = 6 (?)
@ $C0CB label=CreateEnemyShip
b $C173
B $C173
@ $C173 label=PlayerCoord_X
B $C174
@ $C174 label=PlayerCoord_Y
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
@ $C1F4 label=DrawEnemyFighters
C $C2EE Removes the enemy fighter pointed to by IX from the table
@ $C2EE label=RemoveEnemyighter
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
@ $C514 label=Draw8x8Sprite
c $C59B
c $C5A8 Draw Player explosion - and output random sound
@ $C5A8 label=DrawPlayerExplosion
c $C614 Delete one enemy ship
R $C614 IX points to the ship's data in the table
R $C614 B contains the count of ships remaining in the table, including the one being deleted.
N $C614 Upon return, B and IX will be correct and will point to the previous ship in the table,
N $C614 ready to be incremented to find the next ship.
@ $C614 label=DeleteEnemyShip
c $C63B Render Sentinel Nodes (5x5)
@ $C63B label=DrawSentinelNodes
c $C726
c $C75F
@ $C75F label=GetOrientationBits
C $C765
@ $C765 label=GetOrientation_2_Value
C $C768 Get the byte from table in DE indexed by A
@ $C768 label=GetFromTable
c $C76E Advances coordinates in HL by orientation in A with speeds in BC
@ $C76E label=AdvanceShipByOrientation
c $C795
c $C7D1 Generate random number
@ $C7D1 label=GetRandom
c $C7E8 Clear backbuffer
@ $C7E8 label=ClearBackbuffer
c $C810 Enemy fighter at position BC, and fifth parameter (?) in A'. Returns carry == success.
@ $C810 label=CreateEnemyFighter
c $C832
b $C85B
@ $C85B label=NumEnemies
@ $C85C label=EnemyTable
B $C85C,40,8
s $C884
b $C8A4
@ $C8A4 label=SentinelData
B $C8A4,25,5
b $C8BD
@ $C8BD label=EnemyBulletCount
@ $C8BE label=EnemyBulletTable
B $C8BE,24,4
b $C8D6
@ $C8D6 label=PlayerBulletCount
@ $C8D7 label=PlayerBulletTable
B $C8D7,36,4
w $C8FB
@ $C8FB label=SavedBulletTableEnd
b $C8FD
@ $C8FD label=SavedBulletTableType
b $C8FE Enemy fighter data
@ $C8FE label=EnemyFighterCount
@ $C8FF label=EnemyFighterTable
B $C8FF,20,5    X, Y, Sprite, ExplosionSprite, ???
b $C913
b $C91C
@ $C91C label=NumEnemyMissiles
@ $C91D label=EnemyMissilesTable
B $C91D,15,5
B $C927,1
@ $C927 label=PlayerShipOrientation
B $C928,8 Helper table with axis bits for each of 8 orientations
@ $C928 label=OrientationBitsTable
B $C930,8
@ $C930 label=NextOrientation_2_Table
B $CA12
@ $CA12 label=MainMenuWait
W $CA13
@ $CA13 label=RandomSeed
B $CA15
B $CA16
@ $CA16 label=NumEnemyShips
@ $CA17 label=Sprite8x8Table
B $CA17,48,16
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
L $CABE,8,8
c $CAFE Run the logic for all enemy ships
@ $CAFE label=RunEnemyShipLogic
c $CB2A Runs the logic (heat-seeking) for an enemy missile
R $CB2A HL The missile's position
R $CB2A BC The missile's velocity
R $CB2A DE The player's position
N $CB2A Modifies BC to turn towards the player's position
@ $CB2A label=RunEnemyMissileLogic
c $CB6F
@ $CB6F label=RunAllBulletLogic
c $CB9C
@ $CB9C label=RunBulletLogic
@ $CBB6 label=RunBulletLogic_SpeedsSelfMod
c $CC07
c $CC27
c $CC4B
c $CC9F
c $CCC6
@ $CCC6 label=Draw32x32MaskedSprite
c $CCEE
@ $CCEE label=CompareCoord
c $CCFA
c $CDDE
@ $CDDE label=EnemyAI_7_Func
c $CE21
c $CE73
c $CE95
c $CF00
c $CF2E Check an objet's position and dimensions against a bullet table
R $CF2E HL Object coordinates
R $CF2E DE Some dimensions
R $CF2E BC more dimensions
R $CF2E IY Bullet table (player or enemy)
N $CF2E Returns with carry cleared if collision happened
@ $CF2E label=CheckObjectCollisionWithBulletTable
c $CF56
c $CF92
c $CFC0
@ $CFC0 label=CheckPlayerCollisionWithEnemyBullets
c $CFD9
@ $CFD9 label=CheckEnemyMissileCollisionWithPlayerBullets
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
@ $D5A3 label=DrawMainMenu
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
c $DA2E Check current score with High Scores, inserting new score in the table if appropriate
@ $DA2E label=CheckNewHighScoreMode
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
c $DD65 Check collision of energy barrier with player
@ $DD65 label=CheckBarrierCollisionPlayer
c $DDE8 Check collision of enemy with player
@ $DDE8 label=CheckEnemyCollisionPlayer
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
T $E0AF Split text to prevent bug in SkoolKit
T $E0BE Split text to prevent bug in SkoolKit
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
B $E4CC,1
@ $E4CC label=LastPlayerInput
B $E4CD,1
@ $E4CD label=ForceKeyboardInput
B $E4D2,1
@ $E4D2 label=PlayerLivesLeft
B $E4D3,1
@ $E4D3 label=CurrentLevel
W $E4D4,2
@ $E4D4 label=PlayerDemoCurrentInput
c $E5EB
@ $E5EB label=PlayMusic_SetupInterrupts
b $E600 Interrupt table
@ $E600 label=PlayMusic_InterruptTable
b $E701 Interrupt handler page
c $E7E7
@ $E7E7 label=PlayMusic_IMHandlerThunk
@ $E7EA label=PlayMusic_IMHandler
c $E80A
@ $E80A label=PlayMusic_algo
c $E92D
@ $E92D label=PlayMusic_Func1
c $E94D
@ $E94D label=PlayMusic_Func2
c $E96D
@ $E96D label=PlayMusic_Func3
c $E98C
@ $E98C label=PlayMusic_Func4
c $E9AB
@ $E9AB label=PlayMusic
@ $E9F6 label=PlayMusic_OverwrittenCodeBlock
B $EA04,1 Self Modifying Code - LD BC,xxxx
W $EA05,2 Self Modifying code - word value
@ $EA05 label=PlayMusic_selfmod_value_1
B $EA16,1 Self Modifying Code - LD DE,xxxx
W $EA17,2 Self Modifying code - word value
@ $EA17 label=PlayMusic_selfmod_value_2
B $EA1F,1 Self Modifying code - JP xxxx
W $EA20,2 Self Modifying code - address
@ $EA20 label=PlayMusic_selfmod_jump_1
c $EA34 Piece of code copied into PlayMusic
@ $EA34 label=PlayMusic_CodePiece1
c $EA3C Piece of code copied into PlayMusic
@ $EA3C label=PlayMusic_CodePiece2
w $EA44 Jump table
@ $EA44 label=PlayMusic_JumpTable
b $EA54
@ $EA54 label=MusicPlayerPlaybackState
B $EA55
@ $EA55 label=MusicPlayer_v2
W $EA5C,2
@ $EA5C label=MusicPlayer_v3
W $EA5E,2
@ $EA5E label=MusicPlayer_v4
w $EA60
@ $EA60 label=MusicPlayer_NoteTable
w $EADA
@ $EADA label=Music_Script_1_Table
b $EAE4
@ $EAE4 label=Music_Script_Buffer
w $EB0E
@ $EB0E label=Music_Script_2_Table
b $EB16
@ $EB16 label=Music_ScriptData
B $EB38
B $EB49
W $EB4A
L $EB49,3,4
B $EB56
B $EB65
B $EB75
B $EB84
B $EB94
B $EB9D
B $EBA6
B $EBAF
B $EBB8
W $EBB9
L $EBB8,3,4
B $EBC5
W $EBC6
L $EBC5,3,4
B $EBD2
B $EBDA
B $EBE2
B $EBEA
B $EBF2
B $EBFA
B $EC02
B $EC0A
B $EC0D
W $EC0E
L $EC0D,3,8
B $EC26
W $EC27
L $EC26,3,8
B $EC3F
B $EC44
B $EC49
B $EC4E
W $EC4F
L $EC4E,3,8
B $EC67
B $EC74
B $ECB1
B $ECC5
B $ECD4
B $ECE3
B $ED06
B $ED20
B $ED36
B $ED57
B $ED78
B $EDA0
W $EDA1
L $EDA0,3,9
B $EDBB
B $EDBC
W $EDBD
L $EDBC,3,4
B $EDC8
B $EDC9
W $EDCA
L $EDC9,3,4
B $EDD5
B $EDD6
W $EDD7
L $EDD6,3,5
B $EDE5
B $EDE6
W $EDE7
L $EDE6,3,3
B $EDEF,3
B $EDF2
W $EDF3
L $EDF2,3,6
B $EE04
B $EE05
W $EE06
B $EE08,10
B $EE12
W $EE13
L $EE12,3,14
B $EE3C
W $EE3D
L $EE3C,3,17

B $EE6F
c $EE70
@ $EE70 label=LoadNextStage
c $EF9C
@ $EF9C label=LoadingClearScreen
c $EFBE
@ $EFBE label=DrawLoadingString
c $EFDF
@ $EFDF label=DrawSearchingNextStage
T $EFE9
@ $EFE9 label=SearchingNextStageText
c $EFF9
@ $EFF9 label=DrawLoadingNextStage
T $F003
@ $F003 label=LoadingNextStageText
c $F013
@ $F013 label=DrawErrorLoading
T $F01D
@ $F01D label=ErrorLoadingText
i $F02C
i $F100
@ $F100 label=Backbuffer
