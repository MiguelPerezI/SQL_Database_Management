USE mexicoData;

DECLARE @N INT;
SET @N = (SELECT COUNT(DISTINCT totalca2) FROM Delitos);
PRINT N'-->Numero de conjuntos := ' + CONVERT(VARCHAR, @N);
--212230 suma de delitos ocurridos

DECLARE @tableA TABLE(totalca2 VARCHAR(10), Repeticion_Delito INT, Probabilidad FLOAT, logProb FLOAT);
INSERT @tableA(totalca2, Repeticion_Delito, Probabilidad, logProb)
SELECT 	logProb.totalca2,
	logProb.Repeticion_Delito,
	logProb.Probabilidad,
	LOG(logProb.Probabilidad, @N) AS logProb
FROM(
	SELECT  prob.totalca2, 
		prob.Repeticion_Delito, 
		CONVERT(FLOAT, prob.Repeticion_Delito)/212230.0 AS Probabilidad
	FROM(
		SELECT totalca2, COUNT(totalca2) AS Repeticion_Delito
		FROM Delitos
		WHERE ele_comi = 1 
		GROUP BY totalca2
		ORDER BY COUNT(totalca2) DESC OFFSET 0 ROWS
	) AS prob

) AS logProb;

DECLARE @entropy FLOAT;

SELECT *
FROM
(SELECT totalca2, Repeticion_Delito, Probabilidad, logProb, Probabilidad*logProb AS plog_p FROM @tableA) AS Ent;

SELECT 	SUM(Repeticion_Delito) AS Total_Delitos, 
	SUM(Probabilidad) AS Total_Probabilidad,
       	-1.0*SUM(Probabilidad*logProb) AS Entropy
FROM @tableA;



--SET @entropy = -1.0 * (SELECT SUM(Probabilidad*logProb) FROM @tableA);
--PRINT N'Entropía de Crimenes en México := ' + CONVERT(VARCHAR, @entropy);
