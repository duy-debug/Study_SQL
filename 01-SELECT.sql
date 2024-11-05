USE NORTHWND;
--SELECT là lấy dữ liệu từ bảng
--Viết câu lệnh SQL lấy ra tên của tất cả các sản phẩm
SELECT [ProductName]
FROM [dbo].[Products];

--Viết câu lệnh SQL lấy ra tên sản phẩm, giá bán trên mỗi đơn vị, số lượng sản phẩm trên mỗi đơn vị
SELECT [ProductName], [UnitPrice], [QuantityPerUnit]
FROM [dbo].[Products];
	
--Viết câu lệnh SQL lấy ra tên công ty của khách hàng và quốc gia của khách hàng đó
SELECT [CompanyName], [Country]
FROM [dbo].[Customers]

--Cach viết câu lệnh không cần kéo thả
SELECT CompanyName, Country
FROM dbo.Customers;

--Viết câu lệnh SQL lấy ra tên công ty và số điện thoại của tất cả các nhà cung cấp hàng
SELECT CompanyName, Phone
FROM dbo.Suppliers;

--* là lấy tất cả các dữ liệu từ bảng
--Viết câu lệnh SQL lấy ra tất cả dữ liệu từ bảng Products
SELECT *
FROM dbo.Products;

--Viết câu lệnh SQL lấy ra tất cả dữ liệu từ bảng khách hàng -Customers
SELECT *
FROM dbo.Customers;

--Viết câu lệnh SQL lấy ra tất cả dữ liệu tử bảng nhà cung cấp -Suppliers
SELECT *
FROM dbo.Suppliers;
