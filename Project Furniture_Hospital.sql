## Project

select *
from proj_hospital.tr_orderdetails;

SELECT MAX(Quantity)
FROM tr_orderdetails;

#unique Products

SELECT COUNT(DISTINCT(ProductID))
FROM tr_orderdetails;

# Introduce Order By

SELECT DISTINCT(ProductID), Quantity
FROM tr_orderdetails
WHERE Quantity = 3
ORDER BY ProductID ASC, Quantity DESC;

# Unique Properties

SELECT DISTINCT(PropertyID)
FROM tr_orderdetails;

# GROUP BY

# Product category that has maximum products

SELECT *
FROM tr_products;

# Categorizing -- 2 in order by is 2nd colum (no_category) of this query

SELECT ProductCategory, COUNT(*) AS no_category
FROM tr_products
GROUP BY ProductCategory
ORDER BY 2 DESC;

# Property COunt

SELECT PropertyState, COUNT(*) AS City_Count
FROM tr_propertyinfo
GROUP BY PropertyState
ORDER BY 2 DESC;

# Top 5 sold product

SELECT ProductID, SUM(Quantity) AS Total_Product
FROM tr_orderdetails
GROUP BY ProductID
ORDER BY 2 DESC
LIMIT 5;

# Top 5 Properties Sold

SELECT PropertyID, SUM(Quantity) AS Total_Product
FROM tr_orderdetails
GROUP BY PropertyID
ORDER BY 2 DESC
LIMIT 5;

# Joining Tables

SELECT *
FROM tr_orderdetails AS o
LEFT JOIN tr_products AS p
ON o.ProductID = p.ProductID;

# Work on Join
# -- Freh Table

SELECT o.*, p.ProductName,p.ProductCategory, p.Price
FROM tr_orderdetails AS o
LEFT JOIN tr_products AS p
ON o.ProductID = p.ProductID;

# Product & Total Qunatity SOld

SELECT p.ProductName, SUM(o.Quantity) AS Total_Quantity
FROM tr_orderdetails AS o
LEFT JOIN tr_products AS p
ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY 2 DESC;

# Max Selling Product -- To WRAP Prop ID use Backticks (Next to number 1 top)`Prop ID`

SELECT pi.PropertyCity, SUM(o.Quantity * p.Price) AS Profit
FROM tr_orderdetails AS o
LEFT JOIN tr_products AS p ON o.ProductID = p.ProductID
LEFT JOIN tr_propertyinfo AS pi ON o.PropertyID = pi. `Prop ID`
GROUP BY pi.PropertyCity
ORDER BY Profit DESC
LIMIT 5;

# Arlington(city) Sales

SELECT pi.PropertyCity, p.ProductName, SUM(o.Quantity * p.Price) AS Profit
FROM tr_orderdetails AS o
LEFT JOIN tr_products AS p ON o.ProductID = p.ProductID
LEFT JOIN tr_propertyinfo AS pi ON o.PropertyID = pi. `Prop ID`
WHERE pi.PropertyCity = 'Arlington'
GROUP BY pi.PropertyCity, p.ProductName
ORDER BY Profit DESC
LIMIT 5;