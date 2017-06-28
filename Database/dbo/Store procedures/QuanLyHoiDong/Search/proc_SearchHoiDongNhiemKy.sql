CREATE PROC proc_SearchHoiDongNhiemKy
    @LoaiHoiDong VARCHAR(50)
	,@NhiemKyTu VARCHAR(50)
	,@NhiemKyDen VARCHAR(50)
	,@NgayThanhLap VARCHAR(50)
	,@MaHoiDong NVARCHAR(1000)
AS
	DECLARE @strQuery NVARCHAR(MAX)=''
	,@strNhiemKyTu NVARCHAR(1000)='',@strNhiemKyDen NVARCHAR(1000)=''
	,@strNgayThanhLap NVARCHAR(1000)='',@strMaHoiDong NVARCHAR(1000)=''
	---------------
	IF(@NhiemKyTu!='')
	BEGIN
		SET @strNhiemKyTu= ' AND convert(DATE,ISNULL(NhiemKy_Tu,''''),103) >= CONVERT(DATE,'''+@NhiemKyTu+''',103)'
	END
	IF(@NhiemKyDen!='')
	BEGIN
		SET @strNhiemKyDen= ' AND convert(DATE,ISNULL(NhiemKy_Den,''''),103) <=CONVERT(DATE,'''+@NhiemKyDen+''',103)'
	END
	IF(@NgayThanhLap!='')
	BEGIN
		SET @strNgayThanhLap= ' AND  convert(DATE,ISNULL(NgayThanhLap,''''),103) = CONVERT(DATE,''' +@NgayThanhLap+''',103)'
	END
	IF(@MaHoiDong!='')
		SET @strMaHoiDong= ' AND ISNULL(MaHoiDong,'''') LIKE'''+@MaHoiDong+'%'''
	SET @strQuery=' SELECT * FROM HOIDONG_NHIEMKY NOLOCK WHERE LoaiHoiDong in('+@LoaiHoiDong+')'
		+@strNhiemKyTu+@strNhiemKyDen+@strNgayThanhLap+@strMaHoiDong+' ORDER BY LoaiHoiDong,NhiemKy_Tu'
	EXEC( @strQuery)