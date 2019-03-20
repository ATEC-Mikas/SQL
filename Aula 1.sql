--i. Mostrar todos os dados da tabela CD;
SELECT * FROM CD
--ii. Mostrar o t�tulo e a data de compra de todos os CD;
SELECT TITULO,DATA_COMPRA FROM CD
--iii. Mostrar a data de compra de todos CD;
SELECT DATA_COMPRA FROM CD
--iv. Mostrar o resultado da al�nea anterior, mas sem repeti��es;
SELECT DISTINCT DATA_COMPRA FROM CD
--v. Mostrar o c�digo do CD e o int�rprete de todas as m�sicas;
SELECT CD.COD_CD,MUSICA.INTERPRETE FROM CD,MUSICA WHERE CD.COD_CD=MUSICA.COD_CD
--vi. Mostrar o resultado da al�nea anterior, mas sem repeti��es;
SELECT DISTINCT CD.COD_CD,MUSICA.INTERPRETE FROM CD,MUSICA WHERE CD.COD_CD=MUSICA.COD_CD
--vii. Mostrar a data de compra de todos os CD com o resultado intitulado "Data de Compra";
SELECT DATA_COMPRA as 'Data de compra' FROM CD
--viii. Mostrar o t�tulo, o valor pago e o respetivo valor do IVA de todos os CD. O valor do IVA � calculado de acordo com a seguinte f�rmula: valor do IVA = valor pago * 0.23;
SELECT TITULO,VALOR_PAGO,VALOR_PAGO*0.23 AS 'Valor IVA' FROM CD
--ix. Mostrar todos os dados de todas as m�sicas do CD com o c�digo 2;
SELECT * FROM MUSICA WHERE COD_CD=2
--x. Mostrar todos os dados de todas as m�sicas que n�o pertencem ao CD com o c�digo 2;
SELECT * FROM MUSICA WHERE COD_CD<>2
-- xi. Mostrar todos os dados de todas as m�sicas do CD com o c�digo 2 cuja dura��o seja superior a 5;
SELECT * FROM MUSICA WHERE DURACAO>5 AND COD_CD=2
-- xii. Mostrar todos os dados das m�sicas do CD com o c�digo 2 cuja dura��o perten�a ao intervalo [4,6];
SELECT * FROM MUSICA WHERE COD_CD=2  AND DURACAO BETWEEN 4 AND 6
-- xiii. Mostrar todos os dados das m�sicas do CD com o c�digo 2 cuja dura��o seja inferior a 4 ou superior a 6;
SELECT * FROM MUSICA WHERE COD_CD=2  AND NOT DURACAO BETWEEN 4 AND 6
-- xiv. Mostrar todos os dados das m�sicas com os n�meros: 1, 3, 5 ou 6;
SELECT * FROM MUSICA WHERE NR_MUSICA IN(1,3,5,6)
-- xv. Mostrar todos os dados das m�sicas com os n�meros diferentes de 1, 3, 5 e 6;
SELECT * FROM MUSICA WHERE NOT NR_MUSICA IN(1,3,5,6)
-- xvi. Mostrar os t�tulos dos CD comprados na FNAC;
SELECT TITULO FROM CD WHERE LOCAL_COMPRA='FNAC'
-- xvii. Mostrar os t�tulos dos CD que n�o foram comprados na FNAC;
SELECT TITULO FROM CD WHERE NOT LOCAL_COMPRA='FNAC'
-- xviii. Mostrar todos os dados das m�sicas cujo int�rprete � uma orquestra;
SELECT * FROM MUSICA WHERE INTERPRETE LIKE 'Orquestra%'
-- xix. Mostrar todos os dados das m�sicas cujo int�rprete tem um Y;
SELECT * FROM MUSICA WHERE INTERPRETE LIKE '%[Yy]%'
-- xx. Mostrar todos os dados das m�sicas cujo nome termina com DAL?, sendo ? qualquer car�ter;
SELECT * FROM MUSICA WHERE TITULO LIKE '%DAL_'
-- xxi. Mostrar todos os dados das m�sicas cujo t�tulo tem o car�ter %;
SELECT * FROM MUSICA WHERE TITULO LIKE '%[%]%'
-- xxii. Mostrar todos os dados das m�sicas cujo t�tulo � iniciado pela letra B, D ou H;
SELECT * FROM MUSICA WHERE TITULO LIKE '[BDH]%'
-- xxiii. Mostrar todos os dados dos CD sem o local de compra registado;
SELECT * FROM CD WHERE LOCAL_COMPRA IS NULL
-- xxiv. Mostrar todos os dados dos CD com o local de compra registado;
SELECT * FROM CD WHERE LOCAL_COMPRA IS NOT NULL