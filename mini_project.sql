CREATE DATABASE session_4_mini_project;
USE session_4_mini_project;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FullName NVARCHAR(100) NOT NULL,
    BirthDate DATE CHECK (BirthDate < '1900-01-01' AND BirthDate > CURDATE()),
    Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY AUTO_INCREMENT,
    FullName NVARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    TotalSessions INT CHECK (TotalSessions > 0),
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

CREATE TABLE Enrollment (
	EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Result (
	ScoreID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    MidtermScore FLOAT CHECK (MidtermScore BETWEEN 0 AND 10),
    FinalScore FLOAT CHECK (FinalScore BETWEEN 0 AND 10),
    FOREIGN KEY (StudentID, CourseID) REFERENCES Enrollment(StudentID, CourseID)
);

INSERT INTO Student VALUES
('Nguyễn Văn A', '2003-01-01', 'a@gmail.com'),
('Trần Thị B', '2003-02-02', 'b@gmail.com'),
('Lê Văn C', '2002-03-03', 'c@gmail.com'),
('Phạm Thị D', '2003-04-04', 'd@gmail.com'),
('Hoàng Văn E', '2002-05-05', 'e@gmail.com');

INSERT INTO Teacher VALUES
('Thầy An', 'an@gmail.com'),
('Cô Bình', 'binh@gmail.com'),
('Thầy Cường', 'cuong@gmail.com'),
('Cô Dung', 'dung@gmail.com'),
('Thầy Em', 'em@gmail.com');

INSERT INTO Course VALUES
('SQL Cơ Bản', 'Học SQL từ đầu', 20, 1),
('Java', 'Lập trình Java', 25, 2),
('Python', 'Python cơ bản', 30, 3),
('Mạng máy tính', 'Kiến thức mạng', 15, 4),
('AI cơ bản', 'Nhập môn AI', 40, 5);

INSERT INTO Enrollment VALUES
(1,'2025-01-01'),
(2,'2025-01-02'),
(1,'2025-01-03'),
(3,'2025-01-04'),
(4,'2025-01-05');

INSERT INTO Score VALUES
(1,8,9),
(2,7,8),
(1,6,7),
(3,9,9),
(4,5,6);

UPDATE Student
SET Email = 'newemail@gmail.com'
WHERE StudentID = 1;

UPDATE Course
SET Description = 'Khóa học SQL nâng cao'
WHERE CourseID = 1;

UPDATE Result
SET FinalScore = 9.5
WHERE StudentID = 1 AND CourseID = 1;

DELETE FROM Result
WHERE StudentID = 4 AND CourseID = 4;

DELETE FROM Enrollment
WHERE StudentID = 4 AND CourseID = 4;

SELECT * FROM Student;
SELECT * FROM Teacher;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Result;