CREATE DATABASE DKVSampleDb;
GO

USE DKVSampleDb;
GO

CREATE TABLE QUAN_TRI( 
    ID INT PRIMARY KEY IDENTITY, 
    TaiKhoan VARCHAR(25) UNIQUE,
    MatKhau VARCHAR(255),
    TrangThai TINYINT
);
GO

CREATE TABLE LOAI_HINH_NEN(
    ID INT PRIMARY KEY IDENTITY,
    MaLoai VARCHAR(255) UNIQUE,
    TenLoai NVARCHAR(255),
    TrangThai TINYINT
);
GO

CREATE TABLE HINH_NEN(
    ID INT PRIMARY KEY IDENTITY, 
    MaHinhNen VARCHAR(255) UNIQUE, 
    TenHinhNen NVARCHAR(255),
    HinhAnh NVARCHAR(255),
    SoLuong INT,
    DonGia FLOAT,
    MaLoai INT REFERENCES LOAI_HINH_NEN(ID),
    TrangThai TINYINT
);
GO

CREATE TABLE KHACH_HANG(
    ID INT PRIMARY KEY IDENTITY,
    MaKhachHang VARCHAR(255) UNIQUE,
    HoTenKhachHang NVARCHAR(255),
    Email VARCHAR(255) UNIQUE, 
    MatKhau VARCHAR(255),
    DienThoai VARCHAR(10) UNIQUE,
    DiaChi NVARCHAR(255),
    NgayDangKy DATETIME,
    TrangThai TINYINT
);
GO

CREATE TABLE HOA_DON(
    ID INT PRIMARY KEY IDENTITY, 
    MaHoaDon VARCHAR(255) UNIQUE, 
    MaKhachHang INT REFERENCES KHACH_HANG(ID), 
    NgayHoaDon DATETIME,
    NgayNhan DATETIME,
    HoTenKhachHang NVARCHAR(255),
    Email VARCHAR(255),
    DienThoai VARCHAR(10),
    DiaChi NVARCHAR(255),
    TongTriGia FLOAT,
    TrangThai TINYINT
);
GO

CREATE TABLE CT_HOA_DON(
    ID INT PRIMARY KEY IDENTITY,
    HoaDonID INT REFERENCES HOA_DON(ID), 
    SanPhamID INT REFERENCES HINH_NEN(ID), 
    SoLuongMua INT,
    DonGiaMua FLOAT,
    ThanhTien FLOAT,
    TrangThai TINYINT
);
GO

INSERT INTO QUAN_TRI (TaiKhoan, MatKhau, TrangThai)
VALUES
('admin', 'admin123', 1),
('manager', 'manager456', 1),
('staff', 'staff789', 1);

INSERT INTO LOAI_HINH_NEN (MaLoai, TenLoai, TrangThai)
VALUES
('LN001', N'Hình nền thiên nhiên', 1),
('LN002', N'Hình nền động vật', 1),
('LN003', N'Hình nền kiến trúc', 1);

INSERT INTO HINH_NEN (MaHinhNen, TenHinhNen, HinhAnh, SoLuong, DonGia, MaLoai, TrangThai)
VALUES
('HN0001', N'Cảnh biển', 'beach.jpg', 50, 100.0, 1, 1),
('HN0002', N'Sư tử', 'lion.jpg', 30, 200.0, 2, 1),
('HN0003', N'Tòa nhà chọc trời', 'skyscraper.jpg', 100, 150.0, 3, 1),
('HN0004', N'Trăng tròn', 'moon.jpg', 40, 120.0, 1, 1),
('HN0005', N'Chó con dễ thương', 'puppy.jpg', 80, 90.0, 2, 1);

INSERT INTO KHACH_HANG (MaKhachHang, HoTenKhachHang, Email, MatKhau, DienThoai, DiaChi, NgayDangKy, TrangThai)
VALUES
('KH001', N'Nguyễn Văn A', 'nguyenvana@example.com', 'password123', '0912345678', N'Quận 1, TP.HCM', '2024-11-01', 1),
('KH002', N'Phan Thị B', 'phanthib@example.com', 'password456', '0908765432', N'Quận 3, TP.HCM', '2024-10-15', 1),
('KH003', N'Lê Minh C', 'leminhc@example.com', 'password789', '0923456789', N'Quận 5, TP.HCM', '2024-09-10', 1),
('KH004', N'Trần Thị D', 'tranthid@example.com', 'password101', '0932345678', N'Quận 7, TP.HCM', '2024-11-05', 1),
('KH005', N'Hoàng Minh E', 'hoangmine@example.com', 'password202', '0943456789', N'Quận 10, TP.HCM', '2024-08-20', 1);

INSERT INTO HOA_DON (MaHoaDon, MaKhachHang, NgayHoaDon, NgayNhan, HoTenKhachHang, Email, DienThoai, DiaChi, TongTriGia, TrangThai)
VALUES
('HD001', 1, '2024-11-01', '2024-11-02', N'Nguyễn Văn A', 'nguyenvana@example.com', '0912345678', N'Quận 1, TP.HCM', 950.0, 1),
('HD002', 2, '2024-10-15', '2024-10-16', N'Phan Thị B', 'phanthib@example.com', '0908765432', N'Quận 3, TP.HCM', 300.0, 1),
('HD003', 3, '2024-09-10', '2024-09-12', N'Lê Minh C', 'leminhc@example.com', '0923456789', N'Quận 5, TP.HCM', 700.0, 1),
('HD004', 4, '2024-11-05', '2024-11-06', N'Trần Thị D', 'tranthid@example.com', '0932345678', N'Quận 7, TP.HCM', 400.0, 1),
('HD005', 5, '2024-08-20', '2024-08-22', N'Hoàng Minh E', 'hoangmine@example.com', '0943456789', N'Quận 10, TP.HCM', 600.0, 1);

INSERT INTO CT_HOA_DON (HoaDonID, SanPhamID, SoLuongMua, DonGiaMua, ThanhTien, TrangThai)
VALUES
(1, 1, 1, 100.0, 100.0, 1),
(1, 3, 1, 150.0, 150.0, 1),
(2, 2, 2, 200.0, 400.0, 1),
(3, 4, 1, 120.0, 120.0, 1),
(4, 5, 2, 90.0, 180.0, 1);

-- Truy vấn dữ liệu từ các bảng
SELECT * FROM QUAN_TRI;
SELECT * FROM LOAI_HINH_NEN;
SELECT * FROM HINH_NEN;
SELECT * FROM KHACH_HANG; 
SELECT * FROM HOA_DON;
SELECT * FROM CT_HOA_DON;

-- Xóa các bảng và cơ sở dữ liệu
DROP TABLE CT_HOA_DON;
DROP TABLE HOA_DON;
DROP TABLE KHACH_HANG; 
DROP TABLE HINH_NEN; 
DROP TABLE LOAI_HINH_NEN;
DROP TABLE QUAN_TRI;

