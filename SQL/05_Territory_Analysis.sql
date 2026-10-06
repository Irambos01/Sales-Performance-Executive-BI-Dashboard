/*
====================================================
AdventureWorks Sales Analytics
05 - Territory Analysis
Author: Oscar IRAMBONA
====================================================
*/

--Business Question 13: Which territories generate the most revenue?
SELECT
    st.Name AS Territory,
    SUM(sod.LineTotal) AS Revenue
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Sales.SalesTerritory AS st
    ON soh.TerritoryID = st.TerritoryID
GROUP BY
    st.Name
ORDER BY
    Revenue DESC;



--Business Question 14: How many orders does each territory generate?
SELECT
    st.Name AS Territory,
    COUNT(DISTINCT soh.SalesOrderID) AS TotalOrders
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesTerritory AS st
    ON soh.TerritoryID = st.TerritoryID
GROUP BY
    st.Name
ORDER BY
    TotalOrders DESC;