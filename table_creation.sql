CREATE DATABASE IF NOT EXISTS attendance_system;

USE attendance_system;

DROP TABLE IF EXISTS Attendance;
DROP TABLE IF EXISTS Class_Meeting;
DROP TABLE IF EXISTS Classroom;
DROP TABLE IF EXISTS Course_Enrollment;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Instructor;

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    password VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE Instructor (
    employee_id INT PRIMARY KEY,
    password VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(80) NOT NULL,
    course_number VARCHAR(10) NOT NULL,
    description TEXT,
    meeting_room VARCHAR(50) NOT NULL,
    employee_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Instructor(employee_id)
);

CREATE TABLE Course_Enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Might change  this table later, not sure of how we should store the layout graphic yet.
CREATE TABLE Classroom (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    building_name VARCHAR(100) NOT NULL,
    room_number VARCHAR(20) NOT NULL,
    layout_graphic VARCHAR(100) NOT NULL
);

CREATE TABLE ClassMeeting (
    meeting_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    meeting_date DATE NOT NULL,
    qr_code_link VARCHAR(80) NOT NULL,
    short_url VARCHAR(80) NOT NULL,
    room_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (room_id) REFERENCES Classroom(room_id)
);

CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    meeting_id INT NOT NULL,
    student_id INT NOT NULL,
    seat_position VARCHAR(10),
    honor_pledge_signed BOOLEAN NOT NULL,
    FOREIGN KEY (meeting_id) REFERENCES ClassMeeting(meeting_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

INSERT INTO Student VALUES (1234, 'password123','Chris', 'Combs');
INSERT INTO Instructor VALUES (1234, 'password123', 'Professor', 'Etudo');

