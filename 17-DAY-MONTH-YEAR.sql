USE NORTHWND;
--DAY LẤY DỮ LIỀU NGÀY
--MONTH LẤY DỮ LIỆU THÁNG
--YEAR LẤY DỮ LIỆU NĂM

--Tính số lượng đơn đặt hàng trong năm 1997 của từng khách hàng
SELECT CustomerID, COUNT(OrderID), YEAR(OrderDate)
FROM dbo.Orders
WHERE YEAR(OrderDate) = 1997
GROUP BY CustomerID, YEAR(OrderDate);

--Hãy lọc ra các đơn hàng được đặt vào thàng 5 năm 1997
SELECT *
FROM dbo.Orders
WHERE MONTH(OrderDate) = 5 AND YEAR(OrderDate) = 1997;

--Lấy danh sách các đơn hàng được đặt vào ngày 4 tháng 9 năm 1996
SELECT *
FROM dbo.Orders
WHERE DAY(OrderDate) = 4 AND MONTH(OrderDate) = 9 AND YEAR(OrderDate) = 1996;

--Lấy danh sách khách hàng đặt hàng trong năm 1998
--và số đơn hàng mỗi tháng, sắp xếp tháng tăng dần.
SELECT CustomerID, MONTH(OrderDate) AS "Month", COUNT(*)
FROM dbo.Orders
WHERE YEAR(OrderDate) = 1998
GROUP BY CustomerID, MONTH(OrderDate)
ORDER BY MONTH(OrderDate) ASC;

--Hãy lọc các đơn hàng đã được giao vào tháng 5,
--và sắp xếp tăng dần theo năm
SELECT *
FROM dbo.Orders
WHERE MONTH(ShippedDate) = 5
ORDER BY YEAR(OrderDate) ASC;

--Cho biết khách hàng ,và từng số lượng hàng của khách hàng đặt tháng đó. 
--với điều kiện đã đặt hàng vào tháng 5 năm 1997, 
--và trong mã đơn hàng phải có số cuối là số 8, sắp xếp tăng dần theo ngày 
SELECT CustomerID, OrderDate, OrderID, COUNT(*) AS "SÓ LƯỢNG"
FROM dbo.Orders
WHERE MONTH(OrderDate) = 5 AND YEAR(OrderDate) = 1997 AND OrderID LIKE '%8'
GROUP BY CustomerID, OrderDate, OrderID
ORDER BY DAY(OrderDate) ASC;

