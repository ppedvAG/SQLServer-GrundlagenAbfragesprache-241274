USE Northwind

-- Tempor�re Tabellen

/*
	- SELECT INTO #TableName => Ergebenisse werden in eine Temp Table schreiben
	- existiert nur innerhalb der Session (Skriptfenster)
	- werden in SystemDB tempDB angelegt
	- Ergebnisse werden nur einmal generiert --> TempTables sehr schnell aber nicht aktuell
	- mit einem # = "lokal"
	- mit zwei ## = "global"


*/

-- Erstellen einer Temp Table
SELECT *
INTO #TempTable
FROM Customers
WHERE Country = 'Germany'

-- Tempor�re Tabelle aufrufen
SELECT * FROM #TempTable

-- manuell L�schen
DROP TABLE #TempTable

-- globale Temp Table:
SELECT *
INTO ##TempTable
FROM Customers
WHERE Country = 'Germany'

-- Aufrufen einer Globalen Temp Table
SELECT * FROM ##TempTable


