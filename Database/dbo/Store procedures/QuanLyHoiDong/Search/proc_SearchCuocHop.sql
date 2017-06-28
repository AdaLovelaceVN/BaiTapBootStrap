CREATE PROC dbo.proc_SearchCuocHop
    @LoaiHoiDong NVARCHAR(50)
	,@MaHoiDong NVARCHAR(1000)
	,@ThoiGian NVARCHAR(50)
	,@DiaDiem NVARCHAR(1000)
	,@LoaiXetDuyet NVARCHAR(50)
AS
	DECLARE @str nvarchar(max)=''
			,@strLoaiHoiDong NVARCHAR(1000)=''
			,@strMaHoiDong NVARCHAR(1000)=''
			,@strThoiGian NVARCHAR(1000)=''
			,@strDiaDiem NVARCHAR(1000)=''
			,@strLoaiXetDuyet NVARCHAR(1000)=''
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
	IF(@LoaiXetDuyet!='')
	BEGIN
		SET @strLoaiXetDuyet=' AND LoaiXetDuyetID='+@LoaiXetDuyet
	END
	SET @str='SELECT distinct CuocHopID,a.HoiDongID,B.MaHoiDong,ThoiGian,DiaDiem,LoaiXetDuyetID,C.LoaiHoiDong,B.TrangThaiHD '
	SET @str+=' FROM(SELECT * FROM HOIDONG_CHUANBI_CUOCHOP NOLOCK'
	SET @str+=' WHERE 1=1 '+ @strLoaiXetDuyet+@strThoiGian+@strDiaDiem+' ) AS A'
	SET @str+=' INNER JOIN(SELECT * FROM HOIDONG_CHONLUA NOLOCK WHERE 1=1'+ @strLoaiHoiDong+') AS C ON C.HoiDongID=A.HoiDongID'
	SET @str+=' INNER JOIN(SELECT * FROM HOIDONG_YEUCAU_XETDUYET NOLOCK WHERE 1=1 '+@strMaHoiDong+') AS B ON B.HoiDongID=C.HoiDongID ORDER BY LoaiHoiDong,MaHoiDong,ThoiGian'
	exec(@str)