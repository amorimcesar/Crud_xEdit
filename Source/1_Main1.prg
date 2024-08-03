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
 @ 23, 00 SAY Replicate("-",90)
 @ 24, 00 SAY PadC(" INS - INCLUIR | ENTER - ALTERAR | DEL - EXCLUIR | LETRA - BUSCAR | F2 - REL | ESC = SAIR ", 89)

 SELECT CLIENTES
 OrdSetFocus("NOME")
 DBGoTop()

 aTitulos:={"Codigo","Nome" ,"Telefone" }
 aCampos :={"CODIGO", "NOME", "TEL"}

 DBEdit(03, 00, 22, 89, aCampos,"CADASTRO_CLIENTES",,aTitulos)

 RETURN

*-------------------------------------------------------*

FUNCTION CADASTRO_CLIENTES(nModo)

IF nModo==4
   IF LastKey()==22
      INCLUIR()
    ELSEIF LastKey()==13
      ALTERAR()
    ELSEIF LastKey()==27
      Quit
    /*ELSEIF LastKey()==
      *EXCLUIR_CLIENTE()
    ELSEIF LastKey()>=
      *BUSCAR_CLIENTE()
    ELSEIF LASTKEY()==
      *IMPRIMIR_TXT()*/
    ELSEIF LastKey()==27
      Quit
   ENDIF
ENDIF

RETURN 2