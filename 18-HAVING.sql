USE NORTHWND;
--HAVING LỌC DỮ LIỆU SAU GROUP BY


--Hãy cho biết những khách hàng nào đã đặt nhiều hơn 20 đơn hàng,
--sắp xếp theo thứ tự tổng số đơn hàng giảm dần.
SELECT CustomerID, COUNT(OrderID)
FROM dbo.Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 20
ORDER BY COUNT(OrderID) DESC;

--Hãy lọc ra những nhà cung cấp sản phẩm có tổng số lượng hàng trong kho (UnitlnStock) lớn hơn 30,
--và có trung bình đơn giá (UnitPrice) có giá trị nhỏ hơn 50
SELECT SupplierID,
	   SUM(UnitsInStock),
	   AVG(UnitPrice) 
FROM dbo.Products
GROUP BY SupplierID
HAVING SUM(UnitsInStock) > 30 AND COUNT(UnitsInStock) < 50;

--Hãy cho biết tổng số tiền vận chuyển của từng tháng,
--trong nữa năm sau của năm 1996, sắp xếp theo tháng tăng dần
--tổng tiền vận chuyển lớn hơn 1000
SELECT MONTH(ShippedDate), SUM(Freight)
FROM dbo.Orders
WHERE ShippedDate BETWEEN '1996-07-01' AND '1996-12-31'
GROUP BY MONTH(ShippedDate)
HAVING SUM(Freight) > 1000
ORDER BY MONTH(ShippedDate) ASC;

--Hãy lọc ra những thành phố có số lượng đơn hàng > 16
--và sắp xếp theo tổng số lượng giảm dần.
SELECT ShipCity, COUNT(OrderID)
FROM dbo.Orders
GROUP BY ShipCity
HAVING COUNT(OrderID) > 16
ORDER BY COUNT(OrderID) DESC;

--Hãy liệt kê các quốc gia có số lượng khách hàng lớn hơn 5
SELECT Country, COUNT(CustomerID) 
FROM dbo.Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;

--Lấy danh sách sản phẩm có tổng số lượng > 75, có tỷ lệ giảm giá trung bình > 7%,
--và sắp xếp theo tỷ lệ giảm giá trung bình giảm dần
SELECT ProductID, 
		SUM(Quantity) AS [TotalQuantity], 
		AVG(Discount) AS [AVGDiscount]
FROM dbo.[Order Details]
GROUP BY ProductID
HAVING SUM(Quantity)>75 AND AVG(Discount)>0.07
ORDER BY AVG(Discount) DESC;


