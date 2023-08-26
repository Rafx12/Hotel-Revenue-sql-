select *
From imdb_movies$

--data cleaning 

Select [Release Date], CONVERT(date,[Release Date])
From imdb_movies$

Update imdb_movies$
Set [Release Date]=CONVERT(date,[Release Date])

Alter table imdb_movies$
Add [Release Dates] date;

Update imdb_movies$
SET [Release Dates] = CONVERT(Date,[Release Date])

--organize by date

Select  distinct Names,[Release Dates] , Budget,score
From imdb_movies$
where [Release Dates] is not null
order by [Release Dates]

--Rank type 10 grossing movies
Select  distinct Names, Revenue,
Rank() over(order by revenue desc) as rankrev
From imdb_movies$
Where Names is not null
Order by Revenue desc

--finding the ranking of the profits throughout history of cinema

Select distinct names, budget, revenue,(Revenue-Budget)as profit,
Rank() over(order by revenue-budget desc) as ranked
From imdb_movies$
where Names is not null
order by profit desc

--Find where score is greater than 70-80 = average and 81-89=above average and 90-100 great

Select distinct Names, Score,
CASE WHEN score between 70 and 80 then 'average'
	WHEN score between 80 and 90 then  'above average'
	WHEN score between 90 and 100 then 'Great'
	WHEN score between 50 and 60 then 'bad'
	Else 'terrible'
	End as 'ranked'
	FROM imdb_movies$
	where Names is not null
	order by Score desc
	;
--how many movies are considered above average?

with "score description" as (
Select distinct Names, Score,
CASE WHEN score between 70 and 80 then 'average'
	WHEN score between 80 and 90 then  'above average'
	WHEN score between 90 and 100 then 'Great'
	WHEN score between 50 and 60 then 'Bad'
	Else 'terrible'
	End as 'ranked'
	FROM imdb_movies$
	where Names is not null
	--order by Score desc
	)
Select Count(ranked) as "above average count" from [score description] 
where ranked = 'above average'

-- Action Movies in 2020

select genre,count([Release Dates]) as "2020action"
From imdb_movies$
where genre = 'action' and [Release Dates] between '2020-01-01' and '2020-12-31'
Group by Genre

select names,genre,[Release Dates] as "date"
From imdb_movies$
where genre = 'action' and [Release Dates] between '2020-01-01' and '2020-12-31'
Group by Genre, Names, [Release Dates]

--top 10 action movies of all time by profit

Select top 10 names,genre,[Release Dates],Revenue
From imdb_movies$
where Genre = 'Action'
ORDER BY Revenue desc

--average score for action movies

SELECT round(AVG(score) ,0) as avgscoreaction
FROM imdb_movies$
Where genre = 'action'

SELECT round(AVG(score) ,0) as avgscoreaction , Genre
FROM imdb_movies$
where genre in ('horror','comedy','thriller','drama','action','romance')
group by genre

SELECT GENRE,avg(SCORE)
FROM imdb_movies$
where Genre= 'comedy'
group by Genre 
--order by Score desc

Select *
From imdb_movies$

--summer movie profits

with summer2022 as (
SELECT Names,[Release Dates],revenue,
CASE WHEN [Release Dates] BETWEEN '2022-06-30' AND '2022-08-31' THEN 'Summermovies'
	WHEN [Release Dates] BETWEEN ' 2022-12-31' AND '2023-03-20' THEN 'Wintermovies'
	End as seasons
FROM imdb_movies$
)
select * from summer2022
where seasons is not null
order by seasons, [release dates] desc

Select Names,[Release Dates],Score,Budget,Revenue
From imdb_movies$
where Names is not null
order by [Release Dates] asc














