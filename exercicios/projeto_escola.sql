CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE tb_alunos(
	id bigint auto_increment primary key,
    nome varchar(255) not null,
    nascimento date, 
    turma varchar(255) not null,
    nota decimal(2,2)
);

ALTER TABLE tb_alunos MODIFY nota decimal (6,2);

INSERT INTO tb_alunos(nome, nascimento, turma, nota)
VALUES ("Luna", "2011-02-25", "1° A", 9.70),
	   ("Miguel", "2010-11-07", "1° D", 6.25),
       ("Clarissa", "2010-12-10", "2° B", 10.00),
       ("Melina", "2009-03-08", "3° A", 4.40),
       ("Pedro", "2010-05-04", "2° B", 8.95),
       ("Agnes", "2008-07-09", "3° A", 7.90),
       ("Tiago", "2011-03-01", "1° D", 7.10),
       ("Luana", "2009-06-04", "3° B", 6.95);
       
SELECT*FROM tb_alunos;

SELECT nome, DATE_FORMAT (nascimento, '%d/%m/%Y') AS nascimento FROM tb_alunos;
       
SELECT*FROM tb_alunos WHERE nota > 7.0;

SELECT*FROM tb_alunos WHERE nota < 7.0;

UPDATE tb_alunos SET turma = "3° A" WHERE id = 8;