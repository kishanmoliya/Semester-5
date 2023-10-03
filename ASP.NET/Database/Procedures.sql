--1. Create Procedure for Select all Countries
CREATE PROCEDURE [dbo].[PR_Country_SelectAll]
AS
SELECT [dbo].[LOC_Country].[CountryID]
	  ,[dbo].[LOC_Country].[CountryName]
      ,[dbo].[LOC_Country].[CountryCode]
	  ,[dbo].[LOC_Country].[Created]
	  ,[dbo].[LOC_Country].[Modified]

FROM [dbo].[LOC_Country]
ORDER BY [dbo].[LOC_Country].[CountryName]

--2. Create Procedure for Select Country by PK
CREATE PROCEDURE [dbo].[PR_Country_SelectByPK]
@CountryID int
AS

SELECT [dbo].[LOC_Country].[CountryID]
	  ,[dbo].[LOC_Country].[CountryName]
      ,[dbo].[LOC_Country].[CountryCode]
	  ,[dbo].[LOC_Country].[Created]
	  ,[dbo].[LOC_Country].[Modified]

FROM [dbo].[LOC_Country]
WHERE [dbo].[LOC_Country].[CountryID] = @CountryID
ORDER BY [dbo].[LOC_Country].[CountryName]

-- 3. Create Insert Procedure to add any new record for Country
-- [PR_Country_Insert_Record] @CountryName = 'France', @CountryCode = 'frn'
CREATE PROCEDURE [dbo].[PR_Country_Insert_Record]
	@CountryName	varchar(100),
	@CountryCode	varchar(50)

AS
INSERT INTO [dbo].[LOC_Country]
(
	[dbo].[LOC_Country].[CountryName]
   ,[dbo].[LOC_Country].[CountryCode]
)
VALUES
(
	@CountryName,
	@CountryCode
)

-- 4. Create Update Procedure to edit/modeify existing record for Country.
ALTER PROCEDURE [dbo].[PR_Country_UpdateByPK]
	@CountryID		int,
	@CountryName	varchar(100),
	@CountryCode	varchar(50)

AS
UPDATE [dbo].[LOC_Country]
	
	SET [dbo].[LOC_Country].[CountryName] = @CountryName
	   ,[dbo].[LOC_Country].[CountryCode] = @CountryCode
	   ,[dbo].[LOC_Country].[Modified] = GETDATE()

	WHERE [dbo].[LOC_Country].[CountryID] = @CountryID


-- 5. Create Delete Procedure to delete record for Country.
CREATE PROCEDURE [dbo].[PR_Country_DeleteByPK]
	@CountryID	int

AS

DELETE FROM [dbo].[LOC_Country]
WHERE [dbo].[LOC_Country].[CountryID] = @CountryID

-- =================================================================================

-- 6. Create Delete Procedure to delete record for State.
CREATE PROCEDURE [dbo].[PR_State_DeleteByPK]
	@StateID	int

AS

DELETE FROM [dbo].[LOC_State]
WHERE [dbo].[LOC_State].[StateID] = @StateID

--7. Create Procedure for Select all states
-- PR_State_SelectAll
CREATE or Alter PROCEDURE [dbo].[PR_State_SelectAll]
AS

SELECT [dbo].[LOC_State].[StateID]
      ,[dbo].[LOC_Country].[CountryName]
	  ,[dbo].[LOC_State].[StateName]
	  ,[dbo].[LOC_State].[StateCode]
	  ,[dbo].[LOC_State].[Created]
	  ,[dbo].[LOC_State].[Modified]

FROM [dbo].[LOC_State]
INNER JOIN [dbo].[LOC_Country]
ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]
ORDER BY [dbo].[LOC_Country].[CountryName]
        ,[dbo].[LOC_State].[StateName]

--8. Create Procedure for Select State by PK
CREATE PROCEDURE [dbo].[PR_State_SelectByPK]
@StateID int
AS

SELECT [dbo].[LOC_State].[StateID]
      ,[dbo].[LOC_State].[CountryID]
	  ,[dbo].[LOC_State].[StateName]
	  ,[dbo].[LOC_State].[StateCode]
	  ,[dbo].[LOC_State].[Created]
	  ,[dbo].[LOC_State].[Modified]

FROM [dbo].[LOC_State]
INNER JOIN [dbo].[LOC_Country]
ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]
WHERE [dbo].[LOC_State].[StateID] = @StateID
ORDER BY [dbo].[LOC_Country].[CountryName]
        ,[dbo].[LOC_State].[StateName]

-- 9. Create Insert Procedure to add any new record for State
-- [PR_State_Insert_Record] @CountryID = 1, @StateName = 'Gujarat', @StateCode = 'Guj'
CREATE PROCEDURE [dbo].[PR_State_Insert_Record]
	@CountryID int,
	@StateName varchar(100),
	@StateCode varchar(50)
As
INSERT INTO [dbo].[LOC_State]
(
	 [dbo].[LOC_State].[CountryID]
	,[dbo].[LOC_State].[StateName]
	,[dbo].[LOC_State].[StateCode]
)
VALUES
(
	@CountryID,
	@StateName,
	@StateCode
)

-- 10. Create Update Procedure to edit/modeify existing record for State.
ALTER PROCEDURE [dbo].[PR_State_UpdateByPK]
	@CountryID		int,
	@StateID		int,
	@StateName		varchar(100),
	@StateCode		varchar(50)

AS
UPDATE [dbo].[LOC_State]
	
	SET [dbo].[LOC_State].[CountryID] = @CountryID,
		[dbo].[LOC_State].[StateName] = @StateName,
		[dbo].[LOC_State].[StateCode] = @StateCode,
		[dbo].[LOC_State].[Modified] = GETDATE()

	WHERE [dbo].[LOC_State].[StateID] = @StateID

-- =================================================================================

--11. Create Procedure for Select all cities
CREATE or Alter PROCEDURE [dbo].[PR_City_SelectAll]
AS
SELECT [dbo].[LOC_City].[CityID]
	  ,[dbo].[LOC_City].[StateID]
	  ,[dbo].[LOC_City].[CountryID]
	  ,[dbo].[LOC_City].[CityName]
	  ,[dbo].[LOC_State].[StateName]
	  ,[dbo].[LOC_Country].[CountryName] 
	  ,[dbo].[LOC_City].[Citycode]
	  ,[dbo].[LOC_City].[CreationDate]
	  ,[dbo].[LOC_City].[Modified]

FROM [dbo].[LOC_City]
INNER JOIN [dbo].[LOC_State]
ON [dbo].[LOC_State].[StateID] = [dbo].[LOC_City].[StateID]
INNER JOIN [dbo].[LOC_Country] 
ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]
ORDER BY [dbo].[LOC_Country].[CountryName]
        ,[dbo].[LOC_State].[StateName]
		,[dbo].[LOC_City].[CityName]

--12. Create Procedure for Select City by PK
CREATE or Alter PROCEDURE [dbo].[PR_City_SelectByPK]
@CityID int
AS

SELECT [dbo].[LOC_City].[CityID]
	  ,[dbo].[LOC_City].[CityName]
	  ,[dbo].[LOC_City].[StateID]
	  ,[dbo].[LOC_State].[StateName]
	  ,[dbo].[LOC_City].[CountryID]
	  ,[dbo].[LOC_Country].[CountryName]
	  ,[dbo].[LOC_City].[Citycode]
	  ,[dbo].[LOC_City].[CreationDate]
	  ,[dbo].[LOC_City].[Modified]

FROM [dbo].[LOC_City]
INNER JOIN [dbo].[LOC_State]
ON [dbo].[LOC_State].[StateID] = [dbo].[LOC_City].[StateID]
INNER JOIN [dbo].[LOC_Country] 
ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]
WHERE [dbo].[LOC_City].[CityID] = @CityID
ORDER BY [dbo].[LOC_Country].[CountryName]
        ,[dbo].[LOC_State].[StateName]
		,[dbo].[LOC_City].[CityName]

-- 13. Create Insert Procedure to add any new record for State
-- [PR_CIty_Insert_Record] @CountryID = 1, @StateID = 1, @CityName = 'Rajkot', @CityCode = 'Raj'
CREATE PROCEDURE [dbo].[PR_City_Insert_Record]
	@CountryID int,
	@StateID int,
	@CityName varchar(100),
	@CityCode varchar(50)
As
INSERT INTO [dbo].[LOC_City]
(
	 [dbo].[LOC_City].[CountryID]
	,[dbo].[LOC_City].[StateID]
	,[dbo].[LOC_City].[CityName]
	,[dbo].[LOC_City].[CityCode]
)
VALUES
(
	@CountryID,
	@StateID,
	@CityName,
	@CityCode
)


-- 14. Create Update Procedure to edit/modify existing record for City.
ALTER PROCEDURE [dbo].[PR_City_UpdateByPK]
	@CountryID	int,
	@StateID	int,
	@CityID		int,
	@CityName	varchar(100),
	@CityCode	varchar(50)

AS
UPDATE [dbo].[LOC_City]

	SET	[dbo].[LOC_City].[CountryID] = @CountryID,
		[dbo].[LOC_City].[StateID] = @StateID,
		[dbo].[LOC_City].[CityName] = @CityName,
		[dbo].[LOC_City].[Citycode] = @CityCode,
		[dbo].[LOC_City].[Modified] = GETDATE()

	WHERE [dbo].[LOC_City].[CityID] = @CityID

-- 15. Create Delete Procedure to delete record for City.
CREATE PROCEDURE [dbo].[PR_City_DeleteByPK]
	@CityID	int

AS

DELETE FROM [dbo].[LOC_City]
WHERE [dbo].[LOC_City].[CityID] = @CityID


-- =================================================================================


--16. Create Procedure for Select all Branch
-- PR_Branch_SelectAll
CREATE PROCEDURE [dbo].[PR_Branch_SelectAll]
AS
SELECT [dbo].[MST_Branch].[BranchID]
	  ,[dbo].[MST_Branch].[BranchName]
      ,[dbo].[MST_Branch].[BranchCode]
	  ,[dbo].[MST_Branch].[Created]
	  ,[dbo].[MST_Branch].[Modified]

FROM [dbo].[MST_Branch]
ORDER BY [dbo].[MST_Branch].[BranchName]

-- 17. Create Insert Procedure for Add Branch
-- [PR_Branch_Insert_Record] @BranchName = 'CSE', @BranchCode = 'CS'
CREATE PROCEDURE [dbo].[PR_Branch_Insert_Record]
	@BranchName	varchar(100),
	@BranchCode	varchar(50)

AS
INSERT INTO [dbo].[MST_Branch]
(
	[dbo].[MST_Branch].[BranchName]
   ,[dbo].[MST_Branch].[BranchCode]
)
VALUES
(
	@BranchName,
	@BranchCode
)

--18. Create Procedure for Select Branch by PK
-- PR_Branch_SelectByPK 5
CREATE PROCEDURE [dbo].[PR_Branch_SelectByPK]
@BranchID int
AS

SELECT [dbo].[MST_Branch].[BranchID]
	  ,[dbo].[MST_Branch].[BranchName]
      ,[dbo].[MST_Branch].[BranchCode]
	  ,[dbo].[MST_Branch].[Created]
	  ,[dbo].[MST_Branch].[Modified]

FROM [dbo].[MST_Branch]
WHERE [dbo].[MST_Branch].[BranchID] = @BranchID
ORDER BY [dbo].[MST_Branch].[BranchName]

-- 19. Update Procedure to edit existing record for Branch.
-- PR_Branch_UpdateByPK 1, Computer, CSE
Create or ALTER PROCEDURE [dbo].[PR_Branch_UpdateByPK]
	@BranchID		int,
	@BranchName	varchar(100),
	@BranchCode	varchar(50)

AS
UPDATE [dbo].[MST_Branch]
	
	SET [dbo].[MST_Branch].[BranchName] = @BranchName
	   ,[dbo].[MST_Branch].[BranchCode] = @BranchCode
	   ,[dbo].[MST_Branch].[Modified] = GETDATE()

WHERE [dbo].[MST_Branch].[BranchID] = @BranchID

-- 20. Delete Procedure for Branch.
-- PR_Branch_DeleteByPK 1
CREATE PROCEDURE [dbo].[PR_Branch_DeleteByPK]
	@BranchID	int
AS
DELETE FROM [dbo].[MST_Branch]
WHERE [dbo].[MST_Branch].[BranchID] = @BranchID

-- =================================================================================


--21. Create Procedure for Select all Student
-- PR_Student_SelectAll
CREATE or Alter PROCEDURE [dbo].[PR_Student_SelectAll]
AS
SELECT [dbo].[MST_Student].[StudentID]
	  ,[dbo].[LOC_City].[CityID]
	  ,[dbo].[MST_Branch].[BranchID]
	  ,[dbo].[MST_Student].[StudentName]
	  ,[dbo].[MST_Branch].[BranchName]
	  ,[dbo].[MST_Student].[MobileNoStudent]
	  ,[dbo].[MST_Student].[Email] 
	  ,[dbo].[MST_Student].[Created]
	  ,[dbo].[MST_Student].[Modified]

FROM [dbo].[MST_Student]
INNER JOIN [dbo].[MST_Branch]
ON [dbo].[MST_Branch].[BranchID] = [dbo].[MST_Student].[BranchID]
INNER JOIN [dbo].[LOC_City] 
ON [dbo].[LOC_City].[CityID] = [dbo].[MST_Student].[CityID]
ORDER BY [dbo].[MST_Student].[StudentName]
        ,[dbo].[MST_Branch].[BranchName]
		,[dbo].[LOC_City].[CityName]


-- 22. Create Insert Procedure for Add Student
-- [PR_Student_Insert_Record] @CityID = 1, @BranchID = 2, @StudentName = 'uttam', @MobileNoStudent = '7984086755', @Email = 'kishanmoliya232@gmail.com'
CREATE PROCEDURE [dbo].[PR_Student_Insert_Record]
	@CityID				int,
	@BranchID			int,
	@StudentName		varchar(100),	
	@MobileNoStudent	varchar(100),
	@Email				varchar(100)
As
INSERT INTO [dbo].[MST_Student]
(	
	 [dbo].[MST_Student].[CityID]
	,[dbo].[MST_Student].[BranchID]
	,[dbo].[MST_Student].[StudentName]
	,[dbo].[MST_Student].[MobileNoStudent]
	,[dbo].[MST_Student].[Email]
)
VALUES
(
	@CityID,
	@BranchID,
	@StudentName,
	@MobileNoStudent,
	@Email
)

-- 23. Create Procedure for Select Student by PK
-- PR_Student_SelectByPK 9
CREATE or Alter PROCEDURE [dbo].[PR_Student_SelectByPK]
@StudentID int
AS

SELECT [dbo].[LOC_City].[CityID]
	  ,[dbo].[MST_Branch].[BranchID]
	  ,[dbo].[MST_Student].[StudentID]
	  ,[dbo].[MST_Student].[StudentName]
	  ,[dbo].[MST_Branch].[BranchName]
	  ,[dbo].[MST_Student].[MobileNoStudent]
	  ,[dbo].[MST_Student].[Email]
	  ,[dbo].[MST_Student].[Created]
	  ,[dbo].[MST_Student].[Modified]

FROM [dbo].[MST_Student]
INNER JOIN [dbo].[MST_Branch]
ON [dbo].[MST_Branch].[BranchID] = [dbo].[MST_Student].[BranchID]
INNER JOIN [dbo].[LOC_City] 
ON [dbo].[LOC_City].[CityID] = [dbo].[MST_Student].[CityID]
WHERE [dbo].[MST_Student].[StudentID] = @StudentID
ORDER BY [dbo].[MST_Student].[StudentName]
        ,[dbo].[MST_Branch].[BranchName]
		,[dbo].[LOC_City].[CityName]


-- 24. Update Procedure to edit existing record for Student.
-- PR_Student_UpdateByPK 1, 1, 1, 'Kishan Moliya', '7894651235', 'kishanmoliya232@gmail.com'
Create or ALTER PROCEDURE [dbo].[PR_Student_UpdateByPK]
	@CityID				int,
	@BranchID			int,
	@StudentID			int,
	@StudentName		varchar(100),
	@MobileNoStudent	varchar(100),
	@Email				varchar(100)

AS
UPDATE [dbo].[MST_Student]

	SET	[dbo].[MST_Student].[CityID] = @CityID,
		[dbo].[MST_Student].[BranchID] = @BranchID,
		[dbo].[MST_Student].[StudentName] = @StudentName,
		[dbo].[MST_Student].[MobileNoStudent] = @MobileNoStudent,
		[dbo].[MST_Student].[Email] = @Email,
		[dbo].[MST_Student].[Modified] = GETDATE()

	WHERE [dbo].[MST_Student].[StudentID] = @StudentID
	   	 
-- 25. Delete Procedure for Student.
-- PR_Student_DeleteByPK 1
CREATE PROCEDURE [dbo].[PR_Student_DeleteByPK]
	@StudentID	int
AS
DELETE FROM [dbo].[MST_Student]
WHERE [dbo].[MST_Student].[StudentID] = @StudentID

-- =================================================================================
-- =================================================================================

-- 26. Dropdown for Country
Create or Alter Procedure [dbo].[PR_Country_Dropdown]
As
Select [dbo].[LOC_Country].[CountryID],
	   [dbo].[LOC_Country].[CountryName]
From  [dbo].[LOC_Country]
ORDER BY [dbo].[LOC_Country].[CountryName]

-- 27. State Name for Dropdown Combobox.
CREATE OR ALTER PROCEDURE [dbo].[PR_State_Dropdown]
AS
SELECT  [dbo].[LOC_State].[StateID],
	    [dbo].[LOC_State].[StateName]	
FROM [dbo].[LOC_State]
ORDER BY [dbo].[LOC_State].[StateName]


-----------------------------
-- [dbo].[PR_GetStateFromCountry] @CountryID = 1
Create or Alter Procedure [dbo].[PR_GetStateByCountry]
	@CountryID int
As
	Select  [dbo].[LOC_State].[StateID]
		   ,[dbo].[LOC_State].[StateName]
From [dbo].[LOC_State]
Inner Join [dbo].[LOC_Country]
On [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]
Where [dbo].[LOC_State].[CountryID] = @CountryID

-- =================================================================================
-- =================================================================================

-- 28. Search Country by their name of code.
-- PR_Country_Search @CountryName = '', @CountryCode = ''
Create or Alter Procedure [dbo].[PR_Country_Search]
	@CountryName	varchar(100) = null,
	@CountryCode	varchar(25) = null
As
	Select [dbo].[LOC_Country].[CountryID],
		   [dbo].[LOC_Country].[CountryName],
		   [dbo].[LOC_Country].[CountryCode],
		   [dbo].[LOC_Country].[Created],
		   [dbo].[LOC_Country].[Modified]
	From  [dbo].[LOC_Country]
	Where  [dbo].[LOC_Country].[CountryName] Like CONCAT('%', @CountryName, '%')
	And	   [dbo].[LOC_Country].[CountryCode] Like CONCAT('%', @CountryCode, '%')
	Order By [dbo].[LOC_Country].[CountryName]

-- 29. Search State by their name of code.
-- PR_State_Search @StateName = '', @StateCode = ''
Create or Alter Procedure [dbo].[PR_State_Search]
	@StateName	varchar(100) = null,
	@StateCode	varchar(25) = null
As
	Select [dbo].[LOC_State].[StateID],
		   [dbo].[LOC_Country].[CountryName],
		   [dbo].[LOC_State].[StateName],
		   [dbo].[LOC_State].[StateCode],
		   [dbo].[LOC_State].[Created],
		   [dbo].[LOC_State].[Modified]
	From  [dbo].[LOC_State]
	INNER JOIN [dbo].[LOC_Country]
	ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]
	Where  [dbo].[LOC_State].[StateName] Like CONCAT('%', @StateName, '%')
	And	   [dbo].[LOC_State].[StateCode] Like CONCAT('%', @StateCode, '%')
	Order By [dbo].[LOC_State].[StateName]

-- 30. Search City by their name of code.
-- PR_City_Search @CityName = '', @CityCode = ''
Create or Alter Procedure [dbo].[PR_City_Search]
	@CityName	varchar(100) = null,
	@CityCode	varchar(25) = null
As
	Select [dbo].[LOC_City].[CityID],
	       [dbo].[LOC_Country].[CountryName],
		   [dbo].[LOC_State].[StateName],
		   [dbo].[LOC_City].[CityName],
		   [dbo].[LOC_City].[CityCode],
		   [dbo].[LOC_City].[CreationDate],
		   [dbo].[LOC_City].[Modified]
	From  [dbo].[LOC_City]
	Inner Join [dbo].[LOC_Country]
	On [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_City].[CountryID]
	Inner Join [dbo].[LOC_State]
	On [dbo].[LOC_State].[StateID] = [dbo].[LOC_City].[StateID]
	Where  [dbo].[LOC_City].[CityName] Like CONCAT('%', @CityName, '%')
	And	   [dbo].[LOC_City].[Citycode] Like CONCAT('%', @CityCode, '%')
	Order By [dbo].[LOC_City].[CityName]

-- 31. Search Branch by their name of code.
-- PR_Branch_Search @BranchName = '', @BranchCode = ''
Create or Alter Procedure [dbo].[PR_Branch_Search]
	@BranchName	varchar(100) = null,
	@BranchCode	varchar(25) = null
As
	Select [dbo].[MST_Branch].[BranchID],
		   [dbo].[MST_Branch].[BranchName],
		   [dbo].[MST_Branch].[BranchCode],
		   [dbo].[MST_Branch].[Created],
		   [dbo].[MST_Branch].[Modified]
	From  [dbo].[MST_Branch]
	Where  [dbo].[MST_Branch].[BranchName] Like CONCAT('%', @BranchName, '%')
	And	   [dbo].[MST_Branch].[BranchCode] Like CONCAT('%', @BranchCode, '%')
	Order By [dbo].[MST_Branch].[BranchName]

-- 32. Search Student by their name of code.
-- PR_Student_Search @StudentName = ''
Create or Alter Procedure [dbo].[PR_Student_Search]
	@StudentName	varchar(100) = null
As
	Select [dbo].[MST_Student].[StudentID],
		   [dbo].[MST_Student].[StudentName],
		   [dbo].[MST_Branch].[BranchName],
		   [dbo].[MST_Student].[MobileNoStudent],
		   [dbo].[MST_Student].[Email],
		   [dbo].[MST_Student].[Created],
		   [dbo].[MST_Student].[Modified]
	From  [dbo].[MST_Student]
	INNER JOIN [dbo].[MST_Branch]
	ON [dbo].[MST_Branch].[BranchID] = [dbo].[MST_Student].[BranchID]
	Where  [dbo].[MST_Student].[StudentName] Like CONCAT('%', @StudentName, '%')
	Order By [dbo].[MST_Student].[StudentName]