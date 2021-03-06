USE [test]
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 11/17/2016 8:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteEmployee] @EmpID INT
	,@IsSaved INT OUT
AS
BEGIN
	IF EXISTS (
			SELECT EmpFirstName
			FROM tblEmployee
			WHERE EmpID = @EmpID
			)
	BEGIN
		DELETE
		FROM tblEmployee
		WHERE EmpID = @EmpID

		SET @IsSaved = @EmpID

		RETURN @IsSaved
	END
	ELSE
	BEGIN
		SET @IsSaved = - 1

		RETURN @IsSaved
	END
END

GO
/****** Object:  StoredProcedure [dbo].[GetEmployee]    Script Date: 11/17/2016 8:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEmployee]
AS
BEGIN
	SELECT *
	FROM tblEmployee
END

GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeByID]    Script Date: 11/17/2016 8:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEmployeeByID] @EmpID INT
AS
BEGIN
	SELECT *
	FROM tblEmployee
	WHERE EmpID = @EmpID
END

GO
/****** Object:  StoredProcedure [dbo].[SaveEmployee]    Script Date: 11/17/2016 8:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveEmployee] @EmpFirstName VARCHAR(50)
	,@EmpLastName VARCHAR(50)
	,@EmpDesignation VARCHAR(50)
	,@LatLong VARCHAR(50)
	,@Password VARCHAR(50)
	,@IsSaved INT OUT
AS
BEGIN
	IF NOT EXISTS (
			SELECT EmpFirstName
			FROM tblEmployee
			WHERE EmpFirstName = @EmpFirstName
			)
	BEGIN
		INSERT INTO tblEmployee (
			EmpFirstName
			,EmpLastName
			,EmpDesignation
			,LatLong
			,[Password]
			)
		VALUES (
			@EmpFirstName
			,@EmpLastName
			,@EmpDesignation
			,@LatLong
			,@Password
			)

		SET @IsSaved = SCOPE_IDENTITY()

		RETURN @IsSaved
	END
	ELSE
	BEGIN
		SET @IsSaved = - 1

		RETURN @IsSaved
	END
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 11/17/2016 8:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateEmployee] @EmpID INT
	,@EmpFirstName VARCHAR(50)
	,@EmpLastName VARCHAR(50)
	,@EmpDesignation VARCHAR(50)
	,@LatLong VARCHAR(50)
	,@Password VARCHAR(50)
	,@IsSaved INT OUT
AS
BEGIN
	IF EXISTS (
			SELECT EmpFirstName
			FROM tblEmployee
			WHERE EmpID = @EmpID
			)
	BEGIN
		UPDATE tblEmployee
		SET EmpFirstName = @EmpFirstName
			,EmpLastName = @EmpLastName
			,EmpDesignation = @EmpDesignation
			,LatLong = @LatLong
			,[Password] = @Password
		WHERE EmpID = @EmpID

		SET @IsSaved = @EmpID

		RETURN @IsSaved
	END
	ELSE
	BEGIN
		SET @IsSaved = - 1

		RETURN @IsSaved
	END
END

GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 11/17/2016 8:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[EmpFirstName] [varchar](50) NULL,
	[EmpLastName] [varchar](50) NULL,
	[EmpDesignation] [varchar](50) NULL,
	[LatLong] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
