CREATE TABLE IF NOT EXISTS coffee.CardStatuses(
  Status Varchar(20))
LOCATION 's3://ms-athena-data/'

drop table coffee.CardStatuses

CREATE TABLE IF NOT EXISTS coffee.CardTypes(
  Type Varchar(20))
LOCATION 's3://ms-athena-data/'

drop table coffee.PossibleBalances
CREATE EXTERNAL TABLE IF NOT EXISTS coffee.PossibleBalances(
  Balance double)
LOCATION 's3://ms-athena-data/'

CREATE EXTERNAL TABLE IF NOT EXISTS coffee.PrintLocations(
  Location varchar(20))
LOCATION 's3://ms-athena-data/'



INSERT INTO coffee.CardStatuses VALUES ('Activated');
INSERT INTO coffee.CardStatuses VALUES ('Activated');
INSERT INTO coffee.CardStatuses VALUES ('Activated');
INSERT INTO coffee.CardStatuses VALUES ('Activated');
INSERT INTO coffee.CardStatuses VALUES ('Activated');
INSERT INTO coffee.CardStatuses VALUES ('Issued');
INSERT INTO coffee.CardStatuses VALUES ('Issued');
INSERT INTO coffee.CardStatuses VALUES ('Issued');
INSERT INTO coffee.CardStatuses VALUES ('Issued');
INSERT INTO coffee.CardStatuses VALUES ('Voided');


INSERT INTO CardTypes VALUES ('Ecard');
INSERT INTO CardTypes VALUES ('Physical');

INSERT INTO PossibleBalances VALUES (500.00);
INSERT INTO PossibleBalances VALUES (450.00);
INSERT INTO PossibleBalances VALUES (400.00);
INSERT INTO PossibleBalances VALUES (350.00);
INSERT INTO PossibleBalances VALUES (300.00);
INSERT INTO PossibleBalances VALUES (250.00);
INSERT INTO PossibleBalances VALUES (200.00);
INSERT INTO PossibleBalances VALUES (150.00);
INSERT INTO PossibleBalances VALUES (125.00);
INSERT INTO PossibleBalances VALUES (100.00);
INSERT INTO PossibleBalances VALUES (75.00);
INSERT INTO PossibleBalances VALUES (50.00);
INSERT INTO PossibleBalances VALUES (25.00);
INSERT INTO PossibleBalances VALUES (10.00);



INSERT INTO PrintLocations VALUES ('New York City');
INSERT INTO PrintLocations VALUES ('Seattle');
INSERT INTO PrintLocations VALUES ('San Francisco');
INSERT INTO PrintLocations VALUES ('Phoenix');


select * from PrintLocations;


CREATE EXTERNAL TABLE IF NOT EXISTS coffee.ThirdPartyData(
	CardNumber varchar(13),
	MerchantID int,
	MerchantName varchar(50),
	Status varchar(25),
	DateIssued date,
	DateActivated date,
	DateVoided date,
	DateExpires date,
	CardType varchar(25),
	AmountIssued double,
	Balance double,
	PrintLocation varchar(25),
	DatePrinted date,
	CardVersion decimal(18, 2),
	AuthorizationCode varchar(8)
) LOCATION 's3://ms-athena-data/'

CREATE EXTERNAL TABLE IF NOT EXISTS `coffee`.`ThirdPartyData` (
  `cardnumber` string,
  `merchantid` string,
  `merchantname` string,
  `status` string,
  `dateissued` timestamp,
  `dateactivated` timestamp,
  `datevoided` timestamp,
  `dateexpires` timestamp,
  `cardtype` string,
  `amountissued` string,
  `printlocation` string,
  `dateprinted` timestamp,
  `cardversion` string,
  `authorizationcode` string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe' 
WITH SERDEPROPERTIES (
  'serialization.format' = ',',
  'field.delim' = ','
) LOCATION 's3://ms-athena-data/third-party/'
TBLPROPERTIES ('has_encrypted_data'='false');

DROP TABLE COFFEE.ThirdPartyData;

SELECT * FROM COFFEE.ThirdPartyData;

-- Create Tables 

CREATE TABLE coffee.CardStatuses(
	Status string
)

CREATE EXTERNAL TABLE IF NOT EXISTS  coffee.CardStatuses(
  Status string
) LOCATION 's3://ms-athena-data/empty/'

drop table coffee.CardStatuses;
select * from coffee.CardStatuses;

INSERT INTO coffee.CardStatuses VALUES ('Activated');
INSERT INTO coffee.CardStatuses VALUES ('Issued');
INSERT INTO coffee.CardStatuses VALUES ('Voided');


CREATE EXTERNAL TABLE IF NOT EXISTS   coffee.CardTypes(
	Type string
) LOCATION 's3://ms-athena-data/empty/'


INSERT INTO coffee.CardTypes VALUES ('Ecard');
INSERT INTO coffee.CardTypes VALUES ('Physical');


CREATE EXTERNAL TABLE IF NOT EXISTS  coffee.PossibleBalances(
	Balance double
) LOCATION 's3://ms-athena-data/empty/'

INSERT INTO PossibleBalances VALUES (500.00);
INSERT INTO PossibleBalances VALUES (450.00);
INSERT INTO PossibleBalances VALUES (400.00);
INSERT INTO PossibleBalances VALUES (350.00);
INSERT INTO PossibleBalances VALUES (300.00);
INSERT INTO PossibleBalances VALUES (250.00);
INSERT INTO PossibleBalances VALUES (200.00);
INSERT INTO PossibleBalances VALUES (150.00);
INSERT INTO PossibleBalances VALUES (125.00);
INSERT INTO PossibleBalances VALUES (100.00);
INSERT INTO PossibleBalances VALUES (75.00);
INSERT INTO PossibleBalances VALUES (50.00);
INSERT INTO PossibleBalances VALUES (25.00);
INSERT INTO PossibleBalances VALUES (10.00);

select * from coffee.PossibleBalances;


CREATE EXTERNAL TABLE IF NOT EXISTS  coffee.PrintLocations(
	Location string
) LOCATION 's3://ms-athena-data/empty/'


INSERT INTO PrintLocations VALUES ('New York City');
INSERT INTO PrintLocations VALUES ('Seattle');
INSERT INTO PrintLocations VALUES ('San Francisco');
INSERT INTO PrintLocations VALUES ('Phoenix');

select * from coffee.PrintLocations;



CREATE EXTERNAL TABLE IF NOT EXISTS  coffee.WiredBrainCoffeeData(
	StoreID string,
	CardNumber string,
	Status string,
	DateIssued timestamp,
	DateActivated timestamp,
	DateVoided timestamp,
	DateExpires timestamp,
	CardType string,
	AmountIssued string,
	Balance string,
	Notes string
) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe' 
WITH SERDEPROPERTIES (
  'serialization.format' = ',',
  'field.delim' = ','
) LOCATION 's3://ms-athena-data/wiredbraincoffee/'
TBLPROPERTIES ('has_encrypted_data'='false');


drop table coffee.WiredBrainCoffeeData;

select * from  coffee.WiredBrainCoffeeData;

SELECT * FROM COFFEE.ThirdPartyData;
