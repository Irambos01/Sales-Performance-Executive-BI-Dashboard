/*
====================================================
AdventureWorks Sales Analytics
08 - Trends analysis
Author: Oscar IRAMBONA
====================================================
*/

--Business Question 21: How does each month's revenue compare with the previous month?
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

    LAG(MonthlyRevenue) OVER (
        PARTITION BY SalesYear
        ORDER BY SalesMonth
    ) AS PreviousMonthRevenue

FROM MonthlySales
ORDER BY
    SalesYear,
    SalesMonth;


--Monthly Growth Parcentage

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
),

MonthlyComparison AS
(
    SELECT
        SalesYear,
        SalesMonth,
        MonthlyRevenue,

        LAG(MonthlyRevenue) OVER (
            PARTITION BY SalesYear
            ORDER BY SalesMonth
        ) AS PreviousMonthRevenue

    FROM MonthlySales
)

SELECT
    SalesYear,
    SalesMonth,
    MonthlyRevenue,
    PreviousMonthRevenue,

    ((MonthlyRevenue - PreviousMonthRevenue)
        / NULLIF(PreviousMonthRevenue, 0)) * 100
        AS MonthlyGrowthPercent

FROM MonthlyComparison
ORDER BY
    SalesYear,
    SalesMonth;


--Business Question 22: How do products rank within their category?
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

-- Top products within every category
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


--Business Question 23: Is the average order value changing?
SELECT
    YEAR(soh.OrderDate) AS SalesYear,
    SUM(sod.LineTotal) /
        COUNT(DISTINCT soh.SalesOrderID) AS AverageOrderValue
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY
    YEAR(soh.OrderDate)
ORDER BY
    SalesYear;


--Business Question 24: How does customer revenue vary across years?
SELECT
    soh.CustomerID,
    YEAR(soh.OrderDate) AS SalesYear,
    SUM(sod.LineTotal) AS Revenue
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY
    soh.CustomerID,
    YEAR(soh.OrderDate)
ORDER BY
    soh.CustomerID,
    SalesYear;


-- Revenue contribution by category*/
WITH CategorySales AS
(
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
        pc.Name
)

SELECT
    ProductCategory,
    Revenue,
    Revenue * 100.0 /
        SUM(Revenue) OVER () AS RevenueContributionPercent
FROM CategorySales
ORDER BY
    Revenue DESC;