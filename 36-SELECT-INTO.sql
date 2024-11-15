--SELECT INTO
--SAO CHÉP DỮ LIỆU TỪ MỘT BẢNG HIỆN CÓ
USE NORTHWND
--Câu lệnh SELECT INTO trong SQL được sử dụng để tạo một bảng mới dựa trên dữ liệu từ một bảng hiện mới và sao chép dữ liệu từ một bảng hiện có vào bảng mới này.
--Nó thường được sử dụng để tạo bảng tạm thời hoặc sao lưu dữ liệu từ một bảng hiện có để thực hiện các phân tích hoặc thao tác dữ liệu khác.
--Câu lệnh SELECT INTO cũng có thể được dùng để chọn một phần dữ liệu từ bảng hiện có và lưu vào một bảng mới. 

--Tạo ra bảng mới có với các sản phẩm có giá >50
SELECT *
INTO HighValueProducts
FROM dbo.Products
WHERE UnitPrice > 50;

--Tạo ra bảng mới với các đơn hàng được giao đến USA
SELECT *
INTO USAorder
FROM dbo.Orders
WHERE ShipCountry LIKE 'USA';

--Tạo một bảng tạm thời "CustomersInLondon" từ bảng "Customers" trong
--cơ sở dữ liệu để chứa các thông tin của các khách hàng có địa chỉ ở London
SELECT *
INTO CustomersInLondon
FROM dbo.Customers
WHERE City LIKE 'London';

--Tạo một bảng tạm thời "HighValueOrders" để chứa thông tin về các đơn hàng
--có tổng giá trị đặt hàng lớn hơn 1000 đô.
SELECT o.OrderID, SUM(od.Quantity * od.UnitPrice) AS SUMVALUE
INTO HighValueOrders
FROM dbo.Orders o
JOIN dbo.[Order Details] od ON o.OrderID=od.OrderID
GROUP BY o.OrderID
HAVING SUM(od.Quantity * od.UnitPrice) > 1000;