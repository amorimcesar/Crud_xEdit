 FUNCTION INICIA_BANCO_DADOS()

 IF !IsDirectory("DBF")
    Run("MD DBF")
 ENDIF

 IF !IsDirectory("NTX")
    Run("MD NTX")
 ENDIF

 IF !File("DBF\CLIENTES.DBF")
    DBCreate("DBF\CLIENTES.DBF", {{"CODIGO"     ,"N",05,0},;
                                  {"NOME"       ,"C",50,0},;
                                  {"TIPOPESSOA" ,"C",01,0},;
                                  {"CPF"        ,"C",14,0},;
                                  {"CNPJ"       ,"C",18,0},;
                                  {"TEL"        ,"C",15,0},;
                                  {"CADASTRO"   ,"D",08,0},;
                                  {"INATIVO"    ,"L",01,0}})
 ENDIF

 SELECT 0
 USE DBF\CLIENTES
 INDEX ON CLIENTES->CODIGO TAG "CODIGO" TO NTX\IND_CLIENTES
 INDEX ON CLIENTES->NOME   TAG "NOME"   TO NTX\IND_CLIENTES

 RETURN NIL
