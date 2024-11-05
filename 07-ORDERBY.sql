USE NORTHWND;
--ORDER BY column1, column2, ... ASC|DESC;
--ASC: Sắp xếp tăng dần (mặc định nếu không ghi)
--DESC: Sắp xếp giảm dần
--Hãy liệt kê tất cả các nhà cung cấp theo thứ tự tên đơn vị CompanyName từ A-Z
SELECT *
FROM dbo.Suppliers
ORDER BY "CompanyName" ASC;

--Hãy liệt kê tất cả các sản phẩm theo thứ tự giá giảm dần
SELECT *
FROM dbo.Products
ORDER BY "UnitPrice" DESC; 

--Hãy liệt kê tất cả các nhân viên theo thứ tự họ và tên đệm A-Z không dùng ASC | DESC
SELECT *
FROM dbo.Employees
ORDER BY "LastName" ASC, "FirstName" ASC;

--Hãy lấy ra một sản phẩm có số lượng bán cao nhất từ bảng (Order Details). Không được dung MAX
SELECT TOP 1 *
FROM dbo."Order Details"
ORDER BY "Quantity" DESC;

--Hãy liệt kê các danh sách các đơn đặt hàng (OrderID) trong bảng Orders theo thứ tự giảm dần của ngày đặt hàng (OrderDate)
SELECT OrderID, OrderDate
FROM dbo.Orders
ORDER BY "OrderDate" DESC;
--Hãy liệt kê ra các thành phố(City) của nhân viên trong công ty (Employees) theo thứ tự từ Z-A
SELECT *
FROM dbo.Employees
ORDER BY "City" DESC;
--Hãy cho biết nhân viên nào được tuyển đầu tiên trong công ty (Không được sử dụng hàm MIN-MAX)
SELECT TOP 1 *
FROM dbo.Employees
ORDER BY "HireDate" ASC;

--Viết câu lệnh SQL liệt kê họ và tên của nhân viên theo tiêu chí giảm dần ngày sinh của các nhân viên trong (bảng Employees).
SELECT LastName, FirstName, BirthDate 
FROM dbo.Employees
ORDER BY "BirthDate" DESC;