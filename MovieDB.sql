IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'spInsertActorDetails'
)
DROP PROCEDURE dbo.spInsertActorDetails
GO
CREATE PROCEDURE dbo.spInsertActorDetails
    @actorID int = 0,
    @actorFname NVARCHAR(20), 
    @actorLname NVARCHAR(20),
    @actorNationality NVARCHAR(20)
AS

    -- Insert rows into table 'Actors'
    INSERT INTO Actors
    ( -- columns to insert data into
     [ActorID], [FirstName], [LastName],[Nationality]
    )
    VALUES
    ( -- first row: values for the columns in the list above
     @actorID, @actorFname, @actorLname, @actorNationality
    )
    GO

GO

-- Create a new stored procedure called 'spRetreveTYD' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'spRetreveTYD'
)
DROP PROCEDURE dbo.spRetreveTYD
GO
CREATE PROCEDURE dbo.spRetreveTYD
    @movieID INT,
    @movieTitle NVARCHAR(20) = NULL OUTPUT,
    @releaseYear DATE = NULL OUTPUT,
    @directorName NVARCHAR(20) = NULL OUTPUT
AS
    SELECT movieTitle= Movies.Titile, releaseYear= Movies.ReleaseYear, directorName= Directors.FirstName
    FROM dbo.Movies, dbo.Directors
    WHERE  movieID = Movies.MovieID AND Movies.DirectorID = Directors.DirectorID	
    GO
GO

