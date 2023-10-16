select *
From AppleStore$



--Check for any missing values in key fields

SELECT COUNT(*) AS MissingValues
FROM AppleStore$
WHERE track_name is null or user_rating is null or prime_genre is null


--Find out the number of apps per genre

SELECT prime_genre, COUNT(*) as NumApps
FROM AppleStore$
Group By prime_genre
ORDER BY NumApps DESC;


-- Get an overview of the apps' ratings

Select	min(user_rating) AS MinRating,
		max(user_rating) AS MaxRating,
		avg(user_rating) AS AvgRating
FROM AppleStore$


--Determine whether paid apps have highter ratings than free apps


SELECT CASE
		WHEN price > 0 THEN 'Paid'
		ELSE 'Free'
	END AS App_Type,
	avg(user_rating) AS Avg_Rating
FROM AppleStore$
GROUP BY CASE
		WHEN price > 0 THEN 'Paid'
		ELSE 'Free'
	END


--Check if apps with more supported language have higher ratings

SELECT CASE 
	When lang_num < 10 then '<10 languages'
	when lang_num BETWEEN 10 AND 30 THEN '10-30 languages'
	else '>30 languages'
	end as language_bucket,
	avg(user_rating) as Avg_Rating
From AppleStore$
GROUP BY CASE 
When lang_num < 10 then '<10 languages'
when lang_num BETWEEN 10 AND 30 THEN '10-30 languages'
else '>30 languages'
END
ORDER BY Avg_Rating DESC;


-- Check genres with low rating

SELECT TOP 10 prime_genre,
		AVG(user_rating) AS Avg_Rating
FROM AppleStore$
GROUP BY prime_genre
ORDER BY Avg_Rating


--Check the top-rated apps for each genre


Select 
	prime_genre,
	track_name,
	user_rating
FROM ( 
	Select
	prime_genre,
	track_name,
	user_rating,
	Rank() OVER (PARTITION BY prime_genre ORDER BY user_rating Desc,rating_count_tot DESC ) AS RANK
FROM AppleStore$
) AS A 
WHERE A.RANK = 1 


--genre total amount of revenue

Select prime_genre,ROUND(SUM(price),2) AS Total_Revenue
FROM AppleStore$
GROUP BY prime_genre
ORDER BY Total_Revenue DESC


--most expensive app in each genre

Select 
	prime_genre,
	track_name,
	price
FROM ( 
	Select
	prime_genre,
	track_name,
	price,
	Rank() OVER (PARTITION BY prime_genre ORDER BY price Desc,rating_count_tot DESC ) AS RANK
FROM AppleStore$
) AS A 
WHERE A.RANK = 1 
order by price desc

--Which free app has the most user ratings?


SELECT TOP 1 track_name, rating_count_tot
FROM AppleStore$
WHERE price = 0
ORDER BY rating_count_tot DESC


-- What is the average user rating for apps with 4+ content rating comapred to those with a 17+ content rating?

SELECT cont_rating, AVG(user_rating) AS average_rating
FROM AppleStore$
WHERE cont_rating IN ('4+', '17+')
GROUP BY cont_rating;


--Are there any apps with a user rating of 5? How many?

Select COUNT(*) AS Rating5
FROM AppleStore$
WHERE user_rating = 5


--Showing the percentage of rating of 5 

SELECT 
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM AppleStore$)), 2) AS rounded_percentage_of_rating_5_apps
FROM AppleStore$
WHERE user_rating = 5;




--What are the different content ratings in the dataset, and how many apps fall into each content rating category?

SELECT cont_rating,COUNT(*) AS count_cont_rating
FROM AppleStore$
GROUP BY cont_rating

--What apps need or use the most size_bytes?


Select 
	prime_genre,
	track_name,
	size_bytes
FROM ( 
	Select
	prime_genre,
	track_name,
	size_bytes,
	Rank() OVER (PARTITION BY prime_genre ORDER BY price Desc,rating_count_tot DESC ) AS RANK
FROM AppleStore$
) AS A 
WHERE A.RANK = 1 
order by size_bytes desc



--Average size of bytes in each prime_genre

SELECT prime_genre, ROUND(AVG(size_bytes),0) AS average_size
FROM AppleStore$
GROUP BY prime_genre
ORDER BY average_size DESC


SELECT AVG(user_rating) AS average_rating
FROM AppleStore$
WHERE prime_genre = 'Games';

















