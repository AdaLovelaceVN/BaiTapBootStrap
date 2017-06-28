﻿CREATE TABLE DANHMUC_KHOAPHONG
( 
	DMKhoaPhongID				INT NOT NULL IDENTITY,
	MaKhoaPhong					nvarchar(1000)  NULL ,
	TenKhoaPhong				nvarchar(1000)  NULL ,
	KhoiID						int NULL,
	Active						BIT NOT NULL CONSTRAINT DF_DANHMUC_KHOAPHONG_Active DEFAULT 1,
	CONSTRAINT PK_DANHMUC_KHOAPHONG_DMKhoaPhongID PRIMARY KEY  CLUSTERED (DMKhoaPhongID ASC)
)
GO