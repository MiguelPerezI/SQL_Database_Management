USE MeteoriteLandings;


SELECT  TOP 10 der2.name, der2.year, der2.recclass, der2.Distance, der2.mass
FROM(
	--Con esta tabla derivada calculamos la distancia minima a Izcalli y ordenamos de menor a mayor.
        SELECT  TOP 10 derivedImpact.Distance, derivedImpact.name, derivedImpact.year, derivedImpact.mass, derivedImpact.recclass
        FROM (
                SELECT  *,
                        SQRT((GeoLocationX-19.6528)*(GeoLocationX-19.6528) + (GeoLocationY+99.2231)*(GeoLocationY+99.2231)) AS Distance
                FROM meteorites
        ) AS    derivedImpact
        WHERE   derivedImpact.Distance IS NOT NULL
        ORDER BY Distance
    ) AS der2
ORDER BY der2.mass;
