CREATE TABLE [dbo].[RoleRight] (
	[RoleRightId]				INT IDENTITY (1, 1) NOT NULL,
    [RoleName]					NVARCHAR(256) NULL,
	[FunctionCode]				NVARCHAR(100) NULL,
    [CanCreate]					BIT CONSTRAINT DF_RoleRight_CanCreate DEFAULT 0,
	[CanUpdate]					BIT CONSTRAINT DF_RoleRight_CanUpdate DEFAULT 0,
	[CanDelete]					BIT CONSTRAINT DF_RoleRight_CanDelete DEFAULT 0, 
    CONSTRAINT [PK_RoleRight_RoleRightId] PRIMARY KEY ([RoleRightId]),
	CONSTRAINT [FK_RoleRight_FunctionCode] FOREIGN KEY ([FunctionCode]) REFERENCES [dbo].[Function] ([FunctionCode]),
)
GO

CREATE INDEX [IX_RoleRight_RoleName] ON [dbo].[RoleRight] ([RoleName])
GO