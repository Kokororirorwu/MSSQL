
USE ElectronicsStore;
GO

DROP VIEW IF EXISTS CustomerOrdersView;
GO 

CREATE VIEW CustomerOrdersView
AS
SELECT
    Orders.Id AS OrderId,
    Customers.FullName,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Orders
JOIN Customers
ON Orders.CustomerId = Customers.Id;
GO

DROP VIEW IF EXISTS ProductsInStockView;
GO

CREATE VIEW ProductsInStockView
AS
SELECT
    ProductName,
    Price,
    Stock
FROM Products
WHERE Stock > 0;
GO

