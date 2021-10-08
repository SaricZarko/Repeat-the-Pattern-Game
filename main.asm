.386
.model flat, stdcall
.stack 4096
Include ConsoleWritingProcedures.inc
Include GameLogicProcedures.inc
Include Irvine32.inc
ExitProcess proto, dwExitCode:dword
.data
str1 byte " ___  ___  ___  ___          _________    ___           _________  _________  ____  ___        ",0dh,0ah,0
str2 byte "|   ||    |   ||       /\        |       |   |    /\        |          |     |     |   ||\    |",0dh,0ah,0
str3 byte "|___||___ |___||___   /  \       |       |___|   /  \       |          |     |____ |___|| \   |",0dh,0ah,0
str4 byte "|\   |    |    |     /____\      |       |      /____\      |          |     |     |\   |  \  |",0dh,0ah,0
str5 byte "| \  |    |    |    /      \     |       |     /      \     |          |     |     | \  |   \ |",0dh,0ah,0
str6 byte "|  \ |___ |    |___/        \    |       |    /        \    |          |     |____ |  \ |    \|",0dh,0ah,0
str7 byte  " ",0dh,0ah,  "			Za pocetak igre pritisnite taster SPACE  ",0ah,0dh,0
str8 byte " ",0dh,0ah, " Uputstvo:Za zaustavljanje patterna na ekranu pritisnuti space i ponavlja se pritiskanjem taster dodeljenih svakoj boji",0
	
	scoreString byte "Your score is : ",0
	scoreCounter byte 0
	gameStatus byte 1 
	pressSpaceString byte "Press Space if you want to repeat the previous pattern",0
	exitString byte "Goodbye,better luck next time"
	question byte "Sorry you lost ,Play again ?",0
	buttonsArr DWORD 4 DUP(0)
	randomArr DWORD 20 DUP(0)
	countTmp byte 0
	counterRep byte 0
	;variables are here


.code
main proc
	startNewGame:
		push eax
		push edx
		push ebx

		mov scoreCounter,0
		mov gameStatus,1
		Invoke WriteLoadingScreen,OFFSET str1,OFFSET str2,OFFSET str3,OFFSET str4,OFFSET str5,OFFSET str6,OFFSET str7,OFFSET str8
		Invoke DrawRectangle
		Invoke CreateButtons,ADDR buttonsArr,countTmp
	game:
		mov eax,500
		call Delay
		mov counterRep,0
		Invoke CreateRand,ADDR randomArr,ADDR buttonsArr,counterRep
		Invoke RepeatThePattern,ADDR randomArr,ADDR buttonsArr,OFFSET gameStatus,OFFSET scoreString,OFFSET scoreCounter
		cmp gameStatus,1
		je game
		mov	edx,OFFSET question
		mov  ebx,0     
		call MsgBoxAsk
		cmp  eax,IDYES
		jne  endGame
		pop ebx
		pop edx
		pop eax
		jmp StartNewGame
	endGame:
invoke ExitProcess, 0
main endp

end main