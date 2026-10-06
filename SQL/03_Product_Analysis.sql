/*
====================================================
AdventureWorks Sales Analytics
03 - Product Analysis
Author: Oscar IRAMBONA
====================================================
*/


-- Business Question 6: Which product categories generate the most revenue?

SELECT
    pc.Name AS ProductCategory,
    SUM(sod.LineTotal) AS Revenue
FROM Sales.SalesOrderDetail AS sod
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory AS psc
    ON p.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY
    pc.Name;


-- Business Question 7: What are the top 10 products by revenue?

SELECT TOP 10
    p.Name AS ProductName,
    SUM(sod.LineTotal) AS Revenue
FROM Sales.SalesOrderDetail AS sod
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
GROUP BY
    p.Name
ORDER BY
    Revenue DESC;


-- Business Question 8: What are the top products by quantity sold?

SELECT TOP 10
    p.Name AS ProductName,
    SUM(sod.OrderQty) AS QuantitySold
FROM Sales.SalesOrderDetail AS sod
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
GROUP BY
    p.Name
ORDER BY
    QuantitySold DESC;