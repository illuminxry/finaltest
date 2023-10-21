-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2023 at 05:47 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tesstt`
--

-- --------------------------------------------------------

--
-- Table structure for table `admindetails`
--

CREATE TABLE `admindetails` (
  `id` int(10) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admindetails`
--

INSERT INTO `admindetails` (`id`, `firstname`, `middlename`, `lastname`, `department`, `role`) VALUES
(1, 'Christian Emmanuel', 'Avecilla', 'Pastrana', 'IT', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE `adminlogin` (
  `id` int(11) NOT NULL,
  `userid` varchar(25) NOT NULL,
  `userpw` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`id`, `userid`, `userpw`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `studentID` varchar(25) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `date` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `id` int(11) NOT NULL,
  `lessonID` int(11) NOT NULL,
  `subjectname` varchar(20) DEFAULT NULL,
  `quarterID` int(11) DEFAULT NULL,
  `sectionname` varchar(30) NOT NULL,
  `section1` longtext DEFAULT NULL,
  `section2` longtext DEFAULT NULL,
  `section3` longtext DEFAULT NULL,
  `section4` longtext DEFAULT NULL,
  `section5` longtext DEFAULT NULL,
  `section6` longtext DEFAULT NULL,
  `section7` longtext DEFAULT NULL,
  `section8` longtext DEFAULT NULL,
  `section9` longtext DEFAULT NULL,
  `section10` longtext DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `dateAvailableUntil` date DEFAULT NULL,
  `published` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`id`, `lessonID`, `subjectname`, `quarterID`, `sectionname`, `section1`, `section2`, `section3`, `section4`, `section5`, `section6`, `section7`, `section8`, `section9`, `section10`, `dateCreated`, `dateAvailableUntil`, `published`) VALUES
(1, 0, 'HeKaSi', NULL, '', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '2023-10-08', '2023-10-08', 'Publish'),
(2, 0, 'HeKaSi', NULL, '', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '2023-10-08', '2023-10-08', 'Publish'),
(9, 2, 'Math', 4, '', 'hehe', 'hehe', 'hehe', 'hehe', 'hehe', 'hehe', 'hehe', 'hehe', 'hehe', 'hehe', '2023-09-26', '2023-09-25', 'Publish');

-- --------------------------------------------------------

--
-- Table structure for table `quarter`
--

CREATE TABLE `quarter` (
  `quarterID` int(11) NOT NULL,
  `quarterPeriod` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quarter`
--

INSERT INTO `quarter` (`quarterID`, `quarterPeriod`) VALUES
(1, 'First Quarter'),
(2, 'Second Quarter'),
(3, 'Third Quarter'),
(4, 'Fourth Quarter');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `sectionname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`sectionname`) VALUES
('7-A St. Therese of Calcutta - Edited'),
('8-D St. Ezekiel Moreno');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentID` varchar(25) NOT NULL,
  `Firstname` varchar(25) DEFAULT NULL,
  `Middlename` varchar(25) DEFAULT NULL,
  `Lastname` varchar(25) DEFAULT NULL,
  `yearlevel` varchar(10) DEFAULT NULL,
  `sectionname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentID`, `Firstname`, `Middlename`, `Lastname`, `yearlevel`, `sectionname`) VALUES
('2020-20001', 'Jan Raymarc', 'D', 'Mercado', '7', '7-A St. Therese of Calcutta - Edited');

-- --------------------------------------------------------

--
-- Table structure for table `studentlogin`
--

CREATE TABLE `studentlogin` (
  `id` int(11) NOT NULL,
  `studentID` varchar(25) DEFAULT NULL,
  `studentpassword` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studentlogin`
--

INSERT INTO `studentlogin` (`id`, `studentID`, `studentpassword`) VALUES
(1, '2020-20001', 'janraymarc');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subjectid` varchar(15) DEFAULT NULL,
  `subjectname` varchar(20) NOT NULL,
  `sectionname` varchar(50) DEFAULT NULL,
  `teacherid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subjectid`, `subjectname`, `sectionname`, `teacherid`) VALUES
('6', 'English', NULL, NULL),
('3', 'HeKaSi', NULL, NULL),
('1', 'Math', NULL, NULL),
('5', 'PE', NULL, NULL),
('2', 'Science', NULL, NULL),
('4', 'TLE', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teacherdetails`
--

CREATE TABLE `teacherdetails` (
  `id` int(11) NOT NULL,
  `teacherlogin_id` int(11) DEFAULT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `middlename` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `subjectname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacherdetails`
--

INSERT INTO `teacherdetails` (`id`, `teacherlogin_id`, `firstname`, `middlename`, `lastname`, `subjectname`) VALUES
(1, 1, 'Christian Emmanuel', 'Avecilla', 'Pastrana', 'Math');

-- --------------------------------------------------------

--
-- Table structure for table `teacherlogin`
--

CREATE TABLE `teacherlogin` (
  `id` int(11) NOT NULL,
  `userid` varchar(25) DEFAULT NULL,
  `userpassword` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacherlogin`
--

INSERT INTO `teacherlogin` (`id`, `userid`, `userpassword`) VALUES
(1, 'mceapastrana', 'mceapastrana');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admindetails`
--
ALTER TABLE `admindetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminlogin`
--
ALTER TABLE `adminlogin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject`),
  ADD KEY `fk_attendance_student` (`studentID`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quarterID` (`quarterID`),
  ADD KEY `fk_lesson_subject` (`subjectname`);

--
-- Indexes for table `quarter`
--
ALTER TABLE `quarter`
  ADD PRIMARY KEY (`quarterID`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`sectionname`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`),
  ADD KEY `fk_student_section` (`sectionname`);

--
-- Indexes for table `studentlogin`
--
ALTER TABLE `studentlogin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentID` (`studentID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subjectname`);

--
-- Indexes for table `teacherdetails`
--
ALTER TABLE `teacherdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacherlogin_id` (`teacherlogin_id`),
  ADD KEY `fk_teacherdetails_subject` (`subjectname`);

--
-- Indexes for table `teacherlogin`
--
ALTER TABLE `teacherlogin`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminlogin`
--
ALTER TABLE `adminlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `quarter`
--
ALTER TABLE `quarter`
  MODIFY `quarterID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `studentlogin`
--
ALTER TABLE `studentlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teacherdetails`
--
ALTER TABLE `teacherdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teacherlogin`
--
ALTER TABLE `teacherlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admindetails`
--
ALTER TABLE `admindetails`
  ADD CONSTRAINT `fk_admindetails_adminlogin` FOREIGN KEY (`id`) REFERENCES `adminlogin` (`id`);

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`subject`) REFERENCES `subject` (`subjectname`),
  ADD CONSTRAINT `fk_attendance_student` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`);

--
-- Constraints for table `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `fk_lesson_subject` FOREIGN KEY (`subjectname`) REFERENCES `subject` (`subjectname`),
  ADD CONSTRAINT `lesson_ibfk_1` FOREIGN KEY (`subjectName`) REFERENCES `subject` (`subjectname`),
  ADD CONSTRAINT `lesson_ibfk_2` FOREIGN KEY (`quarterID`) REFERENCES `quarter` (`quarterID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_section` FOREIGN KEY (`sectionname`) REFERENCES `section` (`sectionname`);

--
-- Constraints for table `studentlogin`
--
ALTER TABLE `studentlogin`
  ADD CONSTRAINT `studentlogin_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`);

--
-- Constraints for table `teacherdetails`
--
ALTER TABLE `teacherdetails`
  ADD CONSTRAINT `fk_teacherdetails_subject` FOREIGN KEY (`subjectname`) REFERENCES `subject` (`subjectname`),
  ADD CONSTRAINT `teacherdetails_ibfk_1` FOREIGN KEY (`teacherlogin_id`) REFERENCES `teacherlogin` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
