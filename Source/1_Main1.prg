PROCEDURE MAIN()

LOCAL aCampos, aTitulos

SET CENTURY    ON
SET EPOCH      TO 1950
SET DATE       BRITISH
SET DELETE     ON
SET EXCLUSIVE  OFF

INICIA_BANCO_DADOS()

@ 01, 00 SAY PadC(" CADASTRO DE CLIENTES ",89)
@ 01, 02 SAY Date()
@ 01, 71 SAY Time()
@ 02, 00 SAY Replicate("-",90)
CRIA_FOOTER_MAIN()

SELECT CLIENTES

OrdSetFocus("NOME")
DBGoTop()

aTitulos:={"Codigo","Nome" ,"Telefone" }
aCampos :={"CODIGO", "NOME", "TEL"}

DBEdit(03, 00, 22, 89, aCampos,"CADASTRO_CLIENTES",,aTitulos)

RETURN

*--------------------------------*

FUNCTION CADASTRO_CLIENTES(nModo)

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
    ELSEIF LastKey()==27
      Quit
   ENDIF
ENDIF

RETURN 2