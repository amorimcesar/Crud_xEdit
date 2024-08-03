 FUNCTION ALTERAR()

 LOCAL GetList:={}
 LOCAL nCodigo:=0
 LOCAL cNome:="", cTipoPessoa:="", cInativo:="", cCPF:="", cCNPJ:="", cTelefone:=""
 LOCAL dCadastro:=Date()
 LOCAL lInativo

 IF CLIENTES->CODIGO==0
    MessageBox(,"O arquivo está vazio.")
    RETURN NIL
 ENDIF

 SELECT CLIENTES

 nCodigo     :=CLIENTES->CODIGO
 cNome       :=CLIENTES->NOME
 cTipoPessoa :=CLIENTES->TIPOPESSOA
 cCPF        :=CLIENTES->CPF
 cCNPJ       :=CLIENTES->CNPJ
 cTelefone   :=CLIENTES->TEL
 dCadastro   :=CLIENTES->CADASTRO
 cInativo    :=IIF(CLIENTES->INATIVO,"S","N")

 @ 03,00 CLEAR TO 22,89

 @ 03,00 SAY PadC("ALTERACAO", 89)
 @ 04,00 SAY Replicate("-", 90)
 @ 05,01 SAY "CODIGO:     "  GET nCodigo        PICTURE "99999"                WHEN .F.    /**/
 @ 06,01 SAY "NOME:       "  GET cNome          PICTURE "@!S30"                /* */       VALID !Empty(cNome)
 @ 07,01 SAY "TIPO PESSOA:"  GET cTipoPessoa    PICTURE "@!"                   WHEN .F.    /**/
 @ 08,01 SAY "CPF:        "  GET cCPF           PICTURE "999.999.999-99"       WHEN .F.    /**/
 @ 09,01 SAY "CNPJ:       "  GET cCNPJ          PICTURE "99.999.999/9999-99"   WHEN .F.    /**/
 @ 10,01 SAY "TEL:        "  GET cTelefone      PICTURE "(99) 99999-9999"      /**/        VALID !VALIDA_TELEFONE(cTelefone)
 @ 11,01 SAY "CADASTRO:   "  GET dCadastro      /**/                           /**/        VALID dCadastro>=Date()
 @ 12,01 SAY "INATIVO:    "  GET cInativo       PICTURE "@!"                   /**/        VALID (cInativo$"SN")

 READ

 IF LastKey()==27
    RETURN NIL
 ENDIF

 SELECT CLIENTES

 RLock()
 REPLACE NOME     WITH cNome
 REPLACE TEL      WITH cTelefone
 REPLACE CADASTRO WITH dCadastro
 REPLACE INATIVO  WITH cInativo=="S"
 DBCommit()
 DBUnlock()

 RETURN NIL
