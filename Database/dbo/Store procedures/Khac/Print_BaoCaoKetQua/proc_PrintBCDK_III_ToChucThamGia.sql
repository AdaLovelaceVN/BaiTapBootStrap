﻿----III--TO CHUC THAM GIA
CREATE PROC dbo.proc_PrintBCDK_III_ToChucThamGia
	@BCKQID INT
AS
SELECT * FROM TOCHUCTHAMGIA NOLOCK WHERE BaoCaoKetQuaID=@BCKQID
GO 