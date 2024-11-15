USE NORTHWND;
--UPDATE
--CÂU LỆNH CẬP NHẬT DỮ LIỆU
SELECT *
INTO Customers1
FROM Customers;

--Cập nhật thông tin của một khách hàng trong bảng Customers.
--Dưới đây là cách cập nhật địa chỉ của khách hàng có
--CustomerID là "ALFKI"
UPDATE dbo.Customers1
SET Address='New Address'
WHERE CustomerID='ALFKI';

SELECT *
INTO Products1
FROM dbo.Products;

--Tăng giá toàn bộ sản phẩm lên 10%
UPDATE dbo.Products1
SET UnitPrice=UnitPrice*1.1;

--Cập nhật thông tin của sản phẩm có ProductsID
--Là 7 trong bảng Products để thay đổi tên sản phẩm thành "Máy tính xách tay mới"
--và cập nhật giá bán thành 999.99 đô
UPDATE dbo.Products1
SET  ProductName = 'Máy tính xách tay mới', UnitPrice = 999.99 
WHERE ProductID = 7;

--Bạn muốn cập nhật thông tin của tất cả các khách hàng trong bảng Customers
--thành phố City là Paris để thay đổi quốc gia Country của họ thành Pháp
UPDATE dbo.Customers1
SET Country='Phap'
WHERE City='Paris';

