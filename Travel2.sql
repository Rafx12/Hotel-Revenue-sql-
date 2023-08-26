Select *
From Travels

Select Distinct[Traveler name],Destination,[Transportation type]
From Travels
Where Destination like '%States%'

Select Destination, [Transportation type], [Transportation cost]
From Travels
Where Destination like '%states%' and [Transportation type] like 'flight'

Select Destination, [Transportation type], [Transportation cost],[Traveler nationality], [Accommodation type],[Accommodation cost]
From Travels
Where Destination like '%states%' and [Transportation type] like 'flight'
Order by [Transportation cost]

Select Destination, [Transportation type], [Transportation cost],[Traveler nationality], [Accommodation type],[Accommodation cost]
From Travels
Where Destination like 'Mexico' and [Transportation type] like 'flight'
Order by [Transportation cost]


Select Destination,StartDateConverted, EndDateConverted, [Transportation type], [Transportation cost],[Traveler nationality], [Accommodation type],[Accommodation cost]
From Travels
Where StartDateConverted is not null
order by StartDateConverted, EndDateConverted  desc

---Average Accomadation per gender/type

Select [Traveler gender],[Accommodation type], AVG([Accommodation cost]) as "Gender Average cost" 
From travels
Group by [Traveler gender], [Accommodation type] 
Order by [Traveler gender]


--Average cost overall per gender

Select [Traveler gender], sum([Accommodation cost]+[Transportation cost]) As "Total overall cost gender"
From Travels
Group by [Traveler gender] --[Transportation cost], [Accommodation cost]




