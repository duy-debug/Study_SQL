USE NORTHWND;
--TRUY VẤN ĐỆ QUY
WITH fibo(pre_n, n) AS(
--KHỞI TẠO
	SELECT
		0 AS pre_n,
		1 AS n
	UNION ALL
	--ĐỆ QUY
	SELECT
		n AS pre_n,
		 pre_n + n AS n
	FROM fibo
)
SELECT *
FROM fibo
OPTION (MAXRECURSION 5);
--Sn=S(n-1)+S(n-2)
--0 1 1 2 3

USE NORTHWND;
--TRUY VẤN ĐỆ QUY
WITH giaithua(pre_n, n) AS(
--KHỞI TẠO
	SELECT
		1 AS pre_n,
		1 AS n
	UNION ALL
	--ĐỆ QUY
	SELECT
		(pre_n+1) AS pre_n,
		(pre_n+1)* n AS n
	FROM giaithua
)
SELECT *
FROM giaithua
OPTION (MAXRECURSION 5);
-- tính giai thừa

--Sử dụng truy vấn đệ quy để tạo một cây cấu trúc quản lý của nhân viên
--trong bảng "Employees" .Trong đó "ReportsTo" chỉ là mã của ng quản lí
declare @Employeeid int
set @Employeeid=2;

WITH e_cte as (
	--khởi tạo
		SELECT e.EmployeeID,
			   e.FirstName+' '+e.LastName AS NAME,
			   e.ReportsTo AS Managerid,
			   0 AS Level
		FROM dbo.Employees e
		WHERE e.EmployeeID=@Employeeid
		UNION ALL
	--đệ quy
		SELECT
			   e1.EmployeeID,
			   e1.FirstName+' '+e1.LastName AS NAME,
			   e1.ReportsTo AS Managerid,
			   Level + 1 AS Level
		FROM dbo.Employees e1
		JOIN e_cte ON e1.ReportsTo=e_cte.EmployeeID
)
SELECT *
FROM e_cte
OPTION (MAXRECURSION 500);


--KHI NÀO SỬ DỤNG TRUY VẤN ĐỆ QUY
--Cây/phân cấp dữ liệu: Truy vấn đệ quy thường được sử dụng khi bạn làm việc với dữ liệu có cấu trúc cây hoặc phân cấp, ví dụ như cây hệ thống thư mục, cấu trúc tổ chức công ty, hoặc danh sách sản phẩm có danh mục con.
--Duyệt đồ thị: Truy vấn đệ quy cũng hữu ích khi bạn cần duyệt qua các mối quan hệ đồ thị như mối quan hệ bạn bè trong mạng xã hội.
--Tìm kiếm đường đi: Nếu bạn cần tìm kiếm các đường đi, ví dụ như đường đi ngắn nhất giữa hai điểm trong một mạng lưới.
--Tạo danh sách hoặc báo cáo có tính đệ quy: Truy vấn đệ quy có thể được sử dụng để xây dựng danh sách theo các quy tắc phức tạp hoặc tạo báo cáo có cấu trúc phức tạp.