CREATE PROC proc_SearchHoiDong_YeuCau_XetDuyet
	@LoaiHoSo int
	,@DoiTuongXetDuyet NVARCHAR(1000)
	,@DayDuHoSo int
	,@KhoaPhong int
	,@MaHoiDong NVARCHAR(1000)
	,@ThoiGianDangKy date
AS
BEGIN
	
	IF @DayDuHoSo IS NULL
		SET @DayDuHoSo = 2
	IF @DayDuHoSo = 2
		SELECT *
		FROM HOIDONG_YEUCAU_XETDUYET xd
		WHERE (UPPER(LTRIM(RTRIM(xd.DoiTuongXetDuyet))) LIKE '%'+UPPER(LTRIM(RTRIM(@DoiTuongXetDuyet)))+'%' OR @DoiTuongXetDuyet IS NULL)  	
		AND (xd.DMLoaiHoSoID = @LoaiHoSo OR @LoaiHoSo IS NULL)
		AND (xd.DMKhoaPhongID = @KhoaPhong or @KhoaPhong is null)
		and (UPPER(LTRIM(RTRIM(xd.MaHoiDong))) LIKE '%'+UPPER(LTRIM(RTRIM(@MaHoiDong)))+'%' OR @MaHoiDong IS NULL)  
		and (xd.ThoiGianDangKy = @ThoiGianDangKy or @ThoiGianDangKy is null)	

	IF @DayDuHoSo = 1
		SELECT *
		FROM HOIDONG_YEUCAU_XETDUYET xd
		WHERE (UPPER(LTRIM(RTRIM(xd.DoiTuongXetDuyet))) LIKE '%'+UPPER(LTRIM(RTRIM(@DoiTuongXetDuyet)))+'%' OR @DoiTuongXetDuyet IS NULL)  	
		AND (xd.DMLoaiHoSoID = @LoaiHoSo OR @LoaiHoSo IS NULL)
		AND (xd.DMKhoaPhongID = @KhoaPhong or @KhoaPhong is null)
		and (UPPER(LTRIM(RTRIM(xd.MaHoiDong))) LIKE '%'+UPPER(LTRIM(RTRIM(@MaHoiDong)))+'%' OR @MaHoiDong IS NULL)  
		and (xd.ThoiGianDangKy = @ThoiGianDangKy or @ThoiGianDangKy is null)	
		and (xd.DayDuHoSo = 1)

	IF @DayDuHoSo = 0
		SELECT *
		FROM HOIDONG_YEUCAU_XETDUYET xd
		WHERE (UPPER(LTRIM(RTRIM(xd.DoiTuongXetDuyet))) LIKE '%'+UPPER(LTRIM(RTRIM(@DoiTuongXetDuyet)))+'%' OR @DoiTuongXetDuyet IS NULL)  	
		AND (xd.DMLoaiHoSoID = @LoaiHoSo OR @LoaiHoSo IS NULL)
		AND (xd.DMKhoaPhongID = @KhoaPhong or @KhoaPhong is null)
		and (UPPER(LTRIM(RTRIM(xd.MaHoiDong))) LIKE '%'+UPPER(LTRIM(RTRIM(@MaHoiDong)))+'%' OR @MaHoiDong IS NULL)  
		and (xd.ThoiGianDangKy = @ThoiGianDangKy or @ThoiGianDangKy is null)	
		and (xd.DayDuHoSo = 0)

END