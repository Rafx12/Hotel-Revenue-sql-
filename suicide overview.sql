Select *
From master$


--United States Suicide Overview--

Select *
From master$
Where country like '%States%'

--Descending order of Total suicides in the United States 

Select country,year,sum(suicides_no) as Totalsuicides
From master$
Where country like '%States%'
Group by country, year
Order by Totalsuicides Desc

-- Total suicide per M/F and year 
--This is showing that in a cosistent basis Males are committing suicide yearly than women 

Select country,year,sex,sum(suicides_no) as Totalsuicides
From master$
Where country like '%States%'
Group by year,sex,country



--What is the total suicides within each generation through 2015 in the United States
--It details that in Boomers are more likely to commit suicide by out of every other generation

With cte AS (
Select year,country,generation,sum(suicides_no) AS totalgensuicide
From master$
--Where country like '%States%'
Group by year,country,generation
)
Select generation,sum(totalgensuicide) AS Gensuicides
From cte
Group by  generation
ORDER BY Gensuicides Desc


--Suicide Rate each year in the United States 
SELECT year, 
       SUM(suicides_no) AS total_suicides,
       SUM(population) AS total_population,
       ROUND((SUM(suicides_no) / SUM(population)) * 100000,2) AS suicide_rate

FROM master$
WHERE COUNTRY like'%States%'
GROUP BY year
ORDER BY year;


--next world suicide overview

--Suicide Rates each year by gender

SELECT year,sex,
       SUM(suicides_no) AS total_suicides,
       SUM(population) AS total_population,
       ROUND((SUM(suicides_no) / SUM(population)) * 100000,2) AS suicide_rate

FROM master$
GROUP BY year,sex
ORDER BY year;

--countries total population and their suicide rate by the age/gender

SELECT age, sex,
       SUM(suicides_no) AS total_suicides,
       SUM(population) AS total_population,
       ROUND((SUM(suicides_no) / SUM(population)) * 100000,2) AS suicide_rate
FROM master$
GROUP BY age, sex
ORDER BY sex, suicide_rate DESC;



--comparing Gdp and suicide rates in other countries 
--finding correlation between the countries gdp for the year and their 



SELECT  year,country,[gdp_for_year ($)],  
		Round((SUM(suicides_no)/SUM(population))*100000,2) AS yearlysuiciderate
FROM master$
--where country like '%States%'
GROUP BY country,year,[gdp_for_year ($)]



--Finding the max suicide rate for each country and ranking their highest overall

WITH RankedData AS (
	SELECT
		country,
		Round((SUM(suicides_no) / SUM(population)) * 100000,2) AS MAX_suicide_rate,sum(suicides_no) as totalsuicide
	FROM MASTER$
	GROUP BY COUNTRY
)
SELECT RANK() OVER (ORDER BY max_suicide_rate desc)  AS rank_among_max_suicide_rates
,Country,max_suicide_rate,totalsuicide
FROM RankedData
GROUP BY  country,MAX_suicide_rate,totalsuicide

--maxrate and their year

WITH maxcide AS (
    SELECT
        COUNTRY,year,

        ROUND((SUM(SUICIDES_NO) / SUM(POPULATION)) * 100000, 2) AS maxrate,
        RANK() OVER (PARTITION BY COUNTRY ORDER BY ROUND((SUM(SUICIDES_NO) / SUM(POPULATION)) * 100000, 2) DESC) AS rank_per_country
    FROM master$
    GROUP BY COUNTRY,year
)
SELECT
    country,
    year,
    maxrate
FROM maxcide
WHERE rank_per_country = 1
ORDER BY maxrate desc

--What is the total suicides within each generation through 2015 in the United States
--It details that in Boomers are more likely to commit suicide by out of every other generation


select generation,SUM(suicides_no) AS totalgensuicide,Round((SUM(suicides_no) / SUM(population)) * 100000,2) AS gen_suicide_rate
From master$
where generation in ('Boomers','Silent','Generation X','Millenials','G.I. Generation','Generation Z')
Group by generation
















