
SELECT * FROM Brewery

SELECT * FROM Keyword
SELECT * FROM BeerKeyword
SELECT * FROM Beer
SELECT * FROM BreweryTour

SELECT Beer.BeerName, Keyword.KeywordName
FROM Beer
JOIN BeerKeyword on Beer.BeerID = BeerKeyword.BeerID
JOIN Keyword on Keyword.KeywordID = BeerKeyword.KeywordID

INSERT INTO Beer (BreweryID, BeerName, BeerType, ABV, BeerAvailability)
VALUES ((Select BreweryID FROM Brewery WHERE BreweryName = '4 Hands Brewing Co'),'New 4 Hands beer', 'Ale', '6.1',	'Year-Round')

SELECT Beer.BreweryID, Brewery.BreweryName, Beer.BeerID, Beer.BeerName, Beer.BeerType, Beer.ABV, Beer.BeerAvailability
FROM Beer
JOIN Brewery on Brewery.BreweryID = Beer.BreweryID
WHERE Brewery.BreweryName = '4 Hands Brewing Co'

DELETE FROM Beer
WHERE Beername = 'New 4 Hands beer'

SELECT Beer.BreweryID, Brewery.BreweryName, Beer.BeerID, Beer.BeerName, Beer.BeerType, Beer.ABV, Beer.BeerAvailability
FROM Beer
JOIN Brewery on Brewery.BreweryID = Beer.BreweryID
WHERE Brewery.BreweryName = '4 Hands Brewing Co'

--UPDATE Brewery 
--SET BreweryAddress = '123 Maple St', BreweryZip = '63116'
--WHERE BreweryName = 'Civil Life'

---
---
SELECT TOP 1 TopBrewery, BeerCount
FROM(
	SELECT Brewery.BreweryName as TopBrewery, COUNT(Beer.BreweryID) as BeerCount
	FROM Beer
	JOIN Brewery on Brewery.BreweryID = Beer.BreweryID
	GROUP BY Brewery.BreweryName, Beer.BreweryID
) BeersByBrewery
ORDER BY BeerCount desc


SELECT Brewery.BreweryName as Brewery, Beer.BeerName as Beer, ABV  
FROM Beer
JOIN Brewery on Brewery.BreweryID = Beer.BreweryID
WHERE ABV > 8.5
ORDER BY ABV DESC

SELECT TOP 5 TopBrewingStyle, CountOfStyle 
	FROM(
		SELECT Beer.BeerType as TopBrewingStyle, COUNT(Beer.BeerType) as CountOfStyle
		FROM Beer
		GROUP BY Beer.BeerType
) TopBrewing
ORDER BY CountOfStyle desc

--- how many beers are available in each season if they're seasonal
SELECT COUNT(BeerID) NumberOfBeersAvailable, BeerAvailability 
FROM Beer
WHERE BeerAvailability IS NOT NULL AND BeerAvailability != 'Year-Round'
GROUP BY BeerAvailability
ORDER BY NumberOfBeersAvailable desc

--- number of tours available for each tour day of the week
SELECT COUNT(TourID) NumberOfTours, TourDay
FROM BreweryTour
GROUP BY TourDay
ORDER BY NumberOfTours

SELECT COUNT(Brewery.BreweryZip) NumberInZipCode, BreweryZip
FROM Brewery
GROUP BY BreweryZip
ORDER BY NumberInZipCode DESC;