CREATE DATABASE IF NOT EXISTS attendance_system;

USE attendance_system;

DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS course_enrollment;
DROP TABLE IF EXISTS class_meeting;
DROP TABLE IF EXISTS classroom;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS instructor;

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    password VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE instructor (
    employee_id INT PRIMARY KEY,
    password VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(80) NOT NULL,
    course_number VARCHAR(10) NOT NULL,
    description TEXT,
    meeting_room VARCHAR(50) NOT NULL,
    employee_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES instructor(employee_id)
);

CREATE TABLE course_enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- Might change  this table later, not sure of how we should store the layout graphic yet.
CREATE TABLE classroom (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    building_name VARCHAR(100) NOT NULL,
    room_number VARCHAR(20) NOT NULL,
    layout_graphic VARCHAR(100)
);

CREATE TABLE class_meeting (
    meeting_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    meeting_date DATE NOT NULL,
    qr_code_link VARCHAR(80) NOT NULL,
    short_url VARCHAR(80) NOT NULL,
    room_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (room_id) REFERENCES classroom(room_id)
);

CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    meeting_id INT NOT NULL,
    student_id INT NOT NULL,
    seat_position VARCHAR(10),
    honor_pledge_signed BOOLEAN NOT NULL,
    FOREIGN KEY (meeting_id) REFERENCES class_meeting(meeting_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);



INSERT INTO student (student_id, password, first_name, last_name) VALUES
(1001, 'pass123', 'Alice', 'Johnson'),
(1002, 'pass123', 'Bob', 'Smith'),
(1003, 'pass123', 'Charlie', 'Brown'),
(1004, 'pass123', 'Diana', 'Evans');

INSERT INTO instructor (employee_id, password, first_name, last_name) VALUES
(5001, 'pass123', 'Steve', 'Green'),
(5002, 'pass123', 'Josh', 'Stevenson'),
(5003, 'pass123', 'Ryan', 'Lawson'),
(5004, 'pass123', 'Wayne', 'Nelson');

INSERT INTO course (title, course_number, description, meeting_room, employee_id) VALUES
('Systems Development', 'INFO530', 'Covers business process and data requirements modeling for information systems, using advanced methods and techniques.', 'Snead Hall B1021', 5001),
('Analysis and Design of Database Systems', 'INFO610', 'Designed to prepare students for the development of data-driven information systems using advanced database management techniques.', 'Snead Hall B2034', 5002),
('Database Systems', 'INFO364', 'Fundamentals of databases, includes the use of Structured Query Language to query and manipulate data.', 'Snead Hall B3101', 5003),
('Programming for Business Analytics', 'INFO450', 'Teaches students how to use Python for data analytics and data science.', 'Snead Hall B2045', 5004);

INSERT INTO classroom (building_name, room_number, layout_graphic) VALUES
('Snead Hall', 'B1021', '/layouts/sh1021.json'),
('Snead Hall', 'B2034', '/layouts/sh2034.json'),
('Snead Hall', 'B3101', '/layouts/sh3101.json'),
('Snead Hall', 'B2045', '/layouts/sh2045.json');

INSERT INTO class_meeting (course_id, meeting_date, qr_code_link, short_url, room_id) VALUES
(1, '2025-03-05', 'https://example.com/qrcode1', 'qr1', 1),
(1, '2025-03-15', 'https://example.com/qrcode2', 'qr2', 1),
(2, '2025-04-03', 'https://example.com/qrcode3', 'qr3', 2),
(3, '2025-04-24', 'https://example.com/qrcode4', 'qr4', 3);

INSERT INTO course_enrollment (student_id, course_id) VALUES
(1001, 1),
(1002, 1),
(1003, 2),
(1004, 3);

INSERT INTO attendance (meeting_id, student_id, seat_position, honor_pledge_signed) VALUES
(1, 1001, 'A1', TRUE),
(1, 1002, 'A2', TRUE),
(3, 1003, 'B1', TRUE),
(4, 1004, 'C3', TRUE);

