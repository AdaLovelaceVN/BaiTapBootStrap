﻿---kET QUA DE TAI
CREATE PROCEDURE [dbo].[fpt_spDetai_KetQuaDuKien]
	@DetaiId INT
AS
SELECT TenKetQuaDuKien FROM (SELECT * FROM DETAI_KETQUADUKIEN NOLOCK) AS A
INNER JOIN(SELECT * FROM DM_KETQUADUKIEN NOLOCK) AS B ON B.DMKetQuaDuKienID=A.DMKetQuaDuKienID
ORDER BY TenKetQuaDuKien