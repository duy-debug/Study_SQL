USE NORTHWND; 
--Từ bảng order details hãy liệt kê các đơn đặt hàng
--có unit price nằm trong phạm vi từ 100 đến 200
--I
SELECT OrderID
FROM dbo.[Order Details] AS od
WHERE od.UnitPrice BETWEEN 100 AND 200;

--Đưa ra các đơn đặt hàng có Quantity bằng 10 hoặc 20
--Truy vấn II
SELECT od.OrderID
FROM dbo.[Order Details] AS od
WHERE od.Quantity IN(10,20);	

--Từ bảng order details hãy liệt kê các đơn hàng
--có unitprice nằm trong phạm vi từ 100 đến 200
--và đơn hàng phải có quantity bằng 10 hoặc 20
--Truy vấn III
SELECT od.OrderID
FROM dbo.[Order Details] AS od
WHERE od.Quantity IN(10,20) AND od.UnitPrice BETWEEN 100 AND 200;

--Từ bảng order details hãy liệt kê các đơn hàng
--có unitprice nằm trong phạm vi từ 100 đến 200
--HOẶC đơn hàng phải có quantity bằng 10 hoặc 20
--Truy vấn IV
SELECT od.OrderID
FROM dbo.[Order Details] AS od
WHERE od.Quantity IN(10,20) OR od.UnitPrice BETWEEN 100 AND 200;

--Từ bảng order details hãy liệt kê các đơn hàng
--có unitprice nằm trong phạm vi từ 100 đến 200
--HOẶC đơn hàng phải có quantity bằng 10 hoặc 20, có DISTINCT
--Truy vấn V
SELECT DISTINCT od.OrderID
FROM dbo.[Order Details] AS od
WHERE od.Quantity IN(10,20) OR od.UnitPrice BETWEEN 100 AND 200;
--I OR II = 360 ROW

--UNION là được sử dụng để kết hợp tập kết quả của hai hoặc nhiều câu lệnh
--Mỗi câu lệnh bênh trong phải có cùng số lượng cột
--Các cột cũng phải có kiểu dữ liệu tương tự
--Các cột trong mỗi câu lệnh cũng phải theo cùng thứ tự
--CHO PHÉP CÁC GIÁ TRỊ BỊ LẶP LẠI

--V = I OR II = 360 ROWS
SELECT OrderID
FROM dbo.[Order Details] AS od
WHERE od.UnitPrice BETWEEN 100 AND 200
UNION
SELECT od.OrderID
FROM dbo.[Order Details] AS od
WHERE od.Quantity IN(10,20);

--UNION ALL
-- IV(Không có DISTINCT) =  I OR II = 455 ROWS = 448 + 7 = 455
SELECT OrderID
FROM dbo.[Order Details] AS od
WHERE od.UnitPrice BETWEEN 100 AND 200
UNION ALL
SELECT od.OrderID
FROM dbo.[Order Details] AS od
WHERE od.Quantity IN(10,20);

--Hãy liệt kê toàn bộ các thành phố
--và quốc gia tồn tại trong 2 Tables customers và suppliers với 2 tình huống sử dụng
--UNION, va UNION ALL 
SELECT DISTINCT Country
FROM dbo.Suppliers;

SELECT DISTINCT Country
FROM Customers;

SELECT DISTINCT Country
FROM dbo.Suppliers
UNION
SELECT DISTINCT Country
FROM Customers;

SELECT DISTINCT Country
FROM dbo.Suppliers
UNION ALL
SELECT DISTINCT Country
FROM Customers;

