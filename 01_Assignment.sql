/*

Assignment:
1.	You have to implement all the tasks 
Using 
1.	Comparison Operator
2.	Arithmetic Operator
3.	Logical Operator
4.	Concatenation
5.	Predicates
2.	Make use of an alias with some example
3.	Apply some of the operations which you have learned to Northwind database
4.	Schema creation
5.	Orderby example
6.	GroupBy example
7.	Alias concept
8.	UNIQUE keyword


*/


CREATE DATABASE [MyDemoDb]
GO

USE [MyDemoDb]
GO

CREATE TABLE [Products] 
(
	[ProductName] varchar(50)
	, [Quantity] int
	, [Price] int
);
GO

DROP TABLE [Products];

INSERT INTO [Products]
	( [ProductName], [Quantity], [Price] )
	VALUES
	( 'Wheat', 115, 67 )
GO

INSERT INTO [Products]
	( [ProductName], [Quantity], [Price] )
	VALUES
	( 'Rice', 125, 66 )
GO

INSERT INTO [Products]
	( [ProductName], [Quantity], [Price] )
	VALUES
	( 'Salt', 40, 40 ),
	( 'Sugar', 99, 99 )
GO




--Comparison Operator

USE [MyDemoDb]
GO


SELECT [ProductName], [Quantity], [Price]
	FROM [Products]
GO

SELECT * FROM Products
WHERE Price = 66;

SELECT * FROM Products
WHERE Price > 64;

SELECT * FROM Products
WHERE Price < 64;

SELECT * FROM Products
WHERE Price <= 64;

SELECT * FROM Products
WHERE Price >= 64;


-- Arithmetic Operator
CREATE DATABASE [StudentDB]
GO

USE [StudentDB]
Go


CREATE TABLE [StudentTable](
[RollNO] int UNIQUE
,[StudentName] varchar(50)
,[Marathi]int 
,[Hindi] int
,[English]int 
,[Maths]int
,[Science]int
,[Evs] int
,[Max.Marks]int
,[ObtainMarks]int
);
Go

ALTER TABLE [StudentTable]
	ADD [Position] int
Go

SELECT * FROM [StudentTable]
Go



INSERT INTO [StudentTable](

[RollNO] 
,[StudentName] 
,[Marathi] 
,[Hindi] 
,[English] 
,[Maths]
,[Science]
,[Evs] 
,[Max.Marks]


)
VALUES
(04,'Ajit',74,79,53,86,68,45,550),
( 05,'Vijaya',70,77,55,49,75,45,550 )
,(01,'Arman',67,78,56,88,65,43,550),
(06,'Apoorva',76,68,66,58,95,35,550),
( 07,'Ram',90,75,85,80,71,40,550 )
,(08,'Krish',71,78,55,86,55,40,550 )

GO


--- 
SELECT [Marathi]+[Hindi]+[English]+[Maths]+[Science]+[Evs] FROM [StudentTable]
GO
	
SELECT ([Marathi]+[Hindi]+[English]+[Maths]+[Science]+[Evs]) FROM [StudentTable]
GO


INSERT INTO [StudentTable]
(
[Position]
)
VALUES(7,1,5,6,4,8,3)
GO



UPDATE [StudentTable]
	SET [Positon]= 1
	WHERE [RollNO] = 3
SELECT * FROM [StudentTable]
GO



SELECT 30 * 20;

SELECT 40 + 87;

SELECT 50 - 45;

SELECT 75 / 20;

SELECT 35 % 5;

--Logical Operator

SELECT * 
FROM [Products]
WHERE Price = ALL (SELECT Price FROM Products WHERE Quantity = 115);


SELECT * FROM Products
WHERE Price > ANY (SELECT Price FROM Products WHERE Price > 50);


SELECT * FROM Products
WHERE Price BETWEEN 50 AND 80;


--Concatenation

SELECT CONCAT('Brown', 'Rice');


--Make use of an alias with some example

USE [Northwind]
GO

SELECT * FROM [Customers]
GO

SELECT [CustomerID] AS [Id],
       [CompanyName] + ', ' + [Country] AS [Name]
FROM [Customers]



SELECT [Orders].[OrderID]
	   , [Customers].[CustomerID]
	   , [Customers].[CompanyName]
	   , [Orders].[OrderDate]
FROM [Customers]
     , [Orders]
WHERE [Customers].[CustomerID] = [Orders].[CustomerID]


SELECT o.[OrderID]
	   , cust.[CustomerID]
	   , cust.[CompanyName] AS [Name]							
	  /* , o.[OrderDate]
	   , o.[ShipCity] + ', ' + o.[ShipCountry] AS [ShipTo]*/		
FROM [Customers] AS cust				
     , [Orders] AS o					
WHERE cust.[CustomerID] = o.[CustomerID]

--- Schema creation

CREATE SCHEMA emp_amol;
GO

SELECT  *
FROM sys.schemas ;


--Orderby example
USE [Northwind]
GO

SELECT * FROM Customers
ORDER BY Country DESC;


--Groupby example
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;


--Predicates

SELECT * FROM Customers
WHERE [Country] LIKE '%Argentina';


SELECT * FROM Customers
WHERE [Country] IN ('Argentina', 'USA');

