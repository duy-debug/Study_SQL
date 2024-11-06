USE NORTHWND;
--IN CÓ Ý NGHĨA TƯƠNG TỰ NHƯ OR
--CHO PHÉP KIỂM TRA VỚI NHIỀU GIÁ TRỊ CÙNG LÚC
--NOT IN LÀ LẤY GIÁ TRỊ CỦA COLUMN KHÁC VỚI CÁC GIÁ TRỊ ĐÃ ĐƯỢC CHỈ ĐỊNH


--Hãy lọc ra tất cả các đơn hàng với điều kiện:
--a) Đơn hàng được giao đến Germany, UK, Brazil
SELECT *
FROM dbo.Orders
WHERE ShipCountry IN ('Germany', 'UK', 'Brazil');
--b) Đơn hàng được giao đến các quốc gia khác Germany,	UK, Brazil
SELECT *
FROM dbo.Orders
WHERE ShipCountry NOT IN ('Germany', 'UK', 'Brazil');

--Lấy ra các sản phẩm có mã thể loại khác 2,3 và 4
SELECT *
FROM dbo.Products
WHERE CategoryID NOT IN (2,3,4);

--Hãy liệt kê các nhân viên không phải là nữ từ bẳng nhân viên
SELECT *
FROM dbo.Employees
WHERE TitleOfCourtesy NOT IN('Ms.', 'Mrs.');

--Hãy liệt kê các nhân viên là nữ từ bảng nhân viên
SELECT *
FROM dbo.Employees
WHERE TitleOfCourtesy IN('Ms.', 'Mrs.');

--Hãy lấy ra tất cả các khách hàng đến từ các thành phố sau đây:
--Berlin
--London
--Warsza