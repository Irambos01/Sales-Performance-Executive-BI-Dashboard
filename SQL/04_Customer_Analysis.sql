/*
====================================================
AdventureWorks Sales Analytics
04 - Customer Analysis
Author: Oscar IRAMBONA
====================================================
*/


--Business Question 9: Who are the highest-value customers?
SELECT TOP 10
    soh.CustomerID,
    SUM(sod.LineTotal) AS Revenue
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY
    soh.CustomerID
ORDER BY
    Revenue DESC;

--Business Question 10: How much revenue does each customer generate?
SELECT
    soh.CustomerID,
    COUNT(DISTINCT soh.SalesOrderID) AS TotalOrders,
    SUM(sod.LineTotal) AS Revenue
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY
    soh.CustomerID
ORDER BY
    Revenue DESC;