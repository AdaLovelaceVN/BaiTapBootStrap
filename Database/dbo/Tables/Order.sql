CREATE TABLE [dbo].[Order](
	[CustomerID] [int] NOT NULL,
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ShipToName] [nvarchar](1000) NOT NULL, 
    CONSTRAINT [PK_Order] PRIMARY KEY ([OrderID]),
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customers1] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customers1]
GO

