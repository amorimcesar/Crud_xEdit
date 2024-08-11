 #INCLUDE "WINUSER.CH"

 *--------------------------------*

 FUNCTION CODIGO_EXISTE(nCodigo)

 LOCAL lRetorno:=.F.
 LOCAL cOrdem:=""
 LOCAL nRegistro:=0

 cOrdem    :=CLIENTES->(OrdSetFocus("CODIGO"))
 nRegistro :=CLIENTES->(RecNo())
 lRetorno  :=CLIENTES->(DBSeek(nCodigo))

 IF lRetorno
    MessageBox(,"O c�digo informado j� existe.","Aten��o",MB_ICONSTOP)
 ENDIF

 CLIENTES->(OrdSetFocus(cOrdem))
 CLIENTES->(DBGoTo(nRegistro))


 RETURN lRetorno

 *--------------------------------*

 FUNCTION E_CPF_INVALIDO(cCPF)

 LOCAL lRetorno:=.F.
 LOCAL cOrdem:=""
 LOCAL nRegistro:=0

 cOrdem    :=CLIENTES->(OrdSetFocus("CPF"))
 nRegistro :=CLIENTES->(RecNo())
 lRetorno  :=CLIENTES->(DBSeek(cCPF))

 IF lRetorno
   MessageBox(,"O CPF informado j� existe","Aten��o",MB_ICONSTOP)
 ELSEIF Empty(cCPF) .OR. Len(Alltrim(cCPF))<14
   MessageBox(,"O CPF informado � inv�lido.", "Aten��o",MB_ICONSTOP )
   lRetorno:=.T.
 ENDIF

 CLIENTES->(OrdSetFocus(cOrdem))
 CLIENTES->(DBGoTo(nRegistro))

 RETURN lRetorno

 *--------------------------------*

 FUNCTION E_CNPJ_INVALIDO(cCNPJ)

 LOCAL lRetorno:=.F.
 LOCAL cOrdem:=""
 LOCAL nRegistro:=0

 cOrdem    :=CLIENTES->(OrdSetFocus("CNPJ"))
 nRegistro :=CLIENTES->(RecNo())
 lRetorno  :=CLIENTES->(DBSeek(cCNPJ))

 IF lRetorno
   MessageBox(,"O CNPJ informado j� existe","Aten��o",MB_ICONSTOP)
 ELSEIF Empty(cCNPJ) .OR. Len(Alltrim(cCNPJ))<18
   MessageBox(,"O CNPJ informado � inv�lido.", "Aten��o",MB_ICONSTOP)
   lRetorno:=.T.
 ENDIF

 CLIENTES->(OrdSetFocus(cOrdem))
 CLIENTES->(DBGoTo(nRegistro))

 RETURN lRetorno

 *--------------------------------*

 FUNCTION TELEFONE_VALIDO(cTelefone)

 IF Empty(cTelefone) .OR. Len(AllTrim(cTelefone)) < 15
    MessageBox(,"Telefone inv�lido","Aten��o",MB_ICONSTOP)
    RETURN .F.
 ENDIF

 RETURN .T.

 *--------------------------------*

 FUNCTION DATA_VALIDA(dCadastro)

 IF Empty(dCadastro) .OR. dCadastro < Date()
    MessageBox(,"Data inv�lida","Aten��o",MB_ICONSTOP)
    RETURN .F.
 ENDIF

 RETURN .T.

 *--------------------------------*