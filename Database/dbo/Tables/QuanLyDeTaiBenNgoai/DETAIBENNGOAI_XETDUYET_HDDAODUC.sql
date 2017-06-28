﻿CREATE TABLE [dbo].[DETAIBENNGOAI_XETDUYET_HDDAODUC]
(
	XetDuyetHDDDID INT NOT NULL IDENTITY 
    ,PhuongThucXetDuyet NVARCHAR(1000)
   ,NgayXetDuyet Date
   ,NgayChapThuan Date
   ,DeTaiBenNgoaiID INT NULL
   ,HoiDongID INT---ref hoi dong 
   ,CONSTRAINT PK_DETAIBENNGOAI_XETDUYET_HDDAODUC_XetDuyetHDDDID PRIMARY KEY  CLUSTERED (XetDuyetHDDDID ASC), 
    CONSTRAINT [FK_DETAIBENNGOAI_XETDUYET_HDDAODUC_DETAIBENNGOAI_NHANYEUCAU] FOREIGN KEY (DeTaiBenNgoaiID) REFERENCES DETAIBENNGOAI_NHANYEUCAU(DeTaiBenNgoaiID), 
    CONSTRAINT [FK_DETAIBENNGOAI_XETDUYET_HDDAODUC_HOIDONG_YEUCAU_XETDUYET] FOREIGN KEY (HoiDongID) REFERENCES HOIDONG_YEUCAU_XETDUYET(HoiDongID), 
)

GO

CREATE NONCLUSTERED INDEX [IX_DETAIBENNGOAI_XETDUYET_HDDAODUC_DeTaiBenNgoaiID] ON [dbo].[DETAIBENNGOAI_XETDUYET_HDDAODUC] (DeTaiBenNgoaiID ASC)
GO
CREATE NONCLUSTERED INDEX [IX_DETAIBENNGOAI_XETDUYET_HDDAODUC_HoiDongID] ON [dbo].[DETAIBENNGOAI_XETDUYET_HDDAODUC] (HoiDongID ASC)
GO


CREATE FULLTEXT CATALOG [FTC_XetDuyet_HDDaoDuc]
GO

CREATE FULLTEXT INDEX ON [dbo].[DETAIBENNGOAI_XETDUYET_HDDAODUC] ([PhuongThucXetDuyet]) KEY INDEX [PK_DETAIBENNGOAI_XETDUYET_HDDAODUC_XetDuyetHDDDID] ON [FTC_XetDuyet_HDDaoDuc] WITH CHANGE_TRACKING AUTO

