---V--Noi dung cong viec
CREATE PROC dbo.proc_PrintBCDK_V_NoiDungCongViec
	@BCKQID INT
AS
SELECT 
	TenNoiDungCongViec
	,CONVERT(nvarchar(20),KeHoach_BatDau,103) KeHoach_BatDau
	,CONVERT(nvarchar(20),KeHoach_KetThuc,103) KeHoach_KetThuc
	,CONVERT(nvarchar(20),ThucTe_BatDau,103) ThucTe_BatDau
	,CONVERT(nvarchar(20),ThucTe_KetThuc,103) ThucTe_KetThuc
	,Nguoi_CoQuanThucHien
 FROM NOIDUNGCONGVIEC NOLOCK WHERE BaoCaoKetQuaID=@BCKQID
GO