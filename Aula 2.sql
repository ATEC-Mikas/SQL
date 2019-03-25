USE CAMPEONATO
GO
--a. Sele��es simples
--i. Mostrar todos os dados da tabela Equipas;
SELECT * FROM EQUIPA
--ii. Mostrar todos os dados da equipa com o id igual a 12;
SELECT * FROM EQUIPA WHERE EQUIPA.ID_EQUIPA=12
--iii. Mostrar o id e o nome de todas as equipas;
SELECT ID_EQUIPA,NOME FROM EQUIPA
--iv. Mostrar o id, o nome e a idade dos treinadores com menos de 40 anos de idade;
SELECT ID_TREINADOR,NOME,IDADE FROM TREINADOR WHERE IDADE<40
--v. Mostrar todos os dados da tabela Experiencias relativos aos treinadores que treinaram juniores ou que tenham mais do que 10 anos de experi�ncia;
SELECT * FROM EXPERIENCIA WHERE ESCALAO='JUNIORES' OR ANOS>10
--vi. Mostrar todos os dados dos treinadores com idade pertencente ao intervalo [45, 53] e por ordem decrescente da idade;
SELECT * FROM TREINADOR WHERE IDADE BETWEEN 45 AND 53 ORDER BY IDADE DESC
--vii. Mostrar todos os dados das bolas dos fabricantes Reebok e Olimpic;
SELECT * FROM BOLA WHERE FABRICANTE IN('REEBOK','OLIMPIC')
--viii. Mostrar todos os dados dos treinadores cujo nome come�a pela letra A.
SELECT * FROM TREINADOR WHERE NOME LIKE 'A%'
--b. Fun��es de agrega��o
--i. Mostrar a quantidade de equipas que disputam o campeonato;
SELECT COUNT(*) AS 'QUANTIDADE EQUIPAS' FROM EQUIPA
--ii. Mostrar a quantidade de fabricantes distintos que produzem bolas usadas no campeonato;
SELECT COUNT(DISTINCT FABRICANTE) AS 'FABRICANTES DISTINTOS' FROM BOLA
--iii. Mostrar a quantidade de treinadores com idade superior a 40 anos;
SELECT COUNT(*) AS 'TREINADORES IDADE SUPERIOR A 40' FROM TREINADOR WHERE IDADE>40
--c. Sele��es em m�ltiplas tabelas � Jun��es (joins)
--i. Mostrar o id das equipas que utilizam bolas do fabricante Adidas;
SELECT EQUIPA.ID_EQUIPA,EQUIPA.NOME FROM EQUIPA,BOLA WHERE EQUIPA.ID_EQUIPA=BOLA.ID_EQUIPA AND FABRICANTE = 'ADIDAS'
--ii. Mostrar o resultado da al�nea anterior, mas sem repeti��es;
SELECT DISTINCT EQUIPA.ID_EQUIPA,EQUIPA.NOME FROM EQUIPA,BOLA WHERE EQUIPA.ID_EQUIPA=BOLA.ID_EQUIPA AND FABRICANTE = 'ADIDAS'
--iii. Mostrar a m�dia das idades dos treinadores de juvenis;
SELECT AVG(IDADE) AS 'MEDIA IDADES' FROM TREINADOR,EXPERIENCIA WHERE TREINADOR.ID_TREINADOR=EXPERIENCIA.ID_TREINADOR AND ESCALAO='JUVENIS'
--iv. Mostrar todos os dados dos treinadores que treinaram juniores durante 5 ou mais anos;
SELECT TREINADOR.* FROM TREINADOR,EXPERIENCIA WHERE TREINADOR.ID_TREINADOR=EXPERIENCIA.ID_TREINADOR AND (ANOS>=5 AND ESCALAO='JUNIORES')
--v. Mostrar todos os dados dos treinadores e das equipas por eles treinadas;
SELECT DISTINCT TREINADOR.*,EQUIPA.* FROM TREINADOR,EXPERIENCIA,EQUIPA WHERE TREINADOR.ID_TREINADOR=EXPERIENCIA.ID_TREINADOR AND EXPERIENCIA.ID_EQUIPA=EQUIPA.ID_EQUIPA
--vi. Mostrar os nomes e os telefones dos treinadores e os nomes das equipas por eles treinadas;
SELECT DISTINCT TREINADOR.NOME,TREINADOR.TELEFONE,EQUIPA.NOME FROM TREINADOR,EXPERIENCIA,EQUIPA WHERE TREINADOR.ID_TREINADOR=EXPERIENCIA.ID_TREINADOR AND EXPERIENCIA.ID_EQUIPA=EQUIPA.ID_EQUIPA
--vii. Mostrar todos os dados da equipa do Acad�mico e dos respetivos treinadores;
SELECT DISTINCT TREINADOR.*,EQUIPA.* FROM TREINADOR,EXPERIENCIA,EQUIPA WHERE TREINADOR.ID_TREINADOR=EXPERIENCIA.ID_TREINADOR AND EXPERIENCIA.ID_EQUIPA=EQUIPA.ID_EQUIPA AND EQUIPA.NOME='ACAD�MICO'
--viii. Mostrar a idade do treinador mais velho do Acad�mico;
SELECT DISTINCT TOP(1) TREINADOR.IDADE AS 'TREINADOR MAIS VELHO' FROM TREINADOR,EXPERIENCIA,EQUIPA WHERE TREINADOR.ID_TREINADOR=EXPERIENCIA.ID_TREINADOR AND EXPERIENCIA.ID_EQUIPA=EQUIPA.ID_EQUIPA AND EQUIPA.NOME='ACAD�MICO' ORDER BY IDADE DESC
--ix. Mostrar o total de anos de experi�ncia do treinador Ant�nio do Acad�mico
SELECT DISTINCT SUM(ANOS) AS 'ANOS DE EXPERIENCIA DO TREINADOR ANT�NIO' FROM TREINADOR,EXPERIENCIA,EQUIPA WHERE TREINADOR.ID_TREINADOR=EXPERIENCIA.ID_TREINADOR AND EXPERIENCIA.ID_EQUIPA=EQUIPA.ID_EQUIPA AND EQUIPA.NOME='ACAD�MICO' AND TREINADOR.NOME='ANT�NIO' GROUP BY TREINADOR.ID_TREINADOR
