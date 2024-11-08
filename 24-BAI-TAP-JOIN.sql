USE NORTHWND;
--Liệt kê tên sản phẩm
--và tên nhà cung cấp của các sản phẩm đã được đặt hàng trong bảng order details
--sử dụng JOIN để kết hợp bảng order details với các bảng
--liên quan để lấy thông tin sản phẩm và nhà cung cấp
SELECT DISTINCT od.ProductID, p.ProductName, s.CompanyName
FROM dbo.[Order Details] od
JOIN dbo.Products p
ON od.ProductID = p.ProductID
JOIN dbo.Suppliers s
ON p.SupplierID = s.SupplierID;

--Liệt kê tên khách hàng và tên nhân viên phụ trách của các đơn hàng trong bảng 'Orders'
--bao gồm cả các đơn hàng không có nhân viên phụ trách
--sử dụng LEFT JOIN để kết hợp bảng orders với bảng employees
--để lấy thông tin về khách hàng và nhân viên phụ trách
SELECT o.OrderID, e.LastName, e.FirstName, c.CompanyName
FROM dbo.Orders o
LEFT JOIN dbo.Employees e
ON o.EmployeeID = e.EmployeeID
LEFT JOIN dbo.Customers c
ON o.CustomerID = c.CustomerID;

--Liệt kê tên khách hàng và tên nhân viên phụ trách
--của các đơn hàng trong bảng orders
--bao gồm cả các khách hàng không có đơn hàng
--sử dụng RIGHT JOIN để kết hợp bảng orders với bảng customers
--để lấy thông tin về khách hàng và nhân viên phụ trách
SELECT o.OrderID, e.LastName, e.FirstName, c.CompanyName
FROM dbo.Orders o
RIGHT JOIN dbo.Employees e
ON o.EmployeeID = e.EmployeeID
RIGHT JOIN dbo.Customers c
ON o.CustomerID = c.CustomerID;

--Liệt kê tên danh mục và tên nhà cung cấp của các sản phẩm
--trong bảng products bao gồm cả các danh mục 
--và các nhà cung cấp không có sản phẩm
--sử dụng FULL JOIN  hoặc kết hợp LEFT JOIN và RIGHT JOIN
--để lấy thông tin về danh mục và nhà cung cấp
SELECT p.ProductID, p.ProductName, s.CompanyName
FROM dbo.Products p
FULL JOIN dbo.Suppliers s
ON s.SupplierID = p.SupplierID
FULL JOIN dbo.Categories c
ON c.CategoryID = p.CategoryID

--Liệt kê tên khách hàng và tên sản phẩm đã được đặt hàng trong bảng
--Orders và order details.Sử dụng JOIN để kết hợp bảng order
--và orders details để lấy thông tin khách hàng và sản phẩm 
--đã được đặt hàng
SELECT p.ProductName,c.CompanyName
FROM dbo.Orders o
JOIN dbo.[Order Details] od
ON o.OrderID = od.OrderID
JOIN dbo.Customers c
ON c.CustomerID = o.CustomerID
JOIN dbo.Products p
ON p.ProductID = od.ProductID;

--Liệt kê tên nhân viên và tên khách hàng của các đơn hàng trong bảng
--Orders.Bao gồm cả các đơn hàng không có nhân viên hoặc
--khách hàng tương ứng.Sử dụng FULL JOIN hoặc kết hợp LEFT JOIN
--và RIGHT JOIN để kết hợp bảng Orders với bảng Employees và Customers
--để lấy thông tin về nhân viên và khách hàng 
SELECT e.LastName, e.FirstName, c.CompanyName
FROM dbo.Orders o
FULL JOIN dbo.Employees e
ON e.EmployeeID = o.EmployeeID
FULL JOIN dbo.Customers c
ON c.CustomerID = o.CustomerID;