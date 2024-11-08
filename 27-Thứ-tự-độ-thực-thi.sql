USE NORTHWND;
SELECT p.ProductID, p.ProductName --2
FROM dbo.Products p; --1

SELECT p.ProductID, p.ProductName --3 
FROM dbo.Products p --1
WHERE p.CategoryID = 1; --2

SELECT p.CategoryID, COUNT(p.ProductName) AS "SỐ LƯỢNG" --4
FROM dbo.Products p --1
WHERE p.CategoryID IN(1,2,3) --2
GROUP BY p.CategoryID; --3

SELECT p.CategoryID, COUNT(p.ProductID) AS "SỐ LƯỢNG" --5
FROM dbo.Products p --1
WHERE p.CategoryID IN(1,2,3) --2
GROUP BY p.CategoryID --3
HAVING COUNT(p.ProductID) >= 10 --4 'SỐ LƯỢNG' chưa TỒN TẠI
ORDER BY "SỐ LƯỢNG" ASC; --6 'SỐ LƯỢNG' ĐÃ TỒN TẠI