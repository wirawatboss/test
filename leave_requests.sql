-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2025 at 06:45 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leave_request_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` varchar(50) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `departmentPosition` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(50) DEFAULT NULL,
  `leaveType` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `leaveFrom` date NOT NULL,
  `leaveTo` date NOT NULL,
  `createdAt` datetime NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `fullName`, `departmentPosition`, `email`, `phoneNumber`, `leaveType`, `reason`, `leaveFrom`, `leaveTo`, `createdAt`, `status`) VALUES
('1749659478037', 'วีระวัตร์ ขุนทองจันทร์', 'engineer', 'wirawatboss1245@gmail.com', '0972313061', 'พักร้อน', 'พักผ่อน\n', '2025-06-16', '2025-06-17', '2025-06-11 16:29:00', 'รอพิจารณา'),
('1749660187350', 'วีระวัตร์', 'engineer', 'wirawatboss1245@gmail.com', '0972313061', 'พักร้อน', 'นอน', '2025-06-16', '2025-06-17', '2025-06-11 16:38:00', 'รอพิจารณา');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
