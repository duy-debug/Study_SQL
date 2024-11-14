CREATE TABLE NhanVien(
	MaNV INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Phai VARCHAR(50),
	NgaySinh DATE,
	DiaChi VARCHAR(255),
	SDT VARCHAR(10)
);

--LƯU Ý KHI TẠO TABLE:
--Tên bảng phải bắt đầu bằng một ký tự chữ cái và không được chứa các ký tự đặc biệt.
--Tên của các cột trong bảng phải bắt đầu bằng một ký tự chữ cái và không được chứa các ký tự đặc biệt.
--Kiểu dữ liệu của cột phải được xác định rõ ràng.
--Khóa chính của bảng phải là duy nhất.
--Khóa ngoại của bảng phải tham chiếu đến khóa chính của một bảng khác.

CREATE TABLE KhachHang(
	MaKH INT IDENTITY(100,5) NOT NULL PRIMARY KEY,
	TenKH VARCHAR(50) NOT NULL,
	DiaChi VARCHAR(255),
	SDT VARCHAR(10) CHECK(SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

--THÊM CỘT
ALTER TABLE NhanVien
ADD Email VARCHAR(100); 

--THAY ĐỔI KÍCH THƯỚC CỘT HoTen
ALTER TABLE NhanVien
ALTER COLUMN HoTen VARCHAR(100);

ALTER TABLE NhanVien
ADD CONSTRAINT NgaySinhCheck CHECK (NgaySinh <= GETDATE());


--Xóa dữ liệu
TRUNCATE TABLE NhanVien;

--Xóa Bảng
DROP TABLE NhanVien