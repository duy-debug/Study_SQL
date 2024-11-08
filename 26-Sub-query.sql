USE NORTHWND;
--Liệt kê các đơn hàng có ngày đặt hàng gần nhất
SELECT *
FROM dbo.Orders o
WHERE o.OrderDate = (
	SELECT MAX(OrderDate)
	FROM dbo.Orders
);

--Liệt kê tất cả các đơn hàng sản phẩm (ProductsName)
--Mà không có đơn đặt hàng nào đặt mua chúng
SELECT *
FROM dbo.Products p
WHERE p.ProductID NOT IN(
	SELECT DISTINCT ProductID
	FROM dbo.[Order Details]
);

--Lấy thông tin về các đơn hàng, tên các sản phẩm 
--thuộc các đơn hàng chưa được giao cho khách
SELECT o.OrderID, p.ProductName
FROM dbo.Orders o
JOIN dbo.[Order Details] od
ON o.OrderID = od.OrderID
JOIN dbo.Products p
ON p.ProductID = od.ProductID
WHERE o.OrderID IN(
	SELECT o.OrderID
	FROM dbo.Orders o
	WHERE ShippedDate IS NULL
);

--Lấy thông tin về các sản phẩm có số lượng tồn kho
--ít hơn số lượng tồn kho trung bình tất cả các sản phẩm
SELECT *
FROM dbo.Products p
WHERE p.UnitsInStock <(
SELECT AVG(UnitsInStock)
FROM dbo.Products
);

--Lấy thông tin về khách hàng có tổng giá trị đơn hàng lớn nhất
SELECT TOP 1 c.CustomerID, c.CompanyName, SUM(od.Quantity * od.UnitPrice) AS "GIÁ TRỊ ĐƠN HÀNG"
FROM dbo.Customers c
JOIN dbo.Orders o
ON o.CustomerID = c.CustomerID
JOIN dbo.[Order Details] od
ON od.OrderID = o.OrderID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY SUM(od.Quantity * od.UnitPrice) DESC;		



