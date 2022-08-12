/*

Assignment 2:Manipulating data1.	Deletion of row2.	Using PRINT and SELECT and understand the difference3.	Using of ROWCOUNT4.	Using of Alias for a column and for a table5.	Use of Count Variable6.	Working with OFFSET and FETCH
7.	How to test for NULLS correctly?8.	Implementing ORDER BY Clause with different conditions


*/

USE [Northwind]
GO

SELECT*FROM [CustomersDemo];
GO

CREATE TABLE [CustomersDemo]
(
	[Id] int NOT NULL UNIQUE
	, [Name] varchar(50) NOT NULL
	, [Address] varchar(200) NULL

	, CONSTRAINT [PK_CustomersDemo] PRIMARY KEY ( [Id] DESC )
);
GO

SELECT * FROM [CustomersDemo] WHERE [ID]>15 
	CONSTRAINT [ID_CustomersDemo]);


INSERT INTO [CustomersDemo]
	( [Id], [Name], [Address] )
VALUES
	( 10, 'Aman', 'Nagpur' )
	, ( 11, 'Ajay', 'Mumbai' )
	,( 3, 'Ashwin', 'Pune' )
	, ( 1, 'Nutan', 'Mumbai' )
GO

SELECT * FROM [CustomersDemo]
GO


-- 1.	Deletion of row
DELETE FROM [CustomersDemo]
	WHERE [Id] = 3
SELECT * FROM [CustomersDemo]
GO



-- 2.	Using PRINT and SELECT 

DECLARE @ID3 int = 3
--GO
SELECT * FROM [CustomersDemo]
	WHERE [Id] = @ID3
 --GO

PRINT @ID3		
GO




USE [Northwind]
GO

-- ROWCOUNT

SELECT * FROM [CustomersDemo]
SELECT @@ROWCOUNT AS [RowCountAffected]	 
GO


-- COUNT

SELECT COUNT (CustomerID) AS ID FROM Customers;



--Using of Alias for a column and for a table

--- column alias 
--- data as sorted format
SELECT [CustomerID] AS [Id],
       [CompanyName] + ', ' + [Country] AS [Name]
FROM [Customers] AS Cust
GO     
		


SELECT * FROM [Customers];
SELECT * FROM [Orders];


SELECT o.[OrderID]
	   , cust.[CustomerID]
	   , cust.[CompanyName] AS [Name]	--  for  column
	
FROM [Customers] AS cust				--  table
     , [Orders] AS o					--  table
WHERE cust.[CustomerID] = o.[CustomerID]


---  	Working with OFFSET and FETCH

SELECT * FROM [Orders]
ORDER BY [EmployeeID]
	OFFSET 3 ROWS -- skip that rows
	FETCH FIRST 5 ROWS ONLY

GO


--- How to test for NULLS correctly?

SELECT [Region] FROM [Customers]
 WHERE [Customers].[Region] IS NULL;



--	Implementing ORDER BY Clause with different conditions


 SELECT [Country], [PostalCode] FROM [Customers]
	WHERE [dbo].[Customers].[PostalCode] IS NOT NULL
	ORDER BY  [Country] ,[PostalCode] ASC;