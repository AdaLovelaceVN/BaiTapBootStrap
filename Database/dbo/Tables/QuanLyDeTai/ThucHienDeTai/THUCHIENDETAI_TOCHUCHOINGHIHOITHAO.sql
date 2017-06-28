﻿CREATE TABLE THUCHIENDETAI_TOCHUCHOINGHIHOITHAO
(
	ToChucHoiNghiHoiThaoID int NOT NULL IDENTITY,
	DeTaiID int NULL,--ref DANGKYDETAI
	GhiChu nvarchar(1000) NULL,
	CONSTRAINT PK_THUCHIENDETAI_TOCHUCHOINGHIHOITHAO_ToChucHoiNghiHoiThaoID PRIMARY KEY CLUSTERED (ToChucHoiNghiHoiThaoID ASC),
	CONSTRAINT FK_THUCHIENDETAI_TOCHUCHOINGHIHOITHAO_DeTaiID FOREIGN KEY (DeTaiID) REFERENCES DANGKYDETAI(DeTaiID)
)
GO

CREATE NONCLUSTERED INDEX IX_THUCHIENDETAI_TOCHUCHOINGHIHOITHAO_DeTaiID ON THUCHIENDETAI_TOCHUCHOINGHIHOITHAO
( 
	DeTaiID         ASC
)
go