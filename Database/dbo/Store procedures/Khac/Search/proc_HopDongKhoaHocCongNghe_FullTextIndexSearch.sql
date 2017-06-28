CREATE PROCEDURE [dbo].[proc_HopDongKhoaHocCongNghe_FullTextIndexSearch]
	@SoHopDong nvarchar(1000),
	@TrangThai int,
	@BenA nvarchar(1000),
	@BenB nvarchar(1000),
	@TenDeTai nvarchar(1000),
	@ChuNhiemDeTai nvarchar(1000),
	@BatDauTuNgay date,
	@BatDauDenNgay date,
	@KetThucTuNgay date,
	@KetThucDenNgay date,
	@UserId int
AS
BEGIN
	SET NOCOUNT ON;

	IF @TrangThai = 1 OR @TrangThai IS NULL
	BEGIN 
		IF @TenDeTai IS NOT NULL
			SELECT
				HD.HopDongID,
				HD.SoHopDong,
				HD.NgayKy,
				HD.NgayBatDau,
				HD.NgayKetThuc,
				HD.BenA_TenCoQuan AS BenDatHang,
				HD.BenB_TenCoQuan AS BenNhanDatHang,
				DT.TenDeTai,
				DT.CNDT_HoTen as ChuNhiemDeTai,
				DT.DeTaiID
			FROM DETAI DT INNER JOIN FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) as FTS_DT ON DT.DeTaiID = FTS_DT.[KEY]
			INNER JOIN HOPDONG HD ON HD.HD_DeTaiID = DT.DeTaiID
			--WHERE FREETEXT(TenDeTai,@TenDeTai)
			AND (UPPER(LTRIM(RTRIM(HD.BenA_TenCoQuan))) LIKE '%'+UPPER(LTRIM(RTRIM(@BENA)))+'%'  OR @BenA IS NULL)
			AND (UPPER(LTRIM(RTRIM(HD.BenB_TenCoQuan))) LIKE '%'+UPPER(LTRIM(RTRIM(@BenB)))+'%'  OR @BenB IS NULL)		
			AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%'  OR @ChuNhiemDeTai IS NULL)
			AND (CONVERT(DATE,@BatDauTuNgay,105) <= CONVERT(DATE,HD.NgayBatDau,105) OR @BatDauTuNgay IS NULL)
			AND (CONVERT(DATE,@BatDauDenNgay,105) >= CONVERT(DATE,HD.NgayBatDau,105) OR @BatDauDenNgay IS NULL)
			AND (CONVERT(DATE,@KetThucTuNgay,105) <= CONVERT(DATE,HD.NgayKetThuc,105) OR @KetThucTuNgay IS NULL)
			AND (CONVERT(DATE,@KetThucDenNgay,105) >= CONVERT(DATE,HD.NgayKetThuc,105) OR @KetThucDenNgay IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
		ELSE

			SELECT
				HD.HopDongID,
				HD.SoHopDong,
				HD.NgayKy,
				HD.NgayBatDau,
				HD.NgayKetThuc,
				HD.BenA_TenCoQuan AS BenDatHang,
				HD.BenB_TenCoQuan AS BenNhanDatHang,
				DT.TenDeTai,
				DT.CNDT_HoTen as ChuNhiemDeTai,
				DT.DeTaiID
			FROM HOPDONG HD INNER JOIN  DETAI DT ON HD.HD_DeTaiID = DT.DeTaiID
			WHERE 
			(UPPER(LTRIM(RTRIM(HD.BenA_TenCoQuan))) LIKE '%'+UPPER(LTRIM(RTRIM(@BENA)))+'%'  OR @BenA IS NULL)
			AND (UPPER(LTRIM(RTRIM(HD.BenB_TenCoQuan))) LIKE '%'+UPPER(LTRIM(RTRIM(@BenB)))+'%'  OR @BenB IS NULL)		
			AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%'  OR @ChuNhiemDeTai IS NULL)
			AND (CONVERT(DATE,@BatDauTuNgay,105) <= CONVERT(DATE,HD.NgayBatDau,105) OR @BatDauTuNgay IS NULL)
			AND (CONVERT(DATE,@BatDauDenNgay,105) >= CONVERT(DATE,HD.NgayBatDau,105) OR @BatDauDenNgay IS NULL)
			AND (CONVERT(DATE,@KetThucTuNgay,105) <= CONVERT(DATE,HD.NgayKetThuc,105) OR @KetThucTuNgay IS NULL)
			AND (CONVERT(DATE,@KetThucDenNgay,105) >= CONVERT(DATE,HD.NgayKetThuc,105) OR @KetThucDenNgay IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
	END
	--------------------------------------------------------------
	IF @TrangThai = 2
	BEGIN 
		IF @TenDeTai IS NOT NULL
			SELECT
				HD.HopDongID,
				HD.SoHopDong,
				HD.NgayKy,
				HD.NgayBatDau,
				HD.NgayKetThuc,
				HD.BenA_TenCoQuan AS BenDatHang,
				HD.BenB_TenCoQuan AS BenNhanDatHang,
				DT.TenDeTai,
				DT.CNDT_HoTen as ChuNhiemDeTai,
				DT.DeTaiID
			FROM DETAI DT INNER JOIN FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) as FTS_DT ON DT.DeTaiID = FTS_DT.[KEY]
			INNER JOIN HOPDONG HD ON HD.HD_DeTaiID = DT.DeTaiID
			--WHERE FREETEXT(TenDeTai,@TenDeTai)
			AND (UPPER(LTRIM(RTRIM(HD.BenA_TenCoQuan))) LIKE '%'+UPPER(LTRIM(RTRIM(@BENA)))+'%'  OR @BenA IS NULL)
			AND (UPPER(LTRIM(RTRIM(HD.BenB_TenCoQuan))) LIKE '%'+UPPER(LTRIM(RTRIM(@BenB)))+'%'  OR @BenB IS NULL)		
			AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%'  OR @ChuNhiemDeTai IS NULL)
			AND (CONVERT(DATE,@BatDauTuNgay,105) <= CONVERT(DATE,HD.NgayBatDau,105) OR @BatDauTuNgay IS NULL)
			AND (CONVERT(DATE,@BatDauDenNgay,105) >= CONVERT(DATE,HD.NgayBatDau,105) OR @BatDauDenNgay IS NULL)
			AND (CONVERT(DATE,@KetThucTuNgay,105) <= CONVERT(DATE,HD.NgayKetThuc,105) OR @KetThucTuNgay IS NULL)
			AND (CONVERT(DATE,@KetThucDenNgay,105) >= CONVERT(DATE,HD.NgayKetThuc,105) OR @KetThucDenNgay IS NULL)
			AND (CONVERT(DATE,HD.NgayKetThuc,105) > CONVERT(DATE,GETDATE(),105))
			AND (DT.UserId = @UserId OR @UserId IS NULL)
		ELSE

			SELECT
				HD.HopDongID,
				HD.SoHopDong,
				HD.NgayKy,
				HD.NgayBatDau,
				HD.NgayKetThuc,
				HD.BenA_TenCoQuan AS BenDatHang,
				HD.BenB_TenCoQuan AS BenNhanDatHang,
				DT.TenDeTai,
				DT.CNDT_HoTen as ChuNhiemDeTai,
				DT.DeTaiID
			FROM HOPDONG HD INNER JOIN  DETAI DT ON HD.HD_DeTaiID = DT.DeTaiID
			WHERE 
			(UPPER(LTRIM(RTRIM(HD.BenA_TenCoQuan))) LIKE '%'+UPPER(LTRIM(RTRIM(@BENA)))+'%'  OR @BenA IS NULL)
			AND (UPPER(LTRIM(RTRIM(HD.BenB_TenCoQuan))) LIKE '%'+UPPER(LTRIM(RTRIM(@BenB)))+'%'  OR @BenB IS NULL)		
			AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%'  OR @ChuNhiemDeTai IS NULL)
			AND (CONVERT(DATE,@BatDauTuNgay,105) <= CONVERT(DATE,HD.NgayBatDau,105) OR @BatDauTuNgay IS NULL)
			AND (CONVERT(DATE,@BatDauDenNgay,105) >= CONVERT(DATE,HD.NgayBatDau,105) OR @BatDauDenNgay IS NULL)
			AND (CONVERT(DATE,@KetThucTuNgay,105) <= CONVERT(DATE,HD.NgayKetThuc,105) OR @KetThucTuNgay IS NULL)
			AND (CONVERT(DATE,@KetThucDenNgay,105) >= CONVERT(DATE,HD.NgayKetThuc,105) OR @KetThucDenNgay IS NULL)
			AND (CONVERT(DATE,HD.NgayKetThuc,105) > CONVERT(DATE,GETDATE(),105))
			AND (DT.UserId = @UserId OR @UserId IS NULL)
	END
	--------------------------------------------------------------
	IF @TrangThai = 3
	BEGIN 
		IF @TenDeTai IS NOT NULL
			SELECT
				HD.HopDongID,
				HD.SoHopDong,
				HD.NgayKy,
				HD.NgayBatDau,
				HD.NgayKetThuc,
				HD.BenA_TenCoQuan AS BenDatHang,
				HD.BenB_TenCoQuan AS BenNhanDatHang,
				DT.TenDeTai,
				DT.CNDT_HoTen as ChuNhiemDeTai,
				DT.DeTaiID
			FROM DETAI DT INNER JOIN FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) as FTS_DT ON DT.DeTaiID = FTS_DT.[KEY]
			INNER JOIN HOPDONG HD ON HD.HD_DeTaiID = DT.DeTaiID
			--WHERE FREETEXT(TenDeTai,@TenDeTai)
			AND (UPPER(LTRIM(RTRIM(HD.BenA_TenCoQuan))) LIKE '%'+UPPER(LTRIM(RTRIM(@BENA)))+'%'  OR @BenA IS NULL)
			AND (UPPER(LTRIM(RTRIM(HD.BenB_TenCoQuan))) LIKE '%'+UPPER(LTRIM(RTRIM(@BenB)))+'%'  OR @BenB IS NULL)		
			AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%'  OR @ChuNhiemDeTai IS NULL)
			AND (CONVERT(DATE,@BatDauTuNgay,105) <= CONVERT(DATE,HD.NgayBatDau,105) OR @BatDauTuNgay IS NULL)
			AND (CONVERT(DATE,@BatDauDenNgay,105) >= CONVERT(DATE,HD.NgayBatDau,105) OR @BatDauDenNgay IS NULL)
			AND (CONVERT(DATE,@KetThucTuNgay,105) <= CONVERT(DATE,HD.NgayKetThuc,105) OR @KetThucTuNgay IS NULL)
			AND (CONVERT(DATE,@KetThucDenNgay,105) >= CONVERT(DATE,HD.NgayKetThuc,105) OR @KetThucDenNgay IS NULL)
			AND (CONVERT(DATE,HD.NgayKetThuc,105) < CONVERT(DATE,GETDATE(),105))
			AND (DT.UserId = @UserId OR @UserId IS NULL)
		ELSE

			SELECT
				HD.HopDongID,
				HD.SoHopDong,
				HD.NgayKy,
				HD.NgayBatDau,
				HD.NgayKetThuc,
				HD.BenA_TenCoQuan AS BenDatHang,
				HD.BenB_TenCoQuan AS BenNhanDatHang,
				DT.TenDeTai,
				DT.CNDT_HoTen as ChuNhiemDeTai,
				DT.DeTaiID
			FROM HOPDONG HD INNER JOIN  DETAI DT ON HD.HD_DeTaiID = DT.DeTaiID
			WHERE 
			(UPPER(LTRIM(RTRIM(HD.BenA_TenCoQuan))) LIKE '%'+UPPER(LTRIM(RTRIM(@BENA)))+'%'  OR @BenA IS NULL)
			AND (UPPER(LTRIM(RTRIM(HD.BenB_TenCoQuan))) LIKE '%'+UPPER(LTRIM(RTRIM(@BenB)))+'%'  OR @BenB IS NULL)		
			AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%'  OR @ChuNhiemDeTai IS NULL)
			AND (CONVERT(DATE,@BatDauTuNgay,105) <= CONVERT(DATE,HD.NgayBatDau,105) OR @BatDauTuNgay IS NULL)
			AND (CONVERT(DATE,@BatDauDenNgay,105) >= CONVERT(DATE,HD.NgayBatDau,105) OR @BatDauDenNgay IS NULL)
			AND (CONVERT(DATE,@KetThucTuNgay,105) <= CONVERT(DATE,HD.NgayKetThuc,105) OR @KetThucTuNgay IS NULL)
			AND (CONVERT(DATE,@KetThucDenNgay,105) >= CONVERT(DATE,HD.NgayKetThuc,105) OR @KetThucDenNgay IS NULL)
			AND (CONVERT(DATE,HD.NgayKetThuc,105) < CONVERT(DATE,GETDATE(),105))
			AND (DT.UserId = @UserId OR @UserId IS NULL)
	END
END
