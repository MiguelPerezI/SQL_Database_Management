USE mexicoData;

--ID,ENTIDAD,DISTRITO,INDIGENA,POBTOT,POBFEM,POBMAS,PCLIM_RE_C,GRAPROES,   PEA,PE_INAC,TVIVPAR
-- 0,      1,       1,      NO,482911,245249,237662,     10127,       9,223452, 140695,151352
-- First we create a table that matches th columns of the csv file
CREATE TABLE PobMexico_0(
	ID INT PRIMARY KEY NOT NULL,
	ENTIDAD INT,
	NOM_ENT VARCHAR(50),
	DISTRITO INT,
	INDIGENA VARCHAR(5),
	POBTOT INT,
	POBFEM INT,
	POBMAS INT,
	PCLIM_RE_C INT,
	GRAPROES INT,
	PEA INT,
	PE_INAC INT,
	TVIVPAR INT

);

-- We make sure that the table has been constructed correctly
SELECT 
	TABLE_NAME 
FROM 
	mexicoData.INFORMATION_SCHEMA.TABLES;

-- Next we truncate the table
TRUNCATE TABLE PobMexico_0;

-- Now we load the csv file onto the table
-- Clean csv files that have "text, text" on their columns
BULK INSERT PobMexico_0
FROM '/home/mike666/Documents/SQL_Database_Management/output.csv' 
WITH (FORMAT='CSV', FIRSTROW=2);
