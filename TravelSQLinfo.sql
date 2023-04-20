Select *
From Travels

Select Destination, Avg([Accommodation cost]) as "Average cost per Accommodation",[Accommodation type]
From Travels
Group by [Accommodation type], Destination

--Cleaning data

Select StartDateConverted, CONVERT(Date,[Start date])
From Travels

Update Travels
SET [Start date] = Convert(Date,[Start date])

ALTER TABLE Travels
Add StartDateConverted Date;

Update Travels
SET StartDateConverted = Convert(Date,[Start date])

--End date

Select [End date], CONVERT(Date,[End date])
From Travels

Update Travels
Set [End date] = CONVERT(Date,[End date])

ALTER TABLE Travels
Add EndDateConverted Date;

Update Travels
SET EndDateConverted = CONVERT(Date,[End date])


Update Travels
Set [Transportation type] = 'Flight'
Where [Transportation type] = 'Plane'

Update Travels
Set [Transportation type] = 'Flight'
Where [Transportation type] = 'Airplane'

Delete From Travels
Where Destination is null

--Accomodation cost 

Select destination, Avg([Accommodation cost]) as "average cost",[Accommodation type]
From Travels
Group by Destination, [Accommodation type]
order by Destination

Select destination, Max([Accommodation cost]) as "Max cost",[Accommodation type]
From Travels
Group by Destination, [Accommodation type]
Order by Destination

Select destination, Min([Accommodation cost]) as "Min cost",[Accommodation type]
From Travels
Where Destination is not null
Group by Destination, [Accommodation type]
Order by Destination



--accomadation type and cost

Select Destination, Avg([Transportation cost]) as "Average cost per transportation",[Transportation type]
From Travels
Group by [Transportation type], Destination
Order by Destination

Select Destination, Max([Transportation cost]) as "Max cost per transportation",[Transportation type]
From Travels
Group by [Transportation type], Destination
Order by Destination

Select Destination, Min([Transportation cost]) as "Minimun cost per transportation",[Transportation type]
From Travels
Group by [Transportation type], Destination
Order by Destination


Select Destination, Avg([Accommodation cost]) as "Average cost per Accommodation",[Accommodation type]
From Travels
Group by [Accommodation type], Destination
Order by Destination

Select Destination, Max([Accommodation cost]) as "Average cost per Accommodation",[Accommodation type]
From Travels
Group by [Accommodation type], Destination
Order by Destination

Select Destination, Min([Accommodation cost]) as "Average cost per Accommodation",[Accommodation type]
From Travels
Group by [Accommodation type], Destination
Order by Destination

--sorted by date

Select Destination,StartDateConverted, EndDateConverted, [Transportation type], [Transportation cost],[Traveler nationality], [Accommodation type],[Accommodation cost]
From Travels
Where StartDateConverted is not null
order by StartDateConverted, EndDateConverted  desc

--trying to find the most expensive country

Select(select max([accommodation cost]) --as maxcost
From Travels
where Destination = 'italy') + (select max([transportation cost])
From travels where Destination = 'italy'
)

Select(select max([accommodation cost]) --as maxcost
From Travels)
 + (select max([transportation cost])
From travels)

Select(select max([accommodation cost]) --as maxcost
From Travels
where Destination = 'italy')  + (select max([transportation cost])
From travels where Destination = 'italy' 
)

Select destination
From travels 
where destination like



Select *
From Travels

--What country has more duration when traveled?

Select [Trip ID],max([Duration]), Destination 
From travels
Where Destination = 'United States'
Group by [Trip ID],[Duration ],Destination 
Order by [Trip ID] asc


select MAX([destination]),max([duration])
From travels
Where Destination = 'united states'

Select distinct destination, max([duration]) as maxdays
From travels 
Group by Destination 
order by maxdays desc



--United States is the most time spent in the country with a singualar trip

Select distinct(destination) as onlydest, max(duration) as maxduration
From travels
Where Destination = 'united states'
Group by duration, Destination
order by maxduration desc


Select destination, max(duration) as maxduration
From travels
group by Destination
order by maxduration desc









