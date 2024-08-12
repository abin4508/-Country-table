#1
SELECT c.CountryName, COUNT(p.PersonID) AS NumberOfPersons
FROM Country c
JOIN Persons p ON c.CountryID = p.CountryID
GROUP BY c.CountryName;
#2
SELECT c.CountryName, COUNT(p.PersonID) AS NumberOfPersons
FROM Country c
JOIN Persons p ON c.CountryID = p.CountryID
GROUP BY c.CountryName
ORDER BY NumberOfPersons DESC;
#3
SELECT c.CountryName, AVG(p.Rating) AS AverageRating
FROM Country c
JOIN Persons p ON c.CountryID = p.CountryID
GROUP BY c.CountryName
HAVING AVG(p.Rating) > 3.0;
#4
SELECT c.CountryName
FROM Country c
JOIN Persons p ON c.CountryID = p.CountryID
GROUP BY c.CountryName
HAVING AVG(p.Rating) = (
    SELECT AVG(p2.Rating)
    FROM Country c2
    JOIN Persons p2 ON c2.CountryID = p2.CountryID
    WHERE c2.CountryName = 'USA'
);
