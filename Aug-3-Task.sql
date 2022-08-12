/*

Assignment 2 :1.	Exercise on Joins Cross JoinInner JoinLeft Outer JoinRight Outer JoinFull Outer Join
2.	Use DML to modify data : Perform INSERT and UPDATE4.	Apply Delete and truncate.5.	Perform Insertion of data from another table.6.	Do the practise for converting to Integer Data type.7.	Do the practise for converting to DateTime Data type8.	Perform updation of data in one table based on a join 



*/
---JOINS

USE [StudentDB]

Go

SELECT * FROM [StudentRank]

Go


/*
CREATE TABLE[StudentRank]
(
[Grade] varchar(5)
,[Rank] int 
)
*/

/*INSERT INTO [StudentRank]
( 
[Grade], [Rank]

)

VALUES('A', 1), ('B',2)

GO
*/






SELECT * FROM StudentTable;

GO


SELECT * FROM StudentRank;

GO


SELECT *
	FROM [StudentTable] AS ST,
	     [StudentRank] AS SR		---self join
	WHERE ST.RollNO = SR.Rank
 GO

 
 SELECT *
	FROM [StudentTable] AS ST
	LEFT JOIN [StudentRank] AS SR ON ST.RollNO = SR.Rank
	
 GO


 SELECT *
	FROM [StudentTable] AS ST
	RIGHT JOIN [StudentRank] AS SR ON ST.RollNO = SR.Rank
 GO


 SELECT *
	FROM [StudentTable] AS ST
	FULL OUTER JOIN [StudentRank] AS SR ON ST.RollNO = SR.Rank
 GO
 

 SELECT *
	FROM [StudentTable] AS ST  ---- 8 rows
	CROSS JOIN [StudentRank] AS SR --- 5 rows
 GO									--- total rows = 8*5 = 40 rows


 SELECT * FROM [StudentTable]
 GO


 SELECT * FROM [StudentRank]
 GO


 ------------------------------------------------------------------------------------------

 --- 2 Use DML to modify data : Perform INSERT and UPDATE


 USE [StudentDB]
 GO


 SELECT * FROM [StudentRank]

 GO

 --- INSERT
  INSERT INTO [StudentRank]
  ([Grade],[Rank])
  VALUES('B', 3);


  --- UPDATE

UPDATE [StudentRank]
	SET [Grade]= 'A'
	WHERE [Rank] = 3
SELECT * FROM [StudentTable]

GO


 -------------------

 -----  4.	Apply Delete and truncate.

 DELETE [StudentRank] 
	WHERE [Rank] = 3

GO

 SELECT * FROM [StudentRank]

 GO


 TRUNCATE TABLE [StudentRank]   --- records destroy and reset

 GO

 SELECT * FROM [StudentRank]

 GO


 ---------------5
 USE MyDemoDb
 GO

 INSERT INTO [MyEmployee]
	SELECT Designation FROM Employees
	WHERE ID = 1;







 --- 6.	Do the practise for converting to Integer Data type.

 DECLARE @money varchar(8) = '0000109 '
 SELECT @money, CAST( @money AS int ) AS Rupees
 SELECT @money + 1, CAST( @money AS int ) + 1 AS Rupees
 SELECT @money + $2.98, CAST( @money AS money ) + $2.98 AS Rupees
 GO



 -----7.	Do the practise for converting to DateTime Data type

 DECLARE @time varchar(15) = '04 Aug 2022'
 SELECT CAST( @time AS smalldatetime ) AS smalltimedate
        , CAST( @time AS date ) AS CurrentDATE
        , CAST( @time AS datetime ) AS timedate
		, CAST( @time AS time ) AS CurrentTIME
		, CAST( @time AS datetime2 ) AS TIMEDATE
 GO

 ---- 8. updation of data in one table based on a join


CREATE TABLE Table1 (column1 INT, column2 INT, column3 VARCHAR (80))  
INSERT INTO Table1 (column1, column2, column3) 
VALUES (10, 100, 'FIRST-POSITION')
,(20,200, 'SECOND-POSITION') 
,(30, 300, 'THIRD-POSITION')   
,(40, 400, 'FOURTH-POSITION') 

GO
	
	SELECT * FROM Table1

CREATE TABLE Table2 (column1 INT, column2 INT, column3 VARCHAR (80))  
INSERT INTO Table2 (column1, column2, column3)  
VALUES (101, 91, 'RANK-ONE') 
 ,(102, 92, 'RANK-TWO' )
 ,(30, 93, 'RANK-THREE')
 ,(40, 94, 'RANK-FOUR')


 GO

 SELECT * FROM Table1
 SELECT * FROM Table2

 GO

 UPDATE Table1  
SET column2 = t2.column2,  
column3 = t2.column3  
FROM Table1 t1  
INNER JOIN Table2 t2 ON t1.column1 = t2.column1  
WHERE t1.column1 IN (30,40)  

GO

DROP TABLE Table1