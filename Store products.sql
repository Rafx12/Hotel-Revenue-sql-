Select Top 20 sum(quantity) as fd ,ProductName
From superstore$
where Country = 'united states'
Group by ProductName
order by fd desc

select * 
from superstore$
where ProductName = 'xerox 225'
order by Ship_Date




--As of right now everything is cleaned, but if anyting comes up will just turn back into the cleaning phase of this project

Select Country
From superstore$
group by country

--found null country 
SELECT *
FROM superstore$
WHERE COUNTRY IS NULL

DELETE FROM superstore$ WHERE Country IS NULL;


--discover what customer has bought the most objects 
--which we can conclude that Muhammed Yedwab as order the most products

select CustomerName,Count(CustomerName) AS countofproducts
from superstore$
Group by Customername
order by countofproducts desc

--now finding the products that they bought 

select CustomerName, ProductName 
From superstore$
order by CustomerName asc


--Count customers per state and then by city 

Select Country,COUNT(distinct customerid) as customerpercountry,Round(SUM(profit),2) as countryprofit
From superstore$
group by Country
Order by customerpercountry desc

--city
Select City,COUNT(distinct customerid) as customerpercity,Round(SUM(profit),2) as cityprofit
From superstore$
group by City
Order by customerpercity desc

--find the profit and see if they have profit in each country
with cte as (
Select Country,COUNT(distinct customerid) as customerpercountry,Round(SUM(profit),2) as countryprofit
From superstore$
group by Country
--Order by customerpercountry desc
)
Select country, customerpercountry,countryprofit,
	Case 
	when countryprofit < 0 then 'negative'
	when countryprofit > 0 then 'profit'
	else 'meh'
	end as income
From cte
order by countryprofit desc


--find the profit and see if they have profit in each city

with cte as (
Select City,COUNT(distinct customerid) as customerpercity,Round(SUM(profit),2) as cityprofit
From superstore$
group by City
--Order by customerpercountry desc
)
SELECT City, customerpercity,cityprofit,
	Case 
	WHEN cityprofit < 0 THEN 'negative'
	WHEN cityprofit > 0 THEN 'profit'
	ELSE 'meh'
	END AS income
FROM cte
ORDER BY cityprofit DESC


--looking for the total profit for each region of the world

SELECT region,Round(sum(profit),2) AS region_profit
FROM superstore$
GROUP BY Region
ORDER BY region_profit DESC



--what is the average profit for each region
WITH cte AS (
SELECT region,Round(sum(profit),2) AS region_profit
FROM superstore$
GROUP BY Region
)
SELECT region,AVG(region_profit) AS avgprofit
FROM cte
GROUP BY Region 
ORDER BY avgprofit DESC


--Results by Category (Office Supplies, Furniture,Technology)

SELECT Category
FROM superstore$
GROUP BY Category

--Sales

SELECT Category, Sum(Sales) AS sum_sales,Round(AVG(sales),2) AS avg_sales,MAX(sales) AS max_sales, MIN(sales) AS min_sales
FROM superstore$
Group by Category

--Best and worst selling product from each category
--best selling
WITH RankedProducts AS (
    SELECT 
        Category,
        ProductName,
        SUM(Sales) AS TotalSales,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY SUM(Sales) DESC) AS Rank
    FROM
        superstore$
    GROUP BY
        Category, ProductName
)
SELECT
    Category,
    ProductName,
    TotalSales
FROM
    RankedProducts
WHERE
    Rank = 1;


select sum(sales) as df, ProductName
from superstore$
where category = 'technology'
group by ProductName
order by df desc

--Least selling products

WITH RankedProducts AS (
    SELECT 
        Category,
        ProductName,
        SUM(Sales) AS TotalSales,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY SUM(Sales) ASC) AS Rank
    FROM
        superstore$
    GROUP BY
        Category, ProductName
)
SELECT
    Category,
    ProductName,
    TotalSales
FROM
    RankedProducts
WHERE
    Rank = 1;



SELECT Category,Sub_Category,COUNT(Sub_Category) AS SUBCATCOUNT
FROM superstore$
GROUP BY Sub_Category,Category
ORDER BY Category

--Quantity by the category of products 
--most office supplies
--least furniture

SELECT 
  Category,
  COUNT(quantity) AS Total_Cat_Quantity,
  TRIM(TRAILING '0' FROM CAST(ROUND((COUNT(quantity) * 100.0 / (SELECT COUNT(*) FROM superstore$)), 2) AS VARCHAR)) AS Percentage
FROM superstore$
GROUP BY Category;


--Average shipping cost for each category

SELECT Category,ROUND(AVG(Shipping_Cost),2) AS AverageCatprice
FROM superstore$
GROUP BY Category



--What market has the most distinct customers and their total spending

SELECT  Market,Count( Distinct CustomerName) AS countindividual
FROM superstore$
GROUP BY Market

--What Catergory was mainly sold in each market

--the query shows that the #1 ranked category for each market is Office supplies 

WITH RankedCategories AS (
  SELECT
    Category,
    Market,
    COUNT(quantity) AS Total_Quantity,
    RANK() OVER (PARTITION BY Market ORDER BY COUNT(quantity) DESC) AS CategoryRank
  FROM
    superstore$
  GROUP BY
    Category, Market
)
SELECT
  Category,
  Market,
  Total_Quantity
FROM
  RankedCategories
WHERE
  CategoryRank = (1,2,3);

  SELECT
  Category,
  Market,
  COUNT(quantity) AS Total_Quantity
FROM
  superstore$
GROUP BY
  Category, Market
  Order by market,Total_Quantity desc





	




