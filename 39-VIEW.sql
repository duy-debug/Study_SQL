
--View 
--Database View là sự trình bày data theo ý muốn được trích xuất từ một hoặc nhiều
--table/view khác. View không lưu data nên nó còn được biết đến với cái tên
--"bảng ảo"
--Các thao tác select, insert, update và delete với view tương tự như table bình thường
--Vì không lưu data nên tất cả những thao tác được thực hiện trên view thì đều được
--phản ánh đến base table mà được trích xuất dữ liệu.

--Tạo VIEW
CREATE VIEW THONGKE AS
SELECT YEAR(o.OrderDate) AS NĂM, 
	   MONTH(o.OrderDate) AS THÁNG,
	   COUNT(o.OrderDate) AS "SỐ LƯỢNG ĐƠN HÀNG"
FROM dbo.Orders o
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate);

--Truy vấn đến View
SELECT *
FROM dbo.THONGKE;

--Tương đương
SELECT *
FROM (
SELECT YEAR(o.OrderDate) AS NĂM, 
	   MONTH(o.OrderDate) AS THÁNG,
	   COUNT(o.OrderDate) AS "SỐ LƯỢNG ĐƠN HÀNG"
FROM dbo.Orders o
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
) AS TEMP;

--Tạo view kết hợp thông tin về khách hàng và đơn hàng
CREATE VIEW CustomerOrders AS
SELECT 
	c.CustomerID,  
	c.CompanyName,
	c.ContactName,
	o.OrderID,
	o.OrderDate,
	o.ShipCountry
FROM dbo.Customers c
JOIN dbo.Orders o ON c.CustomerID = o.CustomerID;	

--Tạo view để hiện thị giá trị của từng đơn hàng
CREATE VIEW OrderTotalValue AS
SELECT o.OrderID,
	   o.CustomerID,
	   o.OrderDate,
	   SUM(od.Quantity * (od.UnitPrice - (od.UnitPrice * od.Discount))) AS TotalOrderValue
FROM dbo.Orders o
JOIN dbo.[Order Details] od ON od.OrderID = o.OrderID
GROUP BY o.OrderID, o.CustomerID, o.OrderDate;

SELECT *
FROM dbo.OrderTotalValue;

--Check option
--CHECK OPTION trong View là một điều kiện cho phép bạn xác định
--ràng buộc về việc cập nhật hoặc chèn dữ liệu vào View.Nó đảm bảo
--rằng các dòng dữ liệu được chèn hoặc cập nhật thông qua View
--sẽ tuân theo một điều kiện cụ thể	

--Ví dụ sử dụng CHECK OPTION để chỉ cho phép chèn dữ liệu thỏa mãn
--điều kiện.giả sử bạn có một View có tên "HighValueProducts" để
--hiển thị sản phẩm có giá trị cao hơn $500.
CREATE VIEW HighValueProducts AS
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products
WHERE UnitPrice > 500
WITH CHECK OPTION