USE ElectronicsStore;
GO

CREATE TABLE Customers (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(20),
    Email NVARCHAR(100)
);
GO

CREATE TABLE Products (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT DEFAULT 0
);
GO

CREATE TABLE Orders (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CustomerId INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2) DEFAULT 0,

    CONSTRAINT FK_Orders_Customers
    FOREIGN KEY (CustomerId)
    REFERENCES Customers(Id)
);
GO

CREATE TABLE OrderItems (
    Id INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT,
    ProductId INT,
    Quantity INT NOT NULL,
    ItemPrice DECIMAL(10,2),

    CONSTRAINT FK_OrderItems_Orders
    FOREIGN KEY (OrderId)
    REFERENCES Orders(Id),

    CONSTRAINT FK_OrderItems_Products
    FOREIGN KEY (ProductId)
    REFERENCES Products(Id)
);
GO

