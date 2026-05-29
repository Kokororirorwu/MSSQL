USE ElectronicsStore;
GO

DROP TRIGGER IF EXISTS ReduceStock;
GO

-- Триггер — это автоматически выполняемый SQL-код при событиях.

CREATE TRIGGER ReduceStock
ON OrderItems
AFTER INSERT

AS
BEGIN
    UPDATE Products
    SET Stock = Stock - i.Quantity
    FROM Products p
    JOIN inserted i -- содержит новые данные после добавления (временная таблица, виртуальная)
    ON p.Id = i.ProductId;
END;
GO

DROP TRIGGER IF EXISTS UpdateOrderTotal;
GO

CREATE TRIGGER UpdateOrderTotal
ON OrderItems
AFTER INSERT

AS
BEGIN
    UPDATE Orders
    SET TotalAmount = dbo.GetOrderTotal(i.OrderId) -- вызов функции
    FROM Orders o
    JOIN inserted i
    ON o.Id = i.OrderId;

END;
GO

DROP TRIGGER IF EXISTS CheckStock;
GO

CREATE TRIGGER CheckStock
ON OrderItems
INSTEAD OF INSERT -- СНАЧАЛА SQL выполнит INSERT, ПОТОМ сработает триггер.

AS
BEGIN
    DECLARE @Stock INT;
    DECLARE @Quantity INT;
    DECLARE @ProductId INT;

    SELECT
        @ProductId = ProductId,
        @Quantity = Quantity
    FROM inserted;

    SELECT @Stock = Stock
    FROM Products
    WHERE Id = @ProductId;

    IF @Stock < @Quantity
    BEGIN
        RAISERROR(N'Недостаточно товара на складе', 16, 1);
        RETURN;
    END

    INSERT INTO OrderItems
    (
        OrderId,
        ProductId,
        Quantity,
        ItemPrice
    )

    SELECT
        OrderId,
        ProductId,
        Quantity,
        ItemPrice

    FROM inserted;

END;
GO
