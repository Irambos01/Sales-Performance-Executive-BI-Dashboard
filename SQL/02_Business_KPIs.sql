/*
====================================================
AdventureWorks Sales Analytics
02 - Business KPIs
Author: Oscar IRAMBONA
====================================================
*/

-- Business Question1: What is total revenue?
SELECT
    SUM(LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail;

--Business Question2 : How many orders have been placed?

SELECT
    COUNT(DISTINCT SalesOrderID) AS TotalOrders
FROM Sales.SalesOrderDetail;

--Business Question3: How many units have been sold?
SELECT
    SUM(OrderQty) AS TotalQuantity
FROM Sales.SalesOrderDetail;

--Business Question 4: How many unique customers have purchased?

SELECT
    COUNT(DISTINCT CustomerID) AS UniqueCustomers
FROM Sales.SalesOrderHeader;

--Business Question 5: What is the Average Order value?

SELECT
    1.0*SUM(LineTotal) / COUNT(DISTINCT SalesOrderID) AS AverageOrderValue
FROM Sales.SalesOrderDetail;