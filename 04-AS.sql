USE NORTHWND;
--AS là đặt tên thay thế cho các cột giúp cho việc đọc và hiểu của lệnh SQL
--Viết câu lệnh SQL lấy "CompanyName" và đặt tên thay thế là "Tên công ty"; "PostalCode" và đặt tên thay thế là "Mã bưu điện"
SELECT CompanyName AS [Tên công ty],
	   PostalCode AS "Mã bưu điện",
	   City "Thành phố" --Nên dung có AS
FROM dbo.Customers;

--Viết câu lênh SQL lấy ra "LastName" và cài đặt thay thế là "Họ"; "FirstName" và đặt tên thay thế là "Tên"
SELECT LastName AS "Họ",
	   FirstName AS "Tên" 	
FROM dbo.Employees

--Viết câu lệnh SQL lấy ra 15 dòng đầu tiên tất cả các cột trong bảng Orders, đặt tên thay thế cho bảng Orders là "o"
SELECT TOP 15 "o".*
FROM dbo.Orders AS "o";

--Viết câu lệnh SQL lấy ra các cột và đặt tên thay thế như:
--ProductName => Tên sản phẩm
--SupplierID => Mã nhà cung cấp
--CategoryID => Mã thể loại
--Và đặt tên thay thế cho bảng Products là "p", sử dụng tên thay thế khi truy vấn các cột bên trên.
--Và chỉ lấy ra 5 sản phẩm đầu tiên trong bảng
SELECT TOP 5 ProductName AS "Tên sản phẩm",
             SupplierID AS "Mã nhà cung cấp",
	         CategoryID AS "Mã thể loại"
FROM Products AS "p";

-- Câu hỏi cho các bạn: Viết câu lệnh SQL lấy ra các cột và đặt tên thay thế như sau:
-- "Country" => "Quốc gia"
-- "Phone" => "Điện thoại"
-- Và đặt tên thay thế cho bảng "Customers" => "Khách hàng"
-- Chỉ lấy 30 dòng đầu tiên và không được trùng thông tin khách hàng.
SELECT DISTINCT TOP 30 Country AS "Quốc gia",
					   Phone AS "Số điện thoại"
FROM dbo.Customers AS "Khách hàng";
