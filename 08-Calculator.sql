USE NORTHWND;
--Tính số lượng sản phẩm còn lại trong (UnitInStock) sau khi bán hết các sản phẩm đã được đặt hàng (UnitOnOrder)
SELECT ProductID, ProductName,
	   UnitsInStock,UnitsOnOrder,	
	   (UnitsInStock-UnitsOnOrder) AS "SỐ LƯỢNG CÒN LẠI"
FROM dbo.Products;

--Tính giá trị đơn hàng chi tiết cho tất cả các sản phẩm trong bảng OrderDetails
--OrderDetailsValue=UnitPrice x Quantity
SELECT *,
	   (UnitPrice * Quantity) AS "Giá trị đơn hàng" 	
FROM dbo.[Order Details];

--Tính tỷ lệ giá vận chuyển đơn đặt hàng (Freight) trung bình của các đơn hàng trong bảng Orders so với giá trị vận chuyển của đơn hàng lớn nhất (MaxFreight)
--FreightRatio = AVG(Freight)/MAX(Freight)
SELECT AVG(Freight) / MAX(Freight) AS "Tỷ lệ"		
FROM dbo.Orders;

--Hãy liệt kê danh sách các sản phẩm, và giá (UnitPrice) của từng sản phẩm sẽ được giảm đi 10%.
--Cách 1: Dùng phép nhân + phép chia
--Cách 2: Chỉ được dùng phép nhân
SELECT UnitPrice, (UnitPrice * 90/100) AS "Giá sau khi giảm 10%"
FROM dbo.Products;

SELECT UnitPrice, CAST(ROUND(UnitPrice * 0.9, 2) AS DECIMAL(10,2)) AS "Giá sau khi giảm 10%"
FROM dbo.Products;

--Viết câu lệnh SQL gộp họ và tên của Nhân viên
SELECT LastName, FirstName, (LastName + FirstName) AS "FULLNAME"
FROM dbo.Employees;

--Tính giá trị trung bình của giá đơn hàng trong bảng product sau đó chia cho 10 lấy phần dư
SELECT AVG(UnitPrice)%10 AS "Phần dư"
FROM dbo.Products;
