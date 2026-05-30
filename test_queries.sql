
USE ElectronicsStore;
GO


-- Добавление товаров

INSERT INTO Products
(
    ProductName,
    Price,
    Stock
)
VALUES
(N'Ноутбук', 50000, 10),
(N'Мышка', 1500, 30),
(N'Клавиатура', 3000, 20);
GO


-- Добавление клиента через PROCEDURE

EXEC AddCustomer
    @FullName = N'Соловьев Алексей',
    @Phone = '89055923949',
    @Email = '1148coloveyak@gmail.com';
GO


-- Создание заказа через PROCEDURE
EXEC CreateOrder
    @CustomerId = 1;
GO


-- Добавление товара в заказ
INSERT INTO OrderItems
(
    OrderId,
    ProductId,
    Quantity,
    ItemPrice
)

VALUES
(1, 1, 2, 50000);
GO


-- Проверка таблиц
SELECT * FROM Products;
GO

SELECT * FROM Orders;
GO

SELECT * FROM OrderItems;
GO


-- Проверка VIEW
SELECT * FROM CustomerOrdersView;
GO

SELECT * FROM ProductsInStockView;
GO


-- Проверка FUNCTION
SELECT dbo.GetOrderTotal(1) AS TotalAmount;
GO

