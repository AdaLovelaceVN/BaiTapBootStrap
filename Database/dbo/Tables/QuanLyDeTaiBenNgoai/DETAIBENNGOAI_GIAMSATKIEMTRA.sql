﻿CREATE TABLE [dbo].[DETAIBENNGOAI_GIAMSATKIEMTRA]
(
	GiamSatKiemTraID INT NOT NULL IDENTITY 
	,NgayThucHienGS Date
	,DeTaiBenNgoaiID INT
	,CONSTRAINT PK_DETAIBENNGOAI_GIAMSATKIEMTRA_GiamSatKiemTraID PRIMARY KEY  CLUSTERED (GiamSatKiemTraID ASC), 
	 CONSTRAINT [FK_DETAIBENNGOAI_GIAMSATKIEMTRA_DETAIBENNGOAI_NHANYEUCAU] FOREIGN KEY (DeTaiBenNgoaiID) REFERENCES DETAIBENNGOAI_NHANYEUCAU(DeTaiBenNgoaiID), 
)

GO

CREATE NONCLUSTERED INDEX [IX_DETAIBENNGOAI_GIAMSATKIEMTRA_DeTaiBenNgoaiID] ON [dbo].[DETAIBENNGOAI_GIAMSATKIEMTRA] (DeTaiBenNgoaiID asc)
