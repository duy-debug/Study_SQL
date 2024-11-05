USE NORTHWND;
SELECT DISTINCT Country
FROM dbo.Customers;

--Viết câu lệnh SQL lấy ra tên các mã số bưu điện khác nhau từ bảng nhà cung cấp -Suppliers
SELECT DISTINCT PostalCode 
FROM Suppliers;

--Viết câu lệnh SQL lấy ra các dữ liệu khác nhau về họ của nhân viên (Lastname) và cách gọi danh hiệu lịch sự (TitleOfCourtest) của nhân viên từ bảng Employees
SELECT DISTINCT LastName, TitleOfCourtesy
FROM dbo.Employees;

SELECT DISTINCT TitleOfCourtesy
FROM dbo.Employees;

--Viết câu lênh SQL lấy ra mã đơn vị vận chuyển (Shipvia) khác nhau của đơn hàng -Orders
SELECT DISTINCT ShipVia
FROM dbo.Orders;

--Viết câu lệnh SQL lấy ra tên công ty và quốc gia khác nhau từ bảng Customers
SELECT DISTINCT CompanyName, Country
FROM dbo.Customers;

--Viết câu lệnh SQL lấy ra số điện thoại (Phone) khác nhau từ bảng Shippers
SELECT DISTINCT Phone
FROM dbo.Shippers;