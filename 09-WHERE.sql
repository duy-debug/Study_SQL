--MỆNH ĐỀ WHERE
--Được sử dụng để lọc các bản ghi
--Nó được sử dụng để chỉ trích xuất những bản ghi đáp ứng một điều kiện cụ thể
--Bạn hãy liệt kê tất cả các nhân viên đến từ thành phố London
--Sắp xếp kết quả theo LastName A->Z
SELECT *
FROM dbo.Employees
WHERE City='London'
ORDER BY LastName ASC;

--Bạn hãy liệt kê tất cả các đơn hàng giao muộn, biết rằng ngày cần phải giao là RequiredDate, ngày giao hàng thực tế là ShippedDate
SELECT COUNT(*) AS "Số đơn giao hàng muộn"
FROM dbo.Orders
WHERE ShippedDate>RequiredDate;

--Lấy ra tất cả các đơn hàng chi tiết được giảm giá nhiều hơn 10% (Discount>0.1)
SELECT *
FROM dbo.[Order Details]
WHERE Discount>0.1;

--Hãy liệt kê tất cả các đơn hàng được gửi đến quốc gia là "France"
SELECT *
FROM dbo.Orders
WHERE ShipCountry='France';