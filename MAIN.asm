.MODEL SMALL
.STACK 64
.DATA

MODE				DB		1					;1 is the mainscreen, 3 is game
PLAYER1POS			DB		10 					;Y position of the top of  player 
PLAYER2POS			DB		10 					;Y position of the top of  player 
PLAYERSIZE			DB		?					;HEIGHT OF THE PADDLE
playerspeed			db		3					;speed of the player
;ENEMYPOS			DB		1 DUP(?)			;this should be used in phase 3
BALLPOS				DW		30,30 				;X,Y position of the TOP LEFT PIXEL OF THE BALL
BALLSPEED			DW		3,1					;each timestep position increments by this amount, due to 640x200 aspect ratio this is the closest we can get to (1,1)
speedincrements		dw		1,1					;this is like the sign for ballspeed, each timestep this is added to ballpos in a loop that happens ballspeed times
PLAYER1NAME			DB		15,?,15 DUP('$')
PLAYER2NAME			DB		15,?,15 DUP('$')
DELAYSPEED			DW		311BH
SERVING				DB		1					;0 is the no one serving, 1 is player 1 is serving, 2 is player 2
player1score		db		30H					;scores are 0 ascii
player2score		db		30H


;--------------------------splashscreen strings----------------------------------------;
SPLASH1				DB		'Enter your name:$'
NAME1				DB		'Player 1:$'
NAME2				DB		'Player 2:$'
SPLASH2				DB		'Press Enter key to continue$'
;--------------------------------------------------------------------------------------;


;---------------------------gamemode strings-----------------------------------------;
PAUSEDSTRING		DB		'Game is paused$'
PAUSEDSPACE			DB		'Press SPACE to continue ',01H,'$'
PAUSEDESCAPE		DB		'Press ESC to quit to main menu$'
ESCTOPAUSE			DB		'Press ESC to pause the game$'
CHOOSEPADDLESIZE	DB		'CHOOSE THE PADDLE SIZE$'
PADDLECHOICES		DB		'1- SMALL    2- MEDIUM    3- LARGE$'
CHOOSEBALLSPEED		DB		'CHOOSE THE BALL SPEED$'
BALLCHOICES			DB		'1- SLOW    2- MEDIUM    3- FAST     4- INSANE :O$'
SCORE				DB		"'s score:$"
PLAYERWONSTRING		DB		' WINS!!!!!!!!!!!$'
WONESC				DB		'Press ESC to exit the game$'
WONSPACE            DB		'Press SPACE to go to main menu$'
;--------------------------------------------------------------------------------------;

;---------------------------mainscreen strings-----------------------------------------;
MAINSCREEN2			DB		'->To start Pong game press F2$'
MAINSCREEN3			DB		'->To exit the game press ESC$'
;--------------------------------------------------------------------------------------;
;--------------------------PHOTO-------------------------------------------------------;
filenameintro 			db 'pong.bmp',0
filenameouttro 			db 'outro.bmp',0
filehandle 				dw ?
Header 					db 54 dup (0)
Palette 				db 256*4 dup (0)
ScrLine 				db 320 dup (0)
ErrorMsg 				db 'Error', 13, 10,'$'
;-----------------------sounds---------------------------------------------------------------;
; Ports
	pit db 43h
	pit2 db 42h
	delaysound dw 25	; Delay for sample rate -
	; if song sounds too slow or too fast, change this
	filenamesound db "p.wav", 0 
	; Raw headerless mono 8-bit 44100hz wave file -
	filehandlesounds dw 0
	counter dw 0ffffh
	ErrorMsgsounds db "Error.$"
	Buffer db 0

;--------------------------------------------------------------------------------------;
												;the includes are here so that they can work with the datasegment
INCLUDE GUI.INC									;contains some general purpose functions that could be used
INCLUDE MENUGUI.INC								;responsible for drawing all main menu
INCLUDE MENUIN.INC								;responsible for getting the input in the main menu mode
INCLUDE GAMEGUI.INC			
INCLUDE GAMEIN.INC			
		
.CODE			
MAIN PROC FAR			
		MOV AX,@DATA			
		MOV DS,AX	
		
		call SPLASHSCREEN						;THIS IS COMMENTED FOR TESTING PURPOSES ONLY
		
		WHILE:			
		CALL USERINPUT							;CHANGES MEMORY VALUES AND REGISTERS ACCORDING TO USER INPUT
		CALL UPDATEGUI							;UPDATES GUI USING VALUES FROM THE MEMORY THAT CHANGED FROM THE USERINPUT PROCEDURES
		JMP WHILE
		
		mov ax,4c00h
		int 21h
		
MAIN ENDP

UPDATEGUI PROC				;checks mode and calls appropriate proc
		
		CMP mode,01H
		jz mainmenugui
		
		CMP mode,03H
		jz GAME
		
	mainmenugui:
		CALL mainscreenui
		RET
		
	GAME:	
		CALL UPDATEGAMEGUI
		ret
		
UPDATEGUI endp
	
USERINPUT PROC				;checks mode and calls appropriate proc
		
		CMP mode,01H
		jz mainmenuinput
		
		CMP mode,03H
		jz gamemodeinput
		
	mainmenuinput:
		CALL menuinput
		ret
		
	gamemodeinput:
		call gameinput
		ret
		
USERINPUT ENDP

;ANY OTHER PROC GO HERE

END MAIN	