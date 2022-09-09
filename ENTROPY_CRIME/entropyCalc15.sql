USE mexicoData;

DECLARE @N INT;
SET @N = (SELECT COUNT(DISTINCT fec_ocur) FROM Delitos);
PRINT N'-->Numero de conjuntos := ' + CONVERT(VARCHAR, @N);
--212230 suma de delitos ocurridos

DECLARE @tableA TABLE(fec_ocur DATE, Repeticion_Delito INT, Probabilidad FLOAT, logProb FLOAT);
INSERT @tableA(fec_ocur, Repeticion_Delito, Probabilidad, logProb)
SELECT 	logProb.fec_ocur,
	logProb.Repeticion_Delito,
	logProb.Probabilidad,
	LOG(logProb.Probabilidad, @N) AS logProb
FROM(
	SELECT  prob.fec_ocur, 
		prob.Repeticion_Delito, 
		CONVERT(FLOAT, prob.Repeticion_Delito)/212230.0 AS Probabilidad
	FROM(
		SELECT fec_ocur, COUNT(fec_ocur) AS Repeticion_Delito
		FROM Delitos
		GROUP BY fec_ocur
		ORDER BY COUNT(fec_ocur) DESC OFFSET 0 ROWS
	) AS prob

) AS logProb;

DECLARE @entropy FLOAT;

SELECT *
FROM
(SELECT fec_ocur, Repeticion_Delito, Probabilidad, logProb, Probabilidad*logProb AS plog_p FROM @tableA) AS Ent;

SELECT 	SUM(Repeticion_Delito) AS Total_Delitos, 
	SUM(Probabilidad) AS Total_Probabilidad,
       	-1.0*SUM(Probabilidad*logProb) AS Entropy
FROM @tableA;

--SET @entropy = -1.0 * (SELECT SUM(Probabilidad*logProb) FROM @tableA);
--PRINT N'Entropía de Crimenes en México := ' + CONVERT(VARCHAR, @entropy);
