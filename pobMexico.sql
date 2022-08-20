USE mexicoData;

--Count an element/object in a column
-- SELECT DISTINCT COUNT(year) AS clas
-- FROM landingsData
-- WHERE year = @y;

--19.6528, 99.2231

--SELECT	TOP 100 der2.name, der2.year, der2.recclass, der2.Distance, der2.mass
--FROM(
--	SELECT 	TOP 100 derivedImpact.Distance, derivedImpact.name, derivedImpact.year, derivedImpact.mass, derivedImpact.recclass
--	FROM (
--		SELECT 	*, 
--			SQRT((GeoLocationX-19.6528)*(GeoLocationX-19.6528) + (GeoLocationY+99.2231)*(GeoLocationY+99.2231)) AS Distance
--		FROM meteorites
--	) AS 	derivedImpact
--	WHERE 	derivedImpact.Distance IS NOT NULL
--	ORDER BY Distance
--    ) AS der2
--WHERE der2.year = 1969;

--SELECT  * INTO izacalli_2
--FROM izacalli1
--WHERE Distance IS NOT NULL
--ORDER BY Distance;

--ID,ENTIDAD,NOM_ENT ,DISTRITO,INDIGENA,POBTOT,POBFEM,POBMAS,PCLIM_RE_C,GRAPROES,   PEA,PE_INAC,TVIVPAR
--SELECT ENTIDAD,NOM_ENT AS Estado, DISTRITO,INDIGENA, PCLIM_RE_C AS Bajo_IQ, GRAPROES AS GradoEstudios 
--FROM PobMexico_0
--WHERE INDIGENA = 'SI'
--GROUP BY ENTIDAD
--ORDER BY PEA;

--SELECT
--	
--	CASE
--		WHEN ENTIOCUR = 1       THEN N'Aguascalientes'
--		WHEN ENTIOCUR =	2	THEN N'Baja California'
--		WHEN ENTIOCUR = 3	THEN N'Baja California Sur'
--		WHEN ENTIOCUR = 4	THEN N'Campeche'
--		WHEN ENTIOCUR = 5	THEN N'Coahuila de Zaragoza'
--		WHEN ENTIOCUR = 6	THEN N'Colima'
--		WHEN ENTIOCUR = 7	THEN N'Chiapas'
--		WHEN ENTIOCUR = 8	THEN N'Chihuahua'
--		WHEN ENTIOCUR = 9	THEN N'CDMX'
--		WHEN ENTIOCUR = 10	THEN N'Durango'
--		WHEN ENTIOCUR = 11	THEN N'Guanajuato'
--		WHEN ENTIOCUR = 12	THEN N'Guerrero'
--		WHEN ENTIOCUR = 13 	THEN N'Hidalgo'
--		WHEN ENTIOCUR = 14	THEN N'Jalisco'
--		WHEN ENTIOCUR = 15	THEN N'México'
--		WHEN ENTIOCUR = 16	THEN N'Michuacán de Ocampo'
--		WHEN ENTIOCUR = 17	THEN N'Morelos'
--		WHEN ENTIOCUR = 18	THEN N'Nayarit'
--		WHEN ENTIOCUR = 19	THEN N'Nuevo León'
--		WHEN ENTIOCUR = 20	THEN N'Oaxaca'
--		WHEN ENTIOCUR = 21	THEN N'Puebla'
--		WHEN ENTIOCUR = 22	THEN N'Querétaro'
--		WHEN ENTIOCUR = 23	THEN N'Quintana Roo'
--		WHEN ENTIOCUR = 24	THEN N'San Luis Potosí'
--		WHEN ENTIOCUR = 25	THEN N'Sinaloa'
--		WHEN ENTIOCUR = 26	THEN N'Sonora'
--		WHEN ENTIOCUR = 27	THEN N'Tabasco'
--		WHEN ENTIOCUR = 28	THEN N'Tamaulipas'
--		WHEN ENTIOCUR = 29	THEN N'Tlaxcala'
--		WHEN ENTIOCUR = 30	THEN N'Veracruz'
--		WHEN ENTIOCUR = 31	THEN N'Yucatán'
--		WHEN ENTIOCUR = 32	THEN N'Zacatecas'
--				
--		END AS Entidad,
--	DELIRIE8 AS Delito,
--	CASE
--		WHEN ELE_COMI = 0	THEN N'No aplica'
--		WHEN ELE_COMI = 1	THEN N'Arma de Fuego'
--		WHEN ELE_COMI = 2       THEN N'Arma Blanca'
--		WHEN ELE_COMI = 3       THEN N'Putazos'
--		WHEN ELE_COMI = 4       THEN N'Con Vehiculo'
--		WHEN ELE_COMI = 5       THEN N'Electronico o Informatico'
--		WHEN ELE_COMI = 6       THEN N'Otro Instrumento'
--		WHEN ELE_COMI = 7       THEN N'No Identificado'
--	END AS Arma,
--	FORMACCI AS Violencia,
--	GDOCONSU AS Intento,
--	CASE 
--		WHEN CALIFDEL = 1	THEN N'Grave'
--		WHEN CALIFDEL = 2       THEN N'No Grave'
--		WHEN CALIFDEL = 3       THEN N'No identificado'
--	END AS Gravedad,
--	FEC_OCUR AS Fecha
--FROM
--	Delitos
--WHERE	
--	DELIRIE8 = 10400;
--

--SELECT DELIRIE8, COUNT(DELIRIE8) AS Ocurrence 
--FROM Delitos
--GROUP BY DELIRIE8
--ORDER BY COUNT(DELIRIE8) DESC;

SELECT FEC_OCUR, COUNT(FEC_OCUR) AS Ocurrence
FROM Delitos
GROUP BY FEC_OCUR
ORDER BY COUNT(FEC_OCUR) DESC;

--WHILE @k <= 45716
--	BEGIN
--		IF EXISTS(SELECT year FROM landingsData WHERE year = @y AND id = @k)
--			BEGIN
--				SET @iter = @iter + 1;
--			END;
--		SET @k = @k + 1;
--	END;
--
--PRINT @iter;
