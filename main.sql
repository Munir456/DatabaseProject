CREATE TABLE COURSE (
  crs_num INTEGER,
  crs_name TEXT,
  semester TEXT,
  school_year YEAR,
  dept_name TEXT,
  part_percent INTEGER,
  hw_percent INTEGER,
  test_percent INTEGER,
  proj_percent INTEGER
);

CREATE TABLE ROSTER (
  crs_num INTEGER,
  stu_ID INTEGER,
  stu_fname TEXT,
  stu_lname TEXT,
  crs_name TEXT,
  semester TEXT,
  school_year YEAR
);

CREATE TABLE GRADEBOOK (
  stu_ID INTEGER,
  crs_num INTEGER,
  stu_fname TEXT,
  stu_lname TEXT,
  total_grade FLOAT(4,1),
  part_avg FLOAT(4,1),
  hw_avg FLOAT(4,1),
  test_avg FLOAT(4,1),
  proj_avg FLOAT(4,1)
);
CREATE TABLE ASSIGNMENTS (
  assign_ID INTEGER,
  stu_ID INTEGER,
  crs_num INTEGER,
  assign_name TEXT,
  assign_category TEXT,
  assign_score FLOAT(4,1)
);

-- task #2 -> insert values
INSERT INTO COURSE VALUES (0001, 'Databse Systems', 'Spring', 2023, 'CSEE', 5, 10, 30, 10);
INSERT INTO COURSE VALUES (0002, 'SoPL', 'Spring', 2023, 'CSEE',  10, 20, 50, 20);

INSERT INTO ROSTER VALUES (0001, 111, 'Yasmin', 'Senior', 'Database Systems', 'Spring', 2023);
INSERT INTO ROSTER VALUES (0001, 112, 'Munir', 'Adeyola', 'Database Systems', 'Spring', 2023);
INSERT INTO ROSTER VALUES (0002, 113, 'Chad', 'Toomer', 'SoPL', 'Spring', 2023);
INSERT INTO ROSTER VALUES (0002, 114, 'John', 'Q', 'SoPL', 'Spring', 2023);

INSERT INTO GRADEBOOK VALUES (111, 1000, 'Yasmin', 'Senior', 0.0, 67.0, 87.0, 53.0, 100.0);
INSERT INTO GRADEBOOK VALUES (112, 1000, 'Munir', 'Adeyola', 0.0, 80.0, 83.0, 100.0, 70.0);

INSERT INTO GRADEBOOK VALUES (113, 2000, 'Chad', 'Toomer', 0.0, 78.0, 59.0, 90.0, 85.0);
INSERT INTO GRADEBOOK VALUES (114, 2000, 'John', 'Q', 0.0, 83.0, 90.0, 100.0, 89.0);
-- INSERT INTO GRADEBOOK VALUES (111, 2000, 'Jane', 'Doe', 0.0, 0.0, 0.0, 0.0, 0.0);

INSERT INTO ASSIGNMENTS VALUES (1000, 111, 0001, 'intro', 'Participation', 100.0);
INSERT INTO ASSIGNMENTS VALUES (1001, 111, 0001, 'activity', 'Participation', 85.0);
INSERT INTO ASSIGNMENTS VALUES (1002, 111, 0001, 'hw 1', 'Homework', 65.0);
INSERT INTO ASSIGNMENTS VALUES (1004, 111, 0001, 'test 1', 'Test', 70.0);
INSERT INTO ASSIGNMENTS VALUES (1005, 111, 0001, 'test 2', 'Test', 85.0);
INSERT INTO ASSIGNMENTS VALUES (1006, 111, 0001, 'project 1', 'Project', 90.0);
INSERT INTO ASSIGNMENTS VALUES (1007, 111, 0001, 'project 2', 'Project', 100.0);

INSERT INTO ASSIGNMENTS VALUES (1000, 112, 0001, 'intro', 'Participation', 90.0);
INSERT INTO ASSIGNMENTS VALUES (1001, 112, 0001, 'activity', 'Participation', 100.0);
INSERT INTO ASSIGNMENTS VALUES (1002, 112, 0001, 'hw 1', 'Homework', 80.0);
INSERT INTO ASSIGNMENTS VALUES (1004, 112, 0001, 'test 1', 'Test', 90.0);
INSERT INTO ASSIGNMENTS VALUES (1005, 112, 0001, 'test 2', 'Test', 50.0);
INSERT INTO ASSIGNMENTS VALUES (1006, 112, 0001, 'project 1', 'Project', 100.0);
INSERT INTO ASSIGNMENTS VALUES (1007, 112, 0001, 'project 2', 'Project', 90.0);
INSERT INTO ASSIGNMENTS VALUES (2000, 113, 0002, 'hw 1', 'Homework', 95.0);
INSERT INTO ASSIGNMENTS VALUES (2001, 113, 0002, 'test 1', 'Test', 85.0);
INSERT INTO ASSIGNMENTS VALUES (2000, 114, 0002, 'hw 1', 'Homework', 65.0);
INSERT INTO ASSIGNMENTS VALUES (2001, 114, 0002, 'test 1', 'Test', 70.0);

-- task #3 -> show tables w content
SELECT * FROM COURSE;
SELECT * FROM ROSTER;
SELECT * FROM GRADEBOOK;
SELECT * FROM ASSIGNMENTS;

-- -- task #4 
SELECT MIN(assign_score) AS assign_min
FROM ASSIGNMENTS
WHERE assign_ID is 1000;

SELECT MAX(assign_score) AS assign_max
FROM ASSIGNMENTS
WHERE assign_ID is 1000;

-- SELECT AVG(assign_score) AS assign_avg
-- FROM ASSIGNMENTS
-- WHERE assign_ID is 1000;

-- -- task #5 
SELECT stu_ID, stu_fname, stu_lname, semester, school_year
FROM ROSTER
WHERE crs_num is 0001;

--task #6
SELECT ROSTER.stu_fname, stu_lname, ASSIGNMENTS.assign_name, ASSIGNMENTS.assign_score, COURSE.crs_name
FROM ((ROSTER INNER JOIN ASSIGNMENTS ON ROSTER.stu_ID = ASSIGNMENTS.stu_ID ) ROSTER INNER JOIN COURSE ON ROSTER.crs_num = COURSE.crs_num)
WHERE ROSTER.crs_num is 0001;

-- -- task #7 
INSERT INTO ASSIGNMENTS VALUES (1003, NULL, 0001, 'hw 2', 'Homework', NULL); 
SELECT 
DISTINCT assign_ID, assign_name
FROM ASSIGNMENTS 
WHERE assign_ID NOT NULL;

-- -- task #8 
SELECT * FROM COURSE WHERE crs_num = 0001;
UPDATE COURSE
SET part_percent = 10, hw_percent = 20, test_percent = 50, proj_percent = 20
WHERE crs_num = 0001;
SELECT * FROM COURSE WHERE crs_num = 0001;

-- -- task #9 -
SELECT * FROM ASSIGNMENTS WHERE assign_ID = 1005;
UPDATE ASSIGNMENTS 
SET assign_score = assign_score + 2 
WHERE assign_ID = 1005;
SELECT * FROM ASSIGNMENTS WHERE assign_ID = 1005;

-- -- task #10 
INSERT INTO ROSTER VALUES (0001, 115, 'Test', 'Que', 'Database Systems', 'Spring', 2023);
INSERT INTO ROSTER VALUES (0001, 116, 'Testing', 'Sql', 'Database Systems', 'Spring', 2023);
INSERT INTO ASSIGNMENTS VALUES (1000, 115, 0001, 'hw 1', 'Homework', 95.0);
INSERT INTO ASSIGNMENTS VALUES (1001, 115, 0001, 'test 1', 'Test', 80.0);
INSERT INTO ASSIGNMENTS VALUES (1000, 116, 0001, 'hw 1', 'Homework', 100.0);
INSERT INTO ASSIGNMENTS VALUES (1001, 116, 0001, 'test 1', 'Test', 65.0);
INSERT INTO GRADEBOOK VALUES (115, 1000, 'Test', 'Que', 0, 0, 0, 0, 0);
INSERT INTO GRADEBOOK VALUES (116, 1000, 'Testing', 'Sql', 0, 0, 0, 0, 0);

UPDATE GRADEBOOK
SET total_grade = total_grade + 2
WHERE stu_lname LIKE "%q%";

SELECT stu_ID, total_grade
FROM GRADEBOOK 
WHERE stu_lname LIKE "%q%";

-- --task #11

INSERT INTO GRADEBOOK (part_avg)
SELECT AVG(assign_score) FROM ASSIGNMENTS
WHERE stu_ID IS 111 AND assign_name IS 'Participation';

INSERT INTO GRADEBOOK (hw_avg)
SELECT AVG(assign_score) FROM ASSIGNMENTS
WHERE stu_ID IS 111 AND assign_name IS 'Homework';

INSERT INTO GRADEBOOK (test_avg)
SELECT AVG(assign_score) FROM ASSIGNMENTS
WHERE stu_ID IS 111 AND assign_name IS 'Test';

INSERT INTO GRADEBOOK (proj_avg)
SELECT AVG(assign_score) FROM ASSIGNMENTS
WHERE stu_ID IS 111 AND assign_name IS 'Project';

UPDATE GRADEBOOK
SET total_grade = (GRADEBOOK.part_avg * 10 + GRADEBOOK.hw_avg * 20 + GRADEBOOK.test_avg * 50 + GRADEBOOK.proj_avg * 20) / 100
WHERE stu_ID IS 111;

SELECT total_grade
FROM GRADEBOOK
WHERE stu_ID IS 111;

-- -- task #12 

DELETE FROM ASSIGNMENTS WHERE stu_ID IS 111 AND assign_category IS 'Test';

INSERT INTO GRADEBOOK (part_avg)
SELECT AVG(assign_score) FROM ASSIGNMENTS
WHERE stu_ID IS 111 AND assign_name IS 'Participation';

INSERT INTO GRADEBOOK (hw_avg)
SELECT AVG(assign_score) FROM ASSIGNMENTS
WHERE stu_ID IS 111 AND assign_name IS 'Homework';

INSERT INTO GRADEBOOK (test_avg)
SELECT AVG(assign_score) FROM ASSIGNMENTS
WHERE stu_ID IS 111 AND assign_name IS 'Test';

INSERT INTO GRADEBOOK (proj_avg)
SELECT AVG(assign_score) FROM ASSIGNMENTS
WHERE stu_ID IS 111 AND assign_name IS 'Project';

UPDATE GRADEBOOK
SET total_grade = (GRADEBOOK.part_avg * 10 + GRADEBOOK.hw_avg * 20 +
