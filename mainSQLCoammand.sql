USE MeteoriteLandings;

--Count an element/object in a column
-- SELECT DISTINCT COUNT(year) AS clas
-- FROM landingsData
-- WHERE year = @y;

--19.6528, 99.2231

SELECT	TOP 10 der2.name, der2.year, der2.recclass, der2.Distance, der2.mass
FROM(
	SELECT 	TOP 10 derivedImpact.Distance, derivedImpact.name, derivedImpact.year, derivedImpact.mass, derivedImpact.recclass
	FROM (
		SELECT 	*, 
			SQRT((GeoLocationX-19.6528)*(GeoLocationX-19.6528) + (GeoLocationY+99.2231)*(GeoLocationY+99.2231)) AS Distance
		FROM meteorites
	) AS 	derivedImpact
	WHERE 	derivedImpact.Distance IS NOT NULL
	ORDER BY Distance
    ) AS der2
ORDER BY der2.mass;



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
