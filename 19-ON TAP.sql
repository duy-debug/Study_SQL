USE NORTHWND;
--ÔN TẬP	

--Hãy cho biết những khách hàng nào đã đặt nhiều hơn 20 đơn hàng,
--sắp xếp theo thứ tự tổng số đơn hàng giảm dần.
SELECT CustomerID, COUNT(OrderID)
FROM dbo.Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 20
ORDER BY COUNT(OrderID) DESC;

--Hãy lọc ra các nhân viên (EmployeesID) có tổng số đơn hàng lớn hơn hoặc bằng 100,
--sắp xếp theo tổng số đơn hàng giảm dần.

SELECT EmployeeID, COUNT(OrderID)
FROM dbo.Orders
GROUP BY EmployeeID
HAVING COUNT(OrderID) >=100
ORDER BY COUNT(OrderID) DESC;

--Hãy cho biết những thể loại nào (CategoryID) có số sản phẩm khác nhau lớn hơn 11
SELECT CategoryID, COUNT(ProductID)
FROM dbo.Products
GROUP BY CategoryID
HAVING COUNT(ProductID) > 11;

--Hãy cho biết những thể loại nào (CategoryID)
--có số tổng số lượng sản phẩm trong kho (UnitslnStock) lớn hơn 350
SELECT CategoryID, SUM(UnitsInStock)
FROM dbo.Products
GROUP BY CategoryID
HAVING SUM(UnitsInStock) > 350;

--Hãy cho biết những quốc gia nào có nhiều hơn  7 khách hàng
SELECT Country, COUNT(CustomerID)
FROM dbo.Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 7;

--Hãy cho biết những ngày nào có nhiều hơn 5 đươn hàng được giao
--sắp xếp tăng dần theo ngày giao hàng
SELECT ShippedDate, COUNT(*)
FROM dbo.Orders
GROUP BY ShippedDate
HAVING COUNT(*) > 5
ORDER BY ShippedDate ASC; 

--Hãy cho biết những quốc gia bắt đầu bằng chữ 'A' hoặc 'G'
--và có số lượng đơn hàng lơn hơn 29
SELECT ShipCountry, COUNT(*)
FROM dbo.Orders
WHERE ShipCountry LIKE 'A%' OR  ShipCountry LIKE 'G%'
GROUP BY ShipCountry
HAVING COUNT(*) > 29;

--Hãy cho biết những thành phố nào có số lượng đơn hàng được giao là khác 1 và 2,
--ngày đặt hàng từ ngày '1997-04-01' đến ngày '1997-08-31'
SELECT ShipCity, COUNT(OrderID)
FROM dbo.Orders
WHERE OrderDate BETWEEN '1997-04-01' AND '1997-08-31'
GROUP BY ShipCity
HAVING COUNT(OrderID) <> 1 AND COUNT(OrderID) <> 2;

--HOẶC
SELECT ShipCity, COUNT(OrderID)
FROM dbo.Orders
WHERE OrderDate BETWEEN '1997-04-01' AND '1997-08-31'
GROUP BY ShipCity
HAVING COUNT(OrderID) NOT IN(1,2);

