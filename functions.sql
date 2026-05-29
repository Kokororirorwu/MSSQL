USE ElectronicsStore;
GO

DROP FUNCTION IF EXISTS dbo.GetOrderTotal;
GO

CREATE FUNCTION dbo.GetOrderTotal
(
    @OrderId INT
)

RETURNS DECIMAL(10,2)

AS
BEGIN
    DECLARE @Total DECIMAL(10,2);
    SELECT @Total = SUM(Quantity * ItemPrice)
    FROM OrderItems
    WHERE OrderId = @OrderId;
    RETURN ISNULL(@Total, 0);
END;
GO

