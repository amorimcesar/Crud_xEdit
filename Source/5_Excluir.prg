#INCLUDE "WINUSER.CH"

*--------------------------------*
FUNCTION EXCLUIR()

SELECT CLIENTES

IF CLIENTES->CODIGO==0
   MessageBox(,"O arquivo est� vazio.","Aten��o",MB_ICONSTOP)
   RETURN NIL
ENDIF

IF MessageBox(,"Deseja realmente excluir o Cliente?","Aten��o",MB_ICONQUESTION+MB_YESNO)==IDNO
   RETURN NIL
ENDIF

SELECT CLIENTES

RLock()
DELETE
DBUnlock()
DBCloseAll()

RETURN NIL