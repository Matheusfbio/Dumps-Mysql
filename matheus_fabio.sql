-- chamando a tabela para uso
use matheus_fabio;

-- renomeando a tabela
rename table vendedor to  tb_vendedor;
rename table cliente to  tb_cliente;
rename table pedido to  tb_pedido;
rename table produto to  tb_produto;

-- alterando a coluna telefone para fone varchar (15) not 
alter table tb_vendedor change telefone fone varchar (15) not null;	
alter table tb_cliente change telefone fone varchar (15) not null;
-- cinado a tabela vendedor
create table vendedor(
id int(11),
nome varchar(50),
salario decimal(7,2),
telefone char(10),
primary key (id)
);

-- cinado a tabela cliente
create table cliente(
codigo int(11),
nome varchar(100),
endereço varchar(100),
cpf char(11),
telefone char(11),
tipo varchar(40),
primary key (codigo)
);

-- cinado a tabela pedido
create table pedido(
numPedido int(11),
codigoCliente int(11),
codigoVendedor int(11),
tipo varchar (40),
dataEmbarque date,
dataEntrega date,
valorTotal decimal(10,2),
desconto decimal (5,2),
primary key (numPedido)
);

-- criando o codproduto
alter table tb_pedido add codproduto int(20);
-- adicionando chaves estrangeiras
alter table pedido add foreign key (codigoCliente) references cliente(codigo);
alter table pedido add foreign key (codigoVendedor) references vendedor(id);
alter table tb_pedido add foreign key (codproduto) references tb_produto(codigo);

-- cinado a tabela vendedor

create table produto (
codigo int(11),
nome varchar (100),
preço decimal (10,2),
codigoFabricante char(4),
primary key (codigo)
);
-- alteraçoes na tabela produto
alter table produto drop column codigoFabricante;
alter table tb_produto modify preço decimal(7,2)
