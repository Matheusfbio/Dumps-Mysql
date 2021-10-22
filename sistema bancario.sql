use sistema_bancario;

alter table agencia add primary key (Num_agencia);


create table conta(
numero_conta varchar (9) default null,
saldo decimal(10,2) default null,
tipo_conta varchar (20) default null,
num_agencia varchar (20) default null
);
alter table conta modify num_agencia int(4);
alter table conta add foreign key (num_agencia) references agencia(Num_agencia);

create table historico(
cpf_cliente char (14) default null,
num_conta varchar (9) default null,
data_inicio date default null,
constraint historico_cliente foreign key (cpf_cliente) references cliente(cpf),
constraint historico_num_conta foreign key (num_conta) references conta(numero_conta)

);
create table telefone_cliente(
cpf_cli char (14) default null,
telefone varchar (16) default null,
constraint telefone_cliente_cpf foreign key (cpf_cli) references cliente(cpf)

);
alter table telefone_cliente add constraint telefone_do_cli foreign key (cpf_cli) references cliete(cpf);
alter table telefone_cliente modify cpf_cli varchar(11);

describe banco;
select * from banco;
insert into banco values
('1','banco do brasil'),('4','CEF');

select * from agencia;
insert into agencia values
('4','322','Av. Walfredo Macedo Brandao, 1139'),('1','1253','R. Bancário Sérgio Guerra, 17');

select * from cliente;
insert into cliente values
('111.222.333-44','Bruna Andrade' ,'F' ,'Rua José Firmino Ferreira, 1050'),
('666.777.888-99','Radegondes Silva','M','Av. Epitácio Pessoa, 1008'),
('555.444.777-33','Miguel Xavier', 'M' ,'Rua Bancário Sérgio Guerra, 640');
alter table cliente modify cpf varchar(15);
update cliente set email = 'radegondes.silva@gmail.com' where ( cpf = '666.777.888-99');
update cliente set nome = 'Bruna Fernades' where (cpf = '111.222.333-44');

select * from conta;
insert into conta values
('11765-2' ,'22.745.05' ,'2' ,'322'),
('21010-7' ,'3.100.96' ,'1' ,'1253');
alter table conta modify saldo varchar(20);
set foreign_key_checks = 0; -- para desabilita-lo
alter table conta modify numero_conta char(7);
set foreign_key_checks = 1;  -- para re-habilitar-lo
update sistema_bancario.conta set saldo = '3.411.56' where (numero_conta = '21010-7'); -- 3.441.56 é o acrescimo de 10% que é 310,96
update conta set tipo_conta = '3' where (numero_conta = '11765_2');

select * from historico;
insert into historico values
('111.222.333-44' ,'11765-2' ,'2015-12-22'),
('666.777.888-99' ,'11765-2' ,'2016-10-05'),
('555.444.777-33' ,'21010-7' ,'2012-08-29');

select * from telefone_cliente;
insert into telefone_cliente values
('111.222.333-44' ,'(83) 3222-1234'),
('666.777.888-99' ,'(83) 99443-9999'),
('666.777.888-99' ,'(83) 3233-2267');

select * from cliente;
alter table cliente add column pais char (3) default 'BRA';
alter table cliente add column email varchar (60) default null;


select * from agencia;
set foreign_key_checks = 0; -- para desabilita-lo
update sistema_bancario.agencia set Num_agencia = '6342' where (Num_agencia = '322');
set foreign_key_checks = 1;  -- para re-habilitar-lo



