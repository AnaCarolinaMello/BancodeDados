CREATE DATABASE Eleicao;
Use Eleicao;
Create table Partido(
ID int unsigned auto_increment not null,
Nome varchar(80) not null,
Sigla varchar(10) not null,
Primary key(ID)
)Engine=INNODB;

Create table Cargo(
ID int unsigned auto_increment not null,
Nome varchar(80) not null,
Decricao varchar(150) not null,
Primary key(ID)
)Engine=INNODB;

Create table Localidade(
ID int unsigned auto_increment not null,
Nome varchar(80) not null,
Regiao varchar(80) not null,
Primary key(ID)
)Engine=INNODB;

Create table Candidatos(
ID int unsigned auto_increment not null,
Nome varchar(80) not null,
Endereco varchar(150) not null,
Partido_ID int unsigned not null,
Cargo_ID int unsigned not null,
Primary key(ID),
Foreign key(Partido_ID) references Partido(ID),
Foreign key(Cargo_ID) references Cargo(ID)
)Engine=INNODB;

Create table Voto(
ID int unsigned auto_increment not null,
Data date not null,
Quantidade double(9,2) not null,
Cargo_ID int unsigned not null,
Eleitor_ID int unsigned not null,
Primary key(ID),
Foreign key(Cargo_ID) references Cargo(ID),
Foreign key(Eleitor_ID) references Eleitor(ID)
)Engine=INNODB;

Create table Eleitor(
ID int unsigned auto_increment not null,
Nome varchar(80) not null,
Endereco varchar(150) not null,
Secoes_ID int unsigned not null,
Primary key(ID),
Foreign key(Secoes_ID) references Secoes(ID)
)Engine=INNODB;

Create table Secoes(
ID int unsigned auto_increment not null,
Nome varchar(80) not null,
Descricao varchar(150) not null,
Zonas_eleitorais_ID int unsigned not null,
Primary key(ID),
Foreign key(Zonas_eleitorais_ID) references Zonas_eleitorais(ID)
)Engine=INNODB;

Create table Zonas_eleitorais(
ID int unsigned auto_increment not null,
Nome varchar(80) not null,
Descricao varchar(150) not null,
Localidade_ID int unsigned not null,
Primary key(ID),
Foreign key(Localidade_ID) references Localidade(ID)
)Engine=INNODB;