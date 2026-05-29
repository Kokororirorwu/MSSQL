USE ElectronicsStore;
GO

DROP PROCEDURE IF EXISTS AddCustomer;
GO

  -- процедуры вызываются через EXECUTE, однако процедура выполняет действие

CREATE PROCEDURE AddCustomer -- создание покупателя

    @FullName NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Email NVARCHAR(100)

AS
BEGIN

    INSERT INTO Customers
    (   FullName,
        Phone,
        Email )

    VALUES   -- значения присваемые соответствующим названиям
    (   @FullName,
        @Phone,
        @Email ); 
END;
GO

DROP PROCEDURE IF EXISTS CreateOrder;
GO

CREATE PROCEDURE CreateOrder -- создание заказа 
    @CustomerId INT 
AS
BEGIN   

    INSERT INTO Orders
    (CustomerId)

    VALUES
    (@CustomerId);
END;
GO

