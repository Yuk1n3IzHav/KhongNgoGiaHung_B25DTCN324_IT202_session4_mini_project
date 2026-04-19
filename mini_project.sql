CREATE DATABASE session_4_mini_project;
USE session_4_mini_project;
-- DROP DATABASE session_4_mini_project;
CREATE TABLE Student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    BirthDate DATE CHECK ( BirthDate > '1900-01-01' ),
    Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    TotalSessions INT CHECK (TotalSessions > 0),
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID)
);

CREATE TABLE Enrollment (
	EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollDate DATE,
    CONSTRAINT unique_enroll UNIQUE (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Score (
	ScoreID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    MidtermScore FLOAT CHECK (MidtermScore BETWEEN 0 AND 10),
    FinalScore FLOAT CHECK (FinalScore BETWEEN 0 AND 10),
    FOREIGN KEY (StudentID, CourseID) REFERENCES Enrollment(StudentID, CourseID)
);

INSERT INTO Student(FullName, BirthDate, Email) VALUES
('Nguyễn Văn A', '2003-01-01', 'a@gmail.com'),
('Trần Thị B', '2003-02-02', 'b@gmail.com'),
('Lê Văn C', '2002-03-03', 'c@gmail.com'),
('Phạm Thị D', '2003-04-04', 'd@gmail.com'),
('Hoàng Văn E', '2002-05-05', 'e@gmail.com');

INSERT INTO Teacher(FullName, Email) VALUES
('Thầy An', 'an@gmail.com'),
('Cô Bình', 'binh@gmail.com'),
('Thầy Cường', 'cuong@gmail.com'),
('Cô Dung', 'dung@gmail.com'),
('Thầy Em', 'em@gmail.com');

INSERT INTO Course(CourseName,Description, TotalSessions, TeacherID)  VALUES
('SQL Cơ Bản', 'Học SQL từ đầu', 20, 1),
('Java', 'Lập trình Java', 25, 2),
('Python', 'Python cơ bản', 30, 3),
('Mạng máy tính', 'Kiến thức mạng', 15, 4),
('AI cơ bản', 'Nhập môn AI', 40, 5);

INSERT INTO Enrollment(StudentID, CourseID, EnrollDate) VALUES
(1,1,'2025-01-01'),
(1,2,'2025-01-02'),
(2,1,'2025-01-03'),
(3,3,'2025-01-04'),
(4,4,'2025-01-05');

INSERT INTO Score(StudentID, CourseID, MidtermScore, FinalScore) VALUES
(1,1,8,9),
(1,2,7,8),
(2,1,6,7),
(3,3,9,9),
(4,4,5,6);

UPDATE Student
SET Email = 'newemail@gmail.com'
WHERE StudentID = 1;

UPDATE Course
SET Description = 'Khóa học SQL nâng cao'
WHERE CourseID = 1;

UPDATE Score
SET FinalScore = FinalScore - 1.5
WHERE StudentID = 1 AND CourseID = 1;

DELETE FROM Result
WHERE StudentID = 4 AND CourseID = 4;

DELETE FROM Enrollment
WHERE StudentID = 4 AND CourseID = 4;

SELECT * FROM Student;
SELECT * FROM Teacher;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Score;
