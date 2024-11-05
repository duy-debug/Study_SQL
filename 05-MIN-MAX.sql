USE NORTHWND;
--MIN là tìm giá trị nhỏ nhất của một cột.
--Có thể kết hợp với ALIAS để thay đổi tên cột

--MAX là tìm giá trị lớn nhất của một cột.
--Có thể kết hợp với ALIAS để thay đổi tên cột

--Viết câu lệnh SQL tìm giá trị thấp nhất của các sản phẩm trong bảng Products
SELECT MIN("UnitPrice") AS "MinPrice" 
FROM dbo.Products;

--Viết câu lệnh lấy ra ngày đặt hàng gần nhất từ bảng Orders
SELECT MAX("OrderDate") AS "MaxOrdersDate"
FROM dbo.Orders;

--Viết câu lệnh SQL tìm số lượng hàng trong kho (UnitlnStock) lớn nhất
SELECT MAX("UnitsInStock") AS "MaxUnitInstock"
FROM dbo.Products;

--Hãy cho biết ngày sinh của nhân viên lớn nhất công ty.
--Gợi ý: ai có ngày sinh càng nhỏ thì người đó càng lớn tuổi
SELECT MIN("BirthDate") AS "MinBirthDate"
FROM dbo.Employees;