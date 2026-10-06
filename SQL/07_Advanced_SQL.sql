/*
====================================================
AdventureWorks Sales Analytics
07 - Advanced SQL Analysis
Author: Oscar IRAMBONA
====================================================
*/


-- Business Question 18: What is the running total of revenue?

WITH MonthlySales AS
(
    SELECT
        YEAR(soh.OrderDate) AS SalesYear,
        MONTH(soh.OrderDate) AS SalesMonth,
        SUM(sod.LineTotal) AS MonthlyRevenue
    FROM Sales.SalesOrderHeader AS soh
    INNER JOIN Sales.SalesOrderDetail AS sod
        ON soh.SalesOrderID = sod.SalesOrderID
    GROUP BY
        YEAR(soh.OrderDate),
        MONTH(soh.OrderDate)
)

SELECT
    SalesYear,
    SalesMonth,
    MonthlyRevenue,
    SUM(MonthlyRevenue) OVER (
        PARTITION BY SalesYear
        ORDER BY SalesMonth
    ) AS RunningRevenue
FROM MonthlySales
ORDER BY
    SalesYear,
    SalesMonth;


-- Business Question 19: How do products rank within their category?

WITH ProductRevenue AS
(
    SELECT
        pc.Name AS ProductCategory,
        p.Name AS ProductName,
        SUM(sod.LineTotal) AS Revenue
    FROM Sales.SalesOrderDetail AS sod
    INNER JOIN Production.Product AS p
        ON sod.ProductID = p.ProductID
    INNER JOIN Production.ProductSubcategory AS psc
        ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    INNER JOIN Production.ProductCategory AS pc
        ON psc.ProductCategoryID = pc.ProductCategoryID
    GROUP BY
        pc.Name,
        p.Name
)

SELECT
    ProductCategory,
    ProductName,
    Revenue,
    ROW_NUMBER() OVER (
        PARTITION BY ProductCategory
        ORDER BY Revenue DESC
    ) AS ProductRank
FROM ProductRevenue
ORDER BY
    ProductCategory,
    ProductRank;


--Business Question 20: How can we identify the top 5 products within each category?

WITH ProductRevenue AS
(
    SELECT
        pc.Name AS ProductCategory,
        p.Name AS ProductName,
        SUM(sod.LineTotal) AS Revenue
    FROM Sales.SalesOrderDetail AS sod
    INNER JOIN Production.Product AS p
        ON sod.ProductID = p.ProductID
    INNER JOIN Production.ProductSubcategory AS psc
        ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    INNER JOIN Production.ProductCategory AS pc
        ON psc.ProductCategoryID = pc.ProductCategoryID
    GROUP BY
        pc.Name,
        p.Name
),

RankedProducts AS
(
    SELECT
        ProductCategory,
        ProductName,
        Revenue,
        ROW_NUMBER() OVER (
            PARTITION BY ProductCategory
            ORDER BY Revenue DESC
        ) AS ProductRank
    FROM ProductRevenue
)

SELECT
    ProductCategory,
    ProductName,
    Revenue,
    ProductRank
FROM RankedProducts
WHERE ProductRank <= 5
ORDER BY
    ProductCategory,
    ProductRank;