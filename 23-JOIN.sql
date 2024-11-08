USE NORTHWND;
--INNER JOIN (HOẶC JOIN)
--Trả về tất cả các hàng khi có ít nhất một giá trị ở cả hai bảng
--Trả về các cặp khóa giống nhau
--ví dụ: table 1: A B C D E
--		 table 2: C D E F G
--		 JOIN C D E	
--Sử dụng JOIN
--Từ bảng products và categories hãy in ra thông tin sau:
--Mã thể loại
--Tên thể loại
--Mã sản phẩm
--Tên sản phẩm
SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Categories AS c
JOIN dbo.Products AS p
ON c.CategoryID = p.CategoryID;

--Sử dụng JOIN
--Từ bảng products và categories hãy in ra thông tin sau:
--Mã thể loại 
--Tên thể loại
--Số lượng sản phẩm
SELECT c.CategoryID, c.CategoryName, COUNT(p.ProductID) AS "SỐ LƯỢNG SẢN PHẨM"
FROM dbo.Categories AS c
JOIN dbo.Products AS p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName;

--Từ table customers, orders
--sử dụng JOIN, in ra các thông tin sau đây:
--Mã đơn hàng
--Tên công ty khách hàng
SELECT o.OrderID, c.CompanyName
FROM dbo.Orders o
JOIN dbo.Customers c
ON o.CustomerID = c.CustomerID


--LEFT JOIN
--Trả lại tất cả các dòng từ bảng bên trái,
--và các dòng đúng với điều kiện từ bảng bên phải
--ví dụ: table 1: A B C D E
--		 table 2: C D E F G
--		 LEFT JOIN: A B C D E
--Sử dụng JOIN, LEFT JOIN

--Từ bảng products và categories, hãy đưa ra thông tin sau:
--Mã thể loại
--Tên thể loại
--Tên sản phẩm
SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Categories AS c
JOIN dbo.Products AS p
ON c.CategoryID = p.CategoryID;

SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Categories AS c
LEFT JOIN dbo.Products AS p
ON c.CategoryID = p.CategoryID;

SELECT c.CategoryID, c.CategoryName, COUNT(p.ProductID)
FROM dbo.Categories AS c
JOIN dbo.Products AS p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName;

SELECT c.CategoryID, c.CategoryName, COUNT(p.ProductID)
FROM dbo.Categories AS c
LEFT JOIN dbo.Products AS p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName;

--RIGHT JOIN
--Trả lại tất cả các dòng từ bảng bên phải,
--và các dòng thỏa mãn điều kiện từ bảng bên phải
--ví dụ: table 1: A B C D E
--		 table 2: C D E F G
--		 LEFT JOIN: C D E F G
--Sử dụng JOIN, RIGHT JOIN

--Sử dụng RIGHT JOIN,hãy in ra các thông tin:
--Mã đơn hàng 
--Tên công ty khách hàng
SELECT o.OrderID, c.CompanyName
FROM dbo.Orders o
RIGHT JOIN dbo.Customers c
ON o.CustomerID = c.CustomerID;

SELECT c.CompanyName, COUNT(o.OrderID)
FROM dbo.Orders o
RIGHT JOIN dbo.Customers c
ON o.CustomerID = c.CustomerID
GROUP BY c.CompanyName;

--FULL JOIN
--Trả về tất cả các dòng đúng với 1 trong các bảng
--Ví dụ: table 1: A B C D E
--		 table 2: C D E F G
--		 FULL JOIN: A B C D E F G

--Sử dụng FULL JOIN
--Từ bảng products và categories, hãy in ra:
--Mã thể loại
--Tên thể loại 
--Mã sản phẩm
--Tên sản phẩm
SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM dbo.Categories AS c
FULL JOIN dbo.Products AS p
ON c.CategoryID = p.CategoryID;