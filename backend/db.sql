-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS attendance_db;
USE attendance_db;

-- Users table (for both students and teachers)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    role ENUM('student', 'teacher') NOT NULL
);

-- Classes table
CREATE TABLE IF NOT EXISTS classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Subjects table
CREATE TABLE IF NOT EXISTS subjects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Student-Class mapping
CREATE TABLE IF NOT EXISTS student_class (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    class_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (class_id) REFERENCES classes(id) ON DELETE CASCADE
);

-- Attendance records
CREATE TABLE IF NOT EXISTS attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    class_id INT NOT NULL,
    date DATE NOT NULL,
    hours INT NOT NULL,
    status ENUM('present', 'absent') NOT NULL,
    marked_by INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE,
    FOREIGN KEY (class_id) REFERENCES classes(id) ON DELETE CASCADE,
    FOREIGN KEY (marked_by) REFERENCES users(id) ON DELETE CASCADE
);

-- Insert sample data for testing

-- Insert classes
INSERT INTO classes (name) VALUES 
('CSE A'),
('CSE B');

-- Insert subjects
INSERT INTO subjects (name) VALUES 
('DBMS'),
('OS'),
('Data Structures'),
('Computer Networks');

-- Insert sample users (teachers and students)
-- Note: In a real application, passwords should be hashed
INSERT INTO users (username, password, name, role) VALUES
-- Teachers
('teacher1', 'password123', 'John Smith', 'teacher'),
('teacher2', 'password123', 'Jane Doe', 'teacher'),
-- Students
('student1', 'password123', 'Alice Johnson', 'student'),
('student2', 'password123', 'Bob Williams', 'student'),
('student3', 'password123', 'Charlie Brown', 'student'),
('student4', 'password123', 'Diana Miller', 'student'),
('student5', 'password123', 'Edward Davis', 'student'),
('student6', 'password123', 'Fiona Wilson', 'student'),
('student7', 'password123', 'George Moore', 'student'),
('student8', 'password123', 'Hannah Taylor', 'student'),
('student9', 'password123', 'Ian Anderson', 'student'),
('student10', 'password123', 'Julia Thomas', 'student');

-- Assign students to classes
INSERT INTO student_class (student_id, class_id) VALUES
(3, 1), -- Alice in Class A
(4, 1), -- Bob in Class A
(5, 1), -- Charlie in Class A
(6, 1), -- Diana in Class A
(7, 1), -- Edward in Class A
(8, 2), -- Fiona in Class B
(9, 2), -- George in Class B
(10, 2), -- Hannah in Class B
(11, 2), -- Ian in Class B
(12, 2); -- Julia in Class B

-- -- Insert some sample attendance records
-- INSERT INTO attendance (student_id, subject_id, class_id, date, hours, status, marked_by) VALUES
-- -- DBMS class on March 1, 2024 for Class A
-- (3, 1, 1, '2024-03-01', 4, 'present', 1),
-- (4, 1, 1, '2024-03-01', 4, 'present', 1),
-- (5, 1, 1, '2024-03-01', 4, 'present', 1),
-- (6, 1, 1, '2024-03-01', 4, 'present', 1),
-- (7, 1, 1, '2024-03-01', 4, 'absent', 1),

-- -- Web Development class on March 2, 2024 for Class A
-- (3, 2, 1, '2024-03-02', 4, 'present', 2),
-- (4, 2, 1, '2024-03-02', 4, 'present', 2),
-- (5, 2, 1, '2024-03-02', 4, 'absent', 2),
-- (6, 2, 1, '2024-03-02', 4, 'absent', 2),
-- (7, 2, 1, '2024-03-02', 4, 'absent', 2),

-- -- Data Structures class on March 3, 2024 for Class B
-- (8, 3, 2, '2024-03-03', 1, 'present', 1),
-- (9, 3, 2, '2024-03-03', 1, 'absent', 1),
-- (10, 3, 2, '2024-03-03', 1, 'absent', 1),
-- (11, 3, 2, '2024-03-03', 1, 'absent', 1),
-- (12, 3, 2, '2024-03-03', 1, 'absent', 1),

-- -- Computer Networks class on March 4, 2024 for Class B
-- (8, 4, 2, '2024-03-04', 1, 'present', 2),
-- (9, 4, 2, '2024-03-04', 1, 'absent', 2),
-- (10, 4, 2, '2024-03-04', 1, 'absent', 2),
-- (11, 4, 2, '2024-03-04', 1, 'absent', 2),
-- (12, 4, 2, '2024-03-04', 1, 'absent', 2);
