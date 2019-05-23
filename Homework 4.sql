DECLARE @FirstName NVARCHAR(100)
SET @FirstName = 'Antonio'

SELECT * FROM Student
WHERE FirstName = @FirstName



DECLARE @FStudents TABLE 
(StudentID INT,StudentName NVARCHAR(100),DateOfBirth date)

INSERT INTO @FStudents
SELECT ID,FirstName,DateOfBirth FROM Student
WHERE Gender = 'F'
 


CREATE TABLE #TempTable
(LastName NVARCHAR(100),EnrolledDate DATE)

INSERT INTO #TempTable
SELECT LastName,EnrolledDate FROM Student
WHERE Gender = 'M' AND FirstName like 'A%'

SELECT * FROM #TempTable
WHERE LEN(LastName) = 7 




SELECT * FROM Teacher
WHERE LEN(FirstName) = 5 AND LEFT(FirstName,3) = LEFT(LastName,3)





CREATE FUNCTION dbo.fn_FormatStudentName (@StudentID int)
RETURNS NVARCHAR(100)
AS
BEGIN 
DECLARE @Res NVARCHAR(100)
SELECT @Res = SUBSTRING(StudentCardNumber,4,10) + ' - ' + LEFT(FirstName,1) + ' - ' + LastName
FROM Student
WHERE ID = @StudentID
RETURN @Res
END 
GO

SELECT *,dbo.fn_FormatStudentName(id) AS FOutput FROM Student






CREATE FUNCTION dbo.fn_StudentsWithPassedExam (@TeacherId int,@CourseId int)
RETURNS @Output TABLE(FirstName NVARCHAR(100),LastName NVARCHAR(100),Grade int,Created datetime)
AS
BEGIN

INSERT INTO @Output
SELECT s.FirstName,s.LastName,g.Grade,g.CreatedDate
FROM Grade g
INNER JOIN Student s ON s.ID = g.StudentID
WHERE g.TeacherID = @TeacherId and g.CourseID = @CourseId and g.Grade > 5

GROUP BY s.FirstName, s.LastName,g.CreatedDate , g.Grade

RETURN 
END 
GO 


SELECT * FROM dbo.fn_StudentsWithPassedExam(17,18)

