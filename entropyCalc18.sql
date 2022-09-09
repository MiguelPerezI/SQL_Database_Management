USE mexicoData;

DECLARE @ntable AS TABLE(Proportion FLOAT, Entropy FLOAT);

INSERT INTO @ntable(Proportion, Entropy) VALUES (3638, 2.16563375E-2);
INSERT INTO @ntable(Proportion, Entropy) VALUES (1941, 1.27806E-2);
INSERT INTO @ntable(Proportion, Entropy) VALUES (4090, 2.1760604E-2);
INSERT INTO @ntable(Proportion, Entropy) VALUES (1256, 8.97504E-3);
INSERT INTO @ntable(Proportion, Entropy) VALUES ( 574, 4.688058583E-3);
INSERT INTO @ntable(Proportion, Entropy) VALUES (8501, 3.9363548E-2);
INSERT INTO @ntable(Proportion, Entropy) VALUES (180100, 0.149279808);

SELECT SUM(prob2.Result)
FROM(
SELECT prob.P*prob.Entropy AS Result
FROM (
	SELECT Proportion/212230.0 AS P, Entropy 
	FROM @ntable) AS prob
) AS prob2;

