#INCLUDE "WINUSER.CH"

*--------------------------------*

FUNCTION BUSCAR()

LOCAL GetList:={}
LOCAL cNome:=Space(50), cOrdem:=""
LOCAL nRegistro:=0

SELECT CLIENTES

IF CLIENTES->CODIGO==0
   MessageBox(,"O arquivo está vazio.","Atenção",MB_ICONSTOP)
   RETURN NIL
ENDIF

@ 12,10 CLEAR TO 15,67

@ 12,12 TO 15,67
@ 13,14 SAY "INFORME O NOME DO CLIENTE: "
@ 14,14 GET cNome PICTURE "@!"

READ

IF LastKey()==27
  RETURN NIL
ENDIF

SELECT CLIENTES

cOrdem   :=CLIENTES->(OrdSetFocus("NOME"))
nRegistro:=CLIENTES->(RecNo())

DBGoTop()

IF !CLIENTES->(DBSeek(AllTrim(cNome)))
   CLIENTES->(DBGoTo(nRegistro))
   MessageBox(,"O Cliente não foi encontrado.","Atenção",MB_ICONSTOP)
ENDIF

CLIENTES->(OrdSetFocus(cOrdem))

RETURN NIL
