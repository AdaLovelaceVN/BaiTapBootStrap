CREATE PROCEDURE [dbo].[proc_PhieuDanhGiaKetQuaDeTai_FullTextIndexSearch]
	@TenDeTai nvarchar(1000),
	@ChuNhiemDeTai nvarchar(1000),
	@HoTen nvarchar(1000),
	@XepLoai int,
	@UserId int
AS
BEGIN
	SET NOCOUNT ON;

	IF @TenDeTai IS NOT NULL
		IF @XepLoai = 0
			SELECT KQ.KetQuaDeTaiID,DT.TenDeTai,DT.CNDT_HoTen AS ChuNhiemDeTai,DT.ThucHienTuNgay,DT.ThucHienDenNgay,KQ.HoTenChuyenGia,KQ.XepLoai
			FROM  DETAI DT 	INNER JOIN FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) as FTS_DT ON DT.DeTaiID = FTS_DT.[KEY]	
			INNER JOIN KETQUADETAI KQ ON KQ.PDG_DeTaiID = DT.DeTaiID
			WHERE (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(KQ.HoTenChuyenGia))) LIKE '%'+UPPER(LTRIM(RTRIM(@HoTen)))+'%' OR @HoTen IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
		ELSE
			SELECT KQ.KetQuaDeTaiID,DT.TenDeTai,DT.CNDT_HoTen AS ChuNhiemDeTai,DT.ThucHienTuNgay,DT.ThucHienDenNgay,KQ.HoTenChuyenGia,KQ.XepLoai
			FROM  DETAI DT 	INNER JOIN FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) as FTS_DT ON DT.DeTaiID = FTS_DT.[KEY]	
			INNER JOIN KETQUADETAI KQ ON KQ.PDG_DeTaiID = DT.DeTaiID
			WHERE (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(KQ.HoTenChuyenGia))) LIKE '%'+UPPER(LTRIM(RTRIM(@HoTen)))+'%' OR @HoTen IS NULL)
			AND (KQ.XepLoai = @XepLoai OR @XepLoai IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
	ELSE
	BEGIN
		IF @XepLoai = 0
			SELECT KQ.KetQuaDeTaiID,DT.TenDeTai,DT.CNDT_HoTen AS ChuNhiemDeTai,DT.ThucHienTuNgay,DT.ThucHienDenNgay,KQ.HoTenChuyenGia,KQ.XepLoai
			FROM  DETAI DT 
			INNER JOIN KETQUADETAI KQ ON KQ.PDG_DeTaiID = DT.DeTaiID
			WHERE (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(KQ.HoTenChuyenGia))) LIKE '%'+UPPER(LTRIM(RTRIM(@HoTen)))+'%' OR @HoTen IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
		ELSE
			SELECT KQ.KetQuaDeTaiID,DT.TenDeTai,DT.CNDT_HoTen AS ChuNhiemDeTai,DT.ThucHienTuNgay,DT.ThucHienDenNgay,KQ.HoTenChuyenGia,KQ.XepLoai
			FROM  DETAI DT 
			INNER JOIN KETQUADETAI KQ ON KQ.PDG_DeTaiID = DT.DeTaiID
			WHERE (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(KQ.HoTenChuyenGia))) LIKE '%'+UPPER(LTRIM(RTRIM(@HoTen)))+'%' OR @HoTen IS NULL)
			AND (KQ.XepLoai = @XepLoai OR @XepLoai IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
	END

END