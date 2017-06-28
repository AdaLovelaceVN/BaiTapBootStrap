CREATE TABLE [dbo].[DINHKEM_DINHKEMVANBAN]
(
	DinhKemVanBanID				int NOT NULL IDENTITY,
	LoaiQuyTrinh				int NULL,--(Enum)Quy trình tổ chức hội nghị hội thảo , quản lý công tác hội đồng,quản lý  NCKH,quản lý đề tài NCKH bên ngoài
	Form						int NULL,-- (Enum)Cho biết đang ở form nào
	IDTrongForm					int NULL,-- ID của form đang mở
	TenTapTin					nvarchar(MAX) NULL,
	PhanMoRong					nvarchar(MAX) NULL,
	KichThuoc					nvarchar(MAX) NULL,
	LoaiVanBanDinhKemID			int NULL,--ref DANHMUC_LOAIVANBANDINHKEM
	CONSTRAINT PK_DINHKEM_DINHKEMVANBAN_DinhKemVanBanID PRIMARY KEY CLUSTERED (DinhKemVanBanID ASC),
	CONSTRAINT FK_DINHKEM_DINHKEMVANBAN_LoaiVanBanDinhKem FOREIGN KEY (LoaiVanBanDinhKemID) REFERENCES DANHMUC_LOAIVANBANDINHKEM(LoaiVanBanDinhKemID)
)
GO

CREATE NONCLUSTERED INDEX IX_DINHKEM_DINHKEMVANBAN_LoaiVanBanDinhKemID ON DINHKEM_DINHKEMVANBAN
( 
	LoaiVanBanDinhKemID         ASC
)
go


