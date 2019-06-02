CREATE PROCEDURE CreateGrade (@StudentId int,@CourseId int,@TeacherId int,@Grade int,@CreatedDate datetime)
AS
BEGIN

IF @CreatedDate is null
BEGIN
SET @CreatedDate = GETDATE()
END


INSERT INTO Grade (StudentID,CourseID,TeacherID,Grade,CreatedDate)
VALUES(@StudentId,@CourseId,@TeacherId,@Grade,@CreatedDate)

SELECT COUNT [Grade] FROM Grade
WHERE StudentId = @StudentId	

SELECT MAX [Grade] FROM Grade
WHERE StudentID = @StudentId AND TeacherID = @TeacherId

END


EXEC CreateGrade	
@StudentId = 20,
@CourseId = 5,
@TeacherId = 12,
@Grade = 6,
@CreatedDate = NULL



CREATE PROCEDURE CreateGradeDetail (@GradeId int,@AchievementTypeId int,@AchievementPoints int,
@AchievementMaxPoints int,@AchievementDate datetime)
AS
BEGIN

IF @AchievementDate IS NULL
BEGIN
SET @AchievementDate = GETDATE()
END


BEGIN TRY


INSERT INTO GradeDetails (GradeID,AchievementTypeID,AchievementPoints,AchievementMaxPoints,AchievementDate)
VALUES (@GradeId,@AchievementTypeId,@AchievementPoints,@AchievementMaxPoints,@AchievementDate)

SELECT SUM(CAST(gd.AchievementPoints as decimal(15,1))/gd.AchievementMaxPoints*a.ParticipationRate)
FROM GradeDetails gd
INNER JOIN AchievementType a ON a.ID = gd.AchievementTypeID
WHERE gd.GradeID = @GradeId

END TRY
BEGIN CATCH

SELECT 
	ERROR_NUMBER() AS ErrorNumber,  
    ERROR_SEVERITY() AS ErrorSeverity,  
    ERROR_STATE() AS ErrorState,  
    ERROR_PROCEDURE() AS ErrorProcedure,  
    ERROR_LINE() AS ErrorLine,  
    ERROR_MESSAGE() AS ErrorMessage; 
END CATCH

END
GO
