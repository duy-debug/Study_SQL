USE NORTHWND;
--Từ bảng products và categories,
--các sản phẩm thuộc danh mục 'seafood' in ra các thông tin sau đây:
--Mã thể loại
--Tên thể loại
--Mã sản phẩm
--Tên sản phẩm
SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Products AS P, dbo.Categories AS c
WHERE p.CategoryID = c.CategoryID
	  AND c.CategoryName = 'Seafood';

--Từ bảng products và suppliers, hãy tìm sản phẩm thuộc nước 'Germany'
--Mã nhà cung cấp
--Quốc gia
--Mã sản phẩm
--Tên sản phẩm
SELECT s.SupplierID, s.Country, p.ProductID, p.ProductName
FROM dbo.Products AS p, dbo.Suppliers AS s
WHERE s.SupplierID = p.SupplierID AND s.Country ='Germany';

--Từ bảng 3 customers, orders, shippers hãy in ra các thông tin sau đây:
--Mã đơn hàng 
--Tên khách hàng
--Tên công ty vận chuyển
--Và chỉ in ra các đơn hàng của khách hàng đến từ thành phố 'London'
SELECT o.OrderID, c.CompanyName, s.CompanyName
FROM dbo.Customers AS c, dbo.Orders AS o, dbo.Shippers AS s
WHERE o.CustomerID = c.CustomerID
		AND s.ShipperID = o.ShipVia
		AND c.City = 'London';

--Từ customers, orders, shippers in ra các thông tin sau:
--Mã đơn hàng
--Tên khách hàng
--Tên công ty vận chuyển 
--Ngày yêu cầu chuyển hàng
--Ngày giao hàng
--Và chỉ in ra các đơn hàng bị giao muôn hơn quy định
--requireddate < shippeddate
SELECT o.OrderID, c.CompanyName, s.CompanyName, o.RequiredDate, o.ShippedDate
FROM dbo.Customers AS c, dbo.Orders AS o, dbo.Shippers AS s
WHERE c.CustomerID = o.CustomerID
	  AND o.ShipVia = s.ShipperID 
	  AND o.RequiredDate < o.ShippedDate;

--Từ bảng customers, orders, shippers hãy in ra:
--Lấy các quốc gia giao hàng mà khách hàng không đến từ Hoa Kỳ.
--Chọn các quốc gia có hơn 100 đơn hàng.
--Hiển thị quốc gia giao hàng và số lượng đơn hàng.
SELECT o.ShipCountry, COUNT(o.OrderID) AS "SỐ LƯỢNG"
FROM dbo.Customers AS c, dbo.Orders AS o
WHERE o.CustomerID = c.CustomerID 
      AND c.Country NOT IN('USA')
GROUP BY o.ShipCountry
HAVING COUNT(o.OrderID) > 100;