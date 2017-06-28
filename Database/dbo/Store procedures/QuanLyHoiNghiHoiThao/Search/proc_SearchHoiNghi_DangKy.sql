CREATE PROCEDURE [dbo].[proc_SearchHoiNghi_DangKy]
		@TenBai NVARCHAR(1000)
	,@ChuyenKhoa NVARCHAR(1000)
	,@BaoCaoVien NVARCHAR(1000)
	,@SoDt NVARCHAR(1000)
	,@KhoaPhongID NVARCHAR(1000)
	,@LoaiBaoCao NVARCHAR(100)
	,@HoiNghi NVARCHAR(100)
	,@DangTapChi NVARCHAR(100)
	,@TapChiDang NVARCHAR(100)
AS
	declare @str nvarchar(max),
		 @strTenBai NVARCHAR(1000)='',@strChuyenKhoa NVARCHAR(1000)='',@strBaoCaoVien NVARCHAR(1000)=''
		,@strSoDt NVARCHAR(1000)='',@strKhoaPhongID NVARCHAR(1000)=''
		,@strLoaiBaoCao NVARCHAR(100)='',@strHoiNghi NVARCHAR(100)=''
		,@strDangTapChi NVARCHAR(100)='',@strTapChiDang NVARCHAR(100)=''
	IF(@TenBai !='')
	BEGIN 
		SET @strTenBai=' AND ISNULL(TenBai,'''') LIKE'''+ @TenBai+'%'''
	END
	IF(@ChuyenKhoa !='')
	BEGIN
		SET @strChuyenKhoa=' AND ISNULL(ChuyenKhoa,'''') LIKE'''+ @strChuyenKhoa+'%'''
	END
	IF(@BaoCaoVien !='')
	BEGIN 
		SET @strBaoCaoVien=' AND ISNULL(BaoCaoVien,'''') LIKE'''+ @BaoCaoVien+'%'''
	 END
	IF(@SoDt !='')
	BEGIN 
		SET @strSoDt=' AND ISNULL(SoDt_BCV,'''') LIKE'''+ @SoDt+'%'''
	END
	IF(@KhoaPhongID !='')
	BEGIN
		SET @strKhoaPhongID=' AND ISNULL(DMKhoaPhongID,'''') ='+ @KhoaPhongID 
	 END
	IF(@LoaiBaoCao !='')
	BEGIN 
		SET @strLoaiBaoCao=' AND ISNULL(LoaiBaoCao,'''') in ('+ @LoaiBaoCao+')' 
	 END
	IF(@HoiNghi !='')
	BEGIN 
		SET @strHoiNghi=' AND ISNULL(HoiNghiID,'''') ='+ @HoiNghi
	END
	IF(@DangTapChi !='')
	BEGIN 
	   SET @strDangTapChi=' AND ISNULL(DangTapChi,'''') in ('+ @DangTapChi +')'
	 END
	IF(@TapChiDang !='')
	BEGIN
		SET @strTapChiDang=' AND ISNULL(TapChiDang,'''') in ('+ @TapChiDang +')'
	END
	SET @str=' SELECT A.*,B.TrangThaiHoiNghi FROM ('
	SET @str+=' SELECT * FROM HOINGHI_DANGKY NOLOCK  WHERE 1 =1 '
		   +@strTenBai
			+@strChuyenKhoa
			+@strBaoCaoVien
			+@strSoDt
			+@strKhoaPhongID
			+@strLoaiBaoCao
			+@strHoiNghi
			+@strDangTapChi
		+@strTapChiDang +') AS A INNER JOIN(SELECT * FROM HOINGHI_TOCHUCMODOT NOLOCK WHERE 1=1 '+@strHoiNghi+' ) AS B ON B.HoiNghiID=A.HoiNghiID ORDER BY TenBai,ChuyenKhoa,DMKhoaPhongID'
EXEC (@str)