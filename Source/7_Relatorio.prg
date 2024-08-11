#INCLUDE "WINUSER.CH"

*--------------------------------*

FUNCTION IMPRIMIR()

LOCAL nArquivo, nRegistro:=0
LOCAL cCNPJ_CPF, cCRLF:=Chr(13)+Chr(10)

IF CLIENTES->CODIGO==0
   MessageBox(, "O arquivo est� vazio","Aten��o",MB_ICONSTOP)
   RETURN NIL
ENDIF

nArquivo:=FCreate("Relat�rio.txt")

FWrite(nArquivo,PadC("RELAT�RIO DE CLIENTES", 99)+cCRLF)
FWrite(nArquivo,Replicate("-", 99)+cCRLF)

FWrite(nArquivo,"C�DIGO | NOME"+ SPACE(46) + " | TELEFONE" + SPACE(7) + " | CPF/CNPJ" + SPACE(10)+ ""+cCRLF)
FWrite(nArquivo,Replicate("-", 99)+cCRLF)

SELECT CLIENTES
nRegistro:=RecNo()

DBGoTop()

DO WHILE !Eof()
   IIF(CLIENTES->TIPOPESSOA==e"F",cCNPJ_CPF:=CLIENTES->CPF, cCNPJ_CPF:=CLIENTES->CNPJ)
   FWrite(nArquivo,Str(CLIENTES->CODIGO,6)+" | "+CLIENTES->NOME+" | "+CLIENTES->TEL+" | "+cCNPJ_CPF+cCRLF)
   DBSkip()
ENDDO

DBGoTo(nRegistro)
FClose(nArquivo)

MessageBox(,"Relat�rio.txt gerado com sucesso!","Relat�rio",MB_ICONINFORMATION)

RETURN NIL