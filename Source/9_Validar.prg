 FUNCTION VALIDA_CODIGO(nCodigo)

 LOCAL lRetorno:=.F.
 LOCAL cOrdem:=""
 LOCAL nRegistro:=0

 cOrdem    :=CLIENTES->(OrdSetFocus("CODIGO"))
 nRegistro :=CLIENTES->(RecNo())
 lRetorno  :=CLIENTES->(DBSeek(nCodigo))

 IF lRetorno
    MessageBox(,"O código informado já existe.")
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

 IF lRetorno
    MessageBox(,"O CPF informado já existe.")
 ENDIF

 IF Empty(cCPF) .OR. Len(AllTrim(cCPF)) < 14
    MessageBox(,"CPF invalido")
    lRetorno:=.T.
 ENDIF

 CLIENTES->(OrdSetFocus(cOrdem))
 CLIENTES->(DBGoTo(nRegistro))

 RETURN lRetorno

 *------------------------------*
 FUNCTION VALIDA_CNPJ(cCNPJ)

 LOCAL lRetorno:=.F.
 LOCAL cOrdem:=""
 LOCAL nRegistro:=0

 cOrdem    :=CLIENTES->(OrdSetFocus("CNPJ"))
 nRegistro :=CLIENTES->(RecNo())
 lRetorno  :=CLIENTES->(DBSeek(cCNPJ))

 IF lRetorno
    MessageBox(,"O CPF informado já existe.")
 ENDIF

 IF Empty(cCNPJ) .OR. Len(AllTrim(cCNPJ)) < 14
    MessageBox(,"CNPJ invalido")
    lRetorno:=.T.
 ENDIF

 CLIENTES->(OrdSetFocus(cOrdem))
 CLIENTES->(DBGoTo(nRegistro))

 RETURN lRetorno

 *-----------------------------*

 FUNCTION VALIDA_TELEFONE(cTelefone)

 LOCAL lRetorno:=.F.

 IF Empty(cTelefone) .OR. Len(AllTrim(cTelefone)) < 15
    MessageBox(,"Telefone invalido")
    lRetorno:=.T.
 ENDIF

 RETURN lRetorno

 *-----------------------------*