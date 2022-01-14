use loja_de_entregas;

select * from marmita;
-------------------------

create table consulta_dados_marmita(
id_marmita int not null auto_increment,
nome_marmita varchar(100),
descriçao_marmita varchar(100),
valor_marmita varchar(100),
valor_acrescimo varchar(100),
primary key (id_marmita),
foreign key (nome_marmita) references marmita(nome)
)default charset utf8;

select * from marmita;
