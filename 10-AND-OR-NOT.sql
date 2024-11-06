USE NORTHWND;
--AND VÀ
--Hiển thị một bản ghi nếu tất cả các điều kiện được phân tách bằng AND đều có giá trị TRUE
--OR HOẶC
--Hiển thị một bản ghi nếu có ít nhất một điều kiện được phân tách bằng OR đều có giá trị TRUE
--NOT PHỦ ĐỊNH
--Hiển thị một bản ghi nếu điều kiện có giá trị không đúng - FALSE
--Bạn hãy liệt kê tất cả các sản phẩm có số lượng trong kho (UnitslnStock)thuộc khoảng nhỏ hơn 50 hoặc lớn hơn 100
SELECT *
FROM dbo.Products
WHERE UnitsInStock < 50 OR UnitsInStock > 100;
--Hãy liệt kê tất cả các đơn hàng được giao đến Brazil, 
--đã bị giao muộn, biết rằng ngày cần phải giao hàng là RequiredDate, 
--ngày giao hàng thực tế là ShippedDate
SELECT *
FROM dbo.Orders
WHERE ShipCountry='Brazil' AND ShippedDate > RequiredDate;
--Lấy ra tất cả các sản phẩm có giá 100$ và mã thể loại khác 1.
--Lưu ý: dùng NOT
SELECT *
FROM dbo.Products
WHERE NOT(UnitPrice >= 100 OR CategoryID = 1); 
--Hãy liệt kê tất cả các đơn hàng có giá vận chuyển Freight trong khoảng [50,100] đô la
SELECT *
FROM dbo.Orders
WHERE Freight >= 50 AND Freight <= 100;
--Hãy liệt kê các sản phẩm có số lượng hàng trong kho (UnitslnStock) lớn hơn 20 và số lượng hàng trong đơn hàng (UnitsOnOrder) nhỏ hơn 20
SELECT *
FROM dbo.Products
WHERE UnitsInStock > 20 AND UnitsOnOrder < 20;