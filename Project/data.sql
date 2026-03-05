
--a) Tạo cơ sở dữ liệu QLGD và các bảng 
CREATE DATABASE QLGD
GO
USE QLGD
GO

--Tạo bảng người dùng
CREATE TABLE NGUOIDUNG (
    MaNguoiDung varchar(10) NOT NULL PRIMARY KEY,
    HoTen nvarchar(100),
    DiaChi nvarchar(100),
    Email varchar(100),
    LoaiNguoiDung nvarchar(20))
GO

--Tạo bảng hàng hóa 
CREATE TABLE HANGHOA (
    MaHang varchar(10) NOT NULL PRIMARY KEY,
    TenHang nvarchar(100),
    NhomHang nvarchar(50),
    DVT nvarchar(10),
    TrangThai nvarchar(20))
GO

--Tạo bảng giao dịch 
CREATE TABLE GIAODICH (
    MaGiaoDich varchar(10) NOT NULL PRIMARY KEY,
    MaNguoiMua varchar(10),
    NgayGiaoDich date,
    TongTienHang money,
    CONSTRAINT "fk_gd_nd" FOREIGN KEY (MaNguoiMua) REFERENCES NGUOIDUNG(MaNguoiDung))
GO

--Tạo bảng chi tiết giao dịch 
CREATE TABLE CHITIETGD (
    MaGiaoDich varchar(10),
    MaHang varchar(10),
    SoLuong int,
    DonGiaThucTe money,
    PRIMARY KEY (MaGiaoDich, MaHang),
    CONSTRAINT "fk_ctgd_gd" FOREIGN KEY (MaGiaoDich) REFERENCES GIAODICH(MaGiaoDich),
    CONSTRAINT "fk_ctgd_hh" FOREIGN KEY (MaHang) REFERENCES HANGHOA(MaHang))
GO

--Bảng người dùng 
INSERT INTO NGUOIDUNG VALUES  (N'ND01', N'Lê Văn Đồng', N'Hà Nội', N'dong@gmail.com', N'Người mua')
GO
INSERT INTO NGUOIDUNG VALUES  (N'ND02', N'Hoàng Hải Dương', N'TP.HCM', N'duong@gmail.com', N'Người bán')
GO
INSERT INTO NGUOIDUNG VALUES  (N'ND03', N'Nguyễn Thị Hồng Vân', N'Đà Nẵng', N'van@gmail.com', N'Người mua')
GO
INSERT INTO NGUOIDUNG VALUES  (N'ND04', N'Nguyễn Mai Phương', N'Cần Thơ', N'maip@gmail.com', N'Người mua')
GO
INSERT INTO NGUOIDUNG VALUES  (N'ND05', N'Nguyễn Văn Hiệp', N'Hải Phòng', N'hiep@gmail.com', N'Người bán')
GO
INSERT INTO NGUOIDUNG VALUES  (N'ND06', N'Lò Thị Hiền', N'Huế', N'hien@gmail.com', N'Người mua')
GO
INSERT INTO NGUOIDUNG VALUES  (N'ND07', N'Lê Hà Vy', N'Hà Nội', N'havy@gmail.com', N'Người mua')
GO
INSERT INTO NGUOIDUNG VALUES  (N'ND08', N'Trần Văn Mạnh', N'Quảng Ninh', N'manh@gmail.com', N'Người mua')
GO
INSERT INTO NGUOIDUNG VALUES  (N'ND09', N'Nguyễn Đức Hải', N'Bình Dương', N'hai@gmail.com', N'Người mua')
GO
INSERT INTO NGUOIDUNG VALUES  (N'ND10', N'Trần Thị Thu Thủy', N'Nghệ An', N'thuy@gmail.com', N'Người bán')
GO
INSERT INTO NGUOIDUNG VALUES  (N'ND11', N'Hoàng Văn Chí', N'Hà Nội', N'chi@gmail.com', N'Người mua')
GO
INSERT INTO NGUOIDUNG VALUES  (N'ND12', N'Nguyễn Hải Nam', N'Hưng Yên', N'nam@gmail.com', N'Người mua')
GO
INSERT INTO NGUOIDUNG VALUES  (N'ND13', N'Lý Thị Vân', N'Thanh Hóa', N'tvan@gmail.com', N'Người bán')
GO
INSERT INTO NGUOIDUNG VALUES  (N'ND14', N'Phùng Thùy Duyên', N'Hà Nam', N'duyen@gmail.com', N'Người mua')
GO
INSERT INTO NGUOIDUNG VALUES  (N'ND15', N'Vũ Văn Chí', N'Hà Nội', N'vchi@gmail.com', N'Người bán')
GO

--Bảng hàng hóa 
INSERT INTO HANGHOA VALUES (N'H01', N'Laptop Dell', N'Điện tử', N'cái', N'còn hàng')
GO
INSERT INTO HANGHOA VALUES (N'H02', N'Tủ lạnh LG', N'Gia dụng ', N'cái', N'còn hàng')
GO
INSERT INTO HANGHOA VALUES (N'H03', N'Bàn phím cơ Logitech', N'Phụ kiện', N'cái', N'còn hàng')
GO
INSERT INTO HANGHOA VALUES (N'H04', N'Tai nghe Blutooth', N'Phụ kiện', N'cái', N'hết hàng')
GO
INSERT INTO HANGHOA VALUES (N'H05', N'Balo laptop', N'Phụ kiện', N'cái', N'hết hàng')
GO
INSERT INTO HANGHOA VALUES (N'H06', N'Máy hút bụi Dyson', N'Gia dụng', N'cái', N'còn hàng')
GO
INSERT INTO HANGHOA VALUES (N'H07', N'Tivi Sony 55inch', N'Điện tử', N'cái', N'hết hàng')
GO
INSERT INTO HANGHOA VALUES (N'H08', N'Máy rửa bát', N'Gia dụng', N'cái', N'còn hàng')
GO
INSERT INTO HANGHOA VALUES (N'H09', N'Đồng hồ thông minh', N'Điện tử', N'cái', N'còn hàng')
GO
INSERT INTO HANGHOA VALUES (N'H10', N'Lò vi sóng Sharp', N'Gia dụng', N'cái', N'còn hàng ')
GO

--Bảng giao dịch
INSERT INTO GIAODICH VALUES (N'GD01', N'ND05', CAST(N'2025-02-26' AS Date), 30380000)
GO
INSERT INTO GIAODICH VALUES (N'GD02', N'ND14', CAST(N'2024-05-23' AS Date), 62954800)
GO
INSERT INTO GIAODICH VALUES (N'GD03', N'ND14', CAST(N'2025-05-22' AS Date), 7180000)
GO
INSERT INTO GIAODICH VALUES (N'GD04', N'ND13', CAST(N'2025-04-03' AS Date), 10060000)
GO
INSERT INTO GIAODICH VALUES (N'GD05', N'ND15', CAST(N'2024-02-20' AS Date), 14435000)
GO
INSERT INTO GIAODICH VALUES (N'GD06', N'ND02', CAST(N'2024-03-13' AS Date), 119703000)
GO
INSERT INTO GIAODICH VALUES (N'GD07', N'ND13', CAST(N'2024-04-02' AS Date), 64703600)
GO
INSERT INTO GIAODICH VALUES (N'GD08', N'ND10', CAST(N'2024-08-20' AS Date), 80603200)
GO
INSERT INTO GIAODICH VALUES (N'GD09', N'ND07', CAST(N'2024-12-04' AS Date), 11590000)
GO
INSERT INTO GIAODICH VALUES (N'GD10', N'ND08', CAST(N'2024-08-30' AS Date), 17802000)
GO
INSERT INTO GIAODICH VALUES (N'GD11', N'ND06', CAST(N'2025-03-10' AS Date), 17802000)
GO
INSERT INTO GIAODICH VALUES (N'GD12', N'ND01', CAST(N'2024-07-23' AS Date), 14246080)
GO
INSERT INTO GIAODICH VALUES (N'GD13', N'ND09', CAST(N'2024-12-09' AS Date), 25682400)
GO
INSERT INTO GIAODICH VALUES (N'GD14', N'ND07', CAST(N'2024-08-21' AS Date), 20050000)
GO
INSERT INTO GIAODICH VALUES (N'GD15', N'ND06', CAST(N'2024-05-02' AS Date), 24071600)
GO
INSERT INTO GIAODICH VALUES (N'GD16', N'ND10', CAST(N'2025-05-05' AS Date), 44505000)
GO
INSERT INTO GIAODICH VALUES (N'GD17', N'ND11', CAST(N'2025-01-17' AS Date), 37742160)
GO
INSERT INTO GIAODICH VALUES (N'GD18', N'ND04', CAST(N'2024-12-15' AS Date), 44584200)
GO
INSERT INTO GIAODICH VALUES (N'GD19', N'ND15', CAST(N'2025-01-05' AS Date), 1350000)
GO
INSERT INTO GIAODICH VALUES (N'GD20', N'ND04', CAST(N'2025-01-20' AS Date), 20985000)
GO
INSERT INTO GIAODICH VALUES (N'GD21', N'ND05', CAST(N'2024-10-18' AS Date), 34770000)
GO
INSERT INTO GIAODICH VALUES (N'GD22', N'ND12', CAST(N'2024-04-17' AS Date), 10255400)
GO
INSERT INTO GIAODICH VALUES (N'GD23', N'ND01', CAST(N'2025-02-01' AS Date), 2250000)
GO
INSERT INTO GIAODICH VALUES (N'GD24', N'ND11', CAST(N'2024-07-07' AS Date), 80705600)
GO
INSERT INTO GIAODICH VALUES (N'GD25', N'ND03', CAST(N'2024-05-08' AS Date), 12580780)
GO

--Bảng chi tiết giao dịch 
INSERT INTO CHITIETGD VALUES (N'GD01', N'H03', 8, 3600000)
GO
INSERT INTO CHITIETGD VALUES (N'GD01', N'H09', 4, 26780000)
GO
INSERT INTO CHITIETGD VALUES (N'GD02', N'H02', 6, 51364800)
GO
INSERT INTO CHITIETGD VALUES (N'GD02', N'H08', 1, 11590000)
GO
INSERT INTO CHITIETGD VALUES (N'GD03', N'H04', 1, 230000)
GO
INSERT INTO CHITIETGD VALUES (N'GD03', N'H10', 2, 6950000)
GO
INSERT INTO CHITIETGD VALUES (N'GD04', N'H06', 1, 8901000)
GO
INSERT INTO CHITIETGD VALUES (N'GD04', N'H08', 1, 1159000)
GO
INSERT INTO CHITIETGD VALUES (N'GD05', N'H05', 1, 535000)
GO
INSERT INTO CHITIETGD VALUES (N'GD05', N'H10', 4, 13900000)
GO
INSERT INTO CHITIETGD VALUES (N'GD06', N'H06', 3, 26703000)
GO
INSERT INTO CHITIETGD VALUES (N'GD06', N'H07', 4, 93000000)
GO
INSERT INTO CHITIETGD VALUES (N'GD07', N'H01', 5, 62903600)
GO
INSERT INTO CHITIETGD VALUES (N'GD07', N'H03', 4, 1800000)
GO
INSERT INTO CHITIETGD VALUES (N'GD08', N'H02', 4, 34243200)
GO
INSERT INTO CHITIETGD VALUES (N'GD08', N'H08', 4, 46360000)
GO
INSERT INTO CHITIETGD VALUES (N'GD09', N'H08', 1, 11590000)
GO
INSERT INTO CHITIETGD VALUES (N'GD10', N'H06', 2, 17802000)
GO
INSERT INTO CHITIETGD VALUES (N'GD11', N'H06', 2, 17802000)
GO
INSERT INTO CHITIETGD VALUES (N'GD12', N'H02', 1, 856080)
GO
INSERT INTO CHITIETGD VALUES (N'GD12', N'H09', 2, 13390000)
GO
INSERT INTO CHITIETGD VALUES (N'GD13', N'H02', 3, 25682400)
GO
INSERT INTO CHITIETGD VALUES (N'GD14', N'H05', 3, 2675000)
GO
INSERT INTO CHITIETGD VALUES (N'GD14', N'H10', 5, 17375000)
GO
INSERT INTO CHITIETGD VALUES (N'GD15', N'H02', 2, 17121600)
GO
INSERT INTO CHITIETGD VALUES (N'GD15', N'H10', 2, 6950000)
GO
INSERT INTO CHITIETGD VALUES (N'GD16', N'H06', 5, 44505000)
GO
INSERT INTO CHITIETGD VALUES (N'GD17', N'H01', 3, 37742160)
GO
INSERT INTO CHITIETGD VALUES (N'GD18', N'H02', 5, 42804000)
GO
INSERT INTO CHITIETGD VALUES (N'GD18', N'H06', 2, 1780200)
GO
INSERT INTO CHITIETGD VALUES (N'GD19', N'H03', 3, 1350000)
GO
INSERT INTO CHITIETGD VALUES (N'GD20', N'H03', 2, 900000)
GO
INSERT INTO CHITIETGD VALUES (N'GD20', N'H09', 3, 20085000)
GO
INSERT INTO CHITIETGD VALUES (N'GD21', N'H08', 3, 34770000)
GO
INSERT INTO CHITIETGD VALUES (N'GD22', N'H06', 4, 3560400)
GO
INSERT INTO CHITIETGD VALUES (N'GD22', N'H09', 1, 6695000)
GO
INSERT INTO CHITIETGD VALUES (N'GD23', N'H03', 5, 2250000)
GO
INSERT INTO CHITIETGD VALUES (N'GD24', N'H01', 5, 62903600)
GO
INSERT INTO CHITIETGD VALUES (N'GD24', N'H06', 2, 17802000)
GO
INSERT INTO CHITIETGD VALUES (N'GD25', N'H01', 1, 12580780)
GO 

--b) Lấy danh sách các giao dịch trong một tháng trong năm 2025 (T1, T2, T3 hoặc T4 tùy vào dữ liệu đã nhập ở câu a), danh sách hiển thị đã sắp xếp theo ngày giao dịch.

SELECT *
FROM GIAODICH
WHERE YEAR(NgayGiaoDich) = 2025 AND MONTH(NgayGiaoDich) = 1
ORDER BY NgayGiaoDich ASC


--c) Hiển thị thông tin 5 người bán có doanh thu cao nhất năm 2024

SELECT TOP 5 
gd.MaNguoiMua AS MaNguoiBan,
HoTen, DiaChi, Email, 
SUM(TongTienHang) AS DoanhThu
FROM GIAODICH gd INNER JOIN NGUOIDUNG nd ON gd.MaNguoiMua = nd.MaNguoiDung
WHERE nd.LoaiNguoiDung = N'Người bán' AND YEAR(NgayGiaoDich) = 2024
GROUP BY gd.MaNguoiMua, HoTen, DiaChi, Email
ORDER BY DoanhThu DESC


--d) Store Procedure hiển thị tổng doanh thu của một mặt hàng được truyền vào trong năm 2024. Thủ tục kiểm tra xem mặt hàng có tồn tại hay không

CREATE PROCEDURE sp_DoanhThuMatHang
    @mahang varchar(10)
AS BEGIN
    -- Kiểm tra xem mặt hàng có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM HANGHOA WHERE MaHang = @mahang)
    BEGIN
        PRINT N'Mặt hàng không tồn tại'
        RETURN
    END
        -- Tính tổng doanh thu của mặt hàng trong năm 2024
        SELECT hh.MaHang, TenHang, SUM(DonGiaThucTe) AS DoanhThu
        FROM CHITIETGD ctgd
        JOIN GIAODICH gd ON ctgd.MaGiaoDich = gd.MaGiaoDich
        JOIN HANGHOA hh ON ctgd.MaHang = hh.MaHang
        WHERE ctgd.MaHang = @mahang AND YEAR(gd.NgayGiaoDich) = 2024
        GROUP BY hh.MaHang, hh.TenHang
END
--Chạy thử
EXEC sp_DoanhThuMatHang @MaHang = 'H10'
EXEC sp_DoanhThuMatHang @MaHang = 'H15'


--e) Function trả về danh sách khách hàng có tổng giá trị giao dịch nhỏ hơn một số tiền cụ thể được truyền vào

CREATE FUNCTION fn_khachhang(@SoTien money)
RETURNS TABLE
AS RETURN
(SELECT 
        nd.MaNguoiDung,
        nd.HoTen,
        nd.Email,
        nd.DiaChi,
        SUM(gd.TongTienHang) AS TongGiaTriGiaoDich
    FROM GIAODICH gd
    INNER JOIN NGUOIDUNG nd ON gd.MaNguoiMua = nd.MaNguoiDung
    GROUP BY nd.MaNguoiDung, nd.HoTen, nd.Email, nd.DiaChi
    HAVING SUM(gd.TongTienHang) < @SoTien)
END

--Chạy thử
SELECT * FROM fn_khachhang(50000000)

