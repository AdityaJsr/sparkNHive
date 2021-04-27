DROP TABLE IF EXISTS death;

CREATE EXTERNAL TABLE death(
Country STRING,
Continent STRING,
Population INT,
TotalCases INT,
TotalDeaths INT,
TotalRecovered INT,
ActiveCases INT,
Critical INT,
TotalTests INT
)

COMMENT 'max death'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;

INSERT INTO death SELECT * FROM default.worldwise WHERE TotalDeaths = (SELECT MAX(TotalDeaths) FROM default.worldwise);