  
DROP TABLE IF EXISTS worldwise;

CREATE EXTERNAL TABLE worldwise(
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
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/input/hiveData';

LOAD DATA INPATH 'wasb:///inputData/worldwise.csv' INTO TABLE worldwise;
