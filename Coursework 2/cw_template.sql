/*
Student name: Liam Patel             
Student ID: 240005269        
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */

CREATE TABLE classroom (
    classroom_id INTEGER PRIMARY KEY,
    building_name VARCHAR(30),
    capacity INTEGER
);

CREATE TABLE teacher (
    teacher_id INTEGER PRIMARY KEY,
    teacher_name VARCHAR(100),
    teacher_email VARCHAR(100)
);

CREATE TABLE student (
    student_id INTEGER PRIMARY KEY,
    student_name VARCHAR(100)
);

CREATE TABLE lesson (
    lesson_id INTEGER PRIMARY KEY,
    classroom_id INTEGER,
    lesson_day VARCHAR(10),
    start_time TIME,
    end_time TIME,
    teacher_id INTEGER,
    department_name VARCHAR(30),
    FOREIGN KEY (classroom_id) REFERENCES classroom (classroom_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher (teacher_id)
);

CREATE TABLE studentLesson (
    student_id INTEGER,
    lesson_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES student (student_id),
    FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id),
    PRIMARY KEY (student_id, lesson_id)
    
);




/* SECTION 2 - INSERT STATEMENTS */

INSERT INTO classroom VALUES
    (1, "Science Building", 15),
    (2, "Maths Building", 30),
    (3, "Maths Building", 25),
    (4, "Science Building", 30),
    (5, "Arts building", 32),
    (6, "Humanities Building", 18),
    (7, "Science Building", 26),
    (8, "Humanities Building", 40),
    (9, "Arts Building", 45),
    (10, "Humanities Building", 35),
    (11, "Maths Building", 60),
    (12, "Humanities Building", 20);

INSERT INTO teacher VALUES
    (1, "Archie Collier", "archiecollier@gmail.com"),
    (2, "Courtney Andrews", "courtneyandrews@gmail.com"),
    (3, "Jayden Kennedy", "jaydenkennedy@gmail.com"),
    (4, "Shannon Graham", "shannongraham@gmail.com"),
    (5, "Laura Nicholson", "lauranicholson@gmail.com"),
    (6, "Harrison Barlow", "harrisonbarlow@gmail.com"),
    (7, "Peter Hancock", "peterhancock@gmail.com"),
    (8, "Natasha Willis", "natashawillis@gmail.com"),
    (9, "Summer Pickering", "summerpickering@gmail.com"),
    (10, "Oliver Fitzgerald", "oliverfitzgerald@gmail.com");

INSERT INTO student VALUES
    (1, "Phoebe Ryan"),
    (2, "Abby Finch"),
    (3, "Cameron Fraser"),
    (4, "Leah Reeves"),
    (5, "Alex Palmer"),
    (6, "Jonathan Lucas"),
    (7, "Scarlett Browne"),
    (8, "Evie Lewis"),
    (9, "Robert Humphries"),
    (10, "Scarlett Dobson"),
    (11, "Harrison Marsh"),
    (12, "Matilda Leach");


INSERT INTO lesson VALUES
    (1, 2,"Monday", '9:00:00', '11:00:00', 4, "Maths"),
    (2, 4,"Monday", '11:00:00', '12:30:00', 3, "Biology"),
    (3, 10,"Tuesday", '14:00:00', '15:00:00', 8, "English"),
    (4, 10,"Tuesday", '11:00:00', '12:00:00', 10, "History"),
    (5, 12,"Wednesday", '13:00:00', '14:30:00', 3, "Geography"),
    (6, 5,"Thursday", '10:00:00', '11:00:00', 7, "Art"),
    (7, 9,"Thursday", '11:00:00', '12:00:00', 2, "Drama"),
    (8, 3,"Friday", '13:00:00', '14:00:00', 6, "Maths"),
    (9, 7,"Friday", '8:00:00', '9:00:00', 9, "Physics"),
    (10,10,"Friday", '9:00:00', '11:00:00', 4, "English");

INSERT INTO studentLesson VALUES
    (1,1),
    (1,2),
    (1,3),
    (2,4),
    (2,7),
    (3,1),
    (4,7),
    (4,9),
    (5,1),
    (5,10),
    (6,7),
    (7,3),
    (8,5),
    (8,7),
    (9,1),
    (10,1),
    (11,2),
    (12,6),
    (12,8);
 

                     
/* SECTION 3 - UPDATE STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/*
1) Move Lesson 1 from room 2 to room 3

*/

UPDATE lesson SET classroom_id=3 WHERE lesson_id = 1;

/*
2) All classrooms with capacity 25 should now have a capacity of 30;

*/

UPDATE classroom SET capacity = 30 WHERE capacity = 25;


/* SECTION 4 - SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs*/


/* 
1) List the day and start time of all lessons taking place in room 3

*/
select '1)' AS '';

SELECT lesson_day, start_time
FROM lesson
WHERE classroom_id = 3;

/* 
2) Select the classroom, start time, and date of all lessons that Matilda Leach has.

*/
select '2)' AS '';

SELECT classroom_id, start_time, lesson_day
FROM lesson
INNER JOIN studentLesson
ON studentLesson.lesson_id = lesson.lesson_id
INNER JOIN student
ON studentLesson.student_id = student.student_id
WHERE student_name = "Matilda Leach";

/* 
3) Select the names of all subjects that are taught in room 10

*/
select '3)' AS '';

SELECT DISTINCT department_name
FROM lesson
INNER JOIN classroom
ON classroom.classroom_id = lesson.classroom_id
WHERE lesson.classroom_id = 10;


/* 
4) Select the names of teachers who teach on monday

*/
select '4)' AS '';

SELECT teacher_name
FROM teacher
INNER JOIN lesson
ON lesson.teacher_id = teacher.teacher_id
WHERE lesson_day = "Monday";


/* 
5) Select the room id and capacity of the largest capacity classroom(s)

*/
select '5)' AS '';

SELECT classroom_id
FROM classroom
WHERE capacity = (SELECT MAX(capacity)
                  FROM classroom);

/* 
6) select the room ids of the rooms of the higest capacity in each Building

*/
select '6)' AS '';

SELECT c.classroom_id, c.building_name, c.capacity
FROM classroom c
WHERE c.capacity = (SELECT MAX(capacity)
                    FROM classroom
                    WHERE building_name = c.building_name);
    
/* 
7)  Select all the names and email adresses of teachers that teach Evie Lewis

*/
select '7)' AS '';

SELECT teacher_name, teacher_email
FROM teacher
INNER JOIN lesson
ON lesson.teacher_id = teacher.teacher_id
INNER JOIN studentLesson
ON lesson.lesson_id = studentLesson.lesson_id
INNER JOIN student
ON student.student_id = studentLesson.student_id
WHERE student_name = "Evie Lewis";


/* 
8)  Select all lesson ids where the lesson is longer than an hour 

*/
select '8)' AS '';


SELECT lesson_id
FROM lesson
WHERE (TIME_TO_SEC(TIMEDIFF(end_time, start_time)) / 60) > 60;


/* SECTION 5 - DELETE ROWS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/*
1) Archie Collier is no longer a teacher

*/

DELETE 
FROM teacher
WHERE teacher_name = "Archie Collier";

/*
2) Delete all classrooms with capacity lower than 20

*/

DELETE
FROM classroom
WHERE capacity < 20;

/* SECTION 6 - DROP TABLES */




DROP TABLE studentLesson;
DROP TABLE lesson;
DROP TABLE classroom;
DROP TABLE student;
DROP TABLE teacher;




SHOW TABLES;