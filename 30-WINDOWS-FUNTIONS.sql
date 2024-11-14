USE NORTHWND;
--WINDOWS FUNTIONS
--Tính toán trên một tập dữ liệu con (window) của bảng dữ liệu


--FUNCTION_NAME(expression) OVER (
    --[PARTITION BY partition_expression, ...]
    --[ORDER BY sort_expression [ASC | DESC], ...]
    --[ROWS BETWEEN frame_specification]
--)

--Xếp hạng sản phẩm theo giảm dần trên toàn bộ table
SELECT
	ProductID,
	ProductName,
	CategoryID,
	UnitPrice,
	RANK() OVER(PARTITION BY CategoryID ORDER BY UnitPrice DESC) AS Ranking
FROM dbo.Products

--Ví dụ 3

-- Chèn 20 dòng dữ liệu thực tế vào bảng
-- Tạo bảng "sinh_vien"
CREATE TABLE [sinh_vien] (
    [ma_sinh_vien] INT PRIMARY KEY,
    [ho_ten] NVARCHAR(255),
    [diem_trung_binh] DECIMAL(3, 2),
    [ma_lop_hoc] INT
);

-- Chèn 20 dòng dữ liệu thực tế vào bảng
INSERT INTO [sinh_vien] ([ma_sinh_vien], [ho_ten], [diem_trung_binh], [ma_lop_hoc])
VALUES
    (1, N'Nguyễn Văn A', 3.75, 101),
    (2, N'Trần Thị B', 3.88, 102),
    (3, N'Phạm Văn C', 3.75, 101),
    (4, N'Huỳnh Thị D', 3.92, 103),
    (5, N'Lê Văn E', 3.60, 102),
    (6, N'Ngô Thị F', 3.78, 101),
    (7, N'Trịnh Văn G', 3.65, 102),
    (8, N'Võ Thị H', 3.80, 103),
    (9, N'Đặng Văn I', 3.55, 101),
    (10, N'Hoàng Thị K', 3.95, 102),
    (11, N'Mai Thị L', 3.70, 103),
    (12, N'Lý Thị M', 3.62, 101),
    (13, N'Chu Thị N', 3.85, 102),
    (14, N'Đỗ Thị P', 3.58, 103),
    (15, N'Dương Văn Q', 3.72, 101),
    (16, N'Lâm Thị R', 3.85, 102),
    (17, N'Nguyễn Văn S', 3.68, 101),
    (18, N'Nguyễn Thị T', 3.75, 103),
    (19, N'Nguyễn Văn U', 3.93, 102),
    (20, N'Nguyễn Thị V', 3.67, 101);

--Xếp hạng sinh viên toàn trường dựa trên điểm TB số giảm dần
SELECT
	ma_sinh_vien,
	ho_ten,
	diem_trung_binh,
	ma_lop_hoc,
	RANK() OVER(ORDER BY diem_trung_binh DESC) AS "XẾP HẠNG"
FROM dbo.sinh_vien;

--Xếp hạng sinh viên theo từng lớp học dựa trên điểm TB số giảm dần
SELECT
	ma_sinh_vien,
	ho_ten,
	diem_trung_binh,
	ma_lop_hoc,
	RANK() OVER(PARTITION BY ma_lop_hoc ORDER BY diem_trung_binh DESC) AS "XẾP HẠNG"
FROM dbo.sinh_vien;

 --Xếp hạng sinh viên theo từng lớp học dựa trên điểm TB số giảm dần, không nhảy hạng
 SELECT
	ma_sinh_vien,
	ho_ten,
	diem_trung_binh,
	ma_lop_hoc,
	DENSE_RANK() OVER(PARTITION BY ma_lop_hoc ORDER BY diem_trung_binh DESC) AS "XẾP HẠNG"
FROM dbo.sinh_vien;

 --Xếp hạng sinh viên theo từng lớp học dựa trên điểm TB số giảm dần,
 --không bị trùng hạng
 SELECT
	ma_sinh_vien,
	ho_ten,
	diem_trung_binh,
	ma_lop_hoc,
	ROW_NUMBER() OVER(PARTITION BY ma_lop_hoc ORDER BY diem_trung_binh DESC) AS "XẾP HẠNG"
FROM dbo.sinh_vien;

--ROW_NUMBER(): Gán một số thứ tự duy nhất cho mỗi dòng trong cửa sổ (window), bắt đầu từ 1.
--RANK(): Xếp hạng các dòng dựa trên giá trị của cột được sắp xếp. Các giá trị trùng lặp được xếp hạng giống nhau và bỏ qua các số xếp hạng sau đó.
--DENSE_RANK(): Tương tự như RANK(), nhưng các giá trị trùng lặp có cùng một số xếp hạng và không bỏ qua các số xếp hạng tiếp theo.
--NTILE(n): Chia dữ liệu thành n phần bằng nhau và gán một số xác định cho mỗi dòng để chỉ rõ dòng đó thuộc phần nào.
--LAG(column, n): Trả về giá trị của cột ở dòng trước đó (hoặc n dòng trước đó) trong cửa sổ.
--LEAD(column, n): Trả về giá trị của cột ở dòng sau đó (hoặc n dòng sau đó) trong cửa sổ.
--FIRST_VALUE(column): Trả về giá trị đầu tiên của cột trong cửa sổ.

--Chúng ra sử dụng hàm LAG() lấy thông tin về đơn đặt hàng
--và ngày đặt hàng của đơn đặt hàng trước đó cho mỗi khách hàng
SELECT
	CustomerID,
	OrderID,
	OrderDate,
	LAG (OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS "Ngày đặt hàng trước đây"
FROM dbo.Orders
ORDER BY CustomerID, OrderDate;

--LAST_VALUE(column): Trả về giá trị cuối cùng của cột trong cửa sổ (window).
--SUM(column): Tính tổng giá trị của cột trong cửa sổ.
--AVG(column): Tính giá trị trung bình của cột trong cửa sổ.
--COUNT(column): Đếm số lượng dòng có giá trị không null của cột trong cửa sổ.
--MIN(column): Tìm giá trị nhỏ nhất của cột trong cửa sổ.
--MAX(column): Tìm giá trị lớn nhất của cột trong cửa sổ.
--PERCENT_RANK(): Xếp hạng dòng dựa trên phần trăm vị trí của dòng trong cửa sổ. Trả về giá trị từ 0 đến 1.
--CUME_DIST(): Xác định xem dòng đó thuộc phần bao nhiêu phần trăm của dữ liệu trong cửa sổ. Trả về giá trị từ 0 đến 1.

--Tính tổng doanh số bán hàng mỗi năm cho mỗi KH và xếp hạng KH dựa trên doanh số bán hàng.