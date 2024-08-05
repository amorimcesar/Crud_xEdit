#INCLUDE "WINUSER.CH"

*--------------------------------*

FUNCTION VALIDA_CODIGO(nCodigo)

LOCAL lRetorno:=.F.
LOCAL cOrdem:=""
LOCAL nRegistro:=0

cOrdem    :=CLIENTES->(OrdSetFocus("CODIGO"))
nRegistro :=CLIENTES->(RecNo())
lRetorno  :=CLIENTES->(DBSeek(nCodigo))

IF lRetorno
   MessageBox(,"O c�digo informado j� existe.","Aten��o",MB_ICONSTOP)
   lRetorno:=.T.
ENDIF

CLIENTES->(OrdSetFocus(cOrdem))
CLIENTES->(DBGoTo(nRegistro))

RETURN lRetorno

*--------------------------------*

FUNCTION VALIDA_CPF(cCPF)

LOCAL lRetorno:=.F.
LOCAL cOrdem:=""
LOCAL nRegistro:=0

cOrdem    :=CLIENTES->(OrdSetFocus("CPF"))
nRegistro :=CLIENTES->(RecNo())
lRetorno  :=CLIENTES->(DBSeek(cCPF))

IF lRetorno .OR. Empty(cCPF) .OR. Len(AllTrim(cCPF)) < 14
   MessageBox(,"O CPF informado � invalido ou j� existe.","Aten��o",MB_ICONSTOP)
   lRetorno:=.T.
ENDIF

CLIENTES->(OrdSetFocus(cOrdem))
CLIENTES->(DBGoTo(nRegistro))

RETURN lRetorno

*--------------------------------*

FUNCTION VALIDA_CNPJ(cCNPJ)

LOCAL lRetorno:=.F.
LOCAL cOrdem:=""
LOCAL nRegistro:=0

cOrdem    :=CLIENTES->(OrdSetFocus("CNPJ"))
nRegistro :=CLIENTES->(RecNo())
lRetorno  :=CLIENTES->(DBSeek(cCNPJ))

IF lRetorno .OR. Empty(cCNPJ) .OR. Len(AllTrim(cCNPJ)) < 18
   MessageBox(,"O CNPJ informado � invalido ou j� existe.","Aten��o",MB_ICONSTOP)
   lRetorno:=.T.
ENDIF

CLIENTES->(OrdSetFocus(cOrdem))
CLIENTES->(DBGoTo(nRegistro))

RETURN lRetorno

*--------------------------------*

FUNCTION VALIDA_TELEFONE(cTelefone)

IF Empty(cTelefone) .OR. Len(AllTrim(cTelefone)) < 15
   MessageBox(,"Telefone invalido","Aten��o",MB_ICONSTOP)
   RETURN .T.
ENDIF

RETURN .F.

*--------------------------------*

FUNCTION VALIDA_DATA(dCadastro)

IF Empty(dCadastro) .OR. dCadastro < Date()
   MessageBox(,"Data invalida","Aten��o",MB_ICONSTOP)
   RETURN .T.
ENDIF

RETURN .F.

*--------------------------------*