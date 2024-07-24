USE Northwind

-- CREATE / ALTER / DROP
-- INSERT / UPDATE / Delete

-- DDL (Data Definition Language)

-- Immer wenn wir Datenbankobjekte "bearbeiten" gelten diese Befehle

CREATE TABLE PurchasingOrders
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	OrderDate date NOT NULL,
	ProductID int not null
)

SELECT * FROM PurchasingOrders

-- Beziehung zwischen PurchasingOrders und Products anlegen �ber ProductID
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalte hinzuf�gen zu einer bestehenden Tabelle
ALTER TABLE PurchasingOrders
ADD TestDaten INT

-- Spalte aus der Tabelle entfernen
ALTER TABLE PurchasingOrders
DROP COLUMN TestDaten

-- INSERT - Hinzuf�gen von Datens�tzen in die Tabelle


SELECT * FROM PurchasingOrders

-- Alle Spalten befuellen
INSERT INTO PurchasingOrders
VALUES('20240724', 3, 10)

-- Explizit Spalten bef�llen
INSERT INTO PurchasingOrders
(OrderDate, ProductID) VALUES('20240724', 10)

-- Ergebnis einer SELECT-Abfrage k�nnen direkt Inserted werden
-- (Datentypen m�ssen kompatibel sein & Anzahl der Spalten)
INSERT INTO PurchasingOrders
SELECT GETDATE(), 20, NULL


-- DELETE - L�schen von Datens�tzen in einer Bestehenden Tabelle

DELETE FROM PurchasingOrders
WHERE ID = 3

-- Prim�r-/Fremdschl�sselbeziehungen verhinder das l�schen von Datens�tzen
-- weil sonst die Datens�tze "ins leere laufen"
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

-- UPDATE - �ndern von Spaltenwerten in einem vorhanden Datensatz

SELECT * FROM PurchasingOrders

UPDATE PurchasingOrders
SET TestDaten = 18
WHERE ID = 5

-- "L�schen" von Werten:
UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 5

-- Transactions
BEGIN TRANSACTION

UPDATE PurchasingOrders
SET TestDaten = 100

COMMIT --> Die Transaction ausf�hren bzw. die �nderungen �bernehmen
ROLLBACK --> Zur�ck zum Anfang wo ich die Transaction gestartet

--Trage dich selber in die Tabelle ein (Employees). Bei den folgenden Spalten: 
--LastName, FirstName, Title, TitleOfCourtesy, BirthDate, 
--HireDate, City, Region, PostalCode, Country, HomePhone, ReportsTo

-- Bonus: Aendere die Werte danach um, in eine Person die frei erfunden ist

SELECT * FROM Employees