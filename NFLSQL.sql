CREATE TABLE WideReceivers22 (ID INTEGER PRIMARY KEY,
	[Player] Varchar(50),
	[Team] Varchar(50),
	Reception INTEGER,
	Yards INTEGER,
	TD INTEGER,
	[20+ Reception] INTEGER,
    [40+ Reception]  INTEGER,
	Longest INTEGER,
	Targets INTEGER,
	YAC INTEGER,
	Catchpercentage FLOAT);


INSERT INTO WideReceivers22 VALUES(1, 'Justin Jefferson','Minnesota Vikings',128,1809,8,28,6,64,184,613,62.5);
INSERT INTO WideReceivers22 VALUES(2, 'Tyreek Hill', 'Miami Dolphins', 119,1710,7,25,7,64,170,482,64.7);
INSERT INTO WideReceivers22 VALUES(3, 'Stefon Diggs', 'Buffalo Bill', 108,1429,11,17,6,53,154,419,66.7);
INSERT INTO WideReceivers22 VALUES(4, 'CeeDee Lamb', 'Dallas Cowboys', 107,1359,9,24,0,39,156,486,62.6);
INSERT INTO WideReceivers22 VALUES(5, 'Amon-Ra St.Brown', 'Detroit Lions', 106,1161,6,11,1,49,146,531,64.2);
INSERT INTO WideReceivers22 VALUES(6, 'Chris Godwin', 'Tampa Bay Buccaneers',104,1023,3,10,1,44,142,531,51);
INSERT INTO WideReceivers22 VALUES(7, 'Davante Adams', 'Las Vegas Raiders',100,1516,14,24,7,60,180,483,65);
INSERT INTO WideReceivers22 VALUES(8, 'Michael Pittman', 'Indianapolis Colts',99,925,4,8,0,28,141,344,51.5);
INSERT INTO WideReceivers22 VALUES(9, 'DeVonta Smith', 'Philidelphia Eagles',95,1196,7,18,4,45,136,476,60);
INSERT INTO WideReceivers22 VALUES(10, 'DK Metcalf', 'Seattle Seahawks', 90,1048,6,11,3,54,141,211,52.2);
INSERT INTO WideReceivers22 VALUES(11, 'A.J. Brown', 'Philidelphia Eagles', 88,1496,11,23,6,78,145,548,67);
INSERT INTO WideReceivers22 VALUES(12, 'JaMarr Chase', 'Cincinnati Bengals', 87,1046,9,13,3,60,134,421,66.7);
INSERT INTO WideReceivers22 VALUES(13, 'Diontae Johnson', 'Pittsburgh Steelers', 86,882,0,7,0,37,147,235,52.3);
INSERT INTO WideReceivers22 VALUES(14, 'Christian Kirk', 'Jacksonville Jaguars', 84,1108,8,18,2,49,133,377,65.5);
INSERT INTO WideReceivers22 VALUES(15, 'Tyler Lockett', 'Seattle Seahawks', 84,1033,9,14,1,40,117,274,59.5);
INSERT INTO WideReceivers22 VALUES(16, 'Garrett Wilson', 'New York Jets', 83,1103,4,13,3,60,147,384,67.5);
INSERT INTO WideReceivers22 VALUES(17, 'Zay Jones', 'Jacksonville Jaguars', 82,823,5,7,1,59,121,289,53.7);
INSERT INTO WideReceivers22 VALUES(18, 'Brandon Aiyuk', 'San Francisco 49ers', 78,1015,8,17,1,54,114,388,60.3);
INSERT INTO WideReceivers22 VALUES(19, 'Amari Cooper', 'Clevland Browns', 78,1160,9,18,4,55,132,308,78.2);
INSERT INTO WideReceivers22 VALUES(20, 'Juju Smith-Schuster', 'New England Patriots', 78,933,3,9,4,53,101,465,60.3);
INSERT INTO WideReceivers22 VALUES(21, 'Mike Evans', 'Tampa Bay Buccaneers', 77,1124,6,19,5,63,127,216,68.8);



Select * from WideReceivers22


--Find the average catching percentage?

Select Round(Avg(Catchpercentage),2) as RoundedPercentAVG
From WideReceivers22


--Which players have the longest play? Top 5

Select TOP(5) ID,Player, Longest
From WideReceivers22
Order by Longest desc


--Order the Top 5 Catchpercentage players

Select TOP(5) ID,Player,Team,Catchpercentage
From WideReceivers22
Group by ID,Player,Team, Catchpercentage
Order by Catchpercentage desc


--Which player had the most TD?

Select TOP(1) Player,Team,MAX(TD) as MaxTD
From WideReceivers22
Group by Player,Team
Order by MaxTD desc

--Which Team had the most players on this list?

Select Team, Count(Team) as CountTeam
From WideReceivers22
Group by Team
Order by CountTeam desc

--How many yards were not YAC?

Select ID,Player,Team,Yards,YAC,(Yards-YAC) as DifferenceYDS
From WideReceivers22
Group by ID,Player,Team,Yards,YAC
Order by DifferenceYDS desc

--Best Catching Percentage

Select Top(1)Player,Max(catchpercentage) as TopCatchPercentage
From WideReceivers22
Group by Player
Order by TOPCatchPercentage desc

-- Order Players with 40+ Reception and 20+ Receptions

Select ID,Player,[20+ Reception],[40+ Reception], Yards
From WideReceivers22
Order by [40+ Reception] desc,[20+ Reception] desc


















	