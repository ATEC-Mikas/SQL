--criar base de dados

CREATE DATABASE Campeonato
GO
USE Campeonato
GO

--criar tabelas

CREATE TABLE Equipa (
    id_equipa   INTEGER     CONSTRAINT pk_equipa_id_equipa PRIMARY KEY,
    nome        VARCHAR(40) CONSTRAINT nn_equipa_nome NOT NULL,
    cidade      VARCHAR(30) CONSTRAINT nn_equipa_cidade NOT NULL,
    diretor     VARCHAR(40) CONSTRAINT nn_equipa_diretor NOT NULL
)

CREATE TABLE Treinador (
    id_treinador INTEGER     CONSTRAINT pk_treinador_id_treinador PRIMARY KEY,
    nome         VARCHAR(40) CONSTRAINT nn_treinador_nome NOT NULL,
    idade        INTEGER,
    telefone     VARCHAR(15) CONSTRAINT nn_treinador_telefone NOT NULL
)

GO

CREATE TABLE Bola (
    referencia  VARCHAR(10),
    id_equipa   INTEGER,     --CONSTRAINT fk_bola_id_equipa REFERENCES Equipa(id_equipa),
    fabricante  VARCHAR(40) CONSTRAINT nn_bola_fabricante NOT NULL,
    CONSTRAINT pk_bola_referencia_id_equipa PRIMARY KEY (id_equipa, referencia)
)

CREATE TABLE Experiencia (
    id_equipa       INTEGER,     --CONSTRAINT fk_experiencia_id_equipa REFERENCES equipas(id_equipa),
    id_treinador    INTEGER,     --CONSTRAINT fk_experiencia_id_treinador REFERENCES treinadores(id_treinador),
    escalao         VARCHAR(40),
    anos            INTEGER,
    CONSTRAINT pk_experien_id_equip_trein_tip PRIMARY KEY (id_equipa, id_treinador, escalao)
)

ALTER TABLE Bola           ADD CONSTRAINT fk_bola_id_equipa           FOREIGN KEY (id_equipa) REFERENCES Equipa(id_equipa);
ALTER TABLE Experiencia    ADD CONSTRAINT fk_experiencia_id_equipa    FOREIGN KEY (id_equipa) REFERENCES Equipa(id_equipa);
ALTER TABLE Experiencia    ADD CONSTRAINT fk_experiencia_id_treinador FOREIGN KEY (id_treinador) REFERENCES Treinador(id_treinador);

--preencher tabelas

INSERT INTO Treinador VALUES(1, 'António', 34, 922424561),
							(2, 'Barbosa', 45, 965552936),
							(3, 'Tavares', 48, 933332267),
							(4, 'Joaquim', 57, 918638465),
							(5, 'Alberto', 33, 966785309),
							(6, 'Duarte', 54, 912773446)

INSERT INTO Equipa VALUES(12, 'Académico', 'Porto', 'Mário'),
							(15, 'Universitário', 'Coimbra', 'João'),
							(20, 'Juventude', 'Braga', 'Silva'),
							(24, 'Tigres', 'Espinho', 'Cardoso')
GO

INSERT INTO Bola VALUES(1, 12, 'Adidas'),
						(9, 12, 'Reebok'),
						(13, 12, 'Adidas'),
						(1, 15, 'Adidas'),
						(3, 20, 'Olimpic'),
						(4, 20, 'Nike'),
						(18, 24, 'Reebok'),
						(21, 24, 'Olimpic')

INSERT INTO Experiencia VALUES(12, 1, 'juniores', 10),
								(12, 1, 'seniores', 5),
								(12, 2, 'iniciados', 2),
								(12, 2, 'juniores', 3),
								(12, 2, 'juvenis', 4),
								(15, 3, 'juniores', 15),
								(24, 5, 'juvenis', 12)
								
