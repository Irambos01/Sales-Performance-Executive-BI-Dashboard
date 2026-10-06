USE AdventureWorks;

/* =========================================================
   DATA EXPLORATION
   =========================================================
   Initial exploration of the AdventureWorks sales database.
*/

-- 1. Inspect Sales Order Details

SELECT TOP 20 *
FROM Sales.SalesOrderDetail;


-- 2. Determine the Sales Date Range

SELECT
    MIN(OrderDate) AS FirstOrderDate,
    MAX(OrderDate) AS LastOrderDate
FROM Sales.SalesOrderHeader;


-- 3. Count Sales Orders

SELECT COUNT(*) AS TotalOrders
FROM Sales.SalesOrderHeader;


-- 4. Count Sales Line Items

SELECT COUNT(*) AS TotalSalesLines
FROM Sales.SalesOrderDetail;


-- 5. Inspect Available Sales Years

SELECT DISTINCT
    YEAR(OrderDate) AS SalesYear
FROM Sales.SalesOrderHeader
ORDER BY SalesYear;
