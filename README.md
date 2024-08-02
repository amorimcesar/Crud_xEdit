# Crud_xEdit
Projeto criado para pratica do Treinamento sobre a linguagem xHarbour

Um sistema que simula um cadastro de clientes.

## Banco de dados
Os clientes ficarão em uma tabela DBF, com os campos:

| Campo          | Tipo      | Tamanho |
| ---------------| --------- | ------- |
| CODIGO         | Número    |       5 |
| NOME           | Caractere |      50 |
| TIPOPESSOA     | Caractere |       1 |
| CPF            | Caractere |      14 |
| CNPJ           | Caractere |      18 |
| TEL            | Caractere |      15 |
| CADASTRO       | Data      |       8 |
| INATIVO        | Lógico    |       1 |

## Tela inicial
A tela inicial será uma lista de clientes por **ordem alfabética**, com as colunas: CODIGO, NOME e TELEFONE.

E a tela inicial terá as seguintes funcionalidades:

- INCLUIR (INS):
- ALTERAR (ENTER)
- EXCLUIR (DEL)
- BUSCAR (LETRA): 
- RELATORIO (F2)

## Funcionalidades

### Incluir

Abrirá uma nova tela, com os campos:

| Campo         | Valor padrão (exibido ao abrir a tela)  | Valores válidos                                                                  |
| ------------- | --------------------------------------- | -------------------------------------------------------------------------------- |
| CODIGO        | 0                                       | Código maior que zero e que não exista em outro cliente.                         |
| NOME          |                                         | Nome não pode ser vazio.                                                         |
| TIPOPESSOA    |                                         | F = Pessoa Fisica, J = Pessoa Juridica                                           |
| CPF           |                                         | CPF, Permitido somente para P. Fisica e que não exista em outro cliente          |
| CNPJ          |                                         | CNPJ,Permitido somente para P. Juridica e que não exista em outro cliente        |
| TELEFONE      |                                         |                                                                                  |
| CADASTRO      | Data atual                              | Data maior ou igual à data atual.                                                |
| INATIVO       | N                                       | S ou N                                                                           |

### Alterar

> Não poderá ser acessada, se a lista estiver vazia.

Abrirá uma nova tela, com os campos **preenchidos**:

| Campo         | Valor padrão (exibido ao abrir a tela)  | Valores válidos                                                                  |
| ------------- | --------------------------------------- | -------------------------------------------------------------------------------- |
| CODIGO        | 0                                       | Esse campo não pode ser alterado, é apenas para visualização.                    |
| NOME          |                                         | Nome não pode ser vazio.                                                         |
| TIPOPESSOA    |                                         | F = Pessoa Fisica, J = Pessoa Juridica                                           |
| CPF           |                                         | CPF, Permitido somente para P. Fisica e que não exista em outro cliente          |
| CNPJ          |                                         | CNPJ,Permitido somente para P. Juridica e que não exista em outro cliente        |
| TELEFONE      |                                         |                                                                                  |
| CADASTRO      | Data atual                              | Data maior ou igual à data atual.                                                |
| INATIVO       | N                                       | S ou N                                                                           |

### Excluir

> Não pode ser acessada, se a lista estiver vazia.

Perguntar se o usuário realmente deseja excluir o cliente. Se sim, deletar o produto na tabela DBF.

O cliente excluído não pode mais ser exibido na tela principal.

### Consultar

> Não pode ser acessada, se a lista estiver vazia.

Essa funcionalidade deve ser ativada ao pressionar qualquer letra ou número do teclado. Ela exibirá uma tela com um campo, onde o usuário informará o nome do cliente a ser buscado.
Se o nome for encontrado, o sistema deve exibir o cliente na lista. Senão, o sistema deve exibir uma mensagem, dizendo que o cliente não foi encontrado, e deve se manter no cliente que estava antes de abrir a tela.

### Relatório

> Não pode ser acessada, se a lista estiver vazia.

Gera um "Relatório.txt", com todos os dados de todos os clientes.
Ao final da geração, informe ao usuário que o relatório foi gerado com sucesso.







