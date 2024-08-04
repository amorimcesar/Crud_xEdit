FUNCTION INATIVOS()

LOCAL aCampos, aTitulos

LIMPA_TELA()

@ 01, 00 SAY PadC(" CADASTRO DE CLIENTES ",89)
@ 01, 02 SAY Date()
@ 01, 71 SAY Time()
@ 02, 00 SAY Replicate("-",90)
CRIA_FOOTER_MAIN()

SELECT CLIENTES

OrdSetFocus("C_INATIVO")
DBGoTop()

aTitulos:={"Codigo","Nome" ,"Telefone" }
aCampos :={"CODIGO", "NOME", "TEL"}

DBEdit(03, 00, 22, 89, aCampos,"CADASTRO_CLIENTES_INATIVOS",,aTitulos)

RETURN NIL

*--------------------------------*

FUNCTION CADASTRO_CLIENTES_INATIVOS(nModo)

IF nModo==4
   IF LastKey()==22
      INCLUIR()
    ELSEIF LastKey()==13
      ALTERAR()
    ELSEIF LastKey()==7
      EXCLUIR()
    ELSEIF LastKey()>=32 .AND. LastKey()<127
      BUSCAR()
    ELSEIF LASTKEY()==-1
      IMPRIMIR()
    ELSEIF LASTKEY()==-2
      DBCloseAll()
      MAIN()
    ELSEIF LastKey()==27
      Quit
   ENDIF
ENDIF

RETURN 2