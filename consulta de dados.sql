use loja_de_entregas;

create table consulta_marmita(
id int not null auto_increment,
id_marmita int,
nome varchar (100),
descriçao varchar (100),
tamanho varchar (100),
valor_acrescimo varchar (100),
primary key (id),
foreign key (id_marmita) references marmita(id)
)default charset utf8;

 select * from consulta_marmita;
 
 select m.nome , m.descriçao, m.valor , c.valor_acrescimo  from marmita m
 join consulta_marmita c
 on m.id = c.id_marmita; 

INSERT INTO `loja_de_entregas`.`consulta_marmita` 
(`id`, `id_marmita`, `nome`, `descriçao`, `tamanho`, `valor_acrescimo`) VALUES 
('1', '1', 'matheus fabio', 'completo com carne', '30x21', '13.80'),
('2', '2', 'lucas morais', 'completo com frango', '30x21', '14.95');

------------------------------------------------------------

create table info_entregas(
id int not null auto_increment,
status_entregas varchar (100),
data date,
foreign key (id) references pedido(id)
 )default charset utf8;
 

 select  *from pedido p 
 join info_entregas i
 on p.id = i.id;

select *from info_entregas;
describe info_entregas; 