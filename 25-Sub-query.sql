USE NORTHWND;
--SUB QUERY
--Subquery (câu truy vấn con) trong SQL là một truy vấn SELECT được viết
--bên trong một truy vấn SELECT,UPDATE,INSERT, hoặc DELETE khác.
--Subquery hoạt động như một bảng ảo thạm thời, nó được sử dụng để trích
--xuất thông tin từ các bảng hoặc tập dữ liệu khác trong cùng một câu truy vấn

--Liệt kê ra toàn bộ sản phẩm
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products;

--Tìm giá trung bình của các sản phẩm
SELECT AVG(UnitPrice)
FROM dbo.Products;

--Lọc những sản phẩm có giá > giá trung bình
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products
WHERE UnitPrice > 28.4962

--Sub query
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products
WHERE UnitPrice >  (
	SELECT AVG(UnitPrice)
	FROM dbo.Products
);

--Lọc ra những khách hàng có số đơn hàng > 10
--khong sử dụng sub query
SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID) AS "SỐ ĐƠN HÀNG"
FROM dbo.Customers c
LEFT JOIN dbo.Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName
HAVING COUNT(o.OrderID) > 10;

--sử dụng sub query
SELECT *
FROM dbo.Customers
WHERE CustomerID IN (
	SELECT CustomerID
	FROM dbo.Orders
	GROUP BY CustomerID
	HAVING COUNT(OrderID) > 10
);

--Tính tổng tiền cho từng đơn hàng 
SELECT o.*, (
	SELECT SUM(od.Quantity * od.UnitPrice)
	FROM dbo.[Order Details] od
	WHERE o.OrderID = od.OrderID
) AS "TỔNG SỐ TIỀN"
FROM dbo.Orders o;

--Lọc ra tên sản phẩm và tổng số đơn hàng của sản phẩm
SELECT p.ProductID, p.ProductName, (
	SELECT COUNT(*)
	FROM dbo.[Order Details] od
	WHERE od.ProductID =P.ProductID
) AS "Số đơn hàng"
FROM dbo.Products p;	

--Bãn hãy in ra Mã đơn hàng, và số lượng sản phẩm của đơn hàng đó
SELECT o.OrderID, (
	SELECT COUNT(od.Quantity)
	FROM dbo.[Order Details] od
	WHERE od.OrderID = o.OrderID
) AS "SỐ LƯỢNG"
FROM dbo.Orders o;
