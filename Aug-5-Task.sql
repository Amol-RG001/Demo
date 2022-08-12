/*

Assignment:
Implement the following concepts in sql server:
1.	Stored Procedure
2.	Composite Primary key
3.	Foreign key
4.	Working with Master and Transaction table

*/


USE [master]
GO
--- 4task
SELECT * FROM [Countries]
 CREATE TABLE [Countries]		
 (
	[Code] varchar(3) NOT NULL PRIMARY KEY
	, [Name] varchar(50) NOT NULL
 )
 GO
 SELECT * FROM Persons
 DROP TABLE Persons
 CREATE TABLE [Persons]			
 (
    [PersonId] smallint NOT NULL 
    , [Name] varchar(50) NOT NULL
    , [Age] int NULL
	, [CountryCode] varchar(3) NOT NULL		
	, [Gender] varchar(9) NOT NULL

	, CONSTRAINT [PK_Persons] 
		PRIMARY KEY CLUSTERED ( [PersonId] ASC )
	, CONSTRAINT [FK_Persons_Countries] 
		FOREIGN KEY ([CountryCode]) REFERENCES [Countries] ([Code])
	, CONSTRAINT [CHK_Persons_Age] CHECK ( [Age] >= 18 AND [Age] <= 65 )
	, CONSTRAINT [CHK_Persons_Gender] CHECK ( [Gender] IN ('Male', 'Female', 'Unknown') )
 )
 GO

 INSERT INTO [Countries]
 (
 [Code],[Name]
 )
 VALUES
 (
 'UK','Harsha'
 )

 INSERT INTO [Persons]
 (
 [PersonId],[Name],[Age],[CountryCode],[Gender]
 )
 VALUES
 (
 3,'Harshaa',16,'UK','Female'
 )
GO

--- 3 task

USE [MyDemoDb]
GO


CREATE TABLE Customers (
  id INT,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  age INT,
  country VARCHAR(10),
  CONSTRAINT CustomersPK PRIMARY KEY (id)
);

CREATE TABLE Orders (
  order_id INT,
  item VARCHAR(40),
  amount INT,
  customer_id INT,
  CONSTRAINT OrdersPK PRIMARY KEY (order_id)
);

ALTER TABLE Orders --- Notice Orders table have customers ID
ADD FOREIGN KEY (customer_id) REFERENCES Customers(id);


INSERT INTO Customers
VALUES
(1, 'John', 'Doe', 31, 'USA'),
(2, 'Robert', 'Luna', 22, 'USA');


INSERT INTO Orders
VALUES
(1, 'Keyboard', 400, 2),
(2, 'Mouse', 300, 2),
(3, 'Monitor', 12000, 1);

SELECT * FROM Customers;
SELECT * FROM Orders;

--- 2task
CREATE TABLE StudentTable
(
RollNO int, 
StudentName VARCHAR(30), 
Class VARCHAR(30), 
Section VARCHAR(1), 
Mobile bigint,
PRIMARY KEY (RollNO, Mobile)); -- composite key


INSERT INTO StudentTable 
(RollNO, StudentName, Class, Section, Mobile) 
VALUES (1, 'AMAN','FOURTH', 'B', 1234567890),
 (2, 'JOHN','FIRST', 'A', 1234569870),
 (3, 'TOM','FOURTH', 'B', 9874561230),
(4, 'RICHEE','SECOND', 'C', 9988776655)

GO

SELECT *  FROM StudentTable;





--- 1task
 CREATE PROCEDURE [dbo].[sp_GetCustomerSubset] (
	@country nvarchar(15)
 )
 AS
	SELECT * 
	FROM [CustomersSubset] 
	WHERE [Country] = @country
	ORDER BY [CustomerID]
 GO

--- for execution store procedure
 EXEC [sp_GetCustomerSubset] 'France'
 SELECT @@ROWCOUNT
  GO
