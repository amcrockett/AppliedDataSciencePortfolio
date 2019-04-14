/* Drops tables */

DROP TABLE IF EXISTS BreweryTour;
DROP TABLE IF EXISTS BeerKeyword;
DROP TABLE IF EXISTS Beer;
DROP TABLE IF EXISTS Keyword;
DROP TABLE IF EXISTS Brewery;

CREATE TABLE Brewery (
BreweryID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
BreweryName varchar (50) NOT NULL,
BreweryAddress varchar(100),
BreweryZip char(5),
);

CREATE TABLE Keyword (
KeywordID int IDENTITY (1,1) PRIMARY KEY,
KeywordName char(30),
);

CREATE TABLE Beer (
BeerID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
BreweryID int NOT NULL,
BeerName varchar(50) NOT NULL,
BeerType varchar(50) NOT NULL,
ABV decimal (3,1),
BeerAvailability char(30),
FOREIGN KEY (BreweryID) REFERENCES Brewery(BreweryID)
);

CREATE TABLE BreweryTour (
TourID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
BreweryID int NOT NULL,
TourDay char(30),
TourCost decimal(2,2),
FOREIGN KEY (BreweryID) REFERENCES Brewery(BreweryID)
);

CREATE TABLE BeerKeyword (
KeywordID int NOT NULL,
BeerID int NOT NULL,
PRIMARY KEY CLUSTERED ( KeywordId, BeerId ),
FOREIGN KEY (KeywordID) REFERENCES Keyword(KeywordID),
FOREIGN KEY (BeerID) REFERENCES Beer (BeerID)
);
INSERT INTO Brewery (BreweryName, BreweryAddress, BreweryZip)
VALUES ('The Saint Louis Brewery', '7260 Southwest Ave.', '63143'),
	   ('Alpha',  '4310 Fyler Ave',  '63116');
SELECT*FROM Brewery

INSERT INTO Beer (BreweryID, BeerName, BeerType, ABV, BeerAvailability)
VALUES ((Select BreweryID FROM Brewery WHERE BreweryName = 'The Saint Louis Brewery'),'Schafly Pilsner', 'Pilsner', '5.0',	'Year-Round'),
		((SELECT BreweryID FROM Brewery WHERE BreweryName = 'Alpha'), 'Belgian Blonde ', 'Blonde Ale', '5.0', 'Year-Round') ;

INSERT INTO Keyword (KeywordName)
Values ('light'),
	   ('lager'),
	   ('German');

INSERT INTO BeerKeyword (keywordID, BeerID)
VALUES((SELECT KeywordID FROM Keyword WHERE KeywordName ='light'),(SELECT BeerID FROM Beer WHERE BeerName = 'Schafly Pilsner')),
	  ((SELECT KeywordID FROM Keyword WHERE KeywordName ='German'),(SELECT BeerID FROM Beer WHERE BeerName = 'Schafly Pilsner')),
	  ((SELECT KeywordID FROM Keyword WHERE KeywordName ='lager'),(SELECT BeerID FROM Beer WHERE BeerName = 'Schafly Pilsner'));

INSERT INTO BreweryTour (BreweryID, TourDay, TourCost)
VALUES ((Select BreweryID FROM Brewery WHERE BreweryName = 'The Saint Louis Brewery'), 'Saturday', '0.00');

