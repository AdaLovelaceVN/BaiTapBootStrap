﻿CREATE TABLE DANHMUC_CHUCDANHKHOAHOC
(
	DMChucDanhKhoaHocID				INT NOT NULL IDENTITY,
	MaChucDanhKhoaHoc				nvarchar(1000)  NULL ,
	TenChucDanhKhoaHoc				nvarchar(1000)  NULL ,
	Active							BIT NOT NULL CONSTRAINT DF_DANHMUC_CHUCDANHKHOAHOC_Active DEFAULT 1,
	CONSTRAINT PK_DANHMUC_CHUCDANHKHOAHOC_DMChucDanhKhoaHocID PRIMARY KEY  CLUSTERED (DMChucDanhKhoaHocID ASC)
)
GO
