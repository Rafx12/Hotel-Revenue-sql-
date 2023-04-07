
with hotels as (
select * from dbo.['2018$']
union
Select * from dbo.['2019$']
union
Select * from dbo.['2020$'])

Select * from hotels
left join market_segment$
on hotels.market_segment = market_segment$.market_segment
left join meal_cost$
on meal_cost$.meal = hotels.meal

select arrival_date_year,
hotel,
Round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr),2) as Revenue 
from hotels
group by arrival_date_year, hotel -- Revenue for each year for type of hotel

Select * from dbo.market_segment$

