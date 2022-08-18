USE MeteoriteLandings;

-- First we create a table that matches th columns of the csv file
CREATE TABLE landingsData(
	name VARCHAR(50),
	id INT PRIMARY KEY,
	nametype VARCHAR(50),
	recclass VARCHAR(50),
	mass FLOAT,
	fall VARCHAR(50),
	year INT, 
	reclat FLOAT,
	reclong FLOAT, 
	GeoLocationX FLOAT, 
	GeoLocationY FLOAT
);

-- We make sure that the table has been constructed correctly
SELECT 
	TABLE_NAME 
FROM 
	MeteoriteLandings.INFORMATION_SCHEMA.TABLES;

-- Next we truncate the table
TRUNCATE TABLE landingsData;

-- Now we load the csv file onto the table
-- Clean csv files that have "text, text" on their columns
BULK INSERT landingsData 
FROM '/home/mike666/Downloads/data8.csv' 
WITH (FORMAT='CSV', FIRSTROW=2);
