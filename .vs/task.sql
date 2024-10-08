/*---------------table 1------------------------------*/
CREATE TABLE Courses (CourseID INT PRIMARY KEY,CourseName NVARCHAR(100) NOT NULL,Credits INT NOT NULL);
insert into courses values(101,'BCA',201);
insert into courses values(102,'BSC',202);
insert into courses values(103,'BBA',203);
insert into courses values(104,'BA',204);
insert into courses values(105,'CA',205);
insert into courses values(106,'BCA',206);
insert into courses values(107,'BBA',207);
select*from Courses;
/*---------------------table 2----------------------*/
CREATE TABLE Students( StudentID INT PRIMARY KEY IDENTITY(101,1),FirstName NVARCHAR(50) NOT NULL,LastName NVARCHAR(50) NOT NULL, DateOfBirth DATE,  EnrollmentDate DATE);
insert into Students values('marimuthu','karuppaiya','03/05/2005','07/07/2022');
insert into Students values('hariharan','anbazhagan','09/07/2005','07/07/2022');
insert into Students values('gunasekar','kovil','08/09/2005','10/08/2022');
insert into Students values('manikandan','kumar','09/05/2005','06/06/2022');
insert into Students values('gokul','asirvatham','10/05/2005','06/06/2022');
select*from Students;
/*--------------------table 3---------------------------*/
CREATE TABLE Enrollments ( EnrollmentID INT PRIMARY KEY , StudentID INT, CourseID INT, EnrollmentDate DATE,
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID));
insert into Enrollments values(102,103,'05/05/2021');
insert into Enrollments values(101,104,'05/05/2021');
insert into Enrollments values(103,101,'05/05/2021');
insert into Enrollments values(105,102,'05/05/2021');
select*from Enrollments;
/*--------------step 2----------------*/
SELECT FirstName, LastName, EnrollmentDate FROM Students ORDER BY LastName, FirstName;
/*-------------step 3----------------*/
SELECT s.StudentID, s.FirstName, s.LastName FROM Students s JOIN Enrollments e ON s.StudentID = e.StudentID WHERE e.CourseID = 102;
/*-------------step 4----------------*/
SELECT c.CourseID, c.CourseName, COUNT(e.StudentID) AS StudentCount FROM Courses c LEFT JOIN Enrollments e ON c.CourseID = e.CourseID GROUP BY c.CourseID, c.CourseName;
/*-------------step 5------------*/
SELECT s.StudentID, s.FirstName, s.LastName, COUNT(e.CourseID) AS CourseCount FROM Students s 
JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(e.CourseID) > 1;

/*-------------step 6------------*/
SELECT s.StudentID,s.FirstName,s.LastName,e.EnrollmentDate FROM  Enrollments e JOIN  Students s ON e.StudentID = s.StudentID WHERE e.CourseID = 101;
/*-------------step 7-----------*/
SELECT e.StudentID FROM Enrollments e JOIN Courses c ON e.CourseID = c.CourseID WHERE c.CourseName IN ('Introduction to SQL', 'Web Development')
GROUP BY e.StudentID HAVING COUNT(DISTINCT c.CourseName) = 2;
/*-------------step 8-----------*/
SELECT COUNT(*) AS TotalEnrollments FROM Enrollments;

