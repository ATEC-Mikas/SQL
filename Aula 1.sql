USE MusicasBD
GO
--i. Mostrar todos os dados da tabela CD;
SELECT * FROM CD
--ii. Mostrar o título e a data de compra de todos os CD;
SELECT TITULO,DATA_COMPRA FROM CD
--iii. Mostrar a data de compra de todos CD;
SELECT DATA_COMPRA FROM CD
--iv. Mostrar o resultado da alínea anterior, mas sem repetições;
SELECT DISTINCT DATA_COMPRA FROM CD
--v. Mostrar o código do CD e o intérprete de todas as músicas;
SELECT CD.COD_CD,MUSICA.INTERPRETE FROM CD,MUSICA WHERE CD.COD_CD=MUSICA.COD_CD
--vi. Mostrar o resultado da alínea anterior, mas sem repetições;
SELECT DISTINCT CD.COD_CD,MUSICA.INTERPRETE FROM CD,MUSICA WHERE CD.COD_CD=MUSICA.COD_CD
--vii. Mostrar a data de compra de todos os CD com o resultado intitulado "Data de Compra";
SELECT DATA_COMPRA as 'Data de compra' FROM CD
--viii. Mostrar o título, o valor pago e o respetivo valor do IVA de todos os CD. O valor do IVA é calculado de acordo com a seguinte fórmula: valor do IVA = valor pago * 0.23;
SELECT TITULO,VALOR_PAGO,VALOR_PAGO*0.23 AS 'Valor IVA' FROM CD
--ix. Mostrar todos os dados de todas as músicas do CD com o código 2;
SELECT * FROM MUSICA WHERE COD_CD=2
--x. Mostrar todos os dados de todas as músicas que não pertencem ao CD com o código 2;
SELECT * FROM MUSICA WHERE COD_CD<>2
-- xi. Mostrar todos os dados de todas as músicas do CD com o código 2 cuja duração seja superior a 5;
SELECT * FROM MUSICA WHERE DURACAO>5 AND COD_CD=2
-- xii. Mostrar todos os dados das músicas do CD com o código 2 cuja duração pertença ao intervalo [4,6];
SELECT * FROM MUSICA WHERE COD_CD=2  AND DURACAO BETWEEN 4 AND 6
-- xiii. Mostrar todos os dados das músicas do CD com o código 2 cuja duração seja inferior a 4 ou superior a 6;
SELECT * FROM MUSICA WHERE COD_CD=2  AND NOT DURACAO BETWEEN 4 AND 6
-- xiv. Mostrar todos os dados das músicas com os números: 1, 3, 5 ou 6;
SELECT * FROM MUSICA WHERE NR_MUSICA IN(1,3,5,6)
-- xv. Mostrar todos os dados das músicas com os números diferentes de 1, 3, 5 e 6;
SELECT * FROM MUSICA WHERE NOT NR_MUSICA IN(1,3,5,6)
-- xvi. Mostrar os títulos dos CD comprados na FNAC;
SELECT TITULO FROM CD WHERE LOCAL_COMPRA='FNAC'
-- xvii. Mostrar os títulos dos CD que não foram comprados na FNAC;
SELECT TITULO FROM CD WHERE NOT LOCAL_COMPRA='FNAC'
-- xviii. Mostrar todos os dados das músicas cujo intérprete é uma orquestra;
SELECT * FROM MUSICA WHERE INTERPRETE LIKE 'Orquestra%'
-- xix. Mostrar todos os dados das músicas cujo intérprete tem um Y;
SELECT * FROM MUSICA WHERE INTERPRETE LIKE '%[Yy]%'
-- xx. Mostrar todos os dados das músicas cujo nome termina com DAL?, sendo ? qualquer caráter;
SELECT * FROM MUSICA WHERE TITULO LIKE '%DAL_'
-- xxi. Mostrar todos os dados das músicas cujo título tem o caráter %;
SELECT * FROM MUSICA WHERE TITULO LIKE '%[%]%'
-- xxii. Mostrar todos os dados das músicas cujo título é iniciado pela letra B, D ou H;
SELECT * FROM MUSICA WHERE TITULO LIKE '[BDH]%'
-- xxiii. Mostrar todos os dados dos CD sem o local de compra registado;
SELECT * FROM CD WHERE LOCAL_COMPRA IS NULL
-- xxiv. Mostrar todos os dados dos CD com o local de compra registado;
SELECT * FROM CD WHERE LOCAL_COMPRA IS NOT NULL
--b. Ordenações
--i. Mostrar o título e a data de compra dos CD, por ordem alfabética do título do CD;
SELECT TITULO,DATA_COMPRA FROM CD ORDER BY TITULO
--ii. Mostrar o título e a data de compra dos CD, por ordem descendente da data de compra do CD;
SELECT TITULO,DATA_COMPRA FROM CD ORDER BY DATA_COMPRA DESC
--iii. Mostrar o título e o local de compra dos CD, por ordem ascendente do local de compra do CD;
SELECT TITULO,LOCAL_COMPRA FROM CD ORDER BY LOCAL_COMPRA ASC
--iv. Mostrar o resultado da alínea anterior, mas por ordem descendente do local de compra do CD;
SELECT TITULO,LOCAL_COMPRA FROM CD ORDER BY LOCAL_COMPRA DESC
-- v. Mostrar o título, o valor pago e o respetivo valor do IVA dos CD, por ordem decrescente do IVA;
SELECT TITULO,VALOR_PAGO,VALOR_PAGO*0.23 AS 'Valor IVA' FROM CD ORDER BY 'Valor Iva' DESC
-- vi. Mostrar o título do CD por ordem descendente da data de compra e, no caso da igualdade de datas, por ordem alfabética do título.
SELECT TITULO FROM CD ORDER BY DATA_COMPRA DESC,TITULO ASC
--c. Funções de agregação
--i. Mostrar o título do CD e o título das músicas de todos os CD;
SELECT CD.COD_CD,CD.TITULO,MUSICA.TITULO FROM CD,MUSICA WHERE CD.COD_CD=MUSICA.COD_CD
--ii. Mostrar o título do CD e o título da música com o número 1 de cada CD;
SELECT CD.COD_CD,CD.TITULO,MUSICA.TITULO FROM CD,MUSICA WHERE CD.COD_CD=MUSICA.COD_CD AND MUSICA.nr_musica=1
--iii. Mostrar o número, o título e a duração, de todas as músicas do CD com o título Punkzilla
SELECT MUSICA.NR_MUSICA,MUSICA.TITULO,MUSICA.DURACAO FROM CD,MUSICA WHERE CD.COD_CD=MUSICA.COD_CD AND CD.titulo='Punkzilla'