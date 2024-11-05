USE NORTHWND;
--COUNT là đếm số lượng dữ liệu (khác NULL) trong một cột.
--Sử dụng Count(*) khi muốn đếm số lượng bản ghi 
--SUM là tính tổng giá trị của một cột
--Nếu bất kỳ giá trị trong cột là NULL, kết quả của hàm Sum là NULL
--AVG là tính giá trị trung bình cho một cột
--Nếu tất cả các giá trị trong cột là NULL, kết quả của hàm AVG sẽ là NULL
--Nếu chỉ có một vài giá trị là NULL, AVG sẽ bỏ qua các giá trị NULL và tính trung bình cho các giá trị khác
--Hãy đếm số lượng khách hàng có trong bảng (Customers)
SELECT COUNT("CustomerID") AS "NumbersOfCustomers"
FROM dbo.Customers;

--Tính tổng số tiền vận chuyển (Freight) của tất cả các đơn hàng
SELECT SUM("Freight") AS "SumFreight"
FROM dbo.Orders;

--Tính trung bình số lượng đặt hàng (Quantity) của tất cả các sản phẩm trong bảng (Order Details)
SELECT AVG("Quantity") AS "AVGQuantiy"
FROM dbo."Order Details";

--Đếm số lượng, tính tổng số lượng hàng trong kho và trung bình gia của các sản phẩm có trong bảng Product.
SELECT COUNT("UnitsInStock") AS "Số lượng hàng trong kho", 
	   SUM("UnitsInStock") AS "Tổng số lượng trong kho",
	   AVG("UnitPrice") AS "Trung bình giá"
FROM dbo.Products;

--Hãy đếm số lượng đơn hàng từ bảng (Orders) với 2 cách:
--Cách 1: dùng dấu *
--Cách 2: dùng mã đơn hàng
SELECT COUNT(*) AS "Số lượng đơn hàng", COUNT("OrderID") AS "Số lượng đơn hàng"
FROM dbo.Orders;

--Từ bảng Order Details hãy tính trung bình cho cột UnitPrice, và tính tổng cho cột Quanlity
SELECT AVG("UnitPrice"),
	   AVG("Quantity")
FROM dbo."Order Details";