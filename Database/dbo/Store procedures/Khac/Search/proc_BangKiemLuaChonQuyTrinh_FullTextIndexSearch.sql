
CREATE PROCEDURE [dbo].[proc_BangKiemLuaChonQuyTrinh_FullTextIndexSearch]
	@LoaiBangKiem int,
	@SoBangKiem nvarchar(1000),
	@TenDeTai nvarchar(1000),
	@ChuNhiemDeTai nvarchar(1000),
	@UserId int
AS
BEGIN
	SET NOCOUNT ON;

	--xét duyệt tất cả
	IF @LoaiBangKiem = 0
	BEGIN
		IF @TenDeTai IS NOT NULL
			SELECT 
				XDRG.XDRG_XetDuyetRutGonID as XetDuyetID,
				DT.ThucHienTuNgay,
				DT.ThucHienDenNgay,
				DT.TenDeTai,
				XDRG.XDRG_SoBangKiem as SoBangKiem,
				1 as LoaiBangKiem,
				DT.CNDT_HoTen as ChuNhiemDeTai,
				DT.DeTaiID
			FROM DETAI DT INNER JOIN FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) AS FTS_DT ON DT.DeTaiID = FTS_DT.[KEY] 
			INNER JOIN XETDUYETRUTGON XDRG
			ON DT.DeTaiID = XDRG.XDRG_DeTaiID
			--WHERE FREETEXT(TenDeTai,@TenDeTai)
			AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(XDRG.XDRG_SoBangKiem))) LIKE '%'+UPPER(LTRIM(RTRIM(@SoBangKiem)))+'%' OR @SoBangKiem IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
			UNION
			SELECT 
				XDDD.XDDD_XetDuyetDayDuID as XetDuyetID,
				DT.ThucHienTuNgay,
				DT.ThucHienDenNgay,
				DT.TenDeTai,
				XDDD.XDDD_SoBangKiem as SoBangKiem,
				2 as LoaiBangKiem,
				DT.CNDT_HoTen as ChuNhiemDeTai,
				DT.DeTaiID
			FROM DETAI DT INNER JOIN FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) AS FTS_DT ON DT.DeTaiID = FTS_DT.[KEY] 
			INNER JOIN XETDUYETDAYDU XDDD
			ON DT.DeTaiID = XDDD.XDDD_DeTaiID
			--WHERE FREETEXT(TenDeTai,@TenDeTai)
			AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(XDDD.XDDD_SoBangKiem))) LIKE '%'+UPPER(LTRIM(RTRIM(@SoBangKiem)))+'%' OR @SoBangKiem IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
		ELSE
			SELECT 
				XDRG.XDRG_XetDuyetRutGonID as XetDuyetID,
				DT.ThucHienTuNgay,
				DT.ThucHienDenNgay,
				DT.TenDeTai,
				XDRG.XDRG_SoBangKiem as SoBangKiem,
				1 as LoaiBangKiem,
				DT.CNDT_HoTen as ChuNhiemDeTai,
				DT.DeTaiID
			FROM XETDUYETRUTGON XDRG
			INNER JOIN DETAI AS DT
			ON DT.DeTaiID = XDRG.XDRG_DeTaiID
			WHERE
			(UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(XDRG.XDRG_SoBangKiem))) LIKE '%'+UPPER(LTRIM(RTRIM(@SoBangKiem)))+'%' OR @SoBangKiem IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
			UNION
			SELECT 
				XDDD.XDDD_XetDuyetDayDuID as XetDuyetID,
				DT.ThucHienTuNgay,
				DT.ThucHienDenNgay,
				DT.TenDeTai,
				XDDD.XDDD_SoBangKiem as SoBangKiem,
				2 as LoaiBangKiem,
				DT.CNDT_HoTen as ChuNhiemDeTai,
				DT.DeTaiID
			FROM XETDUYETDAYDU XDDD
			INNER JOIN DETAI AS DT
			ON DT.DeTaiID = XDDD_DeTaiID
			WHERE
			(UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(XDDD.XDDD_SoBangKiem))) LIKE '%'+UPPER(LTRIM(RTRIM(@SoBangKiem)))+'%' OR @SoBangKiem IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
	END
	--xét duyệt rút gọn
	IF @LoaiBangKiem = 1
	BEGIN
		IF @TenDeTai IS NOT NULL
			SELECT 
				XDRG.XDRG_XetDuyetRutGonID as XetDuyetID,
				DT.ThucHienTuNgay,
				DT.ThucHienDenNgay,
				DT.TenDeTai,
				XDRG.XDRG_SoBangKiem as SoBangKiem,
				1 as LoaiBangKiem,
				DT.CNDT_HoTen as ChuNhiemDeTai,
				DT.DeTaiID
			FROM DETAI DT INNER JOIN FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) AS FTS_DT ON DT.DeTaiID = FTS_DT.[KEY] 
			INNER JOIN XETDUYETRUTGON XDRG
			ON DT.DeTaiID = XDRG.XDRG_DeTaiID
			--WHERE FREETEXT(TenDeTai,@TenDeTai)
			AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(XDRG.XDRG_SoBangKiem))) LIKE '%'+UPPER(LTRIM(RTRIM(@SoBangKiem)))+'%' OR @SoBangKiem IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
		ELSE
			SELECT 
				XDRG.XDRG_XetDuyetRutGonID as XetDuyetID,
				DT.ThucHienTuNgay,
				DT.ThucHienDenNgay,
				DT.TenDeTai,
				XDRG.XDRG_SoBangKiem as SoBangKiem,
				2 as LoaiBangKiem,
				DT.CNDT_HoTen as ChuNhiemDeTai,
				DT.DeTaiID
			FROM XETDUYETRUTGON XDRG
			INNER JOIN DETAI AS DT
			ON DT.DeTaiID = XDRG.XDRG_DeTaiID
			WHERE
			(UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(XDRG.XDRG_SoBangKiem))) LIKE '%'+UPPER(LTRIM(RTRIM(@SoBangKiem)))+'%' OR @SoBangKiem IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
	END

	--xét duyệt đầy đủ
	IF @LoaiBangKiem =2
	BEGIN
		IF @TenDeTai IS NOT NULL
			SELECT 
				XDDD.XDDD_XetDuyetDayDuID as XetDuyetID,
				DT.ThucHienTuNgay,
				DT.ThucHienDenNgay,
				DT.TenDeTai,
				XDDD.XDDD_SoBangKiem as SoBangKiem,
				1 as LoaiBangKiem,
				DT.CNDT_HoTen as ChuNhiemDeTai,
				DT.DeTaiID
			FROM DETAI DT INNER JOIN FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) AS FTS_DT ON DT.DeTaiID = FTS_DT.[KEY] 
			INNER JOIN XETDUYETDAYDU XDDD
			ON DT.DeTaiID = XDDD.XDDD_DeTaiID
			--WHERE FREETEXT(TenDeTai,@TenDeTai)
			AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(XDDD.XDDD_SoBangKiem))) LIKE '%'+UPPER(LTRIM(RTRIM(@SoBangKiem)))+'%' OR @SoBangKiem IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
		ELSE
			SELECT 
				XDDD.XDDD_XetDuyetDayDuID as XetDuyetID,
				DT.ThucHienTuNgay,
				DT.ThucHienDenNgay,
				DT.TenDeTai,
				XDDD.XDDD_SoBangKiem as SoBangKiem,
				2 as LoaiBangKiem,
				DT.CNDT_HoTen as ChuNhiemDeTai,
				DT.DeTaiID
			FROM XETDUYETDAYDU XDDD
			INNER JOIN DETAI AS DT
			ON DT.DeTaiID = XDDD_DeTaiID
			WHERE
			(UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(XDDD.XDDD_SoBangKiem))) LIKE '%'+UPPER(LTRIM(RTRIM(@SoBangKiem)))+'%' OR @SoBangKiem IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
	END
END
