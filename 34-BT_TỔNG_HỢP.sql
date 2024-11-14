
--Bài tập tổng hợp
--Yêu cầu 1: Tạo bảng SinhVien với các cột sau:
--MaSV: Kiểu dữ liệu INT, khóa chính, không thể chứa giá trị null.
--HoTen: Kiểu dữ liệu VARCHAR(50), không thể chứa giá trị null.
--Lop: Kiểu dữ liệu VARCHAR(20).
--Nganh: Kiểu dữ liệu VARCHAR(20).
--DiemTB: Kiểu dữ liệu FLOAT.
CREATE TABLE SinhVien(
	MaSV INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Lop VARCHAR(20),
	Nganh VARCHAR(20),
	DiemTB FLOAT
);

--2.Thêm cột Email vào bảng SinhVien với kiểu dữ liệu VARCHAR(100).
ALTER TABLE SinhVien
ADD Email VARCHAR(100);

--3.Sửa đổi kiểu dữ liệu của cột DiemTB trong bảng SinhVien thành kiểu dữ liệu DECIMAL(2,1).
ALTER TABLE SinhVien
ALTER COLUMN DiemTB  DECIMAL (2,1);

--4.Xóa cột Nganh khỏi bảng SinhVien.
ALTER TABLE SinhVien
DROP COLUMN Nganh;

--5.Thêm rằng buộc kiểm tra cho cột DiemTB trong bảng SinhVien để giá trị phải lớn hơn hoặc bằng 0 VÀ <=10.
ALTER TABLE SinhVien
ADD CONSTRAINT DiemTBCheck CHECK(DiemTB >= 0 AND DiemTB <= 10);

--6.Thêm ràng buộc duy nhất cho cột MaSV trong bảng SinhVien.
ALTER TABLE SinhVien
ADD CONSTRAINT MaSVUnique UNIQUE(MaSV);

--7.Thêm dữ liệu vào bảng SinhVien với một số thông tin thủ công.
INSERT INTO SinhVien (MaSV, HoTen, Lop, DiemTB, Email) VALUES (1, 'Nguyen Van A', '65.CNTT1', 8.5, 'nguyenvana@ntu.edu.vn');

--8.Xóa dữ liệu trong bảng SinhVien.
TRUNCATE TABLE SinhVien

--9.Xóa bảng SinhVien.
DROP TABLE SinhVien

--10.Tạo lại bảng SinhVien với cấu trúc ban đầu.
CREATE TABLE SinhVien(
	MaSV INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Lop VARCHAR(20),
	Nganh VARCHAR(20),
	DiemTB FLOAT
);