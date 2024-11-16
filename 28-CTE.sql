USE NORTHWND;
--Common Table Expression (CTE)
--Được sử dụng để tạo bảng tạm thời và sử dụng nó trong các truy vấn sau đó.
--Giúp làm cho câu truy vấn trở nên dễ đọc và dễ quản lý hơn.

--WITH tên-CTE (cột 1, cột 2, ...) AS (
-- Truy vấn để định nghĩa CTE )

--WITH là từ khóa bắt buộc để bắt đầu định nghĩa CTE 
--tên_CTE là tên bạn muốn đặt cho CTE, đây là tên mà bạn sẽ sử dụng để
--tham chiếu đến nó trong các truy vấn sau.
--cột1,... là danh sách các cột bạn muốn định nghĩa cho CTE. Có thể
--không cần định danh cột nếu bạn muốn CTE chứa tất cả các cột từ các quả
--của truy vấn
--Truy vấn để định nghĩa CTE là phần trong dấu ngoặc đơn, nơi bạn đặt truy
--vấn SQL để xác định dữ liệu chi CTE. Truy vấn này có thể bao gồm các câu
--lệnh SELECT, FROM, WHERE, GROUP BY, HAVING, và ORDER BY tùy theo nhu cầu của bạn.
WITH shor_e AS (
	SELECT EmployeeID, LastName, FirstName
	FROM dbo.Employees
)

SELECT * 
FROM shor_e;

--Lấy thông tin về đơn hàng cùng với tổng giá trị đơn hàng
--và tỷ lệ giữa tổng giá trị và phí giao hàng
SELECT
	OrderID,
	OrderDate,
	Freight,
	(SELECT SUM(od.Quantity * od.UnitPrice)
		FROM dbo.[Order Details] od
		WHERE od.OrderID = o.OrderID
	) AS TotalPrice,
	(SELECT SUM(od.Quantity * od.UnitPrice)
		FROM dbo.[Order Details] od
		WHERE od.OrderID = o.OrderID
	)/Freight AS ratio
FROM dbo.Orders o;

--CTE
WITH OrderTotals AS(
	SELECT OrderID, SUM(od.Quantity * od.UnitPrice) AS TotalPrice
		FROM dbo.[Order Details] od
		GROUP BY OrderID
)
SELECT
	o.OrderID,
	o.OrderDate,
	o.Freight,
	ot.TotalPrice,
	ot.TotalPrice / o.Freight AS Ratio
FROM dbo.Orders o
JOIN OrderTotals ot ON o.OrderID = ot.OrderID

--Sử dụng CTE để tính tổng doanh số	bán hàng cho từng sản phẩm
--từ hai bảng order details và products
WITH ProductsTotal AS(
	SELECT od.ProductID, SUM(od.Quantity * od.UnitPrice) AS TotalPrice
	FROM dbo.[Order Details] od
	GROUP BY od.ProductID
)
SELECT p.ProductID, p.ProductName, pt.TotalPrice
FROM dbo.Products p
JOIN ProductsTotal pt ON p.ProductID = pt.ProductID;

--Sử dụng CTE để tính toán tổng doanh số bán hàng theo từng khách hàng
--và sau đó sắp xếp danh sách khách hàng theo tổng doanh số giảm dần
WITH Total AS(
	SELECT o.CustomerID, SUM(od.Quantity * od.UnitPrice) AS TotalPrice
	FROM dbo.[Order Details] od, dbo.Orders o
	WHERE od.OrderID = o.OrderID
	GROUP BY o.CustomerID
)
SELECT c.CustomerID, c.CompanyName, t.TotalPrice
FROM dbo.Customers c
JOIN Total t ON t.CustomerID = c.CustomerID
ORDER BY t.TotalPrice DESC;

-- Sử dụng CTE tính tổng doanh số bán hàng theo năm từ bảng Orders và order details
WITH TotalYear AS(
	SELECT od.OrderID, SUM(od.Quantity * od.UnitPrice) AS ORDERTOTAL
	FROM dbo.[Order Details] od
	GROUP BY od.OrderID
)
SELECT YEAR(o.OrderDate) AS NĂM, SUM(t.ORDERTOTAL) AS TotalOfYear
FROM dbo.Orders o
JOIN TotalYear t ON t.OrderID = o.OrderID
GROUP BY YEAR(o.OrderDate)