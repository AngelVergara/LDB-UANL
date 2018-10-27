CREATE TABLE Products_LOG(ProductID int primary key not null, ProductName nvarchar(40) not null, SupplierID int,
CategoryID int, QuantityPerUnit nvarchar(20), UnitPrice money, UnitsInStock smallint, UnitsOnOrder smallint,
ReorderLevel smallint, Discontinued bit not null,
Event varchar(10), EventDate datetime)
GO
CREATE TRIGGER Products_AI
ON Products
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Products_LOG(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,Event,EventDate)
	SELECT ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,'Insert',GETDATE()
	FROM inserted
END
GO
CREATE TRIGGER Products_AU
ON Products
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Products_LOG(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,Event,EventDate)
	SELECT ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,'Update',GETDATE()
	FROM inserted
END
GO
CREATE TRIGGER Products_AD
ON Products
AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Products_LOG(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,Event,EventDate)
	SELECT ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,'Delete',GETDATE()
	FROM deleted
END
GO