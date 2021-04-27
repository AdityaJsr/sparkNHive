DROP TABLE IF EXISTS india;

CREATE EXTERNAL TABLE india(
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

COMMENT 'india covid19 data'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;

INSERT INTO india SELECT * FROM default.worldwise where country='India';