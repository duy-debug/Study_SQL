USE NORTHWND;
--GROUP BY
--DÙNG ĐỂ NHÓM CÁC DÒNG DỮ LIỆU CÓ CÙNG GIÁ TRỊ.
--THƯỜNG ĐƯỢC DUNG VỚI CÁC HÀM: COUNT(), MAX(), MIN(), SUM(), AVG()

--Hãy cho biết mỗi khách hàng đã đặt bao nhiêu đơn hàng 
SELECT CustomerID, COUNT (OrderID) AS "SỐ LƯỢNG ĐƠN HÀNG"
FROM dbo.Orders
GROUP BY CustomerID;

--Hãy tính giá trị đơn giá trung bình theo mỗi nhà cung cấp sản phẩm
SELECT SupplierID, AVG (UnitPrice) AS "Giá trị trung bình"
FROM dbo.Products
GROUP BY SupplierID;

--Hãy cho biết mỗi sản thể loại có tổng số bao nhiêu sản phẩm trong kho (UnitsOnStock)
SELECT CategoryID, SUM (UnitsInStock) AS "Tổng"
FROM dbo.Products
GROUP BY CategoryID;

--Hãy cho biết giá vận chuyển thấp nhất
--và lớn nhất của các đơn hàng theo từng thành phố
--và quốc gia khác nhau
SELECT ShipCountry, ShipCity,
				MIN(Freight) AS "GIÁ THẤP NHẤT",
				MAX(Freight) AS "GIÁ CAO NHẤT"
FROM dbo.Orders
GROUP BY ShipCountry, ShipCity
ORDER BY ShipCountry ASC, ShipCity ASC; 

--Hãy thống kê số lượng nhân viên theo từng quốc gia khác nhau
SELECT Country, COUNT (EmployeeID) AS "Số lượng nhân viên"
FROM dbo.Employees
GROUP BY Country;

--Thống kê số khách hàng ở từng quốc gia, từng thành phố
--Tìm các khách hàng có CompanyName có chữ a trong tên
--Sắp xếp theo chiều A-Z Country
SELECT Country, City, CompanyName, COUNT (CustomerID)
FROM dbo.Customers
WHERE CompanyName LIKE '%a%'
GROUP BY Country, City, CompanyName
ORDER BY Country ASC;

--Tính tổng số tiền vận chuyển ở từng thành phố, quốc qua
--Chỉ lấy những ShipName có có chữ 'b' 
--Sắp xếp theo chiều từ A-Z của ShipCountry
SELECT ShipCountry, ShipCity, SUM(Freight)
FROM dbo.Orders
WHERE ShipName LIKE '%b%'
GROUP BY ShipCountry, ShipCity
ORDER BY ShipCountry ASC;


