Create database aula_parte1;

use aula_parte1;



Create Table Pais (

sigla varchar(3) not null,

nome varchar(15) not null,



CONSTRAINT pk_Pais PRIMARY KEY (sigla)

);



Create Table Cidade (

codigo int not null,

nome varchar(30) not null,

Uf varchar(2) not null,

Pais varchar(3) not null,



CONSTRAINT pk_Cidade PRIMARY KEY(codigo),

CONSTRAINT fk_Cidade_Pais FOREIGN KEY (Pais) REFERENCES Pais(sigla)

);



Create Table Cliente (

codigo int not null,

nome varchar(40) not null,

tipo char(2) not null,

contato varchar(30),

cargo varchar(30),

endereco varchar(50) not null,

cidade int not null,

cep varchar(10),

fone varchar(16),

fax varchar(16),

obs text,



CONSTRAINT pk_Cliente PRIMARY KEY (codigo),

CONSTRAINT ck_Cliente_Tipo CHECK (tipo IN ('PF','PJ')),

CONSTRAINT fk_Cliente_Cidade FOREIGN KEY (cidade)REFERENCES Cidade(codigo)

);



Create Table Tipo (

codigo int not null,

nome varchar(15) not null,

descricao text,



CONSTRAINT pk_Tipo PRIMARY KEY (codigo)

);



-- Drop Table Produto



Create Table Produto (

codigo int not null,

nome varchar(40) not null,

descricao varchar(45) not null,

apresent varchar(30),

venda numeric(6,2) not null,

custo numeric(6,2) not null,

quantest int not null,

estmin int,

tipo int not null,

situacao char(1),



CONSTRAINT pk_Produto PRIMARY KEY (codigo),

CONSTRAINT un_Nome_Produto UNIQUE (nome),

CONSTRAINT fk_Produto_Tipo FOREIGN KEY (tipo) REFERENCES Tipo(codigo),

CONSTRAINT ck_Produto_Situacao CHECK (situacao IN ('N','S','D'))

);



Create Table Funcao (

codigo int not null,

nome varchar(30) not null,

gratific numeric (6,2) not null,



CONSTRAINT pk_Funcao PRIMARY KEY (codigo),

CONSTRAINT un_Nome_Funcao UNIQUE (nome)

);



Create Table Setor (

sigla char(3) not null,

nome varchar(30)not null,

ramal int,

chefe int,



CONSTRAINT pk_Setor PRIMARY KEY (sigla),

CONSTRAINT un_Nome_Setor UNIQUE (nome)

);



Create Table Funcionario (

codigo int not null,

nome varchar(40) not null,

sexo char(1) not null,

estcivil char(1) not null,

rg varchar(15) not null,

cpf varchar(12) not null,

datanasc datetime not null,

naturalidade int not null,

dataadm datetime not null,

endereco varchar(40) not null,

complemento varchar(20),

bairro varchar(20),

cidade int not null,

cep varchar(10),

fone varchar(10),

celular varchar(10),

funcao int not null,

setor char(3) not null,

salario numeric (6,2),

email varchar(40),

Obs text,



CONSTRAINT pk_Funcionario PRIMARY KEY (codigo),

CONSTRAINT ck_Funcionario_Sexo CHECK ( sexo IN ('M','F')),

CONSTRAINT ck_Funcionario_EstCivil CHECK ( estcivil IN ('S','C', 'D', 'V', 'O')),

CONSTRAINT un_Funcionario_Rg UNIQUE (rg),

CONSTRAINT un_Funcionario_Cpf UNIQUE (cpf),

CONSTRAINT fk_Funcionario_Natural_Cidade FOREIGN KEY (naturalidade) REFERENCES Cidade (codigo),

CONSTRAINT fk_Funcionario_Cidade FOREIGN KEY (cidade) REFERENCES Cidade (codigo),

CONSTRAINT fk_Funcionario_Funcao FOREIGN KEY (funcao) REFERENCES Funcao (codigo),

CONSTRAINT fk_Funcionario_Setor FOREIGN KEY (setor) REFERENCES Setor (sigla)

);



Create Table Pedido (

codigo int not null,

cliente int not null,

vendedor int not null,

dataPedido datetime not null,

dataFatura datetime,

via char(1),

frete numeric(6,2),



CONSTRAINT pk_Pedido PRIMARY KEY (codigo),

CONSTRAINT fk_Pedido_Cliente FOREIGN KEY (cliente) REFERENCES Cliente (codigo),

CONSTRAINT fk_Pedido_Funcionario FOREIGN KEY (vendedor) REFERENCES Funcionario (codigo),

CONSTRAINT ck_via_pedido CHECK (via IN ('A','T','M'))

);



-- Drop table Itens

Create Table Itens (

pedido int not null,

produto int not null,

preco numeric (6,2),

quant int not null,

desconto decimal(4,1) not null,



CONSTRAINT pk_Itens PRIMARY KEY (pedido,produto),

CONSTRAINT fk_Itens_Pedido FOREIGN KEY (pedido) REFERENCES Pedido (codigo),

CONSTRAINT fk_Itens_Produto FOREIGN KEY (produto) REFERENCES Produto (codigo)

); 

