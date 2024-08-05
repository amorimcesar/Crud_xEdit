FUNCTION LIMPA_TELA()

@ 03,00 CLEAR TO 24,89

RETURN NIL

*--------------------------------*

FUNCTION CRIA_FOOTER_MAIN()

@ 23, 00 SAY Replicate("-",90)
@ 24, 00 SAY PadC(" INS = INCLUIR | ENTER = ALTERAR | DEL = EXCLUIR |"+;
                  "LETRA = BUSCAR | F2 = REL | ESC = SAIR ", 89)

RETURN NIL

*--------------------------------*

FUNCTION CRIA_FOOTER_INCLUIR_ALTERAR()

@ 23, 00 SAY Replicate("-",90)
@ 24, 00 SAY PadC(" ENTER = SALVAR | ESC = SAIR ", 89)

RETURN NIL