USE NORTHWND;
--DELETE
--CÂU LỆNH XÓA DỮ LIỆU

--LƯU Ý:
--Sử dụng SELECT INTO để tạo ra bảng tạm thời trước khi thực hành câu lệnh DELETE
SELECT *
INTO Customers_1
FROM dbo.Customers;

--Xóa đi khách hàng 'ALFKI'
DELETE FROM dbo.Customers_1
WHERE CustomerID LIKE 'ALFKI';

--Xóa đi toàn bộ khách hàng ở quốc gia
--bắt đầu bằng 'U'
DELETE FROM dbo.Customers_1
WHERE Country LIKE 'U%'; 

--Xóa sạch một bảng
DELETE FROM dbo.Customers_1;

--DELETE FROM KHÁC GÌ VỚI TRUNCATE
SELECT *
INTO Products1
FROM dbo.Products
--Xóa tất cả sản phẩm từ bảng Products có số lượng tồn kho (UnitsInSock)
DELETE FROM dbo.Products1
WHERE UnitsInStock = 0;