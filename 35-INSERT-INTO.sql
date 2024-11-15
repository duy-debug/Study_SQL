USE NORTHWND;
--INSERT INTO table_name
--CÂU LỆNH THÊM DỮ LIỆU
--VALUES(value1, value2, value3,...);

--Thêm một khách hàng mới
INSERT INTO dbo.Customers(CustomerID, CompanyName,ContactName, Phone)
VALUES ('KH123', 'duy', 'Tran Mai Ngoc Duy', '0123456789');

--Thêm một khách hàng mới
INSERT INTO dbo.Customers
VALUES ('KH134', 'duy', 'Tran Mai Ngoc Duy', '0123456789', '-', null, null, null, null, null, null);

--Thêm nhiều khách hàng mới cùng lúc		
INSERT INTO dbo.Customers(CustomerID, CompanyName,ContactName, Phone)
VALUES ('KH143', 'duyhocit', 'Tran Mai Ngoc Duy', '0123456789'),
	   ('KH124', 'duycoder', 'Tran Mai Ngoc Duy', '0123456689'),
	   ('KH126', 'duycodedao', 'Tran Mai Ngoc Duy', '0123456789');