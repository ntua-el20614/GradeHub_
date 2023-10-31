-- Create the database if it doesn't exist
DROP DATABASE IF EXISTS students;
CREATE DATABASE IF NOT EXISTS students;

-- Switch to the students database
USE students;

-- Create the tables
CREATE TABLE student (
  student_id INT PRIMARY KEY AUTO_INCREMENT,
  school INT,
  name VARCHAR(255),
  username VARCHAR(255) UNIQUE,
  password VARCHAR(255),
  birthday date,
  email VARCHAR(255),
  privacy BOOL
  -- FOREIGN KEY (school) REFERENCES schools(school_id) -- Change the reference here
);


CREATE TABLE schools(
  school_id INT PRIMARY KEY AUTO_INCREMENT,
  school_name CHAR(255)
  );

CREATE TABLE course (
  school_id INT,
  course_id INT PRIMARY KEY AUTO_INCREMENT,
  semester INT,
  flow VARCHAR(255),
  name VARCHAR(255),
  optional BOOL,
  ECTS CHAR(255) DEFAULT '',
  INDEX (semester) -- Add an index on the 'semester' column
  -- FOREIGN KEY (school_id) REFERENCES student(school)

);

CREATE TABLE subject_user (
  student_id INT,
  course_id INT,
  semester INT,
  grade VARCHAR(255),
  pending bool DEFAULT False,
  going bool,
  PRIMARY KEY (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES student(student_id),
  FOREIGN KEY (semester) REFERENCES course(semester),
  FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE friendship (
  friendship_id INT PRIMARY KEY AUTO_INCREMENT,
  user1_id INT,
  user2_id INT,
  status VARCHAR(255),
  FOREIGN KEY (user1_id) REFERENCES student(student_id),
  FOREIGN KEY (user2_id) REFERENCES student(student_id)
);
