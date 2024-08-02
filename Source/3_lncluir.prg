 FUNCTION INCLUIR()

 LOCAL GetList:={}
 LOCAL nCodigo:=0
 LOCAL cNome:=Space(50), cTipoPessoa:=Space(1), cInativo:="N", cCPF:=Space(14), cCNPJ:=Space(18), cTelefone:=Space(15)
 LOCAL dCadastro:=Date()
 LOCAL lInativo

 @ 03,00 CLEAR TO 22,80

 @ 03,00 SAY PadC("INCLUSAO", 80)
 @ 04,00 SAY Replicate("-", 80)
 @ 05,01 SAY "CODIGO:     "  GET nCodigo        PICTURE "99999"                                       VALID nCodigo>0 .AND. !VALIDA_CODIGO(nCodigo)
 @ 06,01 SAY "NOME:       "  GET cNome          PICTURE "@!S30"                                       VALID !Empty(cNome)
 @ 07,01 SAY "TIPO PESSOA:"  GET cTipoPessoa    PICTURE "@!"                                          VALID (cTipoPessoa$"FJ")
 @ 08,01 SAY "CPF:        "  GET cCPF           PICTURE "999.999.999-99"       WHEN cTipoPessoa=="F"  VALID VALIDA_CPF(cTipoPessoa, cCPF)  /*Ajustar esta validação - 66 */
 @ 09,01 SAY "CNPJ:       "  GET cCNPJ          PICTURE "99.999.999/9999-99"   WHEN cTipoPessoa=="J"  VALID VALIDA_CNPj(cTipoPessoa, cCNPJ) /*Ajustar esta validação - 66 */
 @ 10,01 SAY "TEL:        "  GET cTelefone      PICTURE "(99) 99999-9999"
 @ 11,01 SAY "CADASTRO:   "  GET dCadastro                                                            VALID dCadastro>=Date()
 @ 12,01 SAY "INATIVO:    "  GET cInativo       PICTURE "@!"                                          VALID (cInativo$"SN")

 READ

 IF LastKey()==27
    RETURN NIL
 ENDIF

 SELECT CLIENTES
 DBAppend()
 REPLACE CODIGO     WITH nCodigo
 REPLACE NOME       WITH cNome
 REPLACE TIPOPESSOA WITH cTipoPessoa
 REPLACE CPF        WITH cCPF
 REPLACE CNPJ       WITH cCNPJ
 REPLACE TEL        WITH cTelefone
 REPLACE CADASTRO   WITH dCadastro
 REPLACE INATIVO    WITH cInativo=="S"
 DBCommit()

 RETURN NIL

*------------------------------*
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

 *------------------------------*
 /*Ajustar estas functions, pois após preencher seja o CPF ou CNPJ é possível retornar a campo Tipo Pessoa trocar seu valor e preencher ambos os campos CNPJ E CPF*/
 /*Adicionar validações para CNPJ ou CPF existente, igual a validação de Código*/
*--------------------------------*
 FUNCTION VALIDA_CPF(cTipoPessoa, cCPF)
  IF (cTipoPessoa == "F" .AND. Empty(cCPF))
     RETURN .F.
  ENDIF
 RETURN .T.

 *------------------------------*
 FUNCTION VALIDA_CNPj(cTipoPessoa, cCNPJ)
  IF (cTipoPessoa == "J" .AND. Empty(cCNPJ))
     RETURN .F.
  ENDIF
 RETURN .T.