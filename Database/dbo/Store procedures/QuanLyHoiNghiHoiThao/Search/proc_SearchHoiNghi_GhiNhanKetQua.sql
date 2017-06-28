CREATE PROCEDURE [dbo].[proc_SearchHoiNghi_GhiNhanKetQua]
   @HoiNghiID NVARCHAR(100)
	,@NgayGhiNhan nvarchar(100)
AS
IF(ISDATE(@NgayGhiNhan)>0)
	  SET @NgayGhiNhan=CONVERT(DATE,@NgayGhiNhan,103)
ELSE
	 SET @NgayGhiNhan='%'
SELECT *,B.TrangThaiHoiNghi FROM(
 SELECT * FROM HOINGHI_GHINHANKETQUA NOLOCK WHERE HoiNghiID LIKE @HoiNghiID AND convert(date,NgayGhiNhan,103) LIKE @NgayGhiNhan) AS A
 INNER JOIN(SELECT * FROM HOINGHI_TOCHUCMODOT NOLOCK WHERE  HoiNghiID LIKE @HoiNghiID) AS B ON B.HoiNghiID=A.HoiNghiID
  ORDER BY A.HoiNghiID,NgayGhiNhan DESC