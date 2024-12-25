USE [dbOrderSystem]
GO
/****** Object:  Table [dbo].[i_OrderDetails]    Script Date: 25-12-2024 20:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[i_OrderDetails](
	[OrderDetailID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[i_Orders]    Script Date: 25-12-2024 20:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[i_Orders](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[i_OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (1, 1, 201, 2, CAST(50.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[i_OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (2, 1, 202, 1, CAST(50.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[i_OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (3, 2, 203, 3, CAST(70.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[i_OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (4, 3, 201, 4, CAST(75.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[i_OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (5, 3, 204, 2, CAST(75.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[i_OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (6, 4, 202, 2, CAST(60.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[i_OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (7, 5, 205, 5, CAST(35.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[i_OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (8, 5, 203, 2, CAST(40.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[i_Orders] ([OrderID], [CustomerID], [OrderDate], [TotalAmount]) VALUES (1, 101, CAST(N'2024-11-01T00:00:00.000' AS DateTime), CAST(150.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[i_Orders] ([OrderID], [CustomerID], [OrderDate], [TotalAmount]) VALUES (2, 102, CAST(N'2024-11-02T00:00:00.000' AS DateTime), CAST(210.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[i_Orders] ([OrderID], [CustomerID], [OrderDate], [TotalAmount]) VALUES (3, 103, CAST(N'2024-11-05T00:00:00.000' AS DateTime), CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[i_Orders] ([OrderID], [CustomerID], [OrderDate], [TotalAmount]) VALUES (4, 101, CAST(N'2024-11-10T00:00:00.000' AS DateTime), CAST(120.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[i_Orders] ([OrderID], [CustomerID], [OrderDate], [TotalAmount]) VALUES (5, 104, CAST(N'2024-11-15T00:00:00.000' AS DateTime), CAST(250.00 AS Decimal(10, 2)))
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFilteredOrders]    Script Date: 25-12-2024 20:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Krutarth Shah
-- Create date: 25-12-2024
-- Description:	to get the orders with filters
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetFilteredOrders]

@CustomerId int,
@FromDate datetime,
@ToDate datetime

AS
BEGIN
	
	--select o.OrderId,o.CustomerId,o.orderdate,o.TotalAmount from i_Orders o	


	select o.OrderId,o.CustomerId,o.Orderdate,sum(od.price*od.Quantity) as TotalAmount from i_Orders o	
	inner join i_orderdetails od on od.orderid=o.orderid
	where o.CustomerId= @CustomerId and o.OrderDate>=@FromDate and o.OrderDate<=@ToDate
	group by o.OrderId,o.CustomerId,o.orderdate


END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetOrders]    Script Date: 25-12-2024 20:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Krutarth Shah
-- Create date: 25-12-2024
-- Description:	to get the orders
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetOrders]

AS
BEGIN
	
	--select o.OrderId,o.CustomerId,o.orderdate,o.TotalAmount from i_Orders o	


	select o.OrderId,o.CustomerId,o.OrderDate,sum(od.price*od.Quantity) as TotalAmount from i_Orders o	
	inner join i_orderdetails od on od.orderid=o.orderid
	group by o.OrderId,o.CustomerId,o.orderdate
END
GO
