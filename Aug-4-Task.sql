
/*
1.	Perform merge operation with condition
2.	Exercise for Converting into the ISO culture.
3.	Implement TOP with ties.
4.	Do the example for logical query processing.
5.	Applying the Logical Order of Operations to Writing SELECT Statements
6.	Do the Exercises for sample database implementing following concepts.
 	1. Expressions for SQL Server
2. Custom Formatting numbers
3. Working with GUID
4. creating a view from table
5. Scalar Function
6. Stored Procedures
*/
CREATE DATABASE ProductsDB

GO

USE ProductsDB
GO

CREATE TABLE Product_List
(
 P_ID int PRIMARY KEY, P_NAME varchar(30), P_PRICE decimal
)

INSERT INTO Product_List
(
 
  P_ID, P_NAME, P_PRICE
)
VALUES(101, 'TEA', 10)
,(102, 'COFFEE', 15)
,(103, 'BISCUIT', 20)

GO

select * from Update_List




CREATE TABLE Updated_List
(
 P_ID int PRIMARY KEY, P_NAME varchar(30), P_PRICE decimal
)

INSERT INTO Updated_List
(
 
  P_ID, P_NAME, P_PRICE
)
VALUES(101, 'TEA', 10.00)
,(102, 'COFFEE', 25.00)
,(104, 'CHIPS', 22.00)

GO


/*  ---------------Perform merge operation with condition--------------*/

/* Selecting the Target and the Source */
MERGE [Product_List] AS TARGET
	USING [Updated_List] AS SOURCE
	
	select * from updated_List  -- 104 ID
	select * from Product_List
	

	/* If the P_ID is same,
	checking for change in P_NAME or P_PRICE */
	ON (TARGET.P_ID = SOURCE.P_ID)
	WHEN MATCHED
		AND TARGET.P_NAME <> SOURCE.P_NAME
		OR TARGET.P_PRICE <> SOURCE.P_PRICE

	

	--- Update the records in TARGET 
	THEN UPDATE
		SET TARGET.P_NAME = SOURCE.P_NAME,
		TARGET.P_PRICE = SOURCE.P_PRICE
	
	--- INSERT operation

	
	WHEN NOT MATCHED BY TARGET
	THEN INSERT (P_ID, P_NAME, P_PRICE)		
		VALUES (SOURCE.P_ID, SOURCE.P_NAME, SOURCE.P_PRICE)

	---  DELETE operation 

	
	WHEN NOT MATCHED BY SOURCE
	THEN DELETE;
 --END OF MERGE 

GO

--- Clean Up Operation
DROP TABLE Updated_List;
DROP TABLE Product_List;

/****************************************************************/



 --- convert date into the ISO Culture standard time date
 SELECT GETDATE() AS dtGetDate
        , CONVERT( varchar(20), GETDATE(), 10 ) AS standardDate10
        , CONVERT( varchar(20), GETDATE(), 9 ) AS standardDate9
        , CONVERT( varchar(20), GETDATE(), 5 ) AS standardDate5
        , CONVERT( varchar(20), GETDATE(), 26 ) AS standardDate26
 GO


 /***********************Implement TOP with ties**************************************************/

 SELECT [P_ID]

      ,[P_NAME]

      ,[P_PRICE]

  FROM Product_List

  Go

 Select  top(2) [P_ID]
 from Product_List
 order by [P_NAME]

 Go

 Select   top(2) with ties [P_NAME]  
 from Product_List  ---To see those recrods add the WITH TIES clause
 order by [P_NAME]


/************************5Applying the Logical Order of Operations to Writing SELECT Statement**************************/

select * from [ProductsDB].[dbo].[Product_List]
select P_NAME as name from [Updated_List]    
group by P_NAME
having P_NAME = 'TEA'                   ---4.Do the example for logical query processing


/************************************** 
6. Expressions for SQL Server

*/

select P_NAME, P_PRICE from [Updated_List]
where P_PRICE <25

go

select P_NAME, P_PRICE from [Updated_List]
where P_NAME ='CHIPS'

go

/*
 *  Working with GUID
 ******************************************************/
 SELECT NEWID() AS [newID]
		, NEWID() AS [newId2]
		, CAST('1C0E3B5C-EA7A-41DC-8E1C-D0A302BE558B' AS uniqueidentifier) AS [oldID]
 GO


 /********************************************/

 CREATE VIEW [dbo].[ProductsDB]
 AS
	SELECT [P_ID], [P_Name], [P_Price]
		FROM [Product_List]
		WHERE [P_Price] IN ( 10,22)
		
 GO


 /**************** Scalar*/ 
 USE Northwind

 CREATE FUNCTION [dbo].[funcScalar] (
	@quantity int,
	@price money = 1		--  default value.
 )
 RETURNS money				-- Returns Scalar Value
 AS
	 BEGIN
		RETURN @quantity * @price
	 END
 GO


 
 SELECT [dbo].[funcScalar] ( 5, $70.25 )
 GO


 /**************************************************************************************************************/
  CREATE PROCEDURE [dbo].[sp_GetCustomerSubset] (
	@country nvarchar(15)
 )
 AS
	SELECT * 
	FROM [CustomersSubset] 
	WHERE [Country] = @country
	ORDER BY [CustomerID]
 GO


 EXEC [sp_GetCustomerSubset] 'USA'
 SELECT @@ROWCOUNT
  GO




