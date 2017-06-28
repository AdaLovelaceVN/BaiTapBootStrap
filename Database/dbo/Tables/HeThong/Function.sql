CREATE TABLE [dbo].[Function] (
	[FunctionCode]				NVARCHAR(100),
	[FunctionType]				TINYINT NULL,	
    [FunctionLink]				NVARCHAR(1000)  NULL,
	[FunctionGroup]				TINYINT,
	[IsDanhMuc]					BIT NOT NULL CONSTRAINT [DF_Function_IsDanhMuc]  DEFAULT 0,	
	[Operator]					TINYINT NULL,
    [Description]				NVARCHAR(1000) NULL, 
    CONSTRAINT [PK_Function_FunctionCode] PRIMARY KEY ([FunctionCode]),
)
Go

