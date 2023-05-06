.code

menuinput proc
		
		
		
		GETMODE:
		
		mov ah,0				;get key input
		int 16h
		
		cmp ah,3bh				;cmp with f1
		jz f1
		
		cmp ah,3ch				;cmp with f2
		jz f2
		
		cmp ah,01h				;cmp with esc
		jz escape
		
		jmp GETMODE
		
		f1:						;chat mode is chosen
		;mov mode,2h
		;PUT CODE HERE TO CLEAR THE SCREEN AND CHOOSE SUITABLE VIDEO MODE FOR CHAT
		ret
		
		f2:						;game mode is chosen
		mov mode,3h
		
		call clearinputbuffer
		
		call GETPADDLESIZE		;ask user for paddle size
		cmp mode,1h
		je retr
		CALL GETBALLSPEED		;ask user for ball speed
		cmp mode,1h
		je retr
		
		MOV AH,0			
		MOV AL,0EH				;this is here just to clear the screen from the text of main menu
		INT 10H		
		CALL drawoutline		;draw game outline
		call initializegame		;reset paddles and ball positions
		retr:
		ret
		
		escape:
		call outro
		
menuinput endp