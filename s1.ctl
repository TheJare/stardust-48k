b $4000 Screen Pixel Buffer
@ $4000 label=ScreenPixelBuffer
b $5800 Screen Color Buffer
@ $5800 label=ScreenColorBuffer
b $5b00 Printer
s $5b30 Stack Area
@ $5b30 label=StackArea
b $5c00 System variables
b $5cc0 Reserved
b $5ccb Main Memory
@ $5ccb label=MainMemory
t $5CF9
b $5CFC
t $5E30
b $5E33
t $5E8B
b $5E9B
t $5EBE
b $5ED0
t $5EFC
@ $5F00 label=CharsetGraphics
N $5F00 The actual charset begins 32*8 bytes further ahead, ASCII 0-31 are not renderable
b $5F02
b $6000 Actual character set graphics, 8 bytes per char
b $61D8
t $6233
b $6236
t $62EB
b $62EE
t $638E
b $6391
t $6406
b $6409
t $648B
b $648E
t $658E
b $6597
t $65AA
b $65AF
t $65E3
b $65E7
t $6677
b $667A
t $6741
b $6744
t $67EB
b $67F0
t $6822
b $6825
t $6885
b $6892
t $68BC
b $68CA
t $68E9
b $68EC
b $69A8 Sentinel node graphics. Each node is 3x3x8 bytes
@ $69A8 label=SentinelNodeGraphics
t $6A91
b $6A9F
t $6AA9
b $6AB7
t $6AD2
b $6AD5
t $6ADF
b $6AED
t $6AF7
b $6AFA
t $6B20
b $6B23
t $6B2D
b $6B3B
t $6B45
b $6B48
t $6B6E
b $6B71
t $6B7B
b $6B89
t $6D37
b $6D3A
t $6F60
s $6F64
t $6F78
b $6F7C
t $6FC0
b $6FC3
t $6FD0
b $6FE4
t $6FF0
b $6FF4
t $7010
b $7014
t $7028
b $7034
t $7040
b $7044
t $7070
b $7073
t $70E0
b $70E3
t $7160
b $716C
t $71D8
b $71DC
t $7338
b $733B
t $7348
b $734B
t $74E0
b $74E4
t $74F9
b $74FC
t $7519
b $751C
t $7539
b $754C
t $7560
b $7564
t $7578
b $757B
t $7619
b $761C
t $7629
b $7634
t $7641
b $7644
t $7678
b $767B
t $7688
b $76AB
t $76C0
b $76C3
t $76E0
b $76E4
t $7760
b $7764
t $79A4
b $79A8
t $79F9
b $7A04
t $7A51
b $7A54
t $7A60
b $7A74
t $7A80
b $7A84
t $7AB8
b $7ABC
t $7AC8
b $7AEB
t $7B58
b $7B64
t $7B70
b $7B7C
t $7B98
b $7B9C
t $7BC0
b $7BC3
t $7BD8
b $7BE4
t $7BF0
b $7BF4
t $7C26
b $7C29
t $7CE0
s $7CE4
t $7CF8
b $7D04
t $7D40
b $7D44
t $7D80
b $7D83
t $7E98
b $7EA3
t $8030
b $803B
t $8048
b $8053
t $8060
b $807C
t $80E0
b $80FB
t $8108
b $810B
t $8120
b $812B
t $8140
b $814B
t $8178
b $8186
t $8198
b $81A3
t $81C0
b $81C4
t $81E0
b $81EC
t $8250
b $826C
t $827F
b $828C
t $82D0
b $82EC
t $8358
b $8364
t $83BA
b $83BD
t $83C8
b $83EC
t $8450
b $8474
t $8480
b $8483
t $84D0
b $84EC
t $850F
b $8514
t $854F
b $8564
t $857C
b $8580
t $8598
b $859B
t $85A8
b $85AB
t $85BC
b $85C0
t $86BF
b $86C2
t $86F8
b $870B
t $8808
b $8823
t $88AE
b $88B1
t $8969
b $899C
t $89A9
b $89D4
t $89E9
b $89F4
t $8A09
b $8A0C
t $8A39
b $8A3C
t $8A51
b $8A54
t $8A69
b $8A74
t $8A90
b $8A93
t $8AD1
b $8AD4
t $8B08
b $8B13
t $8B88
b $8B93
t $8BE0
b $8BEC
t $8C00
b $8C44
t $8C50
b $8C6C
t $8C80
b $8C9C
t $8CA8
b $8CC4
t $8CD0
b $8CEC
t $8D00
b $8D0C
t $8D30
b $8D44
t $8D50
b $8D6C
t $8D7E
b $8D8A
t $8DD0
b $8DEC
t $8DFE
b $8E0A
t $8E50
b $8E6C
t $8E7E
b $8E8A
t $8E96
b $8E99
t $8ED0
b $8EEC
t $8EFE
b $8F12
t $8F1E
b $8F21
t $8F50
b $8F5C
t $8F6C
b $8F6F
t $8FD4
b $8FD8
t $8FEC
b $8FEF
t $9054
b $9057
t $90B1
b $90B4
t $90E0
b $90E4
t $9100
b $9104
t $9110
b $9114
t $91E0
b $91E4
t $91F0
b $91FC
t $9208
b $920B
t $9220
b $9223
t $9260
b $9264
t $9270
b $927C
t $9322
b $9325
t $933C
b $9341
t $948B
b $9497
t $94AC
b $94AF
t $94E0
b $94EB
t $9520
b $9523
t $9560
b $956C
t $95A1
b $95A4
t $95E8
b $95EB
t $95F8
b $95FC
t $9640
b $964C
t $9658
b $965C
t $96C0
b $96CC
t $96D8
b $96DC
t $9706
b $9709
t $9718
b $9729
t $9827
b $982A
t $9870
b $9874
t $98C9
b $98CC
t $98F0
b $98F3
t $99E0
b $99E4
t $99F0
b $99F4
t $9A40
b $9A44
t $9A50
b $9A54
t $9B80
b $9B83
t $9C81
b $9C84
t $9CE1
b $9CE4
t $9DE0
b $9DE4
t $9DF0
b $9DF3
t $9E30
b $9E33
t $9E40
b $9E64
t $9EB8
b $9EBC
t $9EC8
b $9ECB
t $9EE0
b $9EE4
t $9F08
b $9F0C
t $9F38
b $9F3B
t $9F60
b $9F64
t $9FE0
b $9FE4
t $A060
b $A064
t $A0E9
b $A0EC
t $A119
b $A11C
t $A129
b $A12C
t $A158
b $A15C
t $A168
b $A16C
t $A1D8
b $A204
t $A221
b $A224
t $A278
b $A27C
t $A288
b $A28C
t $A308
b $A30B
t $A4B0
b $A4B3
t $A558
b $A55C
t $A5EC
b $A5F1
t $A704
b $A709
t $A77C
b $A785
t $A7C9
b $A7CC
t $A835
b $A838
t $A87C
b $A884
t $A8FC
b $A905
t $AA10
b $AA14
t $AAF8
b $AAFC
t $ABD8
b $ABDD
t $ACB0
b $ACB4
t $AE3C
b $AE41
t $AF74
b $AF79
t $AFB8
b $AFBD
t $B038
b $B049
t $B0C4
b $B0C8
t $B0F4
b $B0F8
t $B188
b $B18D
t $B240
b $B244
t $B308
b $B30D
t $B458
b $B45C
t $B494
b $B497
t $B4B0
b $B4B3
t $B4E0
b $B4E3
t $B63C
b $B640
t $B6CC
b $B6D0
t $B978
b $B988
t $BA04
b $BA08
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
c $C052
c $C0CB
b $C173
b $C177
@ $C177 label=PlayerShields
b $C178
c $C178
c $C17F
b $C19E
c $C1AC
c $C1D6 Read Player Control Keys
@ $C1D6 label=ReadControlKeys
c $C1F4
c $C311 Draws and advances the starfield
@ $C311 label=DrawStarfield
c $C35C
c $C430
c $C442
c $C447
c $C48D
c $C4C4
c $C502 Convert coords in H,L to backbuffer address in HL.
@ $C502 label=CoordsToBackbuffer
c $C514
c $C548
c $C54E
c $C56D
c $C573
c $C59B
c $C5A8
c $C614
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
t $C884
b $C887
t $C89B
b $C8A1
b $CA12 
@ $CA12 label=MainMenuWait
w $CA13
@ $CA13 label=RandomSeed
b $CA15
t $CA4A
b $CA5D
t $CA68
b $CA86
b $CA8D Starfield vertical positions (index is used for X coordinate)
@ $CA8D label=StarfieldData
b $CABD
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
b $CDDE
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
b $D2A3
c $D34D
b $D35C
w $D36C Temporary storage for SP
@ $D36C label=TempSaveSP
c $D36E
c $D385
c $D39B
c $D3D1
c $D3E6
c $D411
c $D420 Render regular string
@ $D420 label=DrawString
c $D43F
c $D476
c $D48D
c $D4A2
c $D4B7
c $D4CF
c $D513
c $D527
c $D551 Render a double-height stippled character
@ $D551 label=DrawDoubleHeightChar
c $D595 Render a double-height stippled string
@ $D595 label=DrawDoubleHeightString
c $D5A3
c $D5DF Dump backbuffer to screen
@ $D5DF label=ShowBackbuffer
b $D625
w $D63E Table with addresses of the start of each line in the screen
@ $D63E label=ScreenLinesTable
c $D77E
c $D7AF Show high scores
@ $D7AF label=HighScoresMode
c $D7CA Check keyboard. Return NZ if any key is pressed
@ $D7CA label=IsAnyKeyDown
c $D7D2
c $D7E5
c $D815 Wait for a key press and figure out which key it is
@ $D815 label=WaitAndReadKey
c $D82D
c $D85A
c $D8D9
c $D8E5
c $D9B1 Run Entity logic (not sure what type of entity yet)
@ $D9B1 label=RunEntityLogic2
c $D9FA
c $DA1F
c $DA2E
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
c $DD65
c $DDE8
c $DE13
c $DE40
b $DE4A
t $DED3 Text preparing the jump to load the 2nd stage
@ $DED3 label=NextStageText
t $DF77 Redefine keys text
@ $DF77 label=RedefineKeysText
b $DFF2
t $DFFA Keyboard map
@ $DFFA label=KeyboardMap
b $E01D Defined keys data - bit, I/O row pairs
@ $E01D label=DefinedKeysData
t $E032 Main Menu Messages
@ $E032 label=MainMenuText
t $E086 High Score table
@ $E086 label=HighScoreText
t $E0FE Current Score
@ $E0FE label=CurrentScoreText
t $E105 High Score Messages
@ $E105 label=HighScoreEnterText
t $E170 Demo Message
@ $E170 label=DemoText
t $E176 Bonus Message
@ $E176 label=BonusMessageText
b $E181 
t $E28A
c $E28D
c $E35A
c $E36D
c $E388
c $E3B0
c $E3C3
c $E3E4
c $E417
c $E455
c $E47F
b $E4CA
b $E4D2
@ $E4D2 label=PlayerLivesLeft
b $E4D3
@ $E4D3 label=CurrentLevel
b $E4D4
t $EC9E
b $ECA2
t $ECAC
b $ECB0
t $ED26
b $ED2A
t $EFB4
b $EFB7
t $EFE9
b $EFF8
s $F100
@ $F100 label=Backbuffer
