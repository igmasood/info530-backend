CREATE DATABASE IF NOT EXISTS attendance_system;

CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    password VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS instructors (
    employee_id INT PRIMARY KEY,
    password VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

INSERT INTO students VALUES (1234, 'password123','Chris', 'Combs');
INSERT INTO instructors VALUES (1234, 'password123', 'Professor', 'Etudo');
