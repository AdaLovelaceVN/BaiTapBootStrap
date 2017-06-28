﻿CREATE TABLE XETDUYETDETAI_HOIDONGDAODUC
(
	HoiDongDaoDucID int NOT NULL IDENTITY,
	DeTaiID int NULL,--ref DANGKYDETAI
	HoiDongID int NULL,--ref HOIDONG from LYNH
	NgayXetDuyet date NULL,
	NgayChapThuan date NULL,
	KetQuaXetDuyet bit NOT NULL CONSTRAINT DF_XETDUYETDETAI_HOIDONGDAODUC_KetQuaXetDuyet DEFAULT 1,
	CoChinhSuaBoSung bit NOT NULL CONSTRAINT DF_XETDUYETDETAI_HOIDONGDAODUC_CoChinhSuaBoSung DEFAULT 1,
	CONSTRAINT PK_XETDUYETDETAI_HOIDONGDAODUC_HoiDongDaoDucID PRIMARY KEY CLUSTERED (HoiDongDaoDucID ASC),
	CONSTRAINT FK_XETDUYETDETAI_HOIDONGDAODUC_DeTaiID FOREIGN KEY (DeTaiID) REFERENCES DANGKYDETAI(DeTaiID),
	CONSTRAINT FK_XETDUYETDETAI_HOIDONGDAODUC_HoiDongID FOREIGN KEY (HoiDongID) REFERENCES HOIDONG_YEUCAU_XETDUYET(HoiDongID)
)
GO

CREATE NONCLUSTERED INDEX IX_XETDUYETDETAI_HOIDONGDAODUC_DeTaiID ON XETDUYETDETAI_HOIDONGDAODUC
( 
	DeTaiID         ASC
)
go

CREATE NONCLUSTERED INDEX IX_XETDUYETDETAI_HOIDONGDAODUC_HoiDongID ON XETDUYETDETAI_HOIDONGDAODUC
( 
	HoiDongID         ASC
)
go
