USE mexicoData;

SET DATEFORMAT dmy;

CREATE TABLE Delitos(
	ubicgeob VARCHAR(10),
	cod_expe INT,
	cod_deli INT,
	delirie8 INT,
	califdel INT,
	gdoconsu INT,
	formcomi INT,
	formacci INT,
	tipmodal INT,
	ele_comi INT,
	ticoncur INT,
	ticlasif INT,
	entiocur INT,
	munocurr VARCHAR(10),
	fec_ocur DATE,
	totalca1 VARCHAR(10),
	totalca2 VARCHAR(10)
);

-- We make sure that the table has been constructed correctly
SELECT 
	TABLE_NAME 
FROM 
	mexicoData.INFORMATION_SCHEMA.TABLES;

-- Next we truncate the table
--TRUNCATE TABLE Delitos;

-- Now we load the csv file onto the table
-- Clean csv files that have "text, text" on their columns
BULK INSERT Delitos
FROM '/home/mike666/Documents/SQL_Database_Management/inegiDelitos2.csv' 
WITH (FORMAT='CSV', FIRSTROW=2);
