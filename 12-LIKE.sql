USE NORTHWND;
--TOÁN TỬ LIKE LÀ CÓ HAI KÝ TỰ ĐẠI DIỆN THƯỜNG ĐƯỢC SỬ DỤNG CÙNG VỚI LIKE
--DẤU PHẦN TRĂM (%) ĐẠI DIỆN CHO KHÔNG, MỘT HOẶC NHIỀU KÝ TỰ
--DẤU GẠCH DƯỚI (_) ĐẠI DIỆN CHO MỘT KÝ TỰ ĐƠN
--Hãy lọc ra tất cả các khách hàng đến từ các quốc gia (Country)
--bắt đầu bằng chứ 'A'
SELECT *
FROM dbo.Customers
WHERE Country LIKE 'A%';

--Lấy danh sách các đơn đặt được gửi đến các thành phố có chứa chữ 'a'.
SELECT *
FROM dbo.Orders
WHERE ShipCity LIKE '%a%';

--Hãy lấy ra tất cả các nhà cung cấp hàng có chứa chữ 'b' trong tên của công ty
SELECT *
FROM dbo.Suppliers
WHERE CompanyName LIKE '%b%';
--Viết câu lệnh SQL để liệt kê họ của nhân viên có chữ "e" trong họ 
--và sinh từ 1952-01-01 đến 1962-12-31, 
--sắp xếp theo thứ tự A-Z theo Tên
--chỉ lấy 5 dòng đầu tiên
SELECT TOP 5 *
FROM dbo.Employees
WHERE LastName LIKE '%e%' AND BirthDate BETWEEN '1952-01-01' AND '1962-12-31'
ORDER BY LastName ASC;

--Hãy lấy ra họ của nhân viên có ký tự thứ 3 là 'a' trong TitleOfCourtesy
SELECT *
FROM dbo.Employees
WHERE LastName LIKE '__a%';
