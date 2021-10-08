Include ConsoleWritingProcedures.inc
Include Irvine32.inc
.code


WriteLoadingScreen PROC,
	str1:PTR BYTE,
	str2:PTR BYTE,
	str3:PTR BYTE,
	str4:PTR BYTE,
	str5:PTR BYTE,
	str6:PTR BYTE,
	str7:PTR BYTE,
	str8:PTR BYTE
	push eax
	push edx
	call Clrscr
	;call DumpRegs
	mov eax, white (black*16)
	call SetTextColor
	mov edx,str1
	call WriteString
	mov edx,str2
	call WriteString
	mov edx,str3
	call WriteString
	mov edx,str4
	call WriteString
	mov edx,str5
	call WriteString
	mov edx,str6
	call WriteString
	mov edx,str7
	call WriteString
	mov edx,str8
	call WriteString
gameStart:
	call ReadChar
	cmp al," "
	jne gameStart
	pop edx
	pop eax
	ret
WriteLoadingScreen ENDP


DrawRectangle PROC; Procedura koja iscrtava kvadratice na pocetku igrice sa Irvine procedurom gotoxy odlazimo na specificirano mesto u konzoli i crtamo kvadratice
	push eax
	push esi 
	push edi
	push ecx
	push edx
	mov eax, white (black*16)
	call SetTextColor
	call Clrscr
	mov dl,25
	mov dh,5
	mov esi,35
	mov edi,10 
	mov eax, yellow (yellow*16)
	call SetTextColor
	yellowRect:
		call GotoXY
		mov al,"X"
		call WriteChar
		inc dl
		movsx ecx,dl
		cmp ecx,esi
		jne yellowRect
		mov dl,25
		inc dh
		movsx ecx,dh
		cmp ecx,edi
		jne yellowRect
	mov esi,47
	mov dl,37
	mov dh,5
	mov eax, blue (blue*16)
	call SetTextColor
	blueRect:
		call GotoXY
		mov al,"X"
		call WriteChar
		inc dl
		movsx ecx,dl
		cmp ecx,esi
		jne blueRect
		mov dl,37
		inc dh
		movsx ecx,dh
		cmp ecx,edi
		jne blueRect
	mov dl,25
	mov dh,11
	mov esi,35
	mov edi,16
	mov eax, red (red*16)
	call SetTextColor
	redRect:
		call GotoXY
		mov al,"X"
		call WriteChar
		inc dl
		movsx ecx,dl
		cmp ecx,esi
		jne redRect
		mov dl,25
		inc dh
		movsx ecx,dh
		cmp ecx,edi
		jne redRect
	mov esi,47
	mov dl,37
	mov dh,11
	mov eax, green (green*16)
	call SetTextColor
	greenRect:
		call GotoXY
		mov al,"X"
		call WriteChar
		inc dl
		movsx ecx,dl
		cmp ecx,esi
		jne greenRect
		mov dl,37
		inc dh
		movsx ecx,dh
		cmp ecx,edi
		jne greenRect
	mov eax, white (black*16)
	call SetTextColor
	pop edx
	pop ecx
	pop edi
	pop esi
	pop eax
	ret
DrawRectangle ENDP

WriteIndex PROC, ; procedura koja ispisuje oznake tastera koji su vezani za odredjeni kvadratic nakon bojenja moramo osveziti njihovu vrednost tome sluzi ova procedura
	ARR:PTR DWORD
	push eax
	push edi
	push edx
	mov edi,ARR
	mov eax, white (black*16)
	call SetTextColor
	mov dl,30
	mov dh,7
	call GotoXY
	mov eax,DWORD PTR[edi]
	add eax,'0'
	call WriteChar
	mov dl,42
	call GotoXY
	mov eax,DWORD PTR[edi+4]
	add eax,'0'
	call WriteChar
	mov dl,30
	mov dh,14
	call GotoXY
	mov eax,DWORD PTR [edi+8]
	add eax,'0'
	call WriteChar
	mov dl,42
	call GotoXY
	mov eax,DWORD PTR [edi+12]
	add eax,'0'
	call WriteChar
	pop edx
	pop edi
	pop eax
	ret
WriteIndex ENDP

PaintWhiteRect PROC, ;procedura koja boji kvadratic koji treba da posvetli
rectArr:PTR DWORD
push eax
push edi
push esi
push ecx
mov ecx,rectArr
	.IF (eax==DWORD PTR[ecx])
		mov esi,35
		mov edi,10
		mov dl,25
		mov dh,5
		mov eax, white (white*16)
		call SetTextColor
	whiteRect:
		call GotoXY
		mov al,"X"
		call WriteChar
		inc dl
		movsx ecx,dl
		cmp ecx,esi
		jne whiteRect
		mov dl,25
		inc dh
		movsx ecx,dh
		cmp ecx,edi
		jne whiteRect
		mov eax,500
		call Delay
		mov dl,25
		mov dh,5
		mov esi,35
		mov edi,10 
		mov eax, yellow (yellow*16)
		call SetTextColor
	yellowRect:
		call GotoXY
		mov al,"X"
		call WriteChar
		inc dl
		movsx ecx,dl
		cmp ecx,esi
		jne yellowRect
		mov dl,25
		inc dh
		movsx ecx,dh
		cmp ecx,edi
		jne yellowRect
	.ELSEIF(eax==DWORD PTR[ecx+4])
		mov esi,47
		mov edi,10
		mov dl,37
		mov dh,5
		mov eax, white (white*16)
		call SetTextColor
	whiteRect1:
		call GotoXY
		mov al,"X"
		call WriteChar
		inc dl
		movsx ecx,dl
		cmp ecx,esi
		jne whiteRect1
		mov dl,37
		inc dh
		movsx ecx,dh
		cmp ecx,edi
		jne whiteRect1
		mov esi,47
		mov eax,500
		call Delay
		mov esi,47
		mov dl,37
		mov dh,5
		mov eax, blue (blue*16)
		call SetTextColor
	blueRect:
		call GotoXY
		mov al,"X"
		call WriteChar
		inc dl
		movsx ecx,dl
		cmp ecx,esi
		jne blueRect
		mov dl,37
		inc dh
		movsx ecx,dh
		cmp ecx,edi
		jne blueRect

	.ELSEIF(eax==DWORD PTR[ecx+8])
		mov dl,25
		mov dh,11
		mov esi,35
		mov edi,16
		mov eax, white (white*16)
		call SetTextColor
	whiteRect2:
		call GotoXY
		mov al,"X"
		call WriteChar
		inc dl
		movsx ecx,dl
		cmp ecx,esi
		jne whiteRect2
		mov dl,25
		inc dh
		movsx ecx,dh
		cmp ecx,edi
		jne whiteRect2
		mov eax,500
		call Delay
		mov dl,25
	mov dh,11
	mov esi,35
	mov edi,16
	mov eax, red (red*16)
	call SetTextColor
	redRect:
		call GotoXY
		mov al,"X"
		call WriteChar
		inc dl
		movsx ecx,dl
		cmp ecx,esi
		jne redRect
		mov dl,25
		inc dh
		movsx ecx,dh
		cmp ecx,edi
		jne redRect

	.ELSE
		mov esi,47
		mov edi,16
		mov dl,37
		mov dh,11
		mov eax, white (white*16)
		call SetTextColor
	whiteRect4:
		call GotoXY
		mov al,"X"
		call WriteChar
		inc dl
		movsx ecx,dl
		cmp ecx,esi
		jne whiteRect4
		mov dl,37
		inc dh
		movsx ecx,dh
		cmp ecx,edi
		jne whiteRect4
		mov eax,500
		call Delay
	mov esi,47
	mov dl,37
	mov dh,11
	mov eax, green (green*16)
	call SetTextColor
	greenRect:
		call GotoXY
		mov al,"X"
		call WriteChar
		inc dl
		movsx ecx,dl
		cmp ecx,esi
		jne greenRect
		mov dl,37
		inc dh
		movsx ecx,dh
		cmp ecx,edi
		jne greenRect
	.ENDIF
	pop ecx
	pop esi
	pop edi
	pop eax
	ret
PaintWhiteRect ENDP



END