CREATE DATABASE StudentManagementDBa;
USE StudentManagementDBa;
CREATE TABLE Student (
    STUDENT_ID INT NOT NULL PRIMARY KEY,
    STUDENT_NAME VARCHAR(100) NOT NULL,
    STUDENT_EMAIL VARCHAR(100) NOT NULL UNIQUE,
    STUDENT_PHONE VARCHAR(15) NOT NULL,
    STUDENT_ADDRESS VARCHAR(150) NOT NULL
);

CREATE TABLE Course (
    COURSE_ID INT NOT NULL PRIMARY KEY,
    COURSE_NAME VARCHAR(100) NOT NULL,
    COURSE_CODE VARCHAR(20) NOT NULL UNIQUE,
    COURSE_DESCRIPTION TEXT NOT NULL
);

CREATE TABLE Enrollment (
    ENROLLMENT_ID INT NOT NULL PRIMARY KEY,
    STUDENT_ID INT,
    COURSE_ID INT,
    ENROLLMENT_DATE DATE NOT NULL,
    FOREIGN KEY (STUDENT_ID) REFERENCES Student(STUDENT_ID) ON DELETE CASCADE,
    FOREIGN KEY (COURSE_ID) REFERENCES Course(COURSE_ID) ON DELETE CASCADE
);

CREATE TABLE Grade (
    GRADE_ID INT NOT NULL PRIMARY KEY,
    ENROLLMENT_ID INT,
    GRADE DECIMAL(5,2),
    EXAM_DATE DATE NOT NULL,
    FOREIGN KEY (ENROLLMENT_ID) REFERENCES Enrollment(ENROLLMENT_ID) ON DELETE CASCADE
);

CREATE TABLE Instructor (
    INSTRUCTOR_ID INT NOT NULL PRIMARY KEY,
    INSTRUCTOR_NAME VARCHAR(100) NOT NULL,
    INSTRUCTOR_EMAIL VARCHAR(100) NOT NULL UNIQUE,
    INSTRUCTOR_PHONE VARCHAR(15) NOT NULL,
    INSTRUCTOR_ADDRESS VARCHAR(150) NOT NULL
);

CREATE TABLE CourseInstructor (
    COURSE_INSTRUCTOR_ID INT NOT NULL PRIMARY KEY,
    INSTRUCTOR_ID INT,
    COURSE_ID INT,
    ASSIGNMENT_DATE DATE NOT NULL,
    FOREIGN KEY (INSTRUCTOR_ID) REFERENCES Instructor(INSTRUCTOR_ID) ON DELETE CASCADE,
    FOREIGN KEY (COURSE_ID) REFERENCES Course(COURSE_ID) ON DELETE CASCADE
);

INSERT INTO Course (COURSE_ID, COURSE_NAME, COURSE_CODE, COURSE_DESCRIPTION)
VALUES 
    (1, 'Штучний інтелект та методи машинного навчання', 'AI101', 'Основи штучного інтелекту та методи машинного навчання'),
    (2, 'База даних', 'DB102', 'Теорія баз даних і практичне використання СУБД'),
    (3, 'Алгоритми та структура даних', 'CS103', 'Теорія алгоритмів та структур даних'),
    (4, 'Основи програмування', 'CS104', 'Вивчення основ програмування на мові C++'),
    (5, 'Теорія ймовірності', 'MATH201', 'Основи теорії ймовірностей та статистики');

INSERT INTO Student (STUDENT_ID, STUDENT_NAME, STUDENT_EMAIL, STUDENT_PHONE, STUDENT_ADDRESS)
VALUES 
    (1, 'Олександр Бугайчук', 'obuhaichuk@rcit.ukr.education', '0684305528', 'вул. Орлова 40'),
    (2, 'Роман Демчук', 'rdemchuk@rcit.ukr.education', '098765432', 'вул. Соборна 15'),
    (3, 'Плисюк Вадим', 'vplysiuk@rcit.ukr.education', '067123456', 'вул. Шевченка 30'),
    (4, 'Ангеліна Жуковська', 'azhukovska@rcit.ukr.education', '0 952522059', 'вул. Ковальська 22'),
    (5, 'Максим Завальнюк', 'mzavalniuk@rcit.ukr.education', '067876543', 'вул. Володимира 12');
    -- Вставка прикладів даних для реєстрацій студентів на всі курси
INSERT INTO Enrollment (ENROLLMENT_ID, STUDENT_ID, COURSE_ID, ENROLLMENT_DATE)
VALUES 
    (1, 1, 1, '2024-09-01'),
    (2, 1, 2, '2024-09-01'),
    (3, 1, 3, '2024-09-01'),
    (4, 1, 4, '2024-09-01'),
    (5, 1, 5, '2024-09-01'),
    (6, 2, 1, '2024-09-01'),
    (7, 2, 2, '2024-09-01'),
    (8, 2, 3, '2024-09-01'),
    (9, 2, 4, '2024-09-01'),
    (10, 2, 5, '2024-09-01'),
    (11, 3, 1, '2024-09-01'),
    (12, 3, 2, '2024-09-01'),
    (13, 3, 3, '2024-09-01'),
    (14, 3, 4, '2024-09-01'),
    (15, 3, 5, '2024-09-01'),
    (16, 4, 1, '2024-09-01'),
    (17, 4, 2, '2024-09-01'),
    (18, 4, 3, '2024-09-01'),
    (19, 4, 4, '2024-09-01'),
    (20, 4, 5, '2024-09-01'),
    (21, 5, 1, '2024-09-01'),
    (22, 5, 2, '2024-09-01'),
    (23, 5, 3, '2024-09-01'),
    (24, 5, 4, '2024-09-01'),
    (25, 5, 5, '2024-09-01');

INSERT INTO Grade (GRADE_ID, ENROLLMENT_ID, GRADE, EXAM_DATE)
VALUES 
    (1, 1, 85.50, '2024-12-01'),
    (2, 2, 30.00, '2024-12-02'),
    (3, 3, 92.00, '2024-12-03'),
    (4, 4, 76.50, '2024-12-04'),
    (5, 5, 88.00, '2024-12-05'),
    (6, 6, 81.00, '2024-12-01'),
    (7, 7, 85.00, '2024-12-02'),
    (8, 8, 67.00, '2024-12-03'),
    (9, 9, 78.50, '2024-12-04'),
    (10, 10, 90.50, '2024-12-05'),
    (11, 11, 84.00, '2024-12-01'),
    (12, 12, 91.00, '2024-12-02'),
    (13, 13, 89.50, '2024-12-03'),
    (14, 14, 82.00, '2024-12-04'),
    (15, 15, 80.50, '2024-12-05'),
    (16, 16, 86.00, '2024-12-01'),
    (17, 17, 88.50, '2024-12-02'),
    (18, 18, 79.00, '2024-12-03'),
    (19, 19, 83.00, '2024-12-04'),
    (20, 20, 91.50, '2024-12-05'),
    (21, 21, 85.00, '2024-12-01'),
    (22, 22, 55.00, '2024-12-02'),
    (23, 23, 88.00, '2024-12-03'),
    (24, 24, 84.50, '2024-12-04'),
    (25, 25, 92.00, '2024-12-05');

INSERT INTO Instructor (INSTRUCTOR_ID, INSTRUCTOR_NAME, INSTRUCTOR_EMAIL, INSTRUCTOR_PHONE, INSTRUCTOR_ADDRESS)
VALUES 
    (1, 'Михайло Бойко', 'm.v.boiko@rcit.ukr.education ', '0671234567', 'вул. Науки 5'),
    (2, 'Андрій Ніколаєнко', 'a.i.nikolaienko@rcit.ukr.education ', '0672345678', 'вул. Козака 7'),
    (3, 'Любов Шостак', 'l.v.shostak@rcit.ukr.education', '0673456789', 'вул. Промислова 4'),
    (4, 'Олександр Шпортько', 'oshportko@rcit.ukr.education ', '0679940369', 'вул. Студентська 2'),
    (5, 'Данило Лагоднюк', 'd.o.lahodniuk@rcit.ukr.education', '0997304391', 'вул. Петра 3');
    
INSERT INTO CourseInstructor (COURSE_INSTRUCTOR_ID, INSTRUCTOR_ID, COURSE_ID, ASSIGNMENT_DATE)
VALUES 
    (1, 1, 1, '2024-09-01'),
    (2, 2, 2, '2024-09-01'),
    (3, 3, 3, '2024-09-01'),
    (4, 4, 4, '2024-09-01'),
    (5, 5, 5, '2024-09-01');
    
SELECT * FROM Student;
SELECT * FROM Instructor;
SELECT * FROM Course;

SELECT 
    Student.STUDENT_NAME,
    MAX(CASE WHEN Course.COURSE_NAME = 'Штучний інтелект та методи машинного навчання' THEN Course.COURSE_NAME END) AS 'Курс 1',
    MAX(CASE WHEN Course.COURSE_NAME = 'База даних' THEN Course.COURSE_NAME END) AS 'Курс 2',
    MAX(CASE WHEN Course.COURSE_NAME = 'Алгоритми та структура даних' THEN Course.COURSE_NAME END) AS 'Курс 3',
    MAX(CASE WHEN Course.COURSE_NAME = 'Основи програмування' THEN Course.COURSE_NAME END) AS 'Курс 4',
    MAX(CASE WHEN Course.COURSE_NAME = 'Теорія ймовірності' THEN Course.COURSE_NAME END) AS 'Курс 5'
FROM 
    Student
JOIN Enrollment ON Student.STUDENT_ID = Enrollment.STUDENT_ID
JOIN Course ON Enrollment.COURSE_ID = Course.COURSE_ID
GROUP BY Student.STUDENT_NAME;

SELECT Student.STUDENT_NAME, Course.COURSE_NAME, Grade.GRADE, Grade.EXAM_DATE
FROM Student
JOIN Enrollment ON Student.STUDENT_ID = Enrollment.STUDENT_ID
JOIN Course ON Enrollment.COURSE_ID = Course.COURSE_ID
JOIN Grade ON Enrollment.ENROLLMENT_ID = Grade.ENROLLMENT_ID;

SELECT Instructor.INSTRUCTOR_NAME, Course.COURSE_NAME
FROM Instructor
JOIN CourseInstructor ON Instructor.INSTRUCTOR_ID = CourseInstructor.INSTRUCTOR_ID
JOIN Course ON CourseInstructor.COURSE_ID = Course.COURSE_ID;

SELECT STUDENT_NAME, GRADE FROM Student
JOIN Enrollment ON Student.STUDENT_ID = Enrollment.STUDENT_ID
JOIN Grade ON Enrollment.ENROLLMENT_ID = Grade.ENROLLMENT_ID
WHERE GRADE > 85;

SELECT Student.STUDENT_NAME, 
       AVG(Grade.GRADE) AS AVERAGE_GRADE
FROM Student
JOIN Enrollment ON Student.STUDENT_ID = Enrollment.STUDENT_ID
JOIN Grade ON Enrollment.ENROLLMENT_ID = Grade.ENROLLMENT_ID
GROUP BY Student.STUDENT_NAME
ORDER BY AVERAGE_GRADE DESC;

SELECT Course.COURSE_NAME, 
       COUNT(Enrollment.ENROLLMENT_ID) AS STUDENT_COUNT, 
       AVG(Grade.GRADE) AS AVERAGE_GRADE
FROM Course
JOIN Enrollment ON Course.COURSE_ID = Enrollment.COURSE_ID
JOIN Grade ON Enrollment.ENROLLMENT_ID = Grade.ENROLLMENT_ID
GROUP BY Course.COURSE_NAME
ORDER BY AVERAGE_GRADE DESC, STUDENT_COUNT DESC
LIMIT 5;

SELECT 
    Course.COURSE_NAME, 
    MAX(CASE WHEN Student.STUDENT_NAME = 'Олександр Бугайчук' THEN Grade.GRADE END) AS "Олександр Бугайчук",
    MAX(CASE WHEN Student.STUDENT_NAME = 'Роман Демчук' THEN Grade.GRADE END) AS "Роман Демчука",
    MAX(CASE WHEN Student.STUDENT_NAME = 'Плисюк Вадим' THEN Grade.GRADE END) AS "Плисюк Вадим",
    MAX(CASE WHEN Student.STUDENT_NAME = 'Ангеліна Жуковська' THEN Grade.GRADE END) AS "Ангеліна Жуковська",
    MAX(CASE WHEN Student.STUDENT_NAME = 'Максим Завальнюк' THEN Grade.GRADE END) AS "Максим Завальнюк"
FROM 
    Course
JOIN Enrollment ON Course.COURSE_ID = Enrollment.COURSE_ID
JOIN Student ON Enrollment.STUDENT_ID = Student.STUDENT_ID
JOIN Grade ON Enrollment.ENROLLMENT_ID = Grade.ENROLLMENT_ID
GROUP BY Course.COURSE_NAME;

DROP PROCEDURE IF EXISTS GradeEvaluation;
DELIMITER $$

SELECT 
    Course.COURSE_NAME,
    Student.STUDENT_NAME,
    Grade.GRADE,
    CASE
        WHEN Grade.GRADE >= 90 THEN 'Відмінно'
        WHEN Grade.GRADE BETWEEN 75 AND 89 THEN 'Добре'
        WHEN Grade.GRADE BETWEEN 60 AND 74 THEN 'Задовільно'
        ELSE 'Незадовільно'
    END AS Grade_Evaluation
FROM Student
JOIN Enrollment ON Student.STUDENT_ID = Enrollment.STUDENT_ID
JOIN Grade ON Enrollment.ENROLLMENT_ID = Grade.ENROLLMENT_ID
JOIN Course ON Enrollment.COURSE_ID = Course.COURSE_ID
ORDER BY Course.COURSE_NAME, Grade.GRADE DESC;
END $$
DELIMITER ;
CALL GradeEvaluation();