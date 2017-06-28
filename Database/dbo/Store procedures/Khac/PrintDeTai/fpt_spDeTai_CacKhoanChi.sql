﻿--------VI(Phu luc)
CREATE PROC dbo.fpt_spDeTai_CacKhoanChi
	@DetaiId INT
	,@Loai INT
AS
SELECT ROW_NUMBER() OVER(ORDER BY ChiTietKinhPhiID) STT,B.TenNoiDungKinhPhi,C.TenDonViDo,A.* FROM(
		SELECT * FROM DETAI_CHITIETKINHPHI NOLOCK WHERE DeTaiID=@DetaiId AND Loai=@Loai) AS A
		left JOIN(SELECT * FROM DM_NOIDUNGKINHPHI NOLOCK)AS B ON B.NoiDungKinhPhiID=A.NoiDungKinhPhiID
		left JOIN(SELECT * FROM DM_DONVIDO NOLOCK) AS C ON C.DMDonViDoID=A.DMDonViDoID
		ORDER BY ChiTietKinhPhiID