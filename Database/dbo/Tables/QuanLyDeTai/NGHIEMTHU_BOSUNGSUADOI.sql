﻿CREATE TABLE NGHIEMTHU_BOSUNGSUADOI
(
	BoSungSuaDoiID int NOT NULL IDENTITY,
	LoaiVanBanChinhSuaBoSung nvarchar(1000) NULL,
	NgayChinhSuaBoSung date NULL,
	DeTaiID int NULL,--ref DANGKYDETAI
	CoHopHoiDongXetLai bit NOT NULL CONSTRAINT DF_NGHIEMTHU_BOSUNGSUADOI_CoHopHoiDongXetLai DEFAULT 1,
	--LaDeTaiCapQuanLy bit NULL,
	CONSTRAINT PK_NGHIEMTHU_BOSUNGSUADOI_BoSungSuaDoiID PRIMARY KEY CLUSTERED (BoSungSuaDoiID ASC),
	CONSTRAINT FK_NGHIEMTHU_BOSUNGSUADOI_DeTaiID FOREIGN KEY (DeTaiID) REFERENCES DANGKYDETAI(DeTaiID)
)
GO

CREATE NONCLUSTERED INDEX IX_NGHIEMTHU_BOSUNGSUADOI_DeTaiID ON NGHIEMTHU_BOSUNGSUADOI
( 
	DeTaiID         ASC
)
go
