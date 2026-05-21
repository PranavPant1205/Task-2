create database StudentManagement;
use StudentManagement;

create table Students(
StudentId int primary key AUTO_INCREMENT,
Name varchar(20),
Gender varchar(20),
Age int,
Grade varchar(10),
MathScore int,
ScienceScore int,
EnglishScore int
);
Create table  courses(
id int primary key auto_increment,
name varchar(20)
);

create table enrollments(
student_id int,
course_id int,
grade int,
foreign key(student_id) references Students(StudentId),
foreign key(course_id) references courses(id)
);

Insert into courses
(name)
values
('Math'),
('Science'),
('English');

INSERT INTO enrollments (student_id, course_id, grade)
VALUES
(1,1,85),
(1,2,78),
(2,1,67),
(2,2,74),
(2,3,81),
(3,1,92),
(4,2,63),
(4,3,59),
(5,1,77),
(5,3,84),
(6,1,91),
(6,2,89),
(6,3,93),
(7,1,72),
(7,2,68),
(8,3,55),
(9,1,88),
(9,2,79),
(9,3,91),
(10,2,64),
(11,1,49),
(11,3,58),
(12,1,95),
(12,2,97),
(12,3,96),
(13,2,73),
(14,1,61),
(14,2,66),
(15,3,82),
(16,1,70),
(16,2,75),
(16,3,78),
(17,1,86),
(18,2,39),
(18,3,44),
(19,1,90),
(19,2,92),
(20,1,80),
(20,2,83),
(20,3,85);

select * from enrollments;

insert into students
(Name,Gender,Age,Grade,MathScore,ScienceScore,EnglishScore)
values
('Aman', 'Male', 12, 6, 78, 82, 74),
('Riya', 'Female', 13, 7, 88, 91, 85),
('Karan', 'Male', 14, 8, 67, 72, 70),
('Sneha', 'Female', 15, 9, 92, 89, 94),
('Arjun', 'Male', 16, 10, 55, 60, 58),
('Pooja', 'Female', 17, 11, 81, 77, 83),
('Rahul', 'Male', 18, 12, 73, 68, 71),
('Neha', 'Female', 12, 6, 90, 95, 89),
('Vikas', 'Male', 13, 7, 64, 66, 62),
('Anjali', 'Female', 14, 8, 85, 87, 90),
('Rohit', 'Male', 15, 9, 79, 75, 80),
('Kavya', 'Female', 16, 10, 93, 92, 91),
('Suresh', 'Male', 17, 11, 58, 61, 57),
('Meena', 'Female', 18, 12, 84, 88, 86),
('Deepak', 'Male', 12, 6, 69, 73, 68),
('Priya', 'Female', 13, 7, 91, 94, 92),
('Amit', 'Male', 14, 8, 72, 70, 74),
('Simran', 'Female', 15, 9, 87, 90, 88),
('Manish', 'Male', 16, 10, 65, 67, 63),
('Nisha', 'Female', 17, 11, 89, 93, 90);

-- To show all students details
select * from students;

-- Average Score in each subject
select avg(MathScore) as MathAvg,avg(ScienceScore) as ScienceAvg,avg(EnglishScore) as EnglishAvg
from students;

-- Top Performer Highest Total Score
select name,(MathScore+ScienceScore+EnglishScore) as total_score from students
order by total_score desc
limit 1;

-- count students per grade
select grade,count(name) as students_per_grade from students
group by grade;

-- Average score by gender
select gender,round(avg((MathScore+ScienceScore+EnglishScore)/3),2) as avg_score from students
group by gender;

-- Students with MathScore>80
select name,MathScore from students
where MathScore>80;

-- Safe mode off command
SET SQL_SAFE_UPDATES = 0;

-- Updation of student grade
update students
set grade=6 where name='Nisha';

-- List all the students enrolled in each course
select s.name,c.name
from enrollments as e
join students as s
on s.studentid=e.student_id
join courses as c
on c.id=e.course_id;

-- Find average grade per course.
select c.name,avg(e.grade) as avg_grade
from enrollments as e
join courses as c
on e.course_id=c.id
group by c.name;

-- Top 3 students overall
select s.name,avg(e.grade) as total_marks 
from students as s
join enrollments as e on s.studentid=e.student_id
group by s.name
order by total_marks desc
limit 3;

-- count students who failed(grade<40)
select count(*) from enrollments where grade<40;