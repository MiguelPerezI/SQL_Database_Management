USE mexicoData;

--SELECT
--	TOP 20      
--      CASE
--              WHEN ENTIOCUR = 1       THEN N'Aguascalientes'
--              WHEN ENTIOCUR = 2       THEN N'Baja California'
--              WHEN ENTIOCUR = 3       THEN N'Baja California Sur'
--              WHEN ENTIOCUR = 4       THEN N'Campeche'
--              WHEN ENTIOCUR = 5       THEN N'Coahuila de Zaragoza'
--              WHEN ENTIOCUR = 6       THEN N'Colima'
--              WHEN ENTIOCUR = 7       THEN N'Chiapas'
--              WHEN ENTIOCUR = 8       THEN N'Chihuahua'
--              WHEN ENTIOCUR = 9       THEN N'CDMX'
--              WHEN ENTIOCUR = 10      THEN N'Durango'
--              WHEN ENTIOCUR = 11      THEN N'Guanajuato'
--              WHEN ENTIOCUR = 12      THEN N'Guerrero'
--              WHEN ENTIOCUR = 13      THEN N'Hidalgo'
--              WHEN ENTIOCUR = 14      THEN N'Jalisco'
--              WHEN ENTIOCUR = 15      THEN N'México'
--              WHEN ENTIOCUR = 16      THEN N'Michuacán de Ocampo'
--              WHEN ENTIOCUR = 17      THEN N'Morelos'
--              WHEN ENTIOCUR = 18      THEN N'Nayarit'
--              WHEN ENTIOCUR = 19      THEN N'Nuevo León'
--              WHEN ENTIOCUR = 20      THEN N'Oaxaca'
--              WHEN ENTIOCUR = 21      THEN N'Puebla'
--              WHEN ENTIOCUR = 22      THEN N'Querétaro'
--              WHEN ENTIOCUR = 23      THEN N'Quintana Roo'
--              WHEN ENTIOCUR = 24      THEN N'San Luis Potosí'
--              WHEN ENTIOCUR = 25      THEN N'Sinaloa'
--              WHEN ENTIOCUR = 26      THEN N'Sonora'
--              WHEN ENTIOCUR = 27      THEN N'Tabasco'
--              WHEN ENTIOCUR = 28      THEN N'Tamaulipas'
--              WHEN ENTIOCUR = 29      THEN N'Tlaxcala'
--              WHEN ENTIOCUR = 30      THEN N'Veracruz'
--              WHEN ENTIOCUR = 31      THEN N'Yucatán'
--              WHEN ENTIOCUR = 32      THEN N'Zacatecas'
--                              
--              END AS Entidad,
--      DELIRIE8 AS Delito,
--      CASE
--              WHEN ELE_COMI = 0       THEN N'No aplica'
--              WHEN ELE_COMI = 1       THEN N'Arma de Fuego'
--              WHEN ELE_COMI = 2       THEN N'Arma Blanca'
--              WHEN ELE_COMI = 3       THEN N'Putazos'
--              WHEN ELE_COMI = 4       THEN N'Con Vehiculo'
--              WHEN ELE_COMI = 5       THEN N'Electronico o Informatico'
--              WHEN ELE_COMI = 6       THEN N'Otro Instrumento'
--              WHEN ELE_COMI = 7       THEN N'No Identificado'
--      END AS Arma,
--      FORMACCI AS Violencia,
--      GDOCONSU AS Intento,
--      CASE 
--              WHEN CALIFDEL = 1       THEN N'Grave'
--              WHEN CALIFDEL = 2       THEN N'No Grave'
--              WHEN CALIFDEL = 3       THEN N'No identificado'
--      END AS Gravedad,
--      FEC_OCUR AS Fecha
--FROM	Delitos
--WHERE 	ENTIOCUR != 99
--ORDER BY NEWID();

--SELECT TOP 20 ENTIOCUR AS Entidad, MUNOCURR
--FROM Delitos
--WHERE ENTIOCUR = 13
--ORDER BY NEWID();




--DECLARE @suma INT;
--SET @suma = (SELECT SUM(derivada.Num_Crimenes)
--FROM
--(SELECT TOP 20 MUNOCURR, COUNT(MUNOCURR) AS Num_Crimenes
--FROM DelitosHidalgo
--GROUP BY MUNOCURR
--ORDER BY NEWID()) AS derivada);
--
--DECLARE @sumaf float;
--SET @sumaf = CONVERT(FLOAT, @suma)
--PRINT N'--->suma := ' + CONVERT(VARCHAR, @suma) + N'/20 := ' + CONVERT(VARCHAR, @sumaf/20.0);



DECLARE @tableA TABLE(MUNOCURR VARCHAR(10), Numero_Delitos INT);
INSERT @tableA(MUNOCURR, Numero_Delitos)
SELECT TOP 20 MUNOCURR, COUNT(MUNOCURR) AS Numero_Delitos
FROM DelitosHidalgo
GROUP BY MUNOCURR
ORDER BY NEWID();

DECLARE @mean INT;
SET @mean = (SELECT SUM(Numero_Delitos) FROM @tableA);

DECLARE @meanf float;
SET @meanf = CONVERT(FLOAT, @mean);
PRINT N'--->suma := ' + CONVERT(VARCHAR, @mean) + N'/20 := ' + CONVERT(VARCHAR, @meanf/20.0);

SELECT * FROM @tableA;





