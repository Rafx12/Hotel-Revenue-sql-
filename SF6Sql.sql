CREATE TABLE Streetfighter6 (ID INTEGER Primary key,
Opponenet varchar (50),
Character varchar(50),
[Rank] varchar(50),
[Win/Lose] varchar(50),
Controller_Type varchar(50)
);

Select *
From Streetfighter6

INSERT INTO Streetfighter6 VALUES(1,'GERMINAL','Dee Jay','PlatinumIV','Win','Classic');
INSERT INTO Streetfighter6 VALUES(2,'GERMINAL','Dee Jay','PlatinumIV','Loss','Classic');
INSERT INTO Streetfighter6 VALUES(3,'GERMINAL','Dee Jay','PlatinumIV','Win','Classic');
INSERT INTO Streetfighter6 VALUES(4,'JojoCornball','Chun-li','PlatinumIII','Win','Classic')
INSERT INTO Streetfighter6 VALUES(5,'Flores','Rashid','PlatinumIV','Loss','Classic');
INSERT INTO Streetfighter6 VALUES(6,'Flores','Rashid','PlatinumIV','Win','Classic');
INSERT INTO Streetfighter6 VALUES(7,'Flores','Rashid','PlatinumIV','Win','Classic')
INSERT INTO Streetfighter6 VALUES(8,'George85','Manon','PlatinumIII','Loss','Modern')
INSERT INTO Streetfighter6 VALUES(9,'Quetzalcoatl','Blanka','PlatinumII','Win','Classic');
INSERT INTO Streetfighter6 VALUES(10,'Quetzalcoatl','Blanka','PlatinumII','Loss','Classic');
INSERT INTO Streetfighter6 VALUES(11,'Quetzalcoatl','Blanka','PlatinumII','Loss','Classic');
INSERT INTO Streetfighter6 VALUES(12,'Eddrock','Kimberly','PlatinumIII','Win','Classic');
INSERT INTO Streetfighter6 VALUES(13,'Eddrock','Kimberly','PlatinumIII','Win','Classic');
INSERT INTO Streetfighter6 VALUES(14,'Kidd-_-Treezy','Marisa','PlatinumIV','Win','Classic');
INSERT INTO Streetfighter6 VALUES(15,'sandmich','Cammy','PlatinumII','Win','Classic');
INSERT INTO Streetfighter6 VALUES(16,'sandmich','Cammy','PlatinumII','Loss','Classic');
INSERT INTO Streetfighter6 VALUES(17,'sandmich','Cammy','PlatinumII','Win','Classic');
INSERT INTO Streetfighter6 VALUES(18,'ZenGuy','Jamie','PlatinumIII','Win','Classic');
INSERT INTO Streetfighter6 VALUES(19,'ZenGuy','Jamie','PlatinumIII','Win','Classic');
INSERT INTO Streetfighter6 VALUES(20,'Jolags','Ryu','PlatinumII','Loss','Modern');
INSERT INTO Streetfighter6 VALUES(21,'papa juice man','Ken','PlatinumIII','Loss','Classic');
INSERT INTO Streetfighter6 VALUES(22,'papa juice man','Ken','PlatinumIII','Win','Classic');
INSERT INTO Streetfighter6 VALUES(23,'A42nado','Dee Jay','PlatinumIII','Loss','Classic');
INSERT INTO Streetfighter6 VALUES(24,'bountyhunter51','Dee Jay','PlatinumIII','Loss','Classic');
INSERT INTO Streetfighter6 VALUES(25,'bountyhunter51','Dee Jay','PlatinumIII','Win','Classic');
INSERT INTO Streetfighter6 VALUES(26,'bountyhunter51','Dee Jay','PlatinumIII','Win','Classic');
INSERT INTO Streetfighter6 VALUES(27,'Tonnm07','Marisa','PlatinumII','Loss','Classic');
INSERT INTO Streetfighter6 VALUES(28,'Tonnm07','Marisa','PlatinumII','Loss','Classic');
INSERT INTO Streetfighter6 VALUES(29,'Apax','Ryu','PlatinumIV','Win','Classic');
INSERT INTO Streetfighter6 VALUES(30,'Apax','Ryu','PlatinumIV','Win','Classic');
INSERT INTO Streetfighter6 VALUES(31,'Kidd-_-Treezy','Marisa','PlatinumIV','Win','Classic');
INSERT INTO Streetfighter6 VALUES(32,'Kidd-_-Treezy','Marisa','PlatinumIV','Loss','Classic');
INSERT INTO Streetfighter6 VALUES(33,'Adiddy91','Ryu','PlatinumII','Loss','Classic');
INSERT INTO Streetfighter6 VALUES(34,'Adiddy91','Ryu','PlatinumII','Loss','Classic');
INSERT INTO Streetfighter6 VALUES(35,'FeraliaMurakami','Rashid','PlatinumIII','Win','Classic');
INSERT INTO Streetfighter6 VALUES(36,'FeraliaMurakami','Rashid','PlatinumIII','Loss','Classic');
INSERT INTO Streetfighter6 VALUES(37,'FeraliaMurakami','Rashid','PlatinumIII','Loss','Classic');
INSERT INTO Streetfighter6 VALUES(38,'MaNiAcJaCe','Ken','PlatinumIV','Win','Classic');
INSERT INTO Streetfighter6 VALUES(39,'MaNiAcJaCe','Ken','PlatinumIV','Win','Classic');
INSERT INTO Streetfighter6 VALUES(40,'ZZZZ','Cammy','PlatinumIII','Loss','Classic');
INSERT INTO Streetfighter6 VALUES(41,'ZZZZ','Cammy','PlatinumIII','Loss','Classic');


Select count([Win/Lose])
From Streetfighter6
where [Win/Lose]= 'Win'


SELECT
    Character,
    COUNT(*) AS TotalMatches,
    SUM(CASE WHEN [Win/Lose] = 'Win' THEN 1 ELSE 0 END) AS Wins,
    ROUND(SUM(CASE WHEN [Win/Lose] = 'Win' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS WinRate
FROM
    Streetfighter6
GROUP BY
    Character
ORDER BY
    WinRate DESC;

--Percentage per rank going against

Select Rank,count(Rank) AS countplat ,
		ROUND(COUNT(*) *100/ SUM(COUNT(*)) OVER(),1) AS Percentage
From Streetfighter6
group by Rank
Order by Percentage desc;

--Win Rate per Oppenent

SELECT
    Opponent,rank,
    COUNT(*) AS TotalMatches,
    SUM(CASE WHEN [Win/Lose] = 'Win' THEN 1 ELSE 0 END) AS Wins,
    ROUND(SUM(CASE WHEN [Win/Lose] = 'Win' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS WinRate
FROM
    Streetfighter6
GROUP BY
    Opponent,Rank
ORDER BY
    WinRate DESC;

--Percentage of character
	

Select character,count(character) AS count,
		Round(COUNT(*) *100/SUM(COUNT(*)) OVER(),2) AS Percentage
From Streetfighter6
Group by Character,[Win/Lose]
ORDER BY Percentage DESC

--Win Rate percentage (character)

SELECT
    Character,
    COUNT(*) AS TotalMatches,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS WinRatePercentage
FROM
    Streetfighter6
GROUP BY
    Character
ORDER BY
    WinRatePercentage DESC;

SELECT Opponent,[Win/Lose],count(Opponent),
		Round(count(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS WinRatePercentage
FROM Streetfighter6
Group by Opponent, [Win/Lose]

--

SELECT controller_type,count(controller_type) AS Countofcontroller,
		ROUND(count(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS controllerpercentage
FROM Streetfighter6
Group by Controller_Type










