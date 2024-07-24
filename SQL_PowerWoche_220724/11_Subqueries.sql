USE Northwind

-- Subqueries / nested queries/ Unterabfragen

/*
	- M�ssen eigenst�ndig funktionieren
	- K�nnen generell �berall eingebaut werden (wenn es Sinn macht)
	- Abfragen die von "innen nach au�en" der Reihe nach ausgef�hrt werden

*/

SELECT AVG(Freight) FROM Orders -- 78,2442

SELECT * FROM Orders
WHERE Freight > 78.2442

-- L�sung -> Unterabfrage
SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)

-- Schreiben Sie eine Abfrage, um eine Produktliste 
--(ID, Name, St�ckpreis) mit einem �berdurchschnittlichen Preis zu erhalten.
SELECT ProductID,ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
ORDER BY UnitPrice DESC
