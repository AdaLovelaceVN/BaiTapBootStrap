﻿CREATE TABLE THUCHIENDETAI_DENGHIGIAHAN
(
	DeNghiGiaHanID int NOT NULL IDENTITY,
	DeTaiID int NULL,--ref DANGKYDETAI
	GhiChu nvarchar(1000) NULL,
	CONSTRAINT PK_THUCHIENDETAI_DENGHIGIAHAN_DeNghiGiaHanID PRIMARY KEY CLUSTERED (DeNghiGiaHanID ASC),
	CONSTRAINT FK_THUCHIENDETAI_DENGHIGIAHAN_DeTaiID FOREIGN KEY (DeTaiID) REFERENCES DANGKYDETAI(DeTaiID)
)
GO

CREATE NONCLUSTERED INDEX IX_THUCHIENDETAI_DENGHIGIAHAN_DeTaiID ON THUCHIENDETAI_DENGHIGIAHAN
( 
	DeTaiID         ASC
)
go