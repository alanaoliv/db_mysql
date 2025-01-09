CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias(
	id bigint auto_increment PRIMARY KEY, 
    categoria varchar(255) NOT NULL,
    descricao varchar(255)
);

CREATE TABLE tb_preparos(
	id bigint auto_increment PRIMARY KEY,
	preparo_indicado varchar(255) NOT NULL,
    descricao varchar(300)
);


CREATE TABLE tb_produtos(
	id bigint auto_increment PRIMARY KEY, 
    corte varchar(255) NOT NULL, 
    preco_kg decimal(6,2),
    data_validade date, 
    peso_kg int,
    categoria_id bigint,
    preparo_id bigint,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id),
    FOREIGN KEY (preparo_id) REFERENCES tb_preparos(id)
);

ALTER TABLE tb_produtos DROP peso_kg;

INSERT INTO tb_categorias(categoria, descricao)
VALUES  ('Frango', 'Carnes de aves, como frango inteiro, filé e coxas.'),
		('Bovinos', 'Carnes de gado, incluindo cortes tradicionais e premium.'),
		('Suínos', 'Cortes de carne de porco, como lombo, pernil e costelinha.'),
		('Embutidos', 'Produtos como linguiças, salsichas e salames.'),
		('Carnes Exóticas', 'Cortes diferenciados como cordeiro, javali e coelho.'),
		('Miúdos', 'Cortes como fígado, coração, moela e outros derivados.');
        
INSERT INTO tb_preparos(preparo_indicado, descricao)
VALUES  ('Assado', 'Ideal para cortes como costela, lombo ou frango inteiro. Recomenda-se temperar e cozinhar em forno ou churrasqueira.'),
		('Grelhado', 'Indicado para cortes como filé de peito, picanha ou contra-filé. Preparado em frigideira ou grelha com alta temperatura.'),
		('Cozido', 'Perfeito para carnes mais duras, como músculo ou rabada. Geralmente preparado em panela de pressão.'),
		('Frito', 'Recomendado para bifes, linguiças ou miúdos. Preparação simples em frigideira com óleo.'),
		('Ensopado', 'Ótimo para cortes como costela ou frango em pedaços. Preparado com caldos e vegetais.'),
		('Churrasco', 'Modo de preparo clássico para cortes como picanha, maminha ou linguiças. Feito em churrasqueira ou grelha.'),
		('Cru (Carpaccio/Tártaro)', 'Indicado para carnes frescas e macias, como filé mignon. Requer cortes finos e preparo delicado.');
        
INSERT INTO tb_produtos(corte, preco_kg, data_validade, categoria_id, preparo_id)
VALUES  ('Peito de Frango', 15.50, '2025-02-01', 1, 2),
		('Coxa e Sobrecoxa', 13.90, '2025-02-05', 1, 5),
		('Picanha', 79.99, '2025-01-20', 2, 6),
		('Contra-filé', 55.00, '2025-01-25', 2, 2),
		('Costelinha Suína', 39.90, '2025-02-10', 3, 1),
		('Linguiça Toscana', 25.50, '2025-01-30', 4, 6),
		('Rabada', 18.00, '2025-02-15', 2, 3),
		('Filé Mignon', 89.99, '2025-01-18', 2, 7),
		('Coração de Galinha', 12.50, '2025-01-28', 6, 4),
		('Costela Bovina', 34.90, '2025-02-12', 2, 1), 
		('Frango Inteiro', 12.00, '2025-01-30', 1, 1), 
		('Músculo', 18.90, '2025-02-25', 2, 3),
		('Moela de Frango', 9.50, '2025-01-28', 6, 4);
        
SELECT*FROM tb_produtos;

SELECT*FROM tb_produtos WHERE preco_kg > 50.00;

SELECT*FROM tb_produtos WHERE preco_kg BETWEEN 50.00 AND 150.00;

SELECT*FROM tb_produtos WHERE preco_kg < 50.00;

SELECT*FROM tb_produtos WHERE corte LIKE '%c%';

SELECT*FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

SELECT*FROM tb_produtos INNER JOIN tb_preparos
ON tb_produtos.preparo_id = tb_preparos.id;

SELECT*FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE categoria_id = 3;

SELECT*FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE categoria_id = 2;

SELECT*FROM tb_produtos INNER JOIN tb_preparos
ON tb_produtos.preparo_id = tb_preparos.id
WHERE preparo_id = 6;

SELECT tb_categorias.categoria, avg(preco_kg) as preco_medio
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY tb_categorias.categoria
ORDER BY categoria;

SELECT tb_preparos.preparo_indicado, avg(preco_kg) as preco_medio
FROM tb_produtos INNER JOIN tb_preparos
ON tb_produtos.preparo_id = tb_preparos.id
GROUP BY tb_preparos.preparo_indicado
ORDER BY preparo_indicado DESC;

