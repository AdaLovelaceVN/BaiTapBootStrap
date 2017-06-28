CREATE PROC proc_SearchHoiDongLuaChon
	 @LoaiHoiDong NVARCHAR(50)
	,@NgayThanhLap NVARCHAR(50)
AS
DECLARE @str NVARCHAR(MAX)='',@strLoaiHD NVARCHAR(1000),@strNgayThanhLap NVARCHAR(1000)=''
IF(@LoaiHoiDong!='')
	SET @strLoaiHD=' AND LoaiHoiDong IN ('+@LoaiHoiDong+')'
IF(@NgayThanhLap!='')
	SET @strNgayThanhLap=' AND CONVERT(date,NgayThanhLap,103) LIKE CONVERT(DATE,'''+ @NgayThanhLap +''',103) '
SET @str='SELECT A.*,iSNULL(MaHoiDong,'''') MaHoiDong,DoiTuongXetDuyet,B.DMKhoaPhongID,B.DMLoaiHoSoID FROM (SELECT * FROM HOIDONG_CHONLUA NOLOCK WHERE 1=1 '
+@strLoaiHD +@strNgayThanhLap+ ' ) AS A INNER JOIN(SELECT * FROM HOIDONG_YEUCAU_XETDUYET NOLOCK)AS B ON B.HoiDongID=A.HoiDongID ORDER BY NgayThanhLap ,MaHoiDong'
EXEC (@str)
