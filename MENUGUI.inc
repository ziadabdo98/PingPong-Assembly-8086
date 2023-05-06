.code

mainscreenui proc

		call writetext
		
		ret
mainscreenui endp

writetext proc

		mov serving,1			;each time the user goes to the main menu, serving should be set to player 1
		
		MOV AH,0				;CHANGE TO GRAPHICS MODE, THIS CLEARS THE SCREEN
		MOV AL,0EH				;640x200 pixels and 80x25 text but only 16 colors, al=13h 320x200 and 256 colors
		INT 10H	
		
		mov bh,0
		mov ah,2          		;Move Cursor to upper middle of screen
		mov dx,0A1Ah      		
		int 10h           		
		
		mov ah,2          		;Move Cursor to lower middle of screen
		mov dx,0C1Ah      		
		int 10h           		

		mov ah, 9				;Display 'To start Pong game press F2'
		mov dx, offset mainscreen2	
		int 21h 
		
		mov ah,2          		;Move Cursor, to middle of screen
		mov dx,0E1Ah      		
		int 10h           		
		
		mov ah,9	      		;Display 'To end the program press ESC'
		mov dx,offset mainscreen3                  
		int 21h
		
		ret
writetext endp
