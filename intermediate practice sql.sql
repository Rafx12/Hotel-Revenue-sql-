/* 
Inner Joins, Full/Left/Right Outer Joins
*/


Select *
From EmployeeDemographics

Select *
From EmployeeSalary

Select *
From [Sql database].dbo.EmployeeDemographics
Inner Join [Sql database].dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Select *
From [Sql database].dbo.EmployeeDemographics
Full Outer Join [Sql database].dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


Select *
From [Sql database].dbo.EmployeeDemographics
LEFT Outer Join [Sql database].dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Select *
From [Sql database].dbo.EmployeeDemographics
RIGHT Outer Join [Sql database].dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
From [Sql database].dbo.EmployeeDemographics
INNER Join [Sql database].dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


Select EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
From [Sql database].dbo.EmployeeDemographics
RIGHT OUTER Join [Sql database].dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

	Select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
From [Sql database].dbo.EmployeeDemographics
RIGHT OUTER Join [Sql database].dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


Select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
From [Sql database].dbo.EmployeeDemographics
LEFT OUTER Join [Sql database].dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Select EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
From [Sql database].dbo.EmployeeDemographics
LEFT OUTER Join [Sql database].dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


Select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
From [Sql database].dbo.EmployeeDemographics
INNER Join [Sql database].dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
	WHERE FirstName <> 'mICHAEL'
	ORDER BY SALARY DESC

	Select  JobTitle, Avg(Salary)
From [Sql database].dbo.EmployeeDemographics
INNER Join [Sql database].dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
	WHERE JobTitle = 'Salesman'
	Group by JobTitle

/*
Union, Union All
*/

SELECT *
FROM [Sql database].DBO.EmployeeDemographics
FULL OUTER JOIN [Sql database].dbo.WareHouseEmployeeDemographics
    ON EmployeeDemographics.EmployeeID = 
	WareHouseEmployeeDemographics.EmployeeID

Select*
From [Sql database].dbo.EmployeeDemographics
union
Select *
From [Sql database].dbo.EmployeeSalary

Select Employeeid, Firstname, age
From [Sql database].dbo.EmployeeDemographics
union
Select EmployeeID, JobTitle, Salary
From [Sql database].dbo.EmployeeSalary