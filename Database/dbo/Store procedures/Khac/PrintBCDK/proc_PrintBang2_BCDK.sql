﻿--------BANG 2 BAO CAO DINH KY
CREATE PROC proc_PrintBang2_BCDK
	@IDBaoCaoDK INT
AS
SELECT A.*,B.TenDonViDo FROM(
	SELECT * FROM BANG2 NOLOCK WHERE BaoCaoDinhKyID=7
	) AS A
LEFT JOIN(SELECT * FROM DM_DONVIDO NOLOCK)AS B ON B.DMDonViDoID=A.DonViDoID
GO