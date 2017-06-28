CREATE PROC dbo.proc_SearchHoiNghi_GuiBaiDangKy
	@HoiNghiID NVARCHAR(100)
	,@DMKhoaPhongID NVARCHAR(100)
	,@NguoiNhan NVARCHAR(100)
	,@NgayGui nvarchar(100)
AS
IF(ISDATE(@NgayGui)>0)
	  SET @NgayGui=CONVERT(DATE,@NgayGui,103)
ELSE
	 SET @NgayGui='%'
SELECT A.*,B.TrangThaiHoiNghi FROM(
	 SELECT * FROM HOINGHI_GUIBAIDANGKY NOLOCK WHERE HoiNghiID LIKE @HoiNghiID AND DMKhoaPhongID LIKE @DMKhoaPhongID 
	 AND NguoiNhan LIKE @NguoiNhan AND convert(date,NgayGui,103) LIKE  @NgayGui) AS A
	 INNER JOIN(SELECT * FROM HOINGHI_TOCHUCMODOT NOLOCK) AS B ON B.HoiNghiID=A.HoiNghiID ORDER BY A.HoiNghiID,NgayGui DESC