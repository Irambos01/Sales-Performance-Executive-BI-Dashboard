# AdventureWorks Sales Analytics

## SQL Server + Power BI Business Intelligence Project

An end-to-end sales analytics solution transforming transactional data into business insights using SQL Server, T-SQL, Power Query, DAX, and Power BI.

![AdventureWorks Executive Dashboard](Screenshots/05_BI_Dashboard 2013.png)


---

## Project Overview

This project demonstrates an end-to-end business intelligence workflow, starting with a transactional sales database and transforming it into an interactive executive dashboard.

The analysis combines SQL-based business analysis with data modeling and Power BI reporting to provide insights into:

- Sales performance
- Customer contribution
- Product performance
- Territory performance
- Monthly sales trends
- Year-over-year performance
- Executive-level KPIs

The project focuses on translating transactional data into information that can support business monitoring and decision-making.

## Business Objective

The objective was to analyze AdventureWorks sales data and build a reporting solution that enables decision-makers to quickly understand revenue performance, customer activity, product contribution, territory performance, and sales trends.

Key business questions included:

- How much revenue is being generated?
- How many orders and products are involved?
- Which customers contribute the most revenue?
- Which products and categories perform best?
- Which territories generate the highest sales?
- How does sales performance change over time?
- How can transactional data be transformed into an executive-level reporting solution?

- ## Technology Stack

| Technology | Purpose |
|---|---|
| Microsoft SQL Server Express | Database environment |
| SQL Server Management Studio (SSMS) | Database exploration and SQL analysis |
| T-SQL | Data querying and business analysis |
| Power Query | Data transformation |
| Power BI | Data modeling, visualization and reporting |
| DAX | Analytical measures and calculations |
| GitHub | Version control and portfolio documentation |

## Dataset

The project uses the Microsoft AdventureWorks sample database, a transactional database containing sales, customer, product, and territory information.

### Main Tables Used

- `Sales.SalesOrderHeader` — order-level information
- `Sales.SalesOrderDetail` — individual sales transactions
- `Sales.Customer` — customer records
- `Sales.SalesTerritory` — sales territory information
- `Person.Person` — customer names and personal information
- `Production.Product` — product information
- `Production.ProductSubcategory` — product subcategories
- `Production.ProductCategory` — product categories

The dataset was imported into SQL Server Express and explored using SQL Server Management Studio (SSMS) before being transformed into an analytical model for Power BI.

## Project Workflow

The project followed an end-to-end analytics workflow:

```text
AdventureWorks Database
        ↓
SQL Server Express
        ↓
SQL Server Management Studio
        ↓
Data Exploration & Validation
        ↓
Business-Oriented SQL Analysis
        ↓
Power Query Transformations
        ↓
Data Modeling
        ↓
DAX Measures
        ↓
Power BI Dashboard
        ↓
Business Insights & Decision Support
```
## Database Exploration

The initial stage focused on understanding the structure and quality of the transactional database.

Activities included:

- Exploring database schemas and tables
- Inspecting columns and data types
- Understanding relationships between sales, customers, products, and territories
- Reviewing transaction dates and sales periods
- Checking record volumes and data consistency
- Identifying the appropriate tables for analytical reporting
- Understanding the difference between order-level and transaction-level data

SQL Server Management Studio was used as the primary environment for database exploration and analysis.

## SQL Business Analysis

SQL Server was used to investigate the transactional data and answer business-oriented questions across sales, customers, products, territories, and time.

The analysis included:

- Core sales KPIs
- Customer revenue and order analysis
- Product and category performance
- Territory performance
- Annual and monthly sales trends
- Top-performing customers and products

The SQL analysis was organized into eight files covering progressively more advanced analytical techniques.

### Key SQL Techniques

The project demonstrates practical T-SQL techniques including:

- `SELECT`, `WHERE`, `ORDER BY`, and `TOP`
- Aggregations with `SUM`, `COUNT`, and `AVG`
- `GROUP BY` and `HAVING`
- `INNER JOIN` and `LEFT JOIN`
- Date and string functions
- `CASE` expressions
- Subqueries
- Common Table Expressions (CTEs)
- `CROSS JOIN`
- Window functions
- `ROW_NUMBER()`, `RANK()`, and `DENSE_RANK()`
- `PARTITION BY`
- Running totals
- Moving averages
- `LAG()` for period-over-period analysis

### Business Questions

Examples of questions addressed through SQL include:

- What is the total sales revenue?
- Which customers generate the highest revenue?
- Which customers perform above the average customer revenue?
- Which products generate the most revenue?
- Which product categories contribute the most sales?
- Which territories generate the highest revenue?
- Who are the top customers within each territory?
- How does monthly revenue change over time?
- What is the previous month's revenue?
- What is the monthly revenue growth rate?
- What are the top-performing products within each category?

## Advanced SQL Analysis

The analysis progressed beyond basic querying to more advanced analytical techniques.

### Common Table Expressions

CTEs were used to create reusable intermediate datasets for customer, product, and monthly sales analysis.

### Window Functions

Window functions were used to perform calculations while retaining the underlying rows, including:

- Customer and product ranking
- Territory-level ranking
- Running revenue totals
- Moving averages
- Previous-period comparisons

### Ranking

`ROW_NUMBER()`, `RANK()`, and `DENSE_RANK()` were used to identify top-performing customers and products within specific groups.

### Time-Series Analysis

Monthly sales were analyzed using CTEs and window functions to calculate:

- Running totals
- Three-month moving averages
- Previous-month revenue
- Monthly revenue growth

## Data Modeling

The transactional data was transformed into a structured analytical model in Power BI.

A star-schema approach was used, with `FactSales` as the central fact table and supporting dimension tables for analysis.

### Model Structure

```text
                    DimDate
                       |
                       |
DimCustomer —— FactSales —— DimProduct
                       |
                       |
                 DimTerritory

```markdown
## Power Query Transformations

Power Query was used to prepare the source data for analytical modeling.

Key transformations included:

- Selecting the required columns
- Setting appropriate data types
- Creating the customer dimension from customer and person data
- Merging related source tables
- Creating a consolidated customer name
- Preparing dimension tables for the Power BI model
- Maintaining a clean separation between transactional data and analytical dimensions

The transformations were designed to produce a model that was structured for reporting rather than simply reproducing the source database.

