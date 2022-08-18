USE MeteoriteLandings;

--SELECT 
--	TABLE_NAME, COLUMN_NAME, DATA_TYPE
--FROM
--	MeteoriteLandings.INFORMATION_SCHEMA.COLUMNS;

--SELECT
--	TOP 3 *
--FROM
--	landingsData;

DECLARE @k INT, @y INT, @iter INT;
SET @k = 1;
SET @y = 1994;
SET @iter = 0;

DECLARE @s VARCHAR(30);
SET @s = "Iron-IVB";

--SELECT	name, recclass, year, GeoLocationX, GeoLocationY
--FROM	landingsData
--WHERE	year = @y
--ORDER BY year ASC;

--SELECT TOP 10 name, recclass, year, mass, GeoLocationX, GeoLocationY
--FROM LandingsData
--ORDER BY mass DESC;

--Count an element/object in a column
-- SELECT DISTINCT COUNT(year) AS clas
-- FROM landingsData
-- WHERE year = @y;


SELECT TOP 10 GeoLocationX, GeoLocationY
FROM
	landingsData;


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
