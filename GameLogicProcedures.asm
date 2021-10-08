Include GameLogicProcedures.inc
Include ConsoleWritingProcedures.inc
Include Irvine32.inc
.code


CreateButtons PROC,;procedura za kreiranje tastera koriscenjem radnom brojeva
	buttonArray:PTR DWORD,
	countTmp:BYTE

	push edi
	push esi
	push eax
	push ecx
	push edx
	mov edx,0
	mov edi,buttonArray
	mov esi,0
	mov ecx,0
Top:
	mov DWORD PTR[edi],0
	add edi,4
	inc ecx
	cmp ecx,4
	jne Top
	mov edi,buttonArray
Loop1:
	mov countTmp,0
    call Randomize
	call Random32
	mov ecx,eax
    shr eax,2
	shl eax,2
	sub ecx,eax
	mov eax,ecx
    inc eax
    mov esi,buttonArray
	cmp edx,0
	je FirstTime
	jne Check
FirstTime:
	mov DWORD PTR[edi],eax
	add edi,4
	inc edx
	jmp Loop1
Check:
	cmp DWORD PTR[esi],eax
	je Loop1
	add esi,4
	inc countTmp
	cmp countTmp,4
	jne Check
	mov countTmp,1
	mov DWORD PTR[edi],eax
	add edi,4
	inc edx
	cmp edx,4
	jne Loop1
	Invoke WriteIndex,buttonArray
	pop edx
	pop ecx
	pop eax
	pop esi
	pop edi
	ret
CreateButtons ENDP



CreateRand PROC, ;procedura za generisanje random brojeva koji povlace svetlucanje kvadratica ceka se space kako bismo znali da je upamcen pattern
	randomArray:PTR DWORD,
	buttonArray:PTR DWORD,
	counterRep:BYTE
	push edi
	push esi
	push eax
	push ecx
	mov edi,randomArray
	mov edx,buttonArray
	mov ecx,0
CLEAR:
	mov DWORD PTR[edi],0
	add edi,4
	inc counterRep
	cmp counterRep,20
	jne CLEAR
	mov edi,randomArray
Loop4:;Nakon genererisanja random broja u opsegu od 1 do 4 gledamo koji kvadratic ima zadati indeks i obojimo ga u belo kako bi jasno bilo naznaceno koji se upalio
	call Randomize
	call Random32
	mov esi,eax
    shr eax,2
	shl eax,2
	sub esi,eax
	mov eax,esi
    inc eax
	inc ecx
	mov DWORD PTR[edi],eax
	add edi,4
	Invoke PaintWhiteRect,buttonArray
	Invoke WriteIndex,buttonArray

	mov eax,700
	call Delay
	call ReadKey
	cmp al,VK_SPACE
	jne Loop4
	pop ecx
	pop eax
	pop esi
	pop edi
	ret
CreateRand ENDP



RepeatThePattern PROC,; procedura koja provera da li je igrac upamtio pattern kako treba i broji rezultat
	randomArray:PTR DWORD,
	buttonArray:PTR DWORD,
	gameStatus:PTR BYTE,
	scoreString:PTR BYTE,
	scoreCounter:PTR BYTE
	push edi
	push esi
	push eax
	push ecx
	push edx
	mov ecx,buttonArray
	mov edi,randomArray
	Repeating:
		call ReadChar
		cmp al,'1'
		je Jump
		cmp al,'2'
		je Jump
		cmp al,'3'
		je Jump
		cmp al,'4'
		jne Repeating
	Jump:
		mov esi,DWORD PTR[edi]
		sub al,'0'
		movsx eax,al
		add edi,4
		.IF (esi==DWORD PTR[ecx] )&&(eax==DWORD PTR[ecx]);gledamo koji da li je ponovljen kvadratic sa pravim brojem i koji je to kvadratic
			Invoke PaintWhiteRect,buttonArray
			Invoke WriteIndex,buttonArray
			mov eax, white (black*16)
			call SetTextColor
			Invoke WriteIndex,buttonArray
			mov edx,scoreCounter
			inc BYTE PTR[edx]
			mov al,BYTE PTR[edx]
			mov dl,60
			mov dh,0
			call GotoXY
			mov edx,scoreString
			call WriteString
			;add al,'0'
			call WriteDec
		.ELSEIF(esi==DWORD PTR[ecx+4])&&(eax==DWORD PTR[ecx+4])
			Invoke PaintWhiteRect,buttonArray
			Invoke WriteIndex,buttonArray
			mov eax, white (black*16)
			call SetTextColor
			Invoke WriteIndex,buttonArray
			mov edx,scoreCounter
			inc BYTE PTR[edx]
			mov al,BYTE PTR[edx]
			mov dl,60
			mov dh,0
			call GotoXY
			mov edx,scoreString
			call WriteString
			;add al,'0'
			call WriteDec
		.ELSEIF(esi==DWORD PTR[ecx+8])&&(eax==DWORD PTR[ecx+8])
			Invoke PaintWhiteRect,buttonArray
			Invoke WriteIndex,buttonArray
			mov eax, white (black*16)
			call SetTextColor
			Invoke WriteIndex,buttonArray
			mov edx,scoreCounter
			inc BYTE PTR[edx]
			mov al,BYTE PTR[edx]
			mov dl,60
			mov dh,0
			call GotoXY
			mov edx, scoreString
			call WriteString
			;add al,'0'
			call WriteDec
		.ELSEIF(esi==DWORD PTR[ecx+12])&&(eax==DWORD PTR[ecx+12])
			Invoke PaintWhiteRect,buttonArray
			Invoke WriteIndex,buttonArray
			mov eax, white (black*16)
			call SetTextColor
			Invoke WriteIndex,buttonArray
			mov edx,scoreCounter
			inc BYTE PTR[edx]
			mov al,BYTE PTR[edx]
			mov dl,60
			mov dh,0
			call GotoXY
			mov edx, scoreString
			call WriteString
			call WriteDec

		.ELSE
		mov edx,gameStatus
		mov BYTE PTR[edx],0
		pop edx
		pop ecx
		pop eax
		pop esi
		pop edi
		ret
		.ENDIF
		.IF(DWORD PTR[edi]==0)
			pop edx
			pop ecx
			pop eax
			pop esi
			pop edi
			ret
		.ELSE
			jmp Repeating
		.ENDIF
		
RepeatThePattern ENDP

END