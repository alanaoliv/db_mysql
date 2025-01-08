CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produtos(
	id bigint auto_increment primary key,
	nome varchar(255) not null,
	quantidade int, 
	categoria varchar(255),
	preco decimal(6,2)
);

INSERT INTO tb_produtos(nome, quantidade, categoria, preco)
VALUES ("Bebê Reborn", 70, "brinquedos", 125.70),
	   ("Kit Facas", 98, "casa", 39.99),
       ("Carrinho Hot Wheels", 81, "brinquedos", 24.75),
       ("Cafeteira Dolce Gusto", 37, "casa", 174.99),
       ("Notebook Gamer", 48, "eletronicos", 3699.50),
       ("Fone JBL Bluetooth", 77, "eletronicos", 564.15),
       ("Carregador iPhone", 210, "eletronicos", 249.00),
       ("Guarda-roupa Casal", 41, "casa", 799.80);
       
DESC tb_produtos;

SELECT*FROM tb_produtos;

SELECT nome, 
CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS preço FROM tb_produtos;

SELECT*FROM tb_produtos WHERE preco > 500.00;

SELECT*FROM tb_produtos WHERE preco < 500.00;

UPDATE tb_produtos SET quantidade = 72 WHERE id = 6;