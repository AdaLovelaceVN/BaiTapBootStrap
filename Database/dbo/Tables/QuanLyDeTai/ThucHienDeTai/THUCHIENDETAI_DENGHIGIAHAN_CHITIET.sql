﻿CREATE TABLE THUCHIENDETAI_DENGHIGIAHAN_CHITIET
(
	DeNghiGiaHanChiTietID int NOT NULL IDENTITY,
	DeNghiGiaHanID int NULL,--ref DENGHIGIAHAN
	NgayDeNghiGiaHan date NULL,
	GiaHanTuNgay date NULL,
	GiaHanDenNgay date NULL,
	NgayTraLoiDeNghi date NULL,
	KetQuaDeNghiGiaHan bit NOT NULL CONSTRAINT DF_THUCHIENDETAI_DENGHIGIAHAN_CHITIET_KetQuaDeNghiGiaHan DEFAULT 1,
	GhiChu nvarchar(1000) NULL,
	CONSTRAINT PK_THUCHIENDETAI_DENGHIGIAHAN_CHITIET_DeNghiGiaHanChiTietID PRIMARY KEY CLUSTERED (DeNghiGiaHanChiTietID ASC),
	CONSTRAINT FK_THUCHIENDETAI_DENGHIGIAHAN_CHITIET_DeNghiGiaHanID FOREIGN KEY (DeNghiGiaHanID) REFERENCES THUCHIENDETAI_DENGHIGIAHAN(DeNghiGiaHanID)
)
GO

CREATE NONCLUSTERED INDEX IX_THUCHIENDETAI_DENGHIGIAHAN_CHITIET_DeNghiGiaHanID ON THUCHIENDETAI_DENGHIGIAHAN_CHITIET
( 
	DeNghiGiaHanID         ASC
)
go