create database lab5;

create table students(
    student_id integer primary key,
    student_name varchar(250)
);

create table courses(
    course_id integer primary key,
    course_name varchar(250)
);

create table grades(
    student_id integer references students,
    course_id integer references courses,
    grade integer
);

INSERT INTO students (student_id, student_name)
VALUES
 (1, 'Иван Иванов'),
 (2, 'Мария Петрова'),
 (3, 'Алексей Сидоров'),
 (4, 'Елена Козлова'),
 (5, 'Сергей Федоров'),
 (6, 'Ольга Смирнова'),
 (7, 'Дмитрий Попов'),
 (8, 'Наталья Иванова'),
 (9, 'Андрей Кузнецов'),
 (10, 'Татьяна Семенова'),
 (11, 'Павел Королев'),
 (12, 'Екатерина Николаева'),
 (13, 'Игорь Захаров'),
 (14, 'Анна Полякова'),
 (15, 'Глеб Морозов'),
 (16, 'Юлия Васильева'),
 (17, 'Артем Белов'),
 (18, 'София Кравченко'),
 (19, 'Максим Григорьев'),
 (20, 'Алиса Фомина'),
 (21, 'Илья Комаров'),
 (22, 'Людмила Орлова'),
 (23, 'Роман Савельев'),
 (24, 'Евгения Лебедева'),
 (25, 'Владимир Петров'),
 (26, 'Дарья Соколова'),
 (27, 'Андрей Морозов'),
 (28, 'Оксана Гусева'),
 (29, 'Михаил Волков'),
 (30, 'Кристина Козлова'),
 (31, 'Александр Сидоров'),
 (32, 'Елена Мельникова'),
 (33, 'Сергей Романов'),
 (34, 'Лариса Шарова'),
 (35, 'Игорь Козлов'),
 (36, 'Анастасия Горбунова'),
 (37, 'Владислав Дмитриев'),
 (38, 'Ольга Семенова'),
 (39, 'Константин Зайцев'),
 (40, 'Надежда Тихонова'),
 (41, 'Павел Кудрявцев'),
 (42, 'Маргарита Королева'),
 (43, 'Артем Федотов'),
 (44, 'Екатерина Григорьева'),
 (45, 'Андрей Степанов'),
 (46, 'Ирина Белякова'),
 (47, 'Денис Максимов'),
 (48, 'Елена Волкова'),
 (49, 'Алексей Миронов'),
 (50, 'Светлана Новикова');

INSERT INTO courses (course_id, course_name)
VALUES
 (101, 'Математика'),
 (102, 'Физика'),
 (103, 'История'),
 (104, 'Биология'),
 (105, 'Химия'),
 (106, 'Литература');

INSERT INTO grades (student_id, course_id, grade)
SELECT
 student_id,
 course_id,
 ROUND(random() * 40 + 60)
FROM
 students
CROSS JOIN
 courses;

select * from grades