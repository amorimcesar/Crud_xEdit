 #INCLUDE "WINUSER.CH"

 *--------------------------------*
 FUNCTION INCLUIR()

 LOCAL GetList:={}
 LOCAL nCodigo:=0
 LOCAL cNome:=Space(50), cTipoPessoa:=Space(1), cInativo:="N", cCPF:=Space(14), cCNPJ:=Space(18), cTelefone:=Space(15)
 LOCAL dCadastro:=Date()

 LIMPA_TELA()
 CRIA_FOOTER_INCLUIR_ALTERAR()

 @ 03,00 SAY PadC("INCLUSAO", 89)
 @ 04,00 SAY Replicate("-", 90)
 @ 05,01 SAY "CODIGO:     "  GET nCodigo        PICTURE "99999"                                                     VALID nCodigo>0 .AND. !CODIGO_EXISTE(nCodigo)
 @ 06,01 SAY "NOME:       "  GET cNome          PICTURE "@!S30"                                                     VALID !Empty(cNome)
 @ 07,01 SAY "TIPO PESSOA:"  GET cTipoPessoa    PICTURE "@!"                   WHEN Empty(cCPF) .AND. Empty(cCNPJ)  VALID (cTipoPessoa$"FJ")
 @ 08,01 SAY "CPF:        "  GET cCPF           PICTURE "999.999.999-99"       WHEN cTipoPessoa=="F"                VALID !E_CPF_INVALIDO(cCPF)
 @ 09,01 SAY "CNPJ:       "  GET cCNPJ          PICTURE "99.999.999/9999-99"   WHEN cTipoPessoa=="J"                VALID !E_CNPJ_INVALIDO(cCNPJ)
 @ 10,01 SAY "TEL:        "  GET cTelefone      PICTURE "(99) 99999-9999"                                           VALID TELEFONE_VALIDO(cTelefone)
 @ 11,01 SAY "CADASTRO:   "  GET dCadastro                                                                          VALID DATA_VALIDA(dCadastro)
 @ 12,01 SAY "INATIVO:    "  GET cInativo       PICTURE "@!"                                                        VALID (cInativo$"SN")

 READ

 IF LastKey()==27
    CRIA_FOOTER_MAIN()
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

 CRIA_FOOTER_MAIN()

 RETURN NIL