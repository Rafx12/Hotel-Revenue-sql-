Select *
From ['global air pollution dataset$']


--Top 10 countires/cities with good AQI

Select Top 10 [Country],City,[AQI Value]
From ['global air pollution dataset$']
Order By [AQI Value] Asc

--The count of quality of the AQI Category
SELECT [AQI Category],count([AQI Category]) AS Total_Category_Count
FROM ['global air pollution dataset$']
WHERE [AQI Category] IN ('Moderate','Good','Unhealthy for Sensitive Groups','Hazardous','Very Unhealthy')
group by [AQI Category]
Order by Total_Category_Count desc

--Top 20 Cities in the US with the best AQI Value

SELECT top 20 Country, City, [AQI Value]
FROM ['global air pollution dataset$']
WHERE Country like '%states%'
Order by [AQI Value] 

--Top 20 Cities in India with best AQI Value

SELECT top 20 Country, City, [AQI Value]
FROM ['global air pollution dataset$']
WHERE Country like '%India%'
Order by [AQI Value] 

--What countries have hazardous aqi category

SELECT country,count(Country) AS countofhazardous
FROM ['global air pollution dataset$']
WHERE [AQI Category] = 'hazardous'
Group by Country, [AQI Category]
order by countofhazardous desc

--According to the data set durango is the most hazardous in the US

Select Country,[AQI Category], City
From ['global air pollution dataset$']
Where [AQI Category] = 'hazardous' and Country like '%states%'

--Count good aqi countries per country

Select country,[AQI Category],count([AQI Category]) as goodaqi
From ['global air pollution dataset$']
where [AQI Category] = 'good'
group by Country,[AQI Category]
order by goodaqi desc

Select country,[AQI Category],count([AQI Category]) as moderateaqi
From ['global air pollution dataset$']
where [AQI Category] = 'moderate'
group by Country,[AQI Category]
order by moderateaqi desc

Select country,[AQI Category],count([CO AQI Category]) as Unhealthyfgsaqi
From ['global air pollution dataset$']
where [AQI Category] = 'Unhealthy for sensitive Groups'
group by Country,[AQI Category]
order by Unhealthyfgsaqi desc

Select country,[AQI Category],count([AQI Category]) as veryunhealthyaqi
From ['global air pollution dataset$']
where [AQI Category] = 'Very unhealthy'
group by Country,[AQI Category]
order by veryunhealthyaqi desc

Select country,[AQI Category],count([AQI Category]) as hazaqi
From ['global air pollution dataset$']
where [AQI Category] = 'Hazardous'
group by Country,[AQI Category]
order by hazaqi desc


--AQI values of countries

SELECT Country,City,[AQI Value],[CO AQI Value],[NO2 AQI Value]
From ['global air pollution dataset$']
order by [AQI Value] asc


--Comparing the average aqi value in the US towards the rest of the worlds and finding the difference

Select(
Select AVG([AQI Value]) AS worldAQIaverage
From ['global air pollution dataset$']
where country not in  ('united states of america')) -
(Select AVG([AQI Value]) AS USAQIAverage
From ['global air pollution dataset$']
where country = 'united states of america'
) as DifferenceAQI

--countries where AQI value is higher than Ozone AQI value

Select country, round(avg([AQI Value]),0) AS Aqiavg,round(Avg([Ozone AQI Value]),0) AS ozoneaqiavg, round(avg([AQI Value]),0) -round(Avg([Ozone AQI Value]),0) as Diffozone_Aqi
From ['global air pollution dataset$']
Where [Ozone AQI Value]<[AQI Value]
group by Country














