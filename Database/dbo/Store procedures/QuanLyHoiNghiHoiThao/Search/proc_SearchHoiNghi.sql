CREATE PROCEDURE [dbo].[proc_SearchHoiNghi]
     @MaHoiNghi VARCHAR(50)
	,@TenHoiNghi VARCHAR(50)
	,@ThoiGianTu VARCHAR(50)
	,@ThoiGianDen VARCHAR(50)
AS
	DECLARE @strQuery NVARCHAR(MAX)=''
	,@strMaHoiNghi NVARCHAR(1000)='',@strTenHoiNghi NVARCHAR(1000)=''
	,@strThoiGianTu NVARCHAR(1000)='',@strThoiGianDen NVARCHAR(1000)=''
	---------------
	IF(@MaHoiNghi!='')
	BEGIN
		SET @strMaHoiNghi=  ' AND ISNULL(MaHoiNghi,'''') LIKE'''+@MaHoiNghi+'%'''
	END
	IF(@TenHoiNghi!='')
	BEGIN
		SET @strTenHoiNghi= ' AND ISNULL(TenHoiNghi,'''') LIKE'''+@TenHoiNghi+'%'''
	END
	IF(@ThoiGianTu!='')
	BEGIN
		SET @strThoiGianTu=' AND convert(DATE,ISNULL(ThoiGianTu,''''),103) >= CONVERT(DATE,'''+@ThoiGianTu+''',103)'
	END
	IF(@ThoiGianDen!='')
		SET @strThoiGianDen=  ' AND convert(DATE,ISNULL(ThoiGianDen,''''),103) <=CONVERT(DATE,'''+@ThoiGianDen+''',103)'

	SET @strQuery=' SELECT * FROM HOINGHI_TOCHUCMODOT NOLOCK WHERE 1=1 '
		+@strMaHoiNghi+@strTenHoiNghi+@strThoiGianTu+@strThoiGianTu+' ORDER BY ThoiGianDen,ThoiGianTu DESC'
	exec( @strQuery)
go