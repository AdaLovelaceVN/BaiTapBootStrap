﻿-----Hop tac quoc te
CREATE PROC dbo.fpt_spDeTai_HopTacQuocTe
	@DetaiId INT
AS
SELECT B.TenTinhTrangHopTacQuocTe,TenDoiTac,NoiDungHopTac FROM (SELECT * FROM DETAI_HOPTACQUOCTE NOLOCK WHERE DeTaiID=@DetaiId)AS A
INNER JOIN(SELECT * FROM DM_TINHTRANGHOPTACQUOCTE NOLOCK)AS B ON B.DMTinhTrangHopTacQuocTeID=A.DMTinhTrangHopTacQuocTeID
ORDER BY TenDoiTac,TenTinhTrangHopTacQuocTe