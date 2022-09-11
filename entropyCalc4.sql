USE mexicoData;






DECLARE @N INT;
SET @N = (SELECT COUNT(DISTINCT entiocur) FROM Delitos);



DECLARE @tableB TABLE(entiocur INT, Repeticion_Delito INT, Probabilidad FLOAT, logProb FLOAT);
INSERT @tableB(entiocur, Repeticion_Delito, Probabilidad, logProb)
SELECT  logProbB.entiocur,
        logProbB.Repeticion_Delito,
        logProbB.Probabilidad,
        LOG(logProbB.Probabilidad, @N) AS logProbB
FROM(
        SELECT  probB.entiocur,
                probB.Repeticion_Delito,
                CONVERT(FLOAT, probB.Repeticion_Delito)/212230.0 AS Probabilidad
        FROM(
                SELECT entiocur, COUNT(entiocur) AS Repeticion_Delito
                FROM Delitos
                --WHERE tipmodal = 1 
                GROUP BY entiocur
                ORDER BY COUNT(entiocur) DESC OFFSET 0 ROWS
        ) AS probB

) AS logProbB;


SELECT *
FROM
(SELECT entiocur, Repeticion_Delito, Probabilidad, logProb, Probabilidad*logProb AS plog_p FROM @tableB) AS Ent;

DECLARE @E FLOAT;
SET @E = (SELECT -1.0*SUM(Probabilidad*logProb) AS Entropy FROM @tableB);

SELECT  SUM(Repeticion_Delito) AS Total_Delitos,
        SUM(Probabilidad) AS Total_Probabilidad,
        -1.0*SUM(Probabilidad*logProb) AS Entropy
FROM @tableB;



















--We classify a column by sets and the number of elements each set has.
DECLARE @tableAux TABLE(ID INT, Sets INT, NumberOfElements INT);
DECLARE @kd INT;
SET @kd = 0;

--Insert instances in the table
INSERT @tableAux(ID, Sets, NumberOfElements)
SELECT @kd AS ID, tipmodal, COUNT(tipmodal) AS Repeticion_Delito
FROM Delitos
GROUP BY tipmodal
ORDER BY COUNT(tipmodal) DESC OFFSET 0 ROWS;

--Index the table
UPDATE @tableAux
SET @kd = ID = @kd+1;

--Print Table
SELECT * FROM @tableAux;

--We define Iterators
DECLARE @i INT, @f INT;
SET @i = 1;
SET @f = (SELECT COUNT(DISTINCT ID) FROM @tableAux);

--We define result Table
DECLARE @result TABLE(Total_Delitos FLOAT, Total_Probabilidad FLOAT, Entropy FLOAT);

WHILE @i <= @f
	BEGIN	
		--DECLARE @N INT;
		--SET @N = (SELECT COUNT(DISTINCT entiocur) FROM Delitos);
		--PRINT N'-->Numero de conjuntos := ' + CONVERT(VARCHAR, @N) + N'		ID = ' + CONVERT(VARCHAR, @i);
		--212230 suma de delitos ocurridos
		
		DECLARE @tableA TABLE(entiocur INT, Repeticion_Delito INT, Probabilidad FLOAT, logProb FLOAT);
		INSERT @tableA(entiocur, Repeticion_Delito, Probabilidad, logProb)
		SELECT 	logProb.entiocur,
			logProb.Repeticion_Delito,
			logProb.Probabilidad,
			LOG(logProb.Probabilidad, @N) AS logProb
		FROM(
			SELECT  prob.entiocur, 
				prob.Repeticion_Delito, 
				CONVERT(FLOAT, prob.Repeticion_Delito)/212230.0 AS Probabilidad
			FROM(
				SELECT entiocur, COUNT(entiocur) AS Repeticion_Delito
				FROM Delitos
				WHERE tipmodal = @i
				GROUP BY entiocur
				ORDER BY COUNT(entiocur) DESC OFFSET 0 ROWS
			) AS prob
		
		) AS logProb;
		
		DECLARE @entropy FLOAT;
		
		--SELECT *
		--FROM
		--(SELECT entiocur, Repeticion_Delito, Probabilidad, logProb, Probabilidad*logProb AS plog_p FROM @tableA) AS Ent;
	
		INSERT @result(Total_Delitos, Total_Probabilidad, Entropy)	
		SELECT 	SUM(Repeticion_Delito) AS Total_Delitos, 
			SUM(Probabilidad) AS Total_Probabilidad,
		       	-1.0*SUM(Probabilidad*logProb) AS Entropy
		FROM @tableA;
		
		DELETE FROM @tableA;
		SET @i = @i+1;
	END;

--We print the result
SELECT * FROM @result;

--
SELECT SUM((Total_Delitos/212230.0)*Entropy) AS Sum_OF_P_Entropy
FROM @result;

DECLARE @E2 FLOAT;
SET @E2 = (SELECT SUM((Total_Delitos/212230.0)*Entropy) AS Sum_OF_P_Entropy FROM @result);
PRINT N'IG(parent, children) := ' + CONVERT(VARCHAR, @E) + N' - ' + CONVERT(VARCHAR, @E2) + N' := ' + CONVERT(VARCHAR, @E-@E2);

--SET @entropy = -1.0 * (SELECT SUM(Probabilidad*logProb) FROM @tableA);
--PRINT N'Entropía de Crimenes en México := ' + CONVERT(VARCHAR, @entropy);
