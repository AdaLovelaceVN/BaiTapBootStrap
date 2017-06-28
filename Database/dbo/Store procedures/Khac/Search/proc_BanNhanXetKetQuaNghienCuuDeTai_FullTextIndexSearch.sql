CREATE PROCEDURE [dbo].[proc_BanNhanXetKetQuaNghienCuuDeTai_FullTextIndexSearch]
	@TenDeTai NVARCHAR(1000),
	@ChuNhiemDeTai NVARCHAR(1000),
	@SoQuyetDinh NVARCHAR(1000),
	@HoTen NVARCHAR(1000),
	@UserId int
AS
BEGIN
	SET NOCOUNT ON;

	IF @TenDeTai IS NOT NULL
		SELECT	DS.HoTen,
				DS.DanhSachHoiDongID,
				KQ.KetQuaNghienCuuID,
				HDNT.HoiDongNghiemThuID,
				DT.DeTaiID,
				DT.TenDeTai,
				DT.CNDT_HoTen AS ChuNhiemDeTai,
				DT.ThucHienTuNgay,
				DT.ThucHienDenNgay,
				HDNT.SoQuyetDinh		
		FROM DETAI DT INNER JOIN FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) AS FTS_DT ON DT.DeTaiID = FTS_DT.[KEY]
		INNER JOIN HOIDONGNGHIEMTHU HDNT ON HDNT.HDNT_DeTaiID = DT.DeTaiID
		INNER JOIN DANHSACHHOIDONG DS ON DS.HoiDongNghiemThuID = HDNT.HoiDongNghiemThuID
		INNER JOIN KETQUANGHIENCUU KQ ON KQ.KQNC_DanhSachHoiDongID = DS.DanhSachHoiDongID
		AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%'  OR @ChuNhiemDeTai IS NULL)
		AND (UPPER(LTRIM(RTRIM(HDNT.SoQuyetDinh))) LIKE '%'+UPPER(LTRIM(RTRIM(@SoQuyetDinh)))+'%'  OR @SoQuyetDinh IS NULL)
		AND (UPPER(LTRIM(RTRIM(DS.HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@HoTen)))+'%'  OR @HoTen IS NULL)
		AND (DT.UserId = @UserId OR @UserId IS NULL)
	ELSE
		SELECT	DS.HoTen,
				DS.DanhSachHoiDongID,
				KQ.KetQuaNghienCuuID,
				HDNT.HoiDongNghiemThuID,
				DT.DeTaiID,
				DT.TenDeTai,
				DT.CNDT_HoTen AS ChuNhiemDeTai,
				DT.ThucHienTuNgay,
				DT.ThucHienDenNgay,
				HDNT.SoQuyetDinh
		FROM DANHSACHHOIDONG DS,KETQUANGHIENCUU KQ ,DETAI DT,HOIDONGNGHIEMTHU HDNT
		WHERE DS.HoiDongNghiemThuID = HDNT.HoiDongNghiemThuID 
		AND KQ.KQNC_DanhSachHoiDongID = DS.DanhSachHoiDongID
		AND DT.DeTaiID = HDNT.HDNT_DeTaiID
		AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%'  OR @ChuNhiemDeTai IS NULL)
		AND (UPPER(LTRIM(RTRIM(HDNT.SoQuyetDinh))) LIKE '%'+UPPER(LTRIM(RTRIM(@SoQuyetDinh)))+'%'  OR @SoQuyetDinh IS NULL)
		AND (UPPER(LTRIM(RTRIM(DS.HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@HoTen)))+'%'  OR @HoTen IS NULL)
		AND (DT.UserId = @UserId OR @UserId IS NULL)
END