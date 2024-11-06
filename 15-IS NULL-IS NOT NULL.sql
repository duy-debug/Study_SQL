USE NORTHWND;
--IS NULL LÀ GIÁ TRỊ CỦA COLUNM bị NULL
--IS NOT NULL là giá trị khác NULL

--Lấy ra tất cả các đơn hàng chưa được giao hàng.
--(ShippedDate => NULL)
 SELECT * 
 FROM dbo.Orders
 WHERE ShippedDate IS NULL; 

 SELECT COUNT(*) AS "ĐƠN HANG CHƯA KỊP GIAO"
 FROM dbo.Orders
 WHERE ShippedDate IS NULL; 

 --Lấy danh sách các khách hàng có khu vực (Region) không bị NULL.
 SELECT *
 FROM dbo.Customers
 WHERE Region IS NOT NULL;

 --Lấy danh sách các khách hàng không có tên công ty
 --(CompanyName)
 SELECT *
 FROM dbo.Customers
 WHERE CompanyName IS NULL;

 --Hãy lấy ra tất cả các đơn hàng chưa được giao hàng và có khu vực giao hàng (ShipRegion) không bị NULL
 SELECT *
 FROM dbo.Orders
 WHERE ShippedDate IS NULL AND ShipRegion IS NOT NULL;

--Tìm ra các đơn hàng đã được giao trong tháng 7 năm 1997,
--sắp xếp theo tứ tự ngày giao sớm nhất đến ngày giao muộn nhất
--và có khu vực giao hàng  NULL
SELECT *
FROM dbo.Orders 
WHERE ShippedDate LIKE '1997-07-%' AND ShipRegion IS NULL
ORDER BY ShippedDate DESC;