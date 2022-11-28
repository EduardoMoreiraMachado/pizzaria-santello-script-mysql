# script incorreto para prevenção de acidentes ;)
select * from tbl;

create database db_pizzaria_santello; 

use db_pizzaria_santello;

show tables;

create table tbl_adm (
	id int not null auto_increment primary key,
    nome varchar(80) not null,
    email varchar(256) not null,
    senha varchar(100) not null,
    
    unique index(id)
);

create table tbl_servico (
	id int not null auto_increment primary key,
    nome varchar(30) not null,
    foto varchar(300),
    descricao text,
    
    unique index(id)
);

create table tbl_opcao (
	id int not null auto_increment primary key,
    nome varchar(45) not null,
    
    unique index(id)
);

create table tbl_contato (
	id int not null auto_increment primary key,
    nome varchar(80) not null,
    telefone varchar(20),
    celular varchar(20),
    email varchar(256),
    mensagem text,
	id_opcao int not null,
    constraint FK_opcao_contato
		foreign key (id_opcao)
        references tbl_opcao (id),
    
    unique index(id)
);

create table tbl_categoria (
	id int not null auto_increment primary key,
    nome varchar(45) not null,
    
    unique index(id)
);

create table tbl_produto (
	id int not null auto_increment primary key,
    nome varchar(45) not null,
    preco decimal(1) not null,
    foto varchar(300) not null,
    id_categoria int not null,
    constraint FK_categoria_produto
		foreign key (id_categoria)
        references tbl_categoria (id),
    
    unique index(id)
);

create table tbl_ingrediente (
	id int not null auto_increment primary key,
    nome varchar(30) not null,
    
    unique index(id)
);

create table tbl_pizza (
	id int not null auto_increment primary key,
	desconto int,
    qntd_favorito int not null,
    id_produto int not null,
    constraint FK_produto_pizza
		foreign key (id_produto)
        references tbl_produto (id),
        
	unique index(id)
);

create table tbl_pizza_ingrediente (
	id int not null auto_increment primary key,
    id_ingrediente int not null,
    constraint FK_ingrediente_pizza_ingrediente
		foreign key (id_ingrediente)
        references tbl_ingrediente (id),
    id_pizza int not null,
    constraint FK_pizza_pizza_ingrediente
		foreign key (id_pizza)
        references tbl_pizza (id),
        
	unique index(id)
);

create table tbl_bebida (
	id int not null auto_increment,
    preso_liquido decimal(1) not null,
    id_produto int not null,
    constraint FK_produto_bebida
		foreign key (id_produto)
        references tbl_produto (id),
        
	unique index(id)
);
