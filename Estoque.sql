CREATE DATABASE Estoque;
Use Estoque;
Create table Fornecedor(
CNPJ char(20) not null,
Nome varchar(80) not null,
Endereco varchar(150) not null,
Primary key(CNPJ)
)Engine=INNODB;

Create table Clientes(
CPF char(14) not null,
Nome varchar(80) not null,
Endereco varchar(150) not null,
Primary key(CPF)
)Engine=INNODB;

Create table Compras(
Codigo int unsigned auto_increment not null,
Data date not null,
Valor double(9,2) not null,
Descricao varchar(200) not null,
Fornecedor_CNPJ char(20) not null,
Primary key(Codigo),
Foreign key(Fornecedor_CNPJ) references Fornecedor(CNPJ)
)Engine=INNODB;

Create table Vendas(
Codigo int unsigned auto_increment not null,
Data date not null,
Valor double(9,2) not null,
Compras_Codigo int unsigned not null,
Clientes_CPF char(14) not null,
Primary key(Codigo),
Foreign key(Compras_Codigo) references Compras(Codigo),
Foreign key(Clientes_CPF) references Clientes(CPF)
)Engine=INNODB;

Create table Nota_fiscal(
Numero int unsigned auto_increment not null,
Tipo varchar(45) not null,
Data date not null,
Valor double(9,2) not null,
Compras_Codigo int unsigned not null,
Vendas_Codigo int unsigned not null,
Primary key(Numero),
Foreign key(Compras_Codigo) references Compras(Codigo),
Foreign key(Vendas_Codigo) references Vendas(Codigo)
)Engine=INNODB;

Create table Produtos(
Codigo int unsigned auto_increment not null,
Nome varchar(80) not null,
Preco double(9,2) not null,
Nota_fiscal_Numero int unsigned not null,
Primary key(Codigo),
Foreign key(Nota_fiscal_Numero) references Nota_fiscal(Numero)
)Engine=INNODB;

Create table Almoxarifados(
ID int unsigned auto_increment not null,
Nome varchar(80) not null,
Endereco varchar(150) not null,
Nota_fiscal_Numero int unsigned not null,
Primary key(ID),
Foreign key(Nota_fiscal_Numero) references Nota_fiscal(Numero)
)Engine=INNODB;

Create table Estoque(
Almoxarifados_ID int unsigned not null,
Produtos_Codigo int unsigned not null,
Data date not null,
Quantidade bigint unsigned not null,
Nota_fiscal_Numero int unsigned not null,
Foreign key(Produtos_ID) references Produtos(ID),
Foreign key(Compras_Codigo) references Compras(Codigo),
Foreign key(Nota_fiscal_Numero) references Nota_fiscal(Numero)
)Engine=INNODB;