-- chamando a tabela para uso
use banco_matheus_fabio;
create database bd_matheus_fabio;

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
codigo int(11) auto_increment, 
nome varchar(100),
endereço varchar(100),
cpf char(11),
telefone char(11),
tipo varchar(40),
primary key (codigo)
);
alter table tb_cliente modify codigo int (11) auto_increment;
alter table tb_cliente modify cpf varchar (30);
alter table tb_cliente modify fone varchar (30);
set foreign_key_checks = 0;
set foreign_key_checks = 1;
-- adicionando dados no tb_cliente
select * from  tb_cliente;
insert into tb_cliente values
('1', 'Carlos Eduardo', 'Rua Maximiano de Figueiredo', '222.888.999-12', '(83)9999-8877', 'padrão') ,
('2', 'Juliana Costa', 'Avenida Marechal Deodoro', '876.987.098-11', '(11) 8769-2454', 'Padrão');
-- update do cliente 
set foreign_key_checks = 0;
update banco_matheus_fabio.tb_cliente set nome = 'Carlos Eduardo Almeida' WHERE (`codigo` = '1');
set foreign_key_checks = 1;

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
alter table tb_pedido add foreign key (codigoCliente) references tb_cliente(codigo);
alter table tb_pedido add foreign key (codigoVendedor) references tb_vendedor(id);
alter table tb_pedido add foreign key (codproduto) references tb_produto(codigo);

-- cinado a tabela vendedor
select * from tb_produto;
create table produto (
codigo int(11),
nome varchar (100),
preço decimal (10,2),
codigoFabricante char(4),
primary key (codigo)
);
-- adicionando valores na tabela
select * from tb_produto;
-- que retorna o nome do produto e o seu código para produtos cujo preço seja menor que R$ 150,00 e maior que R$ 500,00
select * from tb_produto ORDER BY nome , codigo , preço ;



insert into tb_produto values
(1,'açucar','3.99'),
(2,'feijão','5.00'),
(3,'arroz','4.43'),
(4,'cuscuz','0.99');

-- alteraçoes na tabela produto
alter table tb_produto drop column codigoFabricante;
alter table tb_produto modify preço decimal(7,2);


