Select *
From Ecommerce.dbo.data$

--What is the Average amount of time spent on websites and app?

Select AVG([Time on Website]) as avgweb,AVG([Time on app]) as avgapp
From Ecommerce.dbo.data$

--What is the total time spent on between app and website per customer?

Select ([Time on App]+[Time on Website]) as Totaltimespents,_Email
From data$
order by Totaltimespents desc

--What is the total time spent average?

Select AVG([Time on App]+[Time on Website]) as Averagetotaltimespent
From Ecommerce.dbo.data$

--What is the Average amount spent by customer?

Select AVG([Yearly Amount Spent]) as TotaAVGspent
From Ecommerce.dbo.data$


--What is the yearly amount spent per customer?

Select _email, Address,Round([Yearly Amount Spent]/[Length of Membership],2) as Peryearspent
From Ecommerce.dbo.data$
Order by Peryearspent desc


--How many customers are from Texas?
Select Count(Address) as TXcustomers
From Ecommerce.dbo.data$
Where Address Like '% TX %'


--How much time do the people of TX spend on website and app?
Select Address, sum([Time on App]+[Time on Website]) as TotalTimeTX
From Ecommerce.dbo.data$
Where Address like '% TX %'
Group by Address
Order by TotalTimeTX desc


--What is the average time of Total time spent in TX?

with cte as (
Select Address, sum([Time on App]+[Time on Website]) as TotalTimeTX
From Ecommerce.dbo.data$
Where Address like '% TX %'
Group by Address
--Order by TotalTimeTX desc
) 

Select AVG(totaltimeTX) AS averagetimeTX From cte

--What is the average amount spent in TX?

Select  AVG([Yearly Amount Spent]) as AvgamountTX
From Ecommerce.dbo.data$
Where Address Like '% TX %'


--What is the yearly amount spent per customer from TX?

Select Address,[Length of Membership],[Yearly Amount Spent],Round([Yearly Amount Spent]/[Length of Membership],2) as PeryearspentTX
From Ecommerce.dbo.data$
Where Address Like '% TX %'
Order by PeryearspentTX desc


--What the difference between the Total average and TX Average time and cost?

Select(Select AVG([Yearly Amount Spent]) 
From data$)-(select AVG([Yearly Amount Spent]) as sfas From data$ where Address like '% TX %') as TXtotaldiff


Select AVG([Time on App]+[Time on Website]) as Averagetotaltimespent
From Ecommerce.dbo.data$



