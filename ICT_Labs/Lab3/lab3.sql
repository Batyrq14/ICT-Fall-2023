
create table student(
    id              serial primary key,
    first_name      varchar(50),
    last_name       varchar(50),
    course          integer,
    graduation_year integer
);

insert into student(id, first_name, last_name, course, graduation_year)
values
                     (1, 'Elmur', 'Abdulla', 2, 2026),
                     (2, 'Ainur', 'Azamatqyzy', 2, 2026),
                     (3, 'Alina', 'Abdiyeva', 1, 2027),
                     (4, 'Raushan', 'Amanzholova',5,2024),
                     (5, 'Erasyl', 'Baimukhan',1, 2027 ),
                     (6, 'Miras', 'Nuraliev',1, 2027 ),
                     (7, 'Emmanuel', 'Olabide', 2, 2026 ),
                     (8, 'Bauyrzhan', 'Balgaziyev', 4, 2024 ),
                     (9, 'Zhaqsylyq', 'Ashym', 4, 2024);

-- A 1 a
select * from student where course = 2;

-- A 1 b
select * from student order by graduation_year asc limit 1;
select * from student order by graduation_year desc limit 1;

-- A 2 c
update student set last_name = 'Tore' where id = 6;

-- A 2 d
update student set last_name = 'Toqsanbay' where id = 9;
update student set last_name = 'Baqyt' where id = 1;
update student set last_name = 'Isatay' where id = 5;

select * from student order by id asc;
drop table student;







-- B1a

create table teachers (
    teacher_id          int primary key,
    first_name          varchar(50),
    last_name           varchar(50)
);
insert into teacher(teacher_id, first_name, last_name)
values
                     (1, 'Elmur', 'Abdulla'),
                     (2, 'Ainur', 'Azamatqyzy'),
                     (3, 'Alina', 'Abdiyeva'),
                     (4, 'Raushan', 'Amanzholova'),
                     (5, 'Erasyl', 'Baimukhan'),
                     (6, 'Miras', 'Nuraliev'),
                     (7, 'Emmanuel', 'Olabide'),
                     (8, 'Bauyrzhan', 'Balgaziyev'),
                     (9, 'Zhaqsylyq', 'Ashym');

create table courses(
    course_id           int primary key,
    course_name         varchar(255),
    teacher_id          int,
    foreign key (teacher_id) references teachers(teacher_id)
);

insert into courses(course_id,course_name,teacher_id)
values
                     (1, 'math', 2),
                     (2, 'biology',1),
                     (3, 'ict',5)
                     (4, 'physics',6);


create table students (
    student_id           int primary key,
    first_name           varchar(50),
    last_name            varchar(50),
    age                  int,
    gpa                  double precision,
    course_id            int,
    foreign key (course_id) references courses(course_id)
);
insert into students(student_id, first_name, last_name,age,gpa, course_id)
values
                     (1, 'Elmur', 'Abdulla', 19, 3.5, 2),
                     (2, 'Ainur', 'Azamatqyzy', 17, 3.1, 1),
                     (3, 'Alina', 'Abdiyeva', 18, 3.3, 4),
                     (4, 'Raushan', 'Amanzholova', 23, 2.5, 2 ),
                     (5, 'Erasyl', 'Baimukhan', 22, 2.9, 3),
                     (6, 'Miras', 'Nuraliev', 18, 3.0, 1),
                     (7, 'Emmanuel', 'Olabide', 20, 2.7 , 4),
                     (8, 'Bauyrzhan', 'Balgaziyev', 22, 3.9, 1),
                     (9, 'Zhaqsylyq', 'Ashym', 18, 3.2, 2);

-- B1b


select students.student_id,
       students.first_name,
       students.last_name,
       courses.course_name,
       teachers.first_name as teachername,
       teachers.last_name as teacherlastname
from students
join courses on students.course_id = courses.course_id
join teachers on courses.teacher_id = teachers.teacher_id;


select courses.course_name, count(students.student_id) as num_students
from courses
left join students on courses.course_id = students.course_id
group by courses.course_name;


-- C1a

select course_id, count(student_id) as num_students from students group by course_id;

-- C1b

select course_id, avg(age) as avg_age from students group by course_id;

-- C2c

select student_id, first_name, last_name from students where gpa > (select avg(gpa) from students);

-- C2d

select student_id, first_name, last_name from students where gpa > 3;

-- D1a


create table  scores(
    student_id serial primary key,
    score int
);

insert into scores(student_id, score)
values
    (1,2541),
    (2,1324),
    (3,950),
    (4,33674),
    (5,5486),
    (6,3235),
    (7,346),
    (8,43),
    (9,100);


drop table students;

create table  students(
    student_id              serial primary key,
    foreign key (student_id) references scores(student_id),
    first_name      varchar(50),
    last_name       varchar(50),
    course_id          integer,
    foreign key (course_id) references courses(course_id),
    graduation_year integer
);


insert into students(student_id, first_name, last_name, course_id, graduation_year)
values
                     (1, 'Elmur', 'Abdulla', 2, 2026),
                     (2, 'Ainur', 'Azamatqyzy', 2, 2026),
                     (3, 'Alina', 'Abdiyeva', 1, 2027),
                     (4, 'Raushan', 'Amanzholova',5,2024),
                     (5, 'Erasyl', 'Baimukhan',1, 2027 ),
                     (6, 'Miras', 'Nuraliev',1, 2027 ),
                     (7, 'Emmanuel', 'Olabide', 2, 2026 ),
                     (8, 'Bauyrzhan', 'Balgaziyev', 4, 2024 ),
                     (9, 'Zhaqsylyq', 'Ashym', 4, 2024);

create view StudentCourseGrades as
select
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name,
    sg.score
from
    students s
join
    courses c on s.course_id = c.course_id
join
    scores sg on s.student_id = sg.student_id;

-- D1b

SELECT
    course_name,
    AVG(score) AS avg_score
FROM
    StudentCourseGrades
GROUP BY
    course_name;

drop view studentcoursegrades;

drop table courses;
drop table scores;
drop table students;+