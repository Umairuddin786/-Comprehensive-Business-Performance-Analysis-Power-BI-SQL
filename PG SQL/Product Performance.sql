-- Product Performance

-- KPI's

-- 1.Revenue
SELECT SUM(total_price) AS Total_Revenue
FROM Orders;

-- 2.Product Sold
SELECT SUM(Quantity) AS Product_Sold
FROM Orders;

-- 3.Rated Product
SELECT AVG(product_rating) AS Ratings
FROM Products;
-- Most Rated Product
SELECT 
	 Product_Name,
	MAX(Product_Rating) AS Ratings
FROM Products
WHERE product_name = 'Whirlpool Iron'
GROUP BY Product_name
ORDER BY Ratings DESC

-- 4. Stock Available
SELECT SUM(stock_quantity) AS Stock_Available
FROM Products;
-- Stock Alert
SELECT COUNT (*) AS LoweStockProducts
FROM Products
WHERE Stock_Quantity <100;

-- Visuals

-- Revnue by Month
SELECT
   d.MonthName,
   d.MonthNumber,
   SUM(o.total_price) AS Revenue
FROM Orders o
JOIN DateTable d ON o.order_date = d.date
GROUP BY 
     d.MonthName,
     d.MonthNumber
ORDER BY MonthNumber;

-- Product Sold by Month
SELECT
     d.MonthName,
     d.MonthNumber,
     SUM(Quantity) AS Product_Sold
FROM Orders o
JOIN DateTable d ON O.Order_date = d.date
GROUP BY
       d.MonthName,
       d.MonthNumber
ORDER BY MonthNumber;

-- Revenue by Category
SELECT 
      P.Category,
      SUM(total_Price) AS Revenue
FROM Orders o
JOIN Products p ON o.Product_id = p.Product_id
GROUP BY Category
ORDER BY Revenue DESC;

-- Revenue by Sub-Category
SELECT 
	p.Subcategory,
       SUM (Total_price) AS Revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY subcategory
ORDER BY Revenue DESC;

-- Top 10 Products by Revenue
SELECT 
     p. Product_Name,
     SUM(Total_Price) AS Revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY Product_Name
Order BY Revenue DESC
LIMIT 10;

-- Stock Available by Category
SELECT
     Category,
     SUM(stock_quantity) AS Stock_Available
FROM Products
GROUP BY Category
ORDER BY stock_available DESC;

-- Top 3 Rated Products
SELECT 
    Product_name,
    AVG(product_rating) AS Ratings
FROM Products
GROUP BY Product_name
ORDER BY Ratings DESC
LIMIT 3;

-- Top 5 Manufacturer
SELECT
      p.Manufacturer,
      SUM(Total_Price) AS Revenue
FROM  Products p
JOIN Orders o  ON p.Product_id = o.product_id
GROUP BY Manufacturer
ORDER BY Revenue DESC
LIMIT 5;


