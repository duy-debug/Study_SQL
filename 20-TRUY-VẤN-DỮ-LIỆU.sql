USE NORTHWND;
--TRUY VẤN DỮ LIỆU TỪ NHIỀU TABLE CÒN GỌI LÀ KẾT HỢP NHIỀU TABLE VỚI NHAU

--Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
--Mã thể loại
--Tên thể loại
--Mã sản phẩm
--Tên sản phẩm
SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Products AS p, dbo.Categories AS c
WHERE c.CategoryID = p.CategoryID; 

--Từ bảng Employees va Orders, hãy in ra các thông tin sau đây:
--Mã nhân viên
--Tên nhân viên
--Số lượng đơn hàng mà nhân viên đã bán được
SELECT o.EmployeeID, e.LastName, e.FirstName,COUNT(o.OrderID) AS "SỐ LƯỢNG ĐƠN HÀNG"
FROM dbo.Orders AS o, dbo.Employees AS e
WHERE o.EmployeeID = e.EmployeeID
GROUP BY o.EmployeeID, e.LastName, e.FirstName;

--Từ bảng Customers và Orders, hãy in ra các thông tin sau đây:
--Mã số khách hàng
--Tên công ty
--Tên liên hệ
--Số lượng đơn hàng đã mua
--Với điều kiện: quốc gia của khách hàng là UK
SELECT c.CustomerID, c.CompanyName, c.ContactName, COUNT(o.OrderID) AS "SỐ LƯỢNG ĐƠN HÀNG"
FROM dbo.Customers AS c, dbo.Orders AS o
WHERE c.CustomerID = o.CustomerID 
GROUP BY c.CustomerID, c.CompanyName, c.ContactName;

--Từ bảng Orders và Shippers, hãy in ra các thông tin sau đây:
--Mã nhà vận chuyển 
--Tên công ty vận chuyển
--Tổng số tiền được vận chuyển (SUM Freight)
--Và in ra màn hình theo thứ tự sắp xếp tổng số tiền vận chuyển giảm dần
SELECT s.ShipperID, s.CompanyName, SUM(o.Freight) AS "TỔNG SỐ TIỀN"
FROM dbo.Orders AS o, dbo.Shippers AS s
WHERE s.ShipperID = o.ShipVia
GROUP BY s.ShipperID, s.CompanyName
ORDER BY SUM(o.Freight) DESC; 

--Từ bảng Products và Suppliers, hãy in ra các thông tin sau đây:
--Mã nhà cung cấp
--Tên công ty 
--Tổng số các sản phẩm khác nhau đã cung cấp
--Và chỉ ra màn hình duy nhất 1 nhà cung cấp có số lượng sản phẩm khác nhau nhiều nhất
SELECT TOP 1 s.SupplierID, s.CompanyName, COUNT(p.ProductID) AS "SỐ LƯỢNG SẢN PHẨM"
FROM dbo.Products AS p, dbo.Suppliers AS s
WHERE s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.CompanyName
ORDER BY COUNT(p.ProductID) DESC;

--Từ bảng Orders và Orders Details, hãy in ra các thông tin sau đây:
--Mã đơn hàng 
--Tổng số tiền sản phẩm của đơn hàng đó
SELECT o.OrderID, SUM(od.UnitPrice * od.Quantity) AS "Tổng số tiền"
FROM dbo.Orders AS o, dbo.[Order Details] AS od 
WHERE o.OrderID = od.OrderID
GROUP BY o.OrderID; 

--Từ 3 bảng order details, orders, employees in ra các thông tin sau đây:
--Mã đơn hàng 
--Tên nhân viên
--Tổng số tiền sản phẩm của đơn hàng
SELECT o.OrderID, e.LastName, e.FirstName, SUM(od.UnitPrice * od.Quantity) AS "TỔNG SÓ TIỀN"
FROM dbo.[Order Details] AS od, dbo.Orders AS o, dbo.Employees AS e
WHERE o.OrderID = od.OrderID AND o.EmployeeID = e.EmployeeID
GROUP BY o.OrderID, e.LastName, e.FirstName;

--Từ 3 bảng customers, orders, shippers in ra các thông tin sau đây:
--Mã đơn hàng
--Tên khách hàng
--Tên công ty vận chuyển
--Và chỉ in ra các đơn hàng được giao đến 'UK' tong năm 1997
SELECT o.OrderID, c.CompanyName, s.CompanyName , YEAR(o.ShippedDate)
FROM dbo.Customers AS c, dbo.Orders AS o, dbo.Shippers AS s
WHERE o.ShipCountry = 'UK' 
	  AND YEAR(o.ShippedDate) = 1997
	  AND o.CustomerID = c.CustomerID 
	  AND s.ShipperID = o.ShipVia;

--Từ bảng products and orders details, hãy in ra các thông tin sau đây:
--mã đơn hàng
--mã sản phẩm
--tên sản phẩm
--tổng tiền của mỗi đơn hàng
SELECT od.OrderID, p.ProductID, p.ProductName, SUM(od.UnitPrice * od.Quantity) AS "TỔNG TIỀN"
FROM dbo.Products AS p, dbo.[Order Details] AS od
WHERE od.ProductID = p.ProductID
GROUP BY od.OrderID, p.ProductID, p.ProductName;