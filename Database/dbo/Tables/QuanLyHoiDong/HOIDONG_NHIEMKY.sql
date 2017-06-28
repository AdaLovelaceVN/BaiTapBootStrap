CREATE TABLE [dbo].[HOIDONG_NHIEMKY]
(
	 HDNhiemKyID INT NOT NULL IDENTITY 
	,MaHoiDong NVARCHAR(1000) NULL
	,NgayThanhLap Date NULL ---  (ngày ra quyết định)
	,NhiemKy_Tu Date NULL
	,NhiemKy_Den Date NULL
	,LoaiHoiDong INT NULL  --– Enum 1:hội đồng đạo đức;2:hội đồng kỹ thuật,3:hoi dong chuyen mon
	,CONSTRAINT PK_HOIDONG_NHIEMKY_HDNhiemKyID PRIMARY KEY CLUSTERED (HDNhiemKyID ASC)
)

GO

