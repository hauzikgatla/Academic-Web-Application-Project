-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 23, 2026 at 08:45 AM
-- Server version: 8.0.46
-- PHP Version: 8.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tutoring_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE `administrators` (
  `admin_id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`admin_id`, `username`, `password`, `created_at`) VALUES
(1, 'admin_john', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2026-10-07 10:33:48');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int NOT NULL,
  `student_id` int NOT NULL,
  `tutor_id` int NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `booking_status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT 'Requested'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `student_id`, `tutor_id`, `booking_date`, `booking_time`, `booking_status`) VALUES
(1, 1, 1, '2026-11-09', '10:00:00', 'Confirmed'),
(2, 2, 2, '2026-11-10', '14:00:00', 'Requested'),
(3, 3, 1, '2026-10-13', '09:00:00', 'Requested'),
(4, 6, 1, '2026-10-14', '10:28:00', 'Requested'),
(5, 7, 1, '2026-10-13', '09:10:00', 'Requested'),
(6, 9, 1, '2026-10-23', '09:42:00', 'Requested'),
(7, 9, 2, '2026-10-22', '10:49:00', 'Requested'),
(8, 9, 2, '2026-10-22', '10:49:00', 'Requested'),
(9, 9, 1, '2026-10-27', '11:54:00', 'Requested'),
(10, 9, 1, '2026-10-27', '10:14:00', 'Requested'),
(11, 9, 1, '2026-10-27', '10:14:00', 'Requested'),
(12, 9, 1, '2026-10-29', '10:20:00', 'Requested'),
(13, 9, 1, '2026-10-29', '10:20:00', 'Requested');

-- --------------------------------------------------------

--
-- Table structure for table `enrolments`
--

CREATE TABLE `enrolments` (
  `enrolment_id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `programme_id` int DEFAULT NULL,
  `enrolment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrolments`
--

INSERT INTO `enrolments` (`enrolment_id`, `student_id`, `programme_id`, `enrolment_date`) VALUES
(1, 9, 1, '2026-10-23 08:16:01'),
(2, 9, 3, '2026-10-23 08:19:59');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int NOT NULL,
  `student_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT 'Completed',
  `programme_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `student_id`, `amount`, `payment_date`, `payment_status`, `programme_id`) VALUES
(1, 1, 1500.00, '2026-10-07 10:33:49', 'Completed', 0),
(2, 2, 2000.00, '2026-10-07 10:33:49', 'Completed', 0),
(3, 9, 1500.00, '2026-10-23 08:15:59', 'Completed', 1),
(4, 9, 500.00, '2026-10-23 08:19:58', 'Completed', 3);

-- --------------------------------------------------------

--
-- Table structure for table `programmes`
--

CREATE TABLE `programmes` (
  `programme_id` int NOT NULL,
  `programme_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `fee` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `programmes`
--

INSERT INTO `programmes` (`programme_id`, `programme_name`, `description`, `fee`) VALUES
(1, 'Advanced Mathematics', 'Comprehensive calculus, linear algebra, and discrete mathematics.', 1500.00),
(2, 'Data Science Fundamentals', 'Introduction to Python, pandas, and data visualization.', 2000.00),
(3, 'Algebra', 'lets learn', 500.00),
(4, 'Trigonometry', 'lets learn', 500.00),
(5, 'Geometry', 'one single line of code', 490.00),
(6, 'Trigonometry', 'it takes a single line of code', 600.00),
(7, 'Algebra', 'IT TAKES A SINGLE LINE OF CODE.', 120.07),
(8, 'Mathematics', 'Advanced tutoring programme covering algebra, calculus, and statistics.', 1500.00),
(9, 'Data Science', 'Comprehensive training in data analysis, python, and machine learning.', 2000.00),
(10, 'Trigonometry', 'lets learn', 600.00);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `programme_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `full_name`, `email`, `password`, `programme_id`, `created_at`) VALUES
(1, 'Thabo Molefe', 'thabo.molefe@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '2026-10-07 10:33:48'),
(2, 'Chloe Van Der Merwe', 'chloe.vdm@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 2, '2026-10-07 10:33:48'),
(3, 'mohau', 'hauzikgatla@gmail.com', '$2y$10$DuNGwFOTJ9ZltOOpGxEn2ukPQlGsHleNpU2fxB2KVhoT5pfjumBGC', NULL, '2026-10-07 16:57:35'),
(5, 'thobela', 'thobela@gmail.com', '$2y$10$anmEyIyBsgi4m.BgvDh.eeREX8r0rrvPBrbBZRWZaWY4gSzixc.kG', NULL, '2026-10-07 19:06:46'),
(6, 'mohau', 'general@gmail.com', '$2y$10$H18CzbfwC5viTuQ3wxfxPeaRctS7yS8MzEvVojCOm.A3RudMpwh4a', NULL, '2026-10-07 19:27:05'),
(7, 'Motjatji', 'motjatji@gmail.com', '$2y$10$kRsUMBhPa0cRqxYJHjyQz.87cqwYl5F.rl9FDHFoTJQRuplPUevBG', NULL, '2026-10-08 13:06:20'),
(9, 'Mhaw king Em', 'mhawkingem@gmail.com', '$2y$10$TW..w7yWJLWmCjwhZw3vNeAoapLx8r9rV.BB7H9XYJfwczAB2hsRO', NULL, '2026-10-22 11:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `tutors`
--

CREATE TABLE `tutors` (
  `tutor_id` int NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `specialisation` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `availability` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tutors`
--

INSERT INTO `tutors` (`tutor_id`, `full_name`, `email`, `specialisation`, `availability`) VALUES
(1, 'Dr. Sipho Zulu', 'sipho.zulu@tutoring.co.za', 'Mathematics', 'Monday - Friday 08:00 - 16:00'),
(2, 'Sarah Connor', 'sarah.connor@tutoring.co.za', 'Data Science', 'Monday - Friday 10:00 - 17:00');

-- --------------------------------------------------------

--
-- Table structure for table `tutor_availability`
--

CREATE TABLE `tutor_availability` (
  `availability_id` int NOT NULL,
  `tutor_id` int NOT NULL,
  `available_day` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tutor_availability`
--

INSERT INTO `tutor_availability` (`availability_id`, `tutor_id`, `available_day`, `start_time`, `end_time`, `status`) VALUES
(1, 1, 'Monday', '09:00:00', '12:00:00', 'Available'),
(2, 1, 'Wednesday', '13:00:00', '16:00:00', 'Available'),
(3, 2, 'Tuesday', '10:00:00', '13:00:00', 'Available'),
(4, 2, 'Thursday', '14:00:00', '17:00:00', 'Available');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `tutor_id` (`tutor_id`);

--
-- Indexes for table `enrolments`
--
ALTER TABLE `enrolments`
  ADD PRIMARY KEY (`enrolment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `programme_id` (`programme_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `programmes`
--
ALTER TABLE `programmes`
  ADD PRIMARY KEY (`programme_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `programme_id` (`programme_id`);

--
-- Indexes for table `tutors`
--
ALTER TABLE `tutors`
  ADD PRIMARY KEY (`tutor_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tutor_availability`
--
ALTER TABLE `tutor_availability`
  ADD PRIMARY KEY (`availability_id`),
  ADD KEY `tutor_id` (`tutor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrators`
--
ALTER TABLE `administrators`
  MODIFY `admin_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `enrolments`
--
ALTER TABLE `enrolments`
  MODIFY `enrolment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `programmes`
--
ALTER TABLE `programmes`
  MODIFY `programme_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tutors`
--
ALTER TABLE `tutors`
  MODIFY `tutor_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tutor_availability`
--
ALTER TABLE `tutor_availability`
  MODIFY `availability_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`tutor_id`) REFERENCES `tutors` (`tutor_id`) ON DELETE CASCADE;

--
-- Constraints for table `enrolments`
--
ALTER TABLE `enrolments`
  ADD CONSTRAINT `enrolments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `enrolments_ibfk_2` FOREIGN KEY (`programme_id`) REFERENCES `programmes` (`programme_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`programme_id`) REFERENCES `programmes` (`programme_id`) ON DELETE SET NULL;

--
-- Constraints for table `tutor_availability`
--
ALTER TABLE `tutor_availability`
  ADD CONSTRAINT `tutor_availability_ibfk_1` FOREIGN KEY (`tutor_id`) REFERENCES `tutors` (`tutor_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
