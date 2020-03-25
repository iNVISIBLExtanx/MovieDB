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

    INSERT INTO Actors
    ( [ActorID], [FirstName], [LastName],[Nationality])
    VALUES
    ( @actorID, @actorFname, @actorLname, @actorNationality)
    GO

GO


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

IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'spUpdateRating'
)
DROP PROCEDURE dbo.spUpdateRating
GO
CREATE PROCEDURE dbo.spUpdateRating
    @movieid NVARCHAR = NULL,
    @moviesRating NVARCHAR = NULL 
AS
    UPDATE Movies
    SET
        [Rating] = @moviesRating
    WHERE 	
        movieID = Movies.MovieID
    GO
GO

IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'spNameOfActorsByDirector'
)
DROP PROCEDURE dbo.spNameOfActorsByDirector
GO
CREATE PROCEDURE dbo.spNameOfActorsByDirector
    @directorid int = 0,
    @firstname NVARCHAR(20) = NULL OUTPUT,
    @lastname NVARCHAR(20) = NULL OUTPUT
AS
    SELECT firstname = Actors.FirstName , lastname = Actors.LastName
    FROM dbo.Actors, dbo.MovieActor, dbo.Movies, dbo.Directors
    WHERE  dbo.Actors.ActorID = dbo.MovieActor.ActorID AND dbo.MovieActor.MovieID = dbo.Movies.MovieID AND dbo.Movies.DirectorID = dbo.Directors.DirectorID
    GO
GO
