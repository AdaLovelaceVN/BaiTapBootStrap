CREATE PROC proc_SearchGhiNhanKetQua
		 @LoaiHoiDong NVARCHAR(50)
	,@MaHoiDong NVARCHAR(1000)
	,@ThoiGian NVARCHAR(50)
	,@DiaDiem NVARCHAR(1000)

AS
	DECLARE @str nvarchar(max)=''
			,@strLoaiHoiDong NVARCHAR(1000)=''
			,@strMaHoiDong NVARCHAR(1000)=''
			,@strThoiGian NVARCHAR(1000)=''
			,@strDiaDiem NVARCHAR(1000)=''
		
	IF(@LoaiHoiDong!='')
	BEGIN
		SET @strLoaiHoiDong= ' AND LoaiHoiDong IN('+@LoaiHoiDong+')'
	END
	IF(@MaHoiDong!='')
	BEGIN
		SET @strMaHoiDong= ' AND MaHoiDong like'''+@MaHoiDong+''''
	END
	IF(@ThoiGian!='')
	BEGIN
		SET @strThoiGian=' AND CONVERT(date,ThoiGian,103) LIKE CONVERT(date,'''+ @ThoiGian +''',103) '
	END
	IF(@DiaDiem!='')
	BEGIN
		SET @strDiaDiem=' AND DiaDiem LIKE '''+@DiaDiem+'%'''
	END

	SET @str='SELECT distinct GhiNhanKetQuaID,A.ThoiGian,A.DiaDiem,A.KetLuan,A.HoiDongID,MaHoiDong,LoaiHoiDong ,DoiTuongXetDuyet,B.TrangThaiHD '
	SET @str+=' FROM(SELECT * FROM HOIDONG_GHINHAN_KETQUA NOLOCK'
	SET @str+=' WHERE 1=1 '+@strThoiGian+@strDiaDiem+' ) AS A'
	SET  @str+=' INNER JOIN(SELECT * FROM HOIDONG_CHUANBI_CUOCHOP NOLOCK ) AS B1 ON B1.HoiDongID=A.HoiDongID '
	SET @str+=' INNER JOIN(SELECT * FROM HOIDONG_CHONLUA NOLOCK WHERE 1=1'+ @strLoaiHoiDong+') AS C ON C.HoiDongID=B1.HoiDongID'
	SET @str+=' INNER JOIN(SELECT * FROM HOIDONG_YEUCAU_XETDUYET NOLOCK WHERE 1=1 '+@strMaHoiDong+') AS B ON B.HoiDongID=C.HoiDongID ORDER BY LoaiHoiDong,MaHoiDong,ThoiGian'
	exec(@str)
