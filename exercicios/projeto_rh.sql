CREATE DATABASE db_rh;

USE db_rh;

CREATE TABLE tb_funcionarios(
	id bigint auto_increment,
    nome varchar(255) not null,
    cargo varchar(255),
    departamento varchar(255),
    salario decimal(6,2),
    primary key(id)
);

INSERT INTO tb_funcionarios(nome, cargo, departamento, salario)
VALUES ("Roberto", "Gerente", "Operacional", 3900.00),
	   ("Celina", "Gerente", "TI", 4700.00),
       ("Lilian", "Analista de CX Jr", "Operacional", 1900.00),
       ("Bruno", "Analista de CX Senior", "Operacional", 3000.00),
       ("Carla", "Analista de CX Jr", "Operacional", 1900.00);
       
SELECT*FROM tb_funcionarios WHERE salario > 2000.00;

SELECT*FROM tb_funcionarios WHERE salario < 2000.00;

SELECT nome, 
CONCAT('R$', FORMAT(salario, 2, 'pt_BR')) AS salário FROM tb_funcionarios;

UPDATE tb_funcionarios SET nome = "Tobias" WHERE id = 1;