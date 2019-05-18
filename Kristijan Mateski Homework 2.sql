SELECT * FROM Student
WHERE FirstName = 'Antonio'


SELECT * FROM Student
WHERE DateOfBirth > '01.01.1999'


SELECT * FROM Student
WHERE Gender = 'M'


SELECT * FROM Student
WHERE LastName like 'T%'


SELECT * FROM Student
WHERE EnrolledDate >= '1998.01.01' and EnrolledDate < '1998.02.01'


SELECT * FROM Student
WHERE EnrolledDate >= '1998.01.01' and EnrolledDate < '1998.02.01' 
AND LastName like 'J%'



SELECT * FROM Student
WHERE FirstName = 'Antonio' ORDER BY LastName


SELECT * FROM Student 
ORDER BY FirstName


SELECT * FROM Student 
WHERE Gender = 'M' ORDER BY EnrolledDate DESC



SELECT FirstName FROM Teacher
UNION ALL
SELECT FirstName FROM Student



SELECT LastName FROM Teacher
UNION
SELECT LastName FROM Student



SELECT FirstName FROM Teacher
INTERSECT
SELECT FirstName FROM Student



ALTER TABLE GradeDetails 
add constraint DF_Grade_MaxPoints
default 100 for AchievementMaxPoints

select [AchievementPoints] from GradeDetails

ALTER TABLE dbo.GradeDetails WITH CHECK
ADD CONSTRAINT CHK_Grade_Pts2
CHECK (AchievementPoints <= 100);





ALTER TABLE dbo.AchievementType WITH CHECK 
ADD CONSTRAINT UC_Name UNIQUE (Name)



ALTER TABLE dbo.Grade WITH CHECK
ADD CONSTRAINT FK_GRADE_GRADEDETAILS
FOREIGN KEY (StudentID)
REFERENCES dbo.GradeDetails (ID)



SELECT Course.Name,AchievementType.Name
FROM Course
CROSS JOIN AchievementType



SELECT * FROM Teacher
SELECT * FROM Grade 
  

SELECT Teacher.FirstName,Teacher.LastName
FROM Teacher 
INNER JOIN Grade ON Teacher.ID = Grade.TeacherID


SELECT Teacher.FirstName,Teacher.LastName
FROM Teacher
LEFT JOIN Grade ON Grade.TeacherID = Teacher.ID
WHERE Grade.ID is NULL


SELECT Student.FirstName,Student.LastName
FROM Grade
RIGHT JOIN Student ON Student.ID =Grade.StudentID
WHERE Grade.StudentID is NULL








