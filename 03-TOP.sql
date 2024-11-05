
USE NORTHWND;
--TOP là giới hạng số lượng dòng (rows) được trả về
--Viết câu lệnh SQL lấy ra 5 dòng đầu tiên trong bảng Customers
SELECT TOP 10 * 
FROM dbo.Customers;

--Viết câu lệnh SQL lấy ra 30% nhân viên của công ty hiện tại 
SELECT TOP 30 PERCENT *
FROM dbo.Employees;

--Viết câu lệnh SQL lấy ra các mã khách hàng trong bảng đơn hàng với quy định là mã khách hàng không được trùng lặp, chỉ lấy ra 5 dòng dữ liệu đầu tiên
SELECT DISTINCT TOP 5 CustomerID
FROM dbo.Orders;

--Viết câu lệnh SQL lấy ra các mã sản phẩm có mã thể loại không bị trùng lặp, và chỉ lấy ra 3 dòng đầu tiên
SELECT DISTINCT TOP 3 CategoryID
FROM dbo.Products;

--Viết câu lệnh SQL lấy ra 50% các ngày đặt hàng khác nhau từ trong bảng đơn hàng
SELECT DISTINCT TOP 50 PERCENT OrderDate
FROM dbo.Orders;

--Viết câu lệnh SQL lấy ra 10 dòng đầu tiên tên công ty khác nhau từ ngời cung cấp
SELECT DISTINCT TOP 10 CompanyName
FROM dbo.Suppliers;