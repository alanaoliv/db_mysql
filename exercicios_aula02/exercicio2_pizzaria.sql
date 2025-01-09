CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
	id bigint auto_increment primary key,
    nome varchar(255) NOT NULL,
    descricao varchar(255)
);

INSERT INTO tb_categorias(nome, descricao)
VALUES  ('Clássicas', 'Pizzas tradicionais e populares, com sabores que agradam a todos.'),
		('Vegetarianas', 'Opções sem carne, com vegetais frescos e combinações saudáveis.'),
		('Premium', 'Pizzas sofisticadas com ingredientes selecionados e de alta qualidade.'),
		('Doces', 'Deliciosas pizzas doces para sobremesas e momentos especiais.'),
		('Veganas', 'Pizzas sem ingredientes de origem animal, ideais para dietas veganas.'),
		('Especiais', 'Sabores exclusivos da casa, com combinações únicas e inovadoras.');
        
SELECT*FROM tb_categorias;

CREATE TABLE tb_pizzas(
	id bigint auto_increment primary key,
    nome varchar(255) NOT NULL,
    categoria_id bigint,
    descricao varchar(255),
    preco decimal(6,2),
    borda_recheada ENUM('sim', 'nao') default 'nao',
    massa ENUM('fina', 'padrao', 'grossa') default 'padrao',
    adicional ENUM('sim', 'nao') default 'nao',
    preco_final decimal(6,2),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_pizzas(nome, categoria_id, descricao, preco, borda_recheada, massa, adicional, preco_final)
VALUES  ('Mussarela', 1, 'Queijo mussarela com molho de tomate.', 39.99, 'nao', 'padrao', 'nao', 39.99),
		('Calabresa', 1, 'Calabresa fatiada, cebola e orégano.', 44.99, 'sim', 'grossa', 'nao', 60.99),
		('Marguerita', 1, 'Queijo mussarela, tomate e manjericão.', 42.00, 'nao', 'padrao', 'nao', 42.00),
		('Frango com Catupiry', 2, 'Frango desfiado com catupiry.', 65.00, 'sim', 'padrao', 'sim', 80.00),
		('Portuguesa', 1, 'Presunto, ovos, cebola, e ervilha.', 60.00, 'nao', 'grossa', 'nao', 65.00),
		('Quatro Queijos', 2, 'Mussarela, gorgonzola, provolone e parmesão.', 70.00, 'sim', 'padrao', 'sim', 85.00),
		('Vegetariana', 3, 'Tomate, cebola, pimentão, e cogumelos.', 50.00, 'nao', 'fina', 'nao', 55.00),
		('Chocolate', 4, 'Pizza doce com chocolate ao leite.', 48.00, 'sim', 'padrao', 'sim', 63.00),
		('Romeu e Julieta', 4, 'Queijo com goiabada.', 47.00, 'nao', 'fina', 'nao', 52.00),
		('Pepperoni', 1, 'Fatias de pepperoni com mussarela.', 65.00, 'sim', 'padrao', 'sim', 80.00),
		('Vegana', 5, 'Legumes frescos com queijo vegano.', 68.00, 'nao', 'fina', 'nao', 73.00),
		('Carne Seca', 2, 'Carne seca com cebola e queijo coalho.', 80.00, 'sim', 'grossa', 'sim', 95.00),
		('Especial da Casa', 6, 'Ingredientes variados, selecionados pelo chef.', 100.00, 'sim', 'padrao', 'sim', 115.00),
		('Prestígio', 4, 'Chocolate ao leite com coco ralado.', 52.00, 'nao', 'fina', 'nao', 57.00),
		('Camarão', 2, 'Camarão ao alho com catupiry.', 85.00, 'sim', 'grossa', 'sim', 105.00);
        
SELECT*FROM tb_pizzas WHERE preco > 45.00;

SELECT*FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

SELECT*FROM tb_pizzas WHERE preco_final BETWEEN 50.00 AND 100.00;

SELECT nome, CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS preço FROM tb_pizzas;

SELECT*FROM tb_pizzas WHERE nome LIKE '%M%';

SELECT*FROM tb_pizzas;

SELECT*FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id;

SELECT*FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id
WHERE categoria_id = 4;

SELECT*FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id
WHERE categoria_id = 3;

SELECT*FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id
WHERE massa = 'grossa';