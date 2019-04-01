USE CDMUSICA2
GO
--1) Mostrar, numa coluna, o t�tulo de cada CD e de cada uma das m�sicas; 
SELECT CD.TITULO + ': ' + MUSICA.TITULO FROM CD,MUSICA WHERE CD.COD_CD=MUSICA.COD_CD
--2) Copiar e alterar o comando da al�nea anterior, de modo a apresentar tamb�m o comprimento de cada t�tulo e por ordem decrescente; 
SELECT CD.TITULO + ': ' + MUSICA.TITULO,LEN(CD.TITULO),LEN(MUSICA.TITULO) FROM CD,MUSICA WHERE CD.COD_CD=MUSICA.COD_CD ORDER BY LEN(CD.TITULO),LEN(MUSICA.TITULO) DESC
--3) Mostrar a dura��o das m�sicas dos Pink Floyd que s�o iguais � dura��o de m�sicas de outros int�rpretes; 
SELECT DURACAO FROM Musica WHERE interprete='PINK FLOYD' AND duracao IN((SELECT duracao FROM Musica WHERE interprete<>'PINK FLOYD'))
--4) Alterar o comando da al�nea anterior, de modo a mostrar a dura��o das m�sicas por ordem decrescente; 
SELECT DURACAO FROM Musica WHERE interprete='PINK FLOYD' AND duracao IN((SELECT duracao FROM Musica WHERE interprete<>'PINK FLOYD')) ORDER BY duracao DESC
--5) Mostrar o id das editoras que n�o est�o relacionadas com qualquer CD; 
SELECT id_editora FROM EDITORA WHERE NOT EXISTS (SELECT CD.COD_CD FROM CD WHERE CD.id_editora=Editora.ID_EDITORA)
--6) Alterar o comando da al�nea anterior, de modo a mostrar o resultado por ordem decrescente;
SELECT id_editora FROM EDITORA WHERE NOT EXISTS (SELECT CD.COD_CD FROM CD WHERE CD.id_editora=Editora.ID_EDITORA) ORDER BY id_editora DESC
--7) Mostrar apenas a quantidade de CD comprados por local de compra e o respetivo local de compra;  
SELECT * FROM CD
SELECT local_compra as 'Local compra' ,COUNT(*) as 'CD comprados' FROM CD GROUP BY LOCAL_COMPRA
--8) Copiar e alterar o comando da al�nea anterior, de forma a mostrar o resultado por ordem crescente da quantidade de CD comprados;  
SELECT local_compra as 'Local compra' ,COUNT(*) as 'CD comprados' FROM CD GROUP BY LOCAL_COMPRA order by COUNT(*)
--9) Copiar e alterar o comando da al�nea anterior, de forma a n�o mostrar nulos; 
SELECT ISNULL(local_compra,'Desconhecido') as 'Local compra' ,COUNT(*) as 'CD comprados' FROM CD GROUP BY LOCAL_COMPRA order by COUNT(*)
--10) Copiar e alterar o comando da al�nea anterior, de forma a mostrar tamb�m, para cada local de compra, o valor total pago e o maior valor pago; 
--11) Mostrar, para cada CD e respetivos int�rpretes, a quantidade de m�sicas do CD em que o int�rprete participa. Al�m da quantidade referida, tamb�m deve ser apresentado o c�digo do CD e o int�rprete; 
--12) Copiar e alterar o comando da al�nea anterior, de modo a mostrar apenas, o c�digo do CD e o int�rprete; 
--13) Copiar e alterar o comando da al�nea anterior, de modo a mostrar apenas o int�rprete; 
--14) Mostrar a quantidade de CD comprados em cada local de compra; 
--15) Alterar o comando da al�nea anterior, de modo a mostrar apenas as quantidades superiores a 2; 
--16) Mostrar os locais de compra, cujo m�dia do valor pago por CD � inferior a 10, juntamente com o respetivo total do valor pago;
--17) Mostrar o valor total pago nos locais de compra, cuja quantidade de CD comprados � inferior a 2. O local de compra tamb�m deve ser visualizado; 
--18) Mostrar o int�rprete e o c�digo do CD em que o int�rprete participa apenas em 1 m�sica. O resultado deve ser apresentado por ordem crescente do c�digo do CD e, em caso de igualdade, por ordem alfab�tica do int�rprete; 
--19) Copiar e alterar o comando da al�nea anterior, de modo a mostrar apenas os int�rpretes e sem duplicados; 
--20) Copiar e alterar o comando da al�nea anterior, de modo a mostrar apenas os int�rpretes come�ados por E ou L; 
--21) Mostrar, para cada CD, o t�tulo e a quantidade de m�sicas; 
--22) Mostrar, para cada CD, o c�digo, o t�tulo e a quantidade de m�sicas; 
--23) Mostrar, para cada CD, o c�digo, o t�tulo e a quantidade de m�sicas cuja dura��o de pelo menos uma das m�sicas seja superior a 5; 
--24) Mostrar, para cada CD com menos de 6 m�sicas, o c�digo, o t�tulo e a quantidade de m�sicas do CD; 
--25) Mostrar, para cada CD cujas m�sicas t�m uma dura��o m�dia superior a 4, o c�digo, o t�tulo e a quantidade de m�sicas do CD;