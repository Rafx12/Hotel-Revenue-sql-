CREATE TABLE EmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)


CREATE TABLE EmployeeSalary
(EmployeeID int,
JobTitle varchar(50),
Salary int)

INSERT INTO EmployeeDemographics VALUES
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

INSERT INTO EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

INSERT INTO  EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly','Flax', NULL, 'Male'),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

Insert into EmployeeSalary VALUES
(1010, NULL, 47000),
(NULL, 'Salesman', 43000)


Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')


/*
Select Statement
*, Top, Distinct, Count, As, Max, Min, Avg
*/

Select *
From EmployeeDemographics

Select Firstname, Lastname
From EmployeeDemographics

Select Top 5 *
From EmployeeDemographics

Select DISTINCT(EmployeeID)
FROM EmployeeDemographics

Select DISTINCT(Gender)
FROM EmployeeDemographics

SELECT COUNT(LastName) AS LastNameCount
From EmployeeDemographics

SELECT *
FROM EmployeeSalary

SELECT MIN(Salary)
FROM EmployeeSalary

SELECT MAX(Salary)
FROM EmployeeSalary

SELECT AVG(Salary)
FROM EmployeeSalary

/*
Where Statement
=,<>,<, >, And, Or, Like, Null, Not Null, In
*/

SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Jim'

SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Jim'

SELECT *
FROM EmployeeDemographics
WHERE Age > 30

SELECT *
FROM EmployeeDemographics
WHERE Age <=32 AND Gender = 'Male'

SELECT *
FROM EmployeeDemographics
WHERE Age <=32 OR Gender = 'Male'

SELECT *
FROM EmployeeDemographics
WHERE LastName like '%Scott%'

--null

SELECT *
FROM EmployeeDemographics
WHERE FirstName is not null

SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael')


/*Group by, Order by
*/

Select Gender
From EmployeeDemographics
Group by Gender

Select Gender, COUNT(Gender) AS CountGender
From EmployeeDemographics
Where Age > 31
Group by Gender
Order by CountGender