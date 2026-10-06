/*
====================================================
AdventureWorks Sales Analytics
06 - Time Series Analysis
Author: Oscar IRAMBONA
====================================================
*/


--Business Question 15: How does revenue change by year?
SELECT
    YEAR(soh.OrderDate) AS SalesYear,
    SUM(sod.LineTotal) AS Revenue
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY
    YEAR(soh.OrderDate)
ORDER BY
    
   SalesYear;


--Business Question 16: What are the monthly sales patterns?
SELECT
    YEAR(soh.OrderDate) AS SalesYear,
    MONTH(soh.OrderDate) AS SalesMonth,
    SUM(sod.LineTotal) AS Revenue
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY
    YEAR(soh.OrderDate),
    MONTH(soh.OrderDate)
ORDER BY
    SalesYear,
    SalesMonth;

-- Business Question 17: Is the average order value changing over the years?

SELECT
    YEAR(soh.OrderDate) AS SalesYear,
    1.0 * SUM(sod.LineTotal)
        / COUNT(DISTINCT soh.SalesOrderID) AS AverageOrderValue
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY
    YEAR(soh.OrderDate)
ORDER BY
    SalesYear;