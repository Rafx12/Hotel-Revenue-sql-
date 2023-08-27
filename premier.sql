Select * 
From Premier_League$


--delete "null"

Delete from Premier_League$ 
	WHERE Stadium IS NULL

DELETE FROM Premier_League$
	WHERE Stadium = 'Nan'


--Rank the Stadiums with the most attendance

SELECT RANK() OVER (ORDER BY SUM(Attendance) DESC) AS StadiumRank,
		Stadium, SUM(Attendance) AS TotalStadiumAttendance
FROM Premier_League$
GROUP BY Stadium
ORDER BY TotalStadiumAttendance DESC

--What is the average number of goals scored by the home team in a match?

SELECT ROUND(avg([Goals Home]),1) AS Home_TeamAVG
FROM Premier_League$

--Team that has the highest average number of home goals per match?

SELECT [Home Team], ROUND(AVG([Goals Home]),1) AS AverageGoals
FROM Premier_League$
GROUP BY "Home Team"
ORDER BY AverageGoals DESC


--Difference in the number of corners earned by home and aways teams

SELECT ROUND(AVG(home_corners),1) AS AvgHomeCorners,
	   ROUND(AVG(away_corners),1) AS AvgAwayCorners,
	   ROUND(AVG(home_corners),1) - ROUND(AVG(away_corners),1) AS CornersDifference
FROM Premier_League$

--OVERALL Goals scored for each team

	SELECT Team, SUM(TotalGoals) AS TotalGoals
FROM (
    SELECT
        "Home Team" AS Team,
        SUM("Goals Home") AS TotalGoals
    FROM
       Premier_League$
    GROUP BY
        "Home Team"
  UNION ALL
 SELECT
    "Away Team" AS Team,
    SUM("Away Goals") AS TotalGoals
    FROM Premier_League$ 
    GROUP BY "Away Team") AS GoalsByTeam
GROUP BY Team
ORDER BY TotalGoals DESC;


--Teams with the most fouls this season

SELECT  Team, SUM(total_fouls) AS Total_fouls
	FROM (Select	
		"home team" AS Team,
		SUM("home_fouls") AS Total_fouls
	From Premier_League$
	Group by "home team"
UNION ALL
SELECT "Away Team" AS Team,
	SUM(away_fouls) As Total_fouls
	From Premier_League$
	Group by [Away Team]) AS FoulsbyTeam
Group BY Team 
ORDER BY Total_fouls DESC




--the overall shot conversion rate for the home & away team (goals scored per shot taken)

SELECT
       Team,
    SUM(TotalGoals) AS TotalGoals,
    SUM(TotalShots) AS TotalShots,
    ROUND((SUM(TotalGoals) / SUM(TotalShots)) * 100, 2) AS ConversionRate
FROM ( 
		SELECT
			"Home Team" AS Team,
			 SUM("Goals Home") AS TotalGoals,
			 SUM("home_shots") AS TotalShots
FROM
	Premier_League$
GROUP BY "Home Team"
	UNION ALL

	SELECT
        "Away Team" AS Team,
        SUM("Away Goals") AS TotalGoals,
        SUM("away_shots") AS TotalShots	
FROM Premier_League$
GROUP BY "Away Team"
) AS ShotsbyTeam
Group by Team
ORDER BY ConversionRate DESC




	--Is the home team's advantage more pronounced for certain teams?

	SELECT
    "Home Team" AS Team,
    ROUND(AVG("Goals Home"),2) AS AvgHomeGoals,
    ROUND(AVG("Away Goals"),2) AS AvgAwayGoals,
    ROUND(AVG("Goals Home"),2) - ROUND(AVG("Away Goals"),2) AS GoalDifference,
 CASE
        WHEN AVG("Goals Home") - AVG("Away Goals") > 0 THEN 'Home Advantage'
        WHEN AVG("Goals Home") - AVG("Away Goals") = 0 THEN 'Neutral'
        ELSE 'Away Advantage'
    END AS AdvantageCategory
FROM
    Premier_League$
GROUP BY
    "Home Team"
ORDER BY
    GoalDifference DESC;






	














    




