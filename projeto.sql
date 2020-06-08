create database projeto;
use projeto;

create table funcionario(
	idFuncionario int primary key auto_increment,
    nomeFuncionario varchar(50),
    salarioFuncionario float,
    cargoFuncionario varchar(25)
);

create table cliente(
	idCliente int primary key auto_increment,
    nomeCliente varchar(50),
    telefoneCliente varchar(20)
);

create table instrumentos(
	idInstrumentos int primary key auto_increment,
    valorInstrumentos float,
    tipoInstrumentos varchar(20),
    nomeInstrumentos varchar(50)
);

create table diversos(
	idDiversos int primary key auto_increment,
    valorDiversos float,
    tipoDiversos varchar(20),
    nomeDiversos varchar(50)
);

create table servicos(
	idServicos int primary key auto_increment,
    valorServicos float,
    nomeServicos varchar(50)
);

create table notaFiscal(
	idNota int primary key auto_increment,
    valorNota float,
    dataNota varchar(10),
    fk_idFuncionario int not null,
    fk_idCliente int not null,
    fk_idInstrumentos int,
    fk_idDiversos int,
    foreign key (fk_idFuncionario) references funcionario(idFuncionario),
    foreign key (fk_idCliente) references cliente(idCliente),
    foreign key (fk_idInstrumentos) references instrumentos(idInstrumentos),
    foreign key (fk_idDiversos) references diversos(idDiversos)
);

create table inclui(
	fk_idNota int,
    fk_idServicos int,
    foreign key (fk_idNota) references notaFiscal(idNota),
    foreign key (fk_idServicos) references servicos(idServicos)
);

-- Inserção de dados

insert into funcionario (nomeFuncionario, salarioFuncionario, cargoFuncionario) values ("João", 1300, "Vendedor");
insert into funcionario (nomeFuncionario, salarioFuncionario, cargoFuncionario) values ("Carlos", 1300, "Vendedor");
insert into funcionario (nomeFuncionario, salarioFuncionario, cargoFuncionario) values ("Julia", 2500, "Professora");
insert into funcionario (nomeFuncionario, salarioFuncionario, cargoFuncionario) values ("Luis", 2000, "Luthier");

insert into cliente (nomeCliente, telefoneCliente) values ("José", "4342-2324");
insert into cliente (nomeCliente, telefoneCliente) values ("Bianca", "3909-3999");
insert into cliente (nomeCliente, telefoneCliente) values ("Rebeca", "3223-9889");

insert into instrumentos (valorInstrumentos, tipoInstrumentos, nomeInstrumentos) values (2600.0, "cordas", "Guitarra Cort X11");
insert into instrumentos (valorInstrumentos, tipoInstrumentos, nomeInstrumentos) values (1200.0, "cordas", "Guitarra Epiphone Special");
insert into instrumentos (valorInstrumentos, tipoInstrumentos, nomeInstrumentos) values (3900.0, "percursão", "Bateria Pearl");
insert into instrumentos (valorInstrumentos, tipoInstrumentos, nomeInstrumentos) values (2150.0, "cordas", "Violão Takamine GD11");
insert into instrumentos (valorInstrumentos, tipoInstrumentos, nomeInstrumentos) values (29800.0, "teclas", "Teclado Korg PA4X");
insert into instrumentos (valorInstrumentos, tipoInstrumentos, nomeInstrumentos) values (0.0, "*", "*");


insert into diversos (valorDiversos, tipoDiversos, nomeDiversos) values (5.0, "palhetas", "Palheta Jim Dunlop 1mm");
insert into diversos (valorDiversos, tipoDiversos, nomeDiversos) values (60.0, "baquetas", "Baqueta Vic Firth 7A");
insert into diversos (valorDiversos, tipoDiversos, nomeDiversos) values (140.0, "jogo de cordas", "Cordas de aço Elixir 0.9mm");
insert into diversos (valorDiversos, tipoDiversos, nomeDiversos) values (2100.0, "amplificador", "Amp Fender Champion 100xl");
insert into diversos (valorDiversos, tipoDiversos, nomeDiversos) values (0.0, "*", "*");

insert into servicos (valorServicos, nomeServicos) values (120.0, "Aulas de música");
insert into servicos (valorServicos, nomeServicos) values (150.0, "Regulagem de instrumento");
insert into servicos (valorServicos, nomeServicos) values (25.0, "Troca de cordas");
insert into servicos (valorServicos, nomeServicos) values (0.0, "*");

insert into notaFiscal (valorNota, dataNota, fk_idFuncionario, fk_idCliente, fk_idInstrumentos, fk_idDiversos) values (2100.0, "05/01/2020", 2, 2, 6, 4);
insert into notaFiscal (valorNota, dataNota, fk_idFuncionario, fk_idCliente, fk_idInstrumentos, fk_idDiversos) values (29800, "10/07/2019", 1, 3, 5, 5);
insert into notaFiscal (valorNota, dataNota, fk_idFuncionario, fk_idCliente, fk_idInstrumentos, fk_idDiversos) values (2275.0, "04/12/2019", 2, 1, 4, 1);

insert into inclui values (1, 4);
insert into inclui values (2, 4);
insert into inclui values (3, 1);

-- update e delete
update instrumentos as i set valorInstrumentos = 1999.0 where i.idInstrumentos = 1;

delete from instrumentos where idInstrumentos = 2;

-- Relatório
select valorNota, dataNota, nomeFuncionario, nomeCliente, nomeInstrumentos, valorInstrumentos, nomeDiversos, valorDiversos, nomeServicos, valorServicos from notaFiscal as n 
	join funcionario as f on f.idFuncionario=n.fk_idFuncionario
    join cliente as c on c.idCliente=n.fk_IdCliente
    join instrumentos as i on i.idInstrumentos=n.fk_idInstrumentos
    join diversos as d on d.idDiversos=n.fk_idDiversos
    join inclui as inc on inc.fk_idNota=n.idNota
    join servicos as s on s.idServicos=inc.fk_idServicos
    order by c.idCliente;
 