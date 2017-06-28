CREATE TABLE [dbo].[UserProfile] (
    [UserId]			INT IDENTITY (1, 1) NOT NULL,
	[UserType]			TINYINT  NULL,
    [UserName]			NVARCHAR (50)  NULL,
    [FullName]			NVARCHAR (100) NULL,
    [Email]				NVARCHAR (50)  NULL,
    [MaTinh]			VARCHAR(10)    NULL,
    [MaCSKCB]			VARCHAR(10) NULL, 	
    [MaChiNhanh]		VARCHAR(10) NULL, 
	[DbName]			VARCHAR(10) NULL,
	[ChucDanh]			NVARCHAR(100) NULL,
	[DonViCongTac]		NVARCHAR(100) NULL,
	[ManHinhChinh]		NVARCHAR(50) NULL,
    [Active]			BIT NULL CONSTRAINT UserProfile_DEFAULT_Active DEFAULT 1, 
    [NamSinh]			CHAR(4) NULL, 
    [GioiTinh]			TINYINT NULL, 
    [TrinhDo]			NVARCHAR(50) NULL, 
    [LoaiHinhDaoTao]	NVARCHAR(200) NULL, 
    [SoDienThoai]		VARCHAR(15) NULL, 
    CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED ([UserId] ASC)
)
GO

CREATE INDEX [IX_UserProfile_UserName] ON [dbo].[UserProfile] ([UserName])
GO