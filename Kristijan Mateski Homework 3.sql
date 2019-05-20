	SELECT Grade,COUNT (*) as Total 
from dbo.Grade
GROUP BY Grade

SELECT Teacher.FirstName,SUM(Grade) AS Grades
FROM Teacher
inner join  dbo.Grade on Grade.ID=TeacherID
GROUP BY Teacher.FirstName

SELECT Teacher.FirstName,Teacher.ID,Teacher.LastName,COUNT(*) AS AllGrades
FROM Grade
INNER JOIN  Teacher ON Teacher.ID=grade.TeacherID
WHERE grade.StudentID <100
GROUP BY Teacher.ID,Teacher.FirstName,Teacher.LastName


SELECT Student.ID,Student.FirstName, MAX(Grade.Grade) AS MaximumGrade, AVG(Grade.Grade) AS AvgGrade
FROM Grade  
INNER JOIN Student ON Student.ID=Grade.StudentID
GROUP BY Student.ID,Student.FirstName


SELECT Teacher.ID,Teacher.FirstName,Teacher.LastName, COUNT(Grade.Grade) AS Grades
FROM dbo.Grade
INNER JOIN Teacher ON Teacher.ID = Grade.TeacherID
GROUP BY Teacher.ID,Teacher.FirstName,Teacher.LastName
HAVING COUNT(Grade.Grade) > 200;


SELECT Teacher.ID,Teacher.FirstName,Teacher.LastName, COUNT(Grade.Grade) AS TotalGrades
FROM Grade 
INNER JOIN Teacher ON Teacher.ID = Grade.TeacherID
WHERE Grade.StudentID < 100
GROUP BY Teacher.ID,Teacher.FirstName, Teacher.LastName
HAVING COUNT(Grade.Grade) > 50



SELECT Student.ID, Student.FirstName, COUNT(Grade.Grade) AS TotalGrades,MAX(Grade.Grade) AS MaxGrade, AVG(Grade.Grade) AS AvgGrade
FROM Grade 
INNER JOIN Student ON Student.ID=Grade.StudentID
GROUP BY Student.ID, Student.FirstName 
--GROUP BY Student.FirstName,Student.LastName
HAVING MAX(Grade.Grade) = AVG(Grade.Grade)


CREATE VIEW [vv_StudentGrades] AS 
SELECT StudentID,COUNT(Grade) AS TotalGrades
FROM Grade
GROUP BY StudentID

ALTER VIEW [vv_StudentGrades] 
AS 
SELECT Student.FirstName,Student.LastName,COUNT (Grade) AS TotalGrades
FROM Grade
INNER JOIN Student ON Student.ID = Grade.StudentID
GROUP BY Student.FirstName,Student.LastName


SELECT * FROM vv_StudentGrades
ORDER BY TotalGrades DESC


--Poslednata vezba ne mi teknuva kako da ja resham...


