CREATE PROCEDURE [dbo].[proc_QuyetDinhPheDuyetDeTai_FullTextIndexSearch]
	@SoQuyetDinh nvarchar(1000),
	@TenDeTai nvarchar(1000),
	@ChuNhiemDeTai nvarchar(1000),
	@QuyetDinhTuNgay date,
	@QuyetDinhDenNgay date,
	@UserId int
AS
BEGIN 

	SET NOCOUNT ON;

	IF @TenDeTai IS NOT NULL
		SELECT 
			DT.DeTaiID,
			QD.SoQuyetDinh,
			DT.TenDeTai,
			DT.CNDT_HoTen AS ChuNhiemDeTai,
			DT.ThucHienTuNgay,
			DT.ThucHienDenNgay,
			QD.NgayQuyetDinh,
			QD.QuyetDinhPheDuyetID
		FROM DETAI DT INNER JOIN FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) as FTS_DT ON DT.DeTaiID = FTS_DT.[KEY]
		INNER JOIN QUYETDINHPHEDUYET QD ON QD.QDPD_DeTaiID = DT.DeTaiID
		--WHERE FREETEXT(TenDeTai,@TenDeTai)
		AND (UPPER(LTRIM(RTRIM(QD.SoQuyetDinh))) LIKE '%' +UPPER(LTRIM(RTRIM(@SoQuyetDinh)))+ '%' OR @SoQuyetDinh IS NULL )
		AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%' +UPPER(LTRIM(RTRIM(@ChuNhiemDeTai))) + '%' OR @ChuNhiemDeTai IS NULL)
		AND (CONVERT(DATE,QD.NgayQuyetDinh,105) >= CONVERT(DATE,@QuyetDinhTuNgay,105) OR @QuyetDinhTuNgay IS NULL)
		AND (CONVERT(DATE,QD.NgayQuyetDinh,105) <= CONVERT(DATE,@QuyetDinhDenNgay,105) OR @QuyetDinhDenNgay IS NULL)
		AND (DT.UserId = @UserId OR @UserId IS NULL)
	ELSE
		SELECT 
			DT.DeTaiID,
			QD.SoQuyetDinh,
			DT.TenDeTai,
			DT.CNDT_HoTen AS ChuNhiemDeTai,
			DT.ThucHienTuNgay,
			DT.ThucHienDenNgay,
			QD.NgayQuyetDinh,
			QD.QuyetDinhPheDuyetID
		FROM QUYETDINHPHEDUYET QD INNER JOIN DETAI DT ON DT.DeTaiID = QD.QDPD_DeTaiID
		WHERE
		(UPPER(LTRIM(RTRIM(QD.SoQuyetDinh))) LIKE '%' +UPPER(LTRIM(RTRIM(@SoQuyetDinh)))+ '%' OR @SoQuyetDinh IS NULL )
		AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%' +UPPER(LTRIM(RTRIM(@ChuNhiemDeTai))) + '%' OR @ChuNhiemDeTai IS NULL)
		AND (CONVERT(DATE,QD.NgayQuyetDinh,105) >= CONVERT(DATE,@QuyetDinhTuNgay,105) OR @QuyetDinhTuNgay IS NULL)
		AND (CONVERT(DATE,QD.NgayQuyetDinh,105) <= CONVERT(DATE,@QuyetDinhDenNgay,105) OR @QuyetDinhDenNgay IS NULL)
		AND (DT.UserId = @UserId OR @UserId IS NULL)
END