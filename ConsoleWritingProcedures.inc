.386
.model flat, stdcall

WriteLoadingScreen PROTO,
	str1:PTR BYTE,
	str2:PTR BYTE,
	str3:PTR BYTE,
	str4:PTR BYTE,
	str5:PTR BYTE,
	str6:PTR BYTE,
	str7:PTR BYTE,
	str8:PTR BYTE

DrawRectangle PROTO,

DrawRectangle PROTO,

WriteIndex PROTO, ; procedura koja ispisuje oznake tastera koji su vezani za odredjeni kvadratic nakon bojenja moramo osveziti njihovu vrednost tome sluzi ova procedura
	ARR:PTR DWORD

PaintWhiteRect PROTO,;procedura koja boji kvadratic koji treba da posvetli
	rectArr:PTR DWORD
