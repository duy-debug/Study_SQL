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
SELECT *
FROM dbo.Customers
WHERE City IN('Berlin', 'London', 'Warsza');

--Hãy liệt kê các mã nhà cung cấp khác 8, 1, 3 ,2.
SELECT *
FROM dbo.Suppliers
WHERE SupplierID IN(8, 1, 3, 2);

--Hãy liệt  kê  tất  cả  các  đơn  hàng  không gửi  đến thành  phố   Berlin, London, Warszawa
SELECT *
FROM dbo.Orders
WHERE ShipCity NOT IN('Berlin', 'London', 'Warszawa');

--Liệt kê tất cả các  sản  phẩm có đơn giá  là 10, 50, 100
SELECT *
FROM dbo.Products
WHERE UnitPrice IN(10, 50, 100);

-- Hiển thị ra danh sách 5 đơn hàng từ bảng đơn hàng
-- Có ShipCity bắt đầu bằng chữ R và ShipCountry là France hoặc Brazil
-- Sắp xếp theo ngày đặt hàng theo thứ tự từ sớm nhất đến muốn nhất
SELECT TOP 5 *
FROM dbo.Orders
WHERE ShipCity LIKE ('R%') AND ShipCountry IN('France') OR ShipCountry IN('Brazil')
ORDER BY OrderDate ASC;