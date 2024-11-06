USE NORTHWND;
--BETWEEN CHỌN DỮ LIỆU TRONG MỘT KHOẢNG NHẤT ĐỊNH. 
--CÁC GIÁ TRỊ CÓ THỂ LÀ SỐ, VĂN BẢN HOẶC NGÀY THÁNG.
--TOÁN TỬ BETWEEN BAO GỒM: GIÁ TRỊ BẮT ĐẦU VÀ KẾT THÚC
--Lấy danh sách các sản phẩm có giá bán trong khoảng từ 10 đến 20 đô la
SELECT * 
FROM dbo.Products
WHERE UnitPrice BETWEEN 10 AND 20;

--CÁCH 2
SELECT *
FROM dbo.Products
WHERE UnitPrice >= 10 AND UnitPrice <=20;

--Lấy danh sách các đơn đặt hàng được trong khoảng thời gian từ ngày 1996-07-01 đến ngày 1996-07-31
SELECT *
FROM dbo.Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

--Tính tổng tiền vận chuyển (Freight) của các đơn đặt hàng được đặt trong khoảng thời gian từ ngày 1996-07-01 đến ngày 1996-07-31
SELECT SUM(Freight) AS "Tổng số tiền vận chuyển"
FROM dbo.Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

--Lấy danh sách các đơn đặt hàng trong khoảng từ ngày 1/1/1997 đến ngày 31/12/1997 
--và được vận chuyển bằng đường tàu thủy (ShipVia=3)
SELECT *
FROM dbo.Orders
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31' AND ShipVia=3;

--Viết câu lệnh SQL liệt kê họ và tên nhân viên,
--chỉ sống ở London,
--có ngày tháng năm sinh từ đến 1/1/1952 đến 31/12/1963 
--hoặc ngày tuyển từ 1/2/1992 đến 31/12/1993
--chỉ lấy 3 nhân viên đầu tiên sắp xếp theo [LastName] A-Z.
SELECT TOP 3 *
FROM dbo.Employees
WHERE City='London' AND ( BirthDate BETWEEN '1952-01-01' AND '1963-12-31' OR HireDate BETWEEN '1992-02-01' AND '1993-12-31')
ORDER BY LastName ASC;
