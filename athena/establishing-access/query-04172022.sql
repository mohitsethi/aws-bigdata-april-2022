CREATE EXTERNAL TABLE IF NOT EXISTS coffee.CardStatuses(
  Status Varchar(20))
LOCATION 's3://ms-athena-data/'



CREATE EXTERNAL TABLE IF NOT EXISTS coffee.CardTypes(
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
  `merchantid` int,
  `merchantname` string,
  `status` string,
  `dateissued` date,
  `dateactivated` date,
  `datevoided` date,
  `dateexpires` date,
  `cardtype` string,
  `amountissued` double,
  `balance` double,
  `printlocation` string,
  `dateprinted` date,
  `cardversion` float,
  `authorizationcode` string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe' 
WITH SERDEPROPERTIES (
  'serialization.format' = ',',
  'field.delim' = ','
) LOCATION 's3://ms-athena-data/third-party/*'
TBLPROPERTIES ('has_encrypted_data'='false');

SELECT * FROM COFFEE.ThirdPartyData;

