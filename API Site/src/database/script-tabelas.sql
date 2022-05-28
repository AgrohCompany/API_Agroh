-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para workbench - local - desenvolvimento */
create database agrohcompany;

use agrohcompany;

create table Cliente(
idCliente int primary key auto_increment,
nome varchar(100),
email varchar(100),
senha varchar(45),
cpf_cnpj varchar(45),
endereco varchar(100),
cep varchar(12),
complemento varchar(100),
estado char(2)
);

create table tipo_usuario (
idTipo int primary key auto_increment,
tipoUsuario varchar(45)
);

create table usuario (
idUsuario int primary key auto_increment,
nome varchar(100),
email varchar(100),
senha varchar(100),
cpf varchar (15),
telefone varchar(45),
fkCliente int,
fkTipo int,
foreign key (fkCliente) references cliente(idCliente),
foreign key (fkTipo) references tipo_usuario(idTipo)
);

create table fazenda (
idFazenda int primary key auto_increment,
hectar double,
tipoPlantacao varchar(15),
endereco varchar(150),
complemento varchar(150),
cep varchar(12),
cidade varchar(100),
estado char(2),
fkCliente int,
foreign key (fkCliente) references cliente(idCliente)
);

create table sensor (
idSensor int primary key auto_increment,
fkFazenda int,
nomeSensor varchar(50),
regiaoFazenda varchar(20),
foreign key (fkFazenda) references fazenda(idFazenda)
);

create table dados_sensor (
idDado int primary key auto_increment,
fkSensor int,
temperatura double,
umidade double,
momento datetime default current_timestamp,
foreign key (fkSensor) references sensor(idSensor)
);

create table dados_sensor (
idDado int primary key auto_increment,
fkSensor int,
temperatura double,
umidade double,
momento datetime default current_timestamp,
foreign key (fkSensor) references sensor(idSensor)
);

/* para sql server - remoto - produção */

create table Cliente(
idCliente int primary key IDENTITY(1,1),
nome varchar(100),
email varchar(100),
senha varchar(45),
cpf_cnpj varchar(45),
endereco varchar(100),
cep varchar(12),
complemento varchar(100),
estado char(2)
);

create table tipo_usuario (
idTipo int primary key IDENTITY(1,1),
tipoUsuario varchar(45)
);

create table usuario (
idUsuario int primary key IDENTITY(1,1),
nome varchar(100),
email varchar(100),
senha varchar(100),
cpf varchar (15),
telefone varchar(45),
fkCliente int foreign key references cliente(idCliente),
fkTipo int foreign key references tipo_usuario(idTipo)
);

create table fazenda (
idFazenda int primary key IDENTITY(1,1),
hectar decimal,
tipoPlantacao varchar(15),
endereco varchar(150),
complemento varchar(150),
cep varchar(12),
cidade varchar(100),
estado char(2),
fkCliente int foreign key references cliente(idCliente)
);

create table sensor (
idSensor int primary key IDENTITY (1,1),
nomeSensor varchar(50),
regiaoFazenda varchar(20),
fkFazenda int foreign key references fazenda(idFazenda)
);

create table dados_sensor (
idDado int primary key IDENTITY(1,1),
temperatura decimal,
umidade decimal,
momento datetime default current_timestamp,
fkSensor int foreign key references sensor(idSensor)
);


