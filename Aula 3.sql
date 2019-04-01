USE CDMUSICA2
GO
--1) Mostrar, numa coluna, o título de cada CD e de cada uma das músicas; 
SELECT CD.TITULO + ': ' + MUSICA.TITULO FROM CD,MUSICA WHERE CD.COD_CD=MUSICA.COD_CD
--2) Copiar e alterar o comando da alínea anterior, de modo a apresentar também o comprimento de cada título e por ordem decrescente; 
SELECT CD.TITULO + ': ' + MUSICA.TITULO,LEN(CD.TITULO),LEN(MUSICA.TITULO) FROM CD,MUSICA WHERE CD.COD_CD=MUSICA.COD_CD ORDER BY LEN(CD.TITULO),LEN(MUSICA.TITULO) DESC
--3) Mostrar a duração das músicas dos Pink Floyd que são iguais à duração de músicas de outros intérpretes; 
SELECT DURACAO FROM Musica WHERE interprete='PINK FLOYD' AND duracao IN((SELECT duracao FROM Musica WHERE interprete<>'PINK FLOYD'))
--4) Alterar o comando da alínea anterior, de modo a mostrar a duração das músicas por ordem decrescente; 
SELECT DURACAO FROM Musica WHERE interprete='PINK FLOYD' AND duracao IN((SELECT duracao FROM Musica WHERE interprete<>'PINK FLOYD')) ORDER BY duracao DESC
--5) Mostrar o id das editoras que não estão relacionadas com qualquer CD; 
SELECT id_editora FROM EDITORA WHERE NOT EXISTS (SELECT CD.COD_CD FROM CD WHERE CD.id_editora=Editora.ID_EDITORA)
--6) Alterar o comando da alínea anterior, de modo a mostrar o resultado por ordem decrescente;
SELECT id_editora FROM EDITORA WHERE NOT EXISTS (SELECT CD.COD_CD FROM CD WHERE CD.id_editora=Editora.ID_EDITORA) ORDER BY id_editora DESC
--7) Mostrar apenas a quantidade de CD comprados por local de compra e o respetivo local de compra;  
SELECT * FROM CD
SELECT local_compra as 'Local compra' ,COUNT(*) as 'CD comprados' FROM CD GROUP BY LOCAL_COMPRA
--8) Copiar e alterar o comando da alínea anterior, de forma a mostrar o resultado por ordem crescente da quantidade de CD comprados;  
SELECT local_compra as 'Local compra' ,COUNT(*) as 'CD comprados' FROM CD GROUP BY LOCAL_COMPRA order by COUNT(*)
--9) Copiar e alterar o comando da alínea anterior, de forma a não mostrar nulos; 
SELECT ISNULL(local_compra,'Desconhecido') as 'Local compra' ,COUNT(*) as 'CD comprados' FROM CD GROUP BY LOCAL_COMPRA order by COUNT(*)
--10) Copiar e alterar o comando da alínea anterior, de forma a mostrar também, para cada local de compra, o valor total pago e o maior valor pago; 
--11) Mostrar, para cada CD e respetivos intérpretes, a quantidade de músicas do CD em que o intérprete participa. Além da quantidade referida, também deve ser apresentado o código do CD e o intérprete; 
--12) Copiar e alterar o comando da alínea anterior, de modo a mostrar apenas, o código do CD e o intérprete; 
--13) Copiar e alterar o comando da alínea anterior, de modo a mostrar apenas o intérprete; 
--14) Mostrar a quantidade de CD comprados em cada local de compra; 
--15) Alterar o comando da alínea anterior, de modo a mostrar apenas as quantidades superiores a 2; 
--16) Mostrar os locais de compra, cujo média do valor pago por CD é inferior a 10, juntamente com o respetivo total do valor pago;
--17) Mostrar o valor total pago nos locais de compra, cuja quantidade de CD comprados é inferior a 2. O local de compra também deve ser visualizado; 
--18) Mostrar o intérprete e o código do CD em que o intérprete participa apenas em 1 música. O resultado deve ser apresentado por ordem crescente do código do CD e, em caso de igualdade, por ordem alfabética do intérprete; 
--19) Copiar e alterar o comando da alínea anterior, de modo a mostrar apenas os intérpretes e sem duplicados; 
--20) Copiar e alterar o comando da alínea anterior, de modo a mostrar apenas os intérpretes começados por E ou L; 
--21) Mostrar, para cada CD, o título e a quantidade de músicas; 
--22) Mostrar, para cada CD, o código, o título e a quantidade de músicas; 
--23) Mostrar, para cada CD, o código, o título e a quantidade de músicas cuja duração de pelo menos uma das músicas seja superior a 5; 
--24) Mostrar, para cada CD com menos de 6 músicas, o código, o título e a quantidade de músicas do CD; 
--25) Mostrar, para cada CD cujas músicas têm uma duração média superior a 4, o código, o título e a quantidade de músicas do CD;