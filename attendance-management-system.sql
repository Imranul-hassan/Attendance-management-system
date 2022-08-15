-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 15, 2022 at 02:59 PM
-- Server version: 8.0.27
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance-management-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `Attendance_Id` int NOT NULL,
  `Teacher_Id` int NOT NULL,
  `Student_Id` int NOT NULL,
  `Course_Id` int NOT NULL,
  `Session_Id` int NOT NULL,
  `Dept_Id` int NOT NULL,
  `Date` datetime NOT NULL,
  `Attend` int NOT NULL,
  PRIMARY KEY (`Attendance_Id`),
  KEY `Session_Id` (`Session_Id`),
  KEY `Student_Id` (`Student_Id`),
  KEY `Teacher_Id` (`Teacher_Id`),
  KEY `Course_Id` (`Course_Id`),
  KEY `Dept_Id` (`Dept_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `Course_Id` int NOT NULL,
  `Course_Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Course_Code` int NOT NULL,
  `Credit` int NOT NULL,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`Course_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `Dept_Id` int NOT NULL,
  `Dept_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Dept_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `Session_Id` int NOT NULL,
  `Session_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Session_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `Student_Id` int NOT NULL,
  `StudentName` int NOT NULL,
  `Dept` varchar(50) NOT NULL,
  `Batch` varchar(50) NOT NULL,
  `Semester` varchar(50) NOT NULL,
  `Mail` varchar(50) NOT NULL,
  PRIMARY KEY (`Student_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `Teacher_Id` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Dept` varchar(50) NOT NULL,
  `Course` varchar(50) NOT NULL,
  `Mail` varchar(100) NOT NULL,
  `Phone` varchar(100) NOT NULL,
  PRIMARY KEY (`Teacher_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE IF NOT EXISTS `user_info` (
  `Id` int NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `Course_Id` FOREIGN KEY (`Course_Id`) REFERENCES `courses` (`Course_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Dept_Id` FOREIGN KEY (`Dept_Id`) REFERENCES `department` (`Dept_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Session_Id` FOREIGN KEY (`Session_Id`) REFERENCES `sessions` (`Session_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Student_Id` FOREIGN KEY (`Student_Id`) REFERENCES `student` (`Student_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Teacher_Id` FOREIGN KEY (`Teacher_Id`) REFERENCES `teacher` (`Teacher_Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
