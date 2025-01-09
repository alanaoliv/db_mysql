CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes(
	id bigint auto_increment primary key,
    nome_classe varchar(255) NOT NULL, 
    descricao varchar(255)
);

INSERT INTO tb_classes(nome_classe, descricao)
VALUES ('Guerreiro', 'Especialista em combate corpo a corpo, com alta resistência.'),
	   ('Mago', 'Utiliza feitiços poderosos para atacar e defender.'),
	   ('Arqueiro', 'Ataca à distância com precisão e agilidade.'),
	   ('Ladino', 'Mestre em furtividade e ataques rápidos.'),
	   ('Paladino', 'Combina habilidades de combate com cura e proteção divina.');
       
CREATE TABLE tb_personagens(
	id bigint auto_increment primary key,
    nome_personagem varchar(255) NOT NULL, 
    nivel bigint,
    pontuacao bigint, 
    classe_id bigint,
    hp bigint, 
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

SELECT*FROM tb_classes;

ALTER TABLE tb_personagens ADD ataque bigint;
ALTER TABLE tb_personagens ADD defesa bigint;

SELECT*FROM tb_personagens;

INSERT INTO tb_personagens(nome_personagem, nivel, pontuacao, classe_id, hp, ataque, defesa)
VALUES ('Legolas', 12, 2500, 3, 120, 3400, 1800),
	   ('Mycas', 15, 3200, 1, 150, 4200, 3000),
       ('Nannerl', 18, 4200, 5, 180, 1700, 2900),
	   ('Lyra', 20, 5000, 2, 100, 5800, 3200),
       ('Caterine', 22, 5800, 3, 110, 4600, 2100), 
       ('Benedictus', 19, 4700, 2, 95, 4500, 3010),
       ('Briony', 10, 1800, 4, 90, 2700, 1500),
       ('Thorn', 25, 7200, 1, 200, 6700, 4500);
       
SELECT*FROM tb_personagens WHERE ataque >= 2000;

SELECT*FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;

SELECT*FROM tb_personagens WHERE nome_personagem LIKE '%C%';

SELECT*FROM tb_personagens ORDER BY nome_personagem;

SELECT*FROM tb_personagens ORDER BY nivel;

SELECT*FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classe_id = tb_classes.id
ORDER BY nivel DESC;

SELECT*FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.classe_id = tb_classes.id
WHERE classe_id = 2
ORDER BY pontuacao;

SELECT*FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classe_id = tb_classes.id
WHERE nivel IN (18,19,20,22) ORDER BY nivel;