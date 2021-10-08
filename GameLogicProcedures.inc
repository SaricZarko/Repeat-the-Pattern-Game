.386
.model flat, stdcall

CreateButtons PROTO,
	buttonArray:PTR DWORD,
	countTmp:BYTE

CreateRand PROTO, ;procedura za generisanje random brojeva koji povlace svetlucanje kvadratica ceka se space kako bismo znali da je upamcen pattern
	randomArray:PTR DWORD,
	buttonArray:PTR DWORD,
	counterRep:BYTE

RepeatThePattern PROTO,; procedura koja provera da li je igrac upamtio pattern kako treba i broji rezultat
	randomArray:PTR DWORD,
	buttonArray:PTR DWORD,
	gameStatus:PTR BYTE,
	scoreString:PTR BYTE,
	scoreCounter:PTR BYTE