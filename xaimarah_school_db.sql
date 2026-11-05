-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2026 at 05:27 AM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xaimarah_school_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `achievement_id` int(11) NOT NULL,
  `achievement_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `activity_id` int(11) NOT NULL,
  `activity_type_id` int(11) NOT NULL,
  `quarter_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `total_points` decimal(6,2) DEFAULT NULL,
  `status` enum('Active','Closed') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_types`
--

CREATE TABLE `activity_types` (
  `activity_type_id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `weight` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `audience_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `status` enum('Draft','Scheduled','Published') DEFAULT 'Draft'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `attendance_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `quarter_id` int(11) NOT NULL,
  `attendance_status_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `remarks` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_statuses`
--

CREATE TABLE `attendance_statuses` (
  `attendance_status_id` int(11) NOT NULL,
  `status_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance_statuses`
--

INSERT INTO `attendance_statuses` (`attendance_status_id`, `status_name`) VALUES
(2, 'Absent'),
(4, 'Excused'),
(3, 'Late'),
(1, 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `audience`
--

CREATE TABLE `audience` (
  `audience_id` int(11) NOT NULL,
  `audience_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audience`
--

INSERT INTO `audience` (`audience_id`, `audience_name`) VALUES
(1, 'All'),
(2, 'Parents'),
(4, 'Staff'),
(3, 'Teachers');

-- --------------------------------------------------------

--
-- Table structure for table `behavior_records`
--

CREATE TABLE `behavior_records` (
  `behavior_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `quarter_id` int(11) NOT NULL,
  `record_date` date NOT NULL,
  `behavior_type` enum('Positive','Needs Improvement') NOT NULL,
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `billing_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `amount_due` decimal(10,2) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` enum('Paid','Partial','Unpaid') DEFAULT 'Unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_schedules`
--

CREATE TABLE `class_schedules` (
  `schedule_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `day_id` int(11) NOT NULL,
  `day_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`day_id`, `day_name`) VALUES
(5, 'Friday'),
(1, 'Monday'),
(4, 'Thursday'),
(2, 'Tuesday'),
(3, 'Wednesday');

-- --------------------------------------------------------

--
-- Table structure for table `document_type`
--

CREATE TABLE `document_type` (
  `document_type_id` int(11) NOT NULL,
  `document_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `grade_level_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `enrollment_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_type`
--

CREATE TABLE `enrollment_type` (
  `enrollment_type_id` int(11) NOT NULL,
  `enrollment_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `event_type` enum('Exam Week','School Event','Deadline','Enrollment') DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `gender_id` int(11) NOT NULL,
  `gender_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`gender_id`, `gender_name`) VALUES
(2, 'Female'),
(1, 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `quarter_id` int(11) NOT NULL,
  `remarks` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grade_details`
--

CREATE TABLE `grade_details` (
  `grade_detail_id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `activity_type_id` int(11) NOT NULL,
  `transmutation_id` int(11) DEFAULT NULL,
  `raw_grade` decimal(5,2) DEFAULT NULL,
  `transmuted_grade` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grade_levels`
--

CREATE TABLE `grade_levels` (
  `grade_level_id` int(11) NOT NULL,
  `grade_name` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grade_levels`
--

INSERT INTO `grade_levels` (`grade_level_id`, `grade_name`, `description`) VALUES
(1, 'Grade 1', NULL),
(2, 'Grade 2', NULL),
(3, 'Grade 3', NULL),
(4, 'Grade 4', NULL),
(5, 'Grade 5', NULL),
(6, 'Grade 6', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `guardians`
--

CREATE TABLE `guardians` (
  `guardian_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `marital_status_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guardian_relationship`
--

CREATE TABLE `guardian_relationship` (
  `relationship_id` int(11) NOT NULL,
  `relationship_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `holiday_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `holiday_name` varchar(100) DEFAULT NULL,
  `holiday_date` date DEFAULT NULL,
  `holiday_type` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marital_statuses`
--

CREATE TABLE `marital_statuses` (
  `marital_status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_classes`
--

CREATE TABLE `online_classes` (
  `online_class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `meeting_link` varchar(255) DEFAULT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `status` enum('Scheduled','Ongoing','Completed','Cancelled') DEFAULT 'Scheduled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `billing_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `receipt_number` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `payment_method_id` int(11) NOT NULL,
  `method_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`payment_method_id`, `method_name`) VALUES
(1, 'Cash'),
(2, 'GCash'),
(3, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `quarters`
--

CREATE TABLE `quarters` (
  `quarter_id` int(11) NOT NULL,
  `quarter_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quarters`
--

INSERT INTO `quarters` (`quarter_id`, `quarter_name`) VALUES
(1, 'Q1'),
(2, 'Q2'),
(3, 'Q3'),
(4, 'Q4');

-- --------------------------------------------------------

--
-- Table structure for table `question_options`
--

CREATE TABLE `question_options` (
  `option_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_text` varchar(255) DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `quiz_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `grade_level_id` int(11) NOT NULL,
  `topic` varchar(150) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `material_type` enum('Quiz','Worksheet') DEFAULT NULL,
  `status` enum('Draft','Final') DEFAULT 'Draft',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_answers`
--

CREATE TABLE `quiz_answers` (
  `answer_id` int(11) NOT NULL,
  `attempt_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_given` text DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempts`
--

CREATE TABLE `quiz_attempts` (
  `attempt_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `score` decimal(6,2) DEFAULT NULL,
  `taken_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_items`
--

CREATE TABLE `quiz_items` (
  `quiz_item_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `item_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `question_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `grade_level_id` int(11) NOT NULL,
  `topic` varchar(150) DEFAULT NULL,
  `difficulty` enum('Easy','Medium','Hard') NOT NULL DEFAULT 'Medium',
  `question_type` enum('Multiple Choice','True or False','Identification','Fill in the Blank') DEFAULT NULL,
  `question_text` text DEFAULT NULL,
  `correct_answer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `report_type_id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `generated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_type`
--

CREATE TABLE `report_type` (
  `report_type_id` int(11) NOT NULL,
  `report_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `description`) VALUES
(1, 'Administrator', 'Sample administrator role'),
(2, 'Registrar', 'Sample registrar role'),
(3, 'Teacher', 'Sample teacher role'),
(4, 'Finance', 'Sample finance staff role'),
(5, 'Parent', 'Sample parent role');

-- --------------------------------------------------------

--
-- Table structure for table `school_years`
--

CREATE TABLE `school_years` (
  `school_year_id` int(11) NOT NULL,
  `school_year` varchar(20) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('Active','Inactive','Completed') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `section_id` int(11) NOT NULL,
  `grade_level_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `section_name` varchar(50) DEFAULT NULL,
  `room_number` varchar(20) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `lrn` varchar(12) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_achievements`
--

CREATE TABLE `student_achievements` (
  `student_achievement_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `achievement_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `date_awarded` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_documents`
--

CREATE TABLE `student_documents` (
  `document_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `status` enum('Submitted','Pending') DEFAULT NULL,
  `submitted_date` date DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_follow_ups`
--

CREATE TABLE `student_follow_ups` (
  `follow_up_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `follow_up_date` date NOT NULL,
  `risk_type` enum('Absences','Missing Activities','Low Grades','Other') NOT NULL,
  `action_taken` text DEFAULT NULL,
  `parent_contacted` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('Open','Monitoring','Resolved') NOT NULL DEFAULT 'Open',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_guardians`
--

CREATE TABLE `student_guardians` (
  `student_guardian_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `guardian_id` int(11) NOT NULL,
  `relationship_id` int(11) NOT NULL,
  `is_emergency_contact` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_code` varchar(20) NOT NULL,
  `subject_name` varchar(100) DEFAULT NULL,
  `grade_level_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `submission_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `score` decimal(6,2) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `status` enum('Submitted','Late','Graded','Missing') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `employee_number` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `status` enum('Active','On Leave','Transferred','Resigned') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transmutation_table`
--

CREATE TABLE `transmutation_table` (
  `transmutation_id` int(11) NOT NULL,
  `min_grade` decimal(5,2) DEFAULT NULL,
  `max_grade` decimal(5,2) DEFAULT NULL,
  `transmuted_grade` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role_id`, `username`, `password`, `status`, `created_at`) VALUES
(1, 1, 'leah_nicolas', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(2, 1, 'april_reyes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(3, 1, 'danica_ocampo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(4, 1, 'james_pineda', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(5, 1, 'elijah_tan', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(6, 2, 'regina_mendoza', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(7, 2, 'sarah_molina', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(8, 2, 'chloe_fabian', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(9, 2, 'ivan_abalos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(10, 2, 'evelyn_valencia', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(11, 2, 'eric_rosales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(12, 2, 'ian_valdez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(13, 2, 'charles_delossantos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(14, 2, 'paula_nicolas', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(15, 2, 'adrian_bautista', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(16, 2, 'samuel_herrera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(17, 2, 'alan_sanchez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(18, 2, 'esther_paredes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(19, 2, 'victor_ramirez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(20, 2, 'jamie_castro', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(21, 2, 'ivan_caballero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(22, 2, 'gloria_jimenez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(23, 2, 'chloe_alvarez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(24, 2, 'julian_lim', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(25, 2, 'ella_diaz', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(26, 2, 'kimberly_martinez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(27, 2, 'charles_ferrer', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(28, 2, 'aaron_nicolas', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(29, 2, 'dominic_gutierrez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(30, 2, 'mark_ramirez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(31, 2, 'carlos_reyes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(32, 2, 'manuel_villanueva', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(33, 2, 'joel_morales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(34, 2, 'ramon_campos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(35, 2, 'joshua_tan', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(36, 2, 'ivan_borja', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(37, 2, 'hannah_ramos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(38, 2, 'bianca_chavez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(39, 2, 'gloria_yap', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(40, 2, 'bianca_ferrer', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(41, 2, 'gabriela_villanueva', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(42, 2, 'edith_abella', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(43, 2, 'nathan_delossantos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(44, 2, 'karen_ramirez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(45, 2, 'nathan_molina', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(46, 3, 'abigail_jimenez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(47, 3, 'eduardo_molina', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(48, 3, 'hazel_pineda', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(49, 3, 'rose_cabrera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(50, 3, 'stephen_rivera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(51, 3, 'miguel_velasco', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(52, 3, 'eduardo_mercado', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(53, 3, 'nathan_bautista', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(54, 3, 'hannah_diaz', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(55, 3, 'elijah_paredes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(56, 3, 'audrey_lucero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(57, 3, 'stephen_aguilar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(58, 3, 'regina_castillo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(59, 3, 'charles_castro', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(60, 3, 'luis_molina', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(61, 3, 'charles_mercado', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(62, 3, 'stephen_ocampo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(63, 3, 'diana_calderon', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(64, 3, 'anthony_manalo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(65, 3, 'alexa_romero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(66, 3, 'edgar_campos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(67, 3, 'jade_valdez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(68, 3, 'hazel_laurel', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(69, 3, 'gloria_francisco', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(70, 3, 'jason_pascual', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(71, 3, 'donna_borja', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(72, 3, 'ella_calderon', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(73, 3, 'laura_garcia', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(74, 3, 'philip_perez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(75, 3, 'patrick_arellano', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(76, 3, 'julia_torres', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(77, 3, 'jade_tan', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(78, 3, 'margaret_torres', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(79, 3, 'angela_ferrer', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(80, 3, 'zoe_campos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(81, 3, 'esther_flores', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(82, 3, 'david_rodriguez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(83, 3, 'michael_abad', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(84, 3, 'oscar_castro', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(85, 3, 'esther_fabian', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(86, 3, 'stephen_chavez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(87, 3, 'robert_lucero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(88, 3, 'april_laurel', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(89, 3, 'dominic_yap', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(90, 3, 'ethan_romero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(91, 3, 'samantha_escobar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(92, 3, 'christian_garcia', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(93, 3, 'edgar_laurel', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(94, 3, 'carla_escobar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(95, 3, 'evelyn_hernandez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(96, 3, 'sandra_herrera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(97, 3, 'felix_fernandez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(98, 3, 'philip_ortega', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(99, 3, 'jasmine_lucero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(100, 3, 'paula_ocampo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(101, 3, 'ramon_abalos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(102, 3, 'rebecca_abad', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(103, 3, 'joshua_escobar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(104, 3, 'noel_mendoza', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(105, 3, 'mary_lucero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(106, 3, 'katherine_aguilar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(107, 3, 'alice_alvarez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(108, 3, 'rica_velasco', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(109, 3, 'ruby_molina', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(110, 3, 'maureen_castillo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(111, 3, 'nathan_cervantes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(112, 3, 'harold_escobar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(113, 3, 'mark_morales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(114, 3, 'mary_ramos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(115, 3, 'thomas_abad', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(116, 3, 'aileen_ortega', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(117, 3, 'ryan_aguilar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(118, 3, 'rica_bautista', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(119, 3, 'jason_tan', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(120, 3, 'kristine_aquino', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(121, 3, 'leah_morales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(122, 3, 'bernard_lopez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(123, 3, 'edgar_ignacio', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(124, 3, 'arnold_sanchez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(125, 3, 'daniel_abalos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(126, 3, 'gloria_campos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(127, 3, 'beatrice_valdez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(128, 3, 'christian_ocampo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(129, 3, 'lucas_lacson', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(130, 3, 'susan_escobar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(131, 3, 'daniel_alvarez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(132, 3, 'martin_escobar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(133, 3, 'sheila_lacson', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(134, 3, 'patricia_herrera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(135, 3, 'hazel_gonzales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(136, 3, 'joel_bernardo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(137, 3, 'isabel_moreno', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(138, 3, 'francis_robles', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(139, 3, 'irene_fajardo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(140, 3, 'eric_reyes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(141, 3, 'andrea_yap', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(142, 3, 'kimberly_flores', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(143, 3, 'roberto_hernandez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(144, 3, 'marco_romero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(145, 3, 'samuel_jimenez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(146, 3, 'aileen_salazar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(147, 3, 'lucas_castro', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(148, 3, 'sandra_rodriguez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(149, 3, 'eva_jimenez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(150, 3, 'sandra_cervantes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(151, 3, 'gabriela_molina', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(152, 3, 'edith_gonzales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(153, 3, 'monica_cervantes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(154, 3, 'bianca_marquez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(155, 3, 'arnold_ocampo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(156, 3, 'marco_sanchez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(157, 3, 'ian_ortega', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(158, 3, 'leah_yap', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(159, 3, 'eduardo_caballero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(160, 3, 'sophia_escobar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(161, 3, 'ivan_romero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(162, 3, 'angela_castillo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(163, 3, 'elaine_marquez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(164, 3, 'ryan_ocampo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(165, 3, 'kimberly_aguilar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(166, 3, 'eric_salazar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(167, 3, 'manuel_yap', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(168, 3, 'richard_campos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(169, 3, 'sandra_tan', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(170, 3, 'paula_castillo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(171, 3, 'carmen_valencia', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(172, 3, 'anna_flores', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(173, 3, 'carmen_evangelista', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(174, 3, 'luis_reyes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(175, 3, 'elaine_lucero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(176, 3, 'bianca_bautista', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(177, 3, 'rebecca_aquino', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(178, 3, 'samuel_ramos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(179, 3, 'anthony_ocampo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(180, 3, 'arnold_diaz', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(181, 3, 'jason_borja', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(182, 3, 'gloria_rosales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(183, 3, 'sean_reyes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(184, 3, 'mary_evangelista', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(185, 3, 'kimberly_delacruz', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(186, 3, 'isabel_medina', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(187, 3, 'jessica_soriano', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(188, 3, 'bernard_enriquez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(189, 3, 'arnold_chavez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(190, 3, 'elaine_evangelista', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(191, 3, 'stephen_manalo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(192, 3, 'jade_torres', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(193, 3, 'robert_rodriguez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(194, 3, 'lucas_tan', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(195, 3, 'noel_mercado', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(196, 3, 'gabriela_yap', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(197, 3, 'mark_fabian', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(198, 3, 'jasmine_chavez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(199, 3, 'hazel_perez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(200, 3, 'ian_calderon', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(201, 3, 'george_mendoza', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(202, 3, 'carlos_castro', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(203, 3, 'irene_santiago', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(204, 3, 'leonard_diaz', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(205, 3, 'alexa_ortega', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(206, 3, 'jonathan_tan', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(207, 3, 'matthew_mendoza', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(208, 3, 'sarah_espinosa', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(209, 3, 'karen_francisco', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(210, 3, 'clara_rosales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(211, 3, 'angela_herrera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(212, 3, 'susan_chavez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(213, 3, 'thomas_medina', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(214, 3, 'joshua_torres', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(215, 3, 'esther_francisco', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(216, 3, 'justin_fabian', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(217, 3, 'sophia_herrera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(218, 3, 'sheila_cabrera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(219, 3, 'angela_paredes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(220, 3, 'adrian_cervantes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(221, 3, 'joseph_cervantes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(222, 3, 'francis_abalos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(223, 3, 'joshua_perez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(224, 3, 'ethan_perez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(225, 3, 'donna_lopez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(226, 3, 'anna_caballero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(227, 3, 'cedric_fernandez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(228, 3, 'justin_velasco', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(229, 3, 'martin_valencia', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(230, 3, 'brian_rosales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(231, 3, 'luis_alcantara', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(232, 3, 'anthony_chavez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(233, 3, 'roberto_medina', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(234, 3, 'vincent_lopez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(235, 3, 'karen_borja', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(236, 3, 'kristine_pascual', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(237, 3, 'julia_pineda', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(238, 3, 'laura_laurel', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(239, 3, 'carla_valdez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(240, 3, 'ruby_garcia', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(241, 3, 'stephen_pineda', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(242, 3, 'margaret_evangelista', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(243, 3, 'ella_francisco', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(244, 3, 'brian_arellano', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(245, 3, 'samantha_herrera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(246, 4, 'bianca_valencia', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(247, 4, 'edgar_valencia', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(248, 4, 'nathan_ramirez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(249, 4, 'alan_zamora', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(250, 4, 'kimberly_gutierrez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(251, 4, 'felix_caballero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(252, 4, 'mark_alcantara', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(253, 4, 'sheila_mercado', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(254, 4, 'ethan_marquez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(255, 4, 'patricia_martinez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(256, 4, 'janet_herrera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(257, 4, 'regina_fajardo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(258, 4, 'hannah_ramirez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(259, 4, 'charles_villanueva', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(260, 4, 'benjamin_perez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(261, 4, 'gloria_flores', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(262, 4, 'ivan_diaz', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(263, 4, 'gloria_domingo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(264, 4, 'janet_pascual', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(265, 4, 'hazel_abalos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(266, 4, 'sheila_mendoza', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(267, 4, 'ruby_mercado', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(268, 4, 'arnold_reyes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(269, 4, 'ivan_sanchez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(270, 4, 'aileen_austria', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(271, 4, 'brandon_bernardo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(272, 4, 'leonard_navarro', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(273, 4, 'gabriel_bautista', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(274, 4, 'harold_cruz', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(275, 4, 'daniel_abella', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(276, 4, 'abigail_lucero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(277, 4, 'noel_jimenez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(278, 4, 'adrian_pascual', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(279, 4, 'oscar_marquez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(280, 4, 'rose_reyes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(281, 4, 'liam_mendoza', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(282, 4, 'dominic_valdez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(283, 4, 'esther_moreno', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(284, 4, 'lucas_fernandez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(285, 4, 'victor_aguilar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(286, 4, 'joy_cruz', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(287, 4, 'aileen_cervantes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(288, 4, 'sean_valdez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(289, 4, 'jamie_fernandez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(290, 4, 'diana_romero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(291, 4, 'elijah_rodriguez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(292, 4, 'vanessa_ramos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(293, 4, 'jamie_villanueva', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(294, 4, 'joel_alvarez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(295, 4, 'angela_ramos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(296, 5, 'evelyn_valdez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(297, 5, 'miguel_delacruz', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(298, 5, 'arnold_ramirez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(299, 5, 'maria_fernandez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(300, 5, 'john_santos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(301, 5, 'sarah_valdez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(302, 5, 'katherine_espinosa', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(303, 5, 'daniel_enriquez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(304, 5, 'sheila_yap', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(305, 5, 'jason_santiago', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(306, 5, 'grace_alvarez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(307, 5, 'samuel_fernandez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(308, 5, 'jamie_aguilar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(309, 5, 'bernard_abad', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(310, 5, 'rica_abella', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(311, 5, 'nathan_nicolas', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(312, 5, 'chloe_abad', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(313, 5, 'alan_rosales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(314, 5, 'irene_zamora', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(315, 5, 'alice_laurel', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(316, 5, 'sophia_ocampo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(317, 5, 'isabel_rodriguez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(318, 5, 'cedric_flores', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(319, 5, 'kristine_manalo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(320, 5, 'samantha_robles', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(321, 5, 'bernard_tan', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(322, 5, 'monica_cabrera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(323, 5, 'jasmine_romero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(324, 5, 'john_calderon', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(325, 5, 'evelyn_campos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(326, 5, 'kimberly_cruz', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(327, 5, 'clara_soriano', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(328, 5, 'ramon_diaz', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(329, 5, 'eric_valdez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(330, 5, 'oscar_valdez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(331, 5, 'joseph_gutierrez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(332, 5, 'catherine_chavez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(333, 5, 'dominic_robles', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(334, 5, 'olivia_delossantos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(335, 5, 'evelyn_santos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(336, 5, 'jessica_rodriguez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(337, 5, 'luis_gonzales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(338, 5, 'victor_castillo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(339, 5, 'ella_sanchez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(340, 5, 'chloe_fajardo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(341, 5, 'hazel_lim', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(342, 5, 'joel_ramirez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(343, 5, 'joy_pineda', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(344, 5, 'april_molina', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(345, 5, 'philip_cervantes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(346, 5, 'brian_enriquez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(347, 5, 'arnold_aquino', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(348, 5, 'marian_ortega', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(349, 5, 'paula_ramos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(350, 5, 'julia_ignacio', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(351, 5, 'ethan_aguilar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(352, 5, 'gabriel_valencia', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(353, 5, 'grace_ferrer', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(354, 5, 'manuel_enriquez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(355, 5, 'adrian_ortega', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(356, 5, 'lucas_lopez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(357, 5, 'maria_medina', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(358, 5, 'benjamin_molina', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(359, 5, 'bernard_paredes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(360, 5, 'bianca_perez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(361, 5, 'roberto_zamora', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(362, 5, 'ashley_beltran', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(363, 5, 'manuel_fabian', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(364, 5, 'nicole_arellano', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(365, 5, 'elijah_sanchez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(366, 5, 'felix_hernandez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(367, 5, 'rafael_molina', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(368, 5, 'harold_jimenez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(369, 5, 'carlos_ignacio', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(370, 5, 'jonathan_chavez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(371, 5, 'catherine_torres', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(372, 5, 'julian_gutierrez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(373, 5, 'emmanuel_laurel', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(374, 5, 'susan_caballero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(375, 5, 'eva_aquino', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(376, 5, 'angela_fabian', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(377, 5, 'kevin_torres', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(378, 5, 'leah_lim', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(379, 5, 'abigail_lopez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(380, 5, 'beatrice_evangelista', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(381, 5, 'rebecca_robles', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(382, 5, 'eduardo_aguilar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(383, 5, 'francis_delossantos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(384, 5, 'leah_austria', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(385, 5, 'kristine_enriquez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(386, 5, 'richard_suarez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(387, 5, 'jasmine_abalos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(388, 5, 'hazel_cervantes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(389, 5, 'irene_alcantara', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(390, 5, 'henry_ortega', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(391, 5, 'james_perez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(392, 5, 'catherine_campos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(393, 5, 'sandra_rosales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(394, 5, 'sandra_sanchez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(395, 5, 'rebecca_soriano', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(396, 5, 'jasmine_cruz', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(397, 5, 'rafael_austria', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(398, 5, 'brandon_navarro', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(399, 5, 'thomas_gonzales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(400, 5, 'gloria_morales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(401, 5, 'nathan_bernardo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(402, 5, 'beatrice_ferrer', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(403, 5, 'george_austria', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(404, 5, 'angela_delacruz', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(405, 5, 'rica_ferrer', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(406, 5, 'stephanie_molina', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(407, 5, 'jonathan_fernandez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(408, 5, 'francis_fabian', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15');
INSERT INTO `users` (`user_id`, `role_id`, `username`, `password`, `status`, `created_at`) VALUES
(409, 5, 'gabriel_jimenez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(410, 5, 'edith_borja', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(411, 5, 'liam_alvarez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(412, 5, 'joel_velasco', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(413, 5, 'regina_alvarez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(414, 5, 'irene_hernandez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(415, 5, 'ella_rivera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(416, 5, 'richard_cabrera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(417, 5, 'miguel_flores', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(418, 5, 'sarah_rosales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(419, 5, 'edith_medina', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(420, 5, 'edith_jimenez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(421, 5, 'katherine_caballero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(422, 5, 'ashley_campos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(423, 5, 'sheila_espinosa', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(424, 5, 'lance_romero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(425, 5, 'erika_ferrer', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(426, 5, 'noel_rosales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(427, 5, 'samuel_gutierrez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(428, 5, 'stephen_ramos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(429, 5, 'michael_pascual', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(430, 5, 'joy_ignacio', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(431, 5, 'anthony_rodriguez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(432, 5, 'sarah_arellano', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(433, 5, 'bernard_alcantara', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(434, 5, 'angela_rivera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(435, 5, 'john_velasco', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(436, 5, 'joseph_bernardo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(437, 5, 'liam_francisco', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(438, 5, 'bianca_fernandez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(439, 5, 'brandon_fabian', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(440, 5, 'stephanie_caballero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(441, 5, 'ethan_sanchez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(442, 5, 'patrick_alvarez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(443, 5, 'christian_cabrera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(444, 5, 'michelle_delacruz', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(445, 5, 'kristine_francisco', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(446, 5, 'oscar_lacson', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(447, 5, 'jamie_ramirez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(448, 5, 'bernard_evangelista', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(449, 5, 'ramon_laurel', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(450, 5, 'katherine_cervantes', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(451, 5, 'richard_tan', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(452, 5, 'thomas_romero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(453, 5, 'diana_delacruz', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(454, 5, 'kristine_gutierrez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(455, 5, 'allan_valencia', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(456, 5, 'patricia_velasco', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(457, 5, 'arnold_gutierrez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(458, 5, 'hazel_santos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(459, 5, 'rebecca_aguilar', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(460, 5, 'aaron_ferrer', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(461, 5, 'sandra_morales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(462, 5, 'james_rivera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(463, 5, 'daniel_tan', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(464, 5, 'joshua_moreno', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(465, 5, 'gloria_manalo', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(466, 5, 'leonard_mercado', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(467, 5, 'lance_alvarez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(468, 5, 'david_jimenez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(469, 5, 'donna_tan', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(470, 5, 'edith_gutierrez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(471, 5, 'mark_velasco', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(472, 5, 'julian_diaz', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(473, 5, 'eva_pascual', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(474, 5, 'alan_alvarez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(475, 5, 'richard_ramos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(476, 5, 'donna_santos', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(477, 5, 'ruby_cabrera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(478, 5, 'philip_molina', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(479, 5, 'luis_nicolas', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(480, 5, 'samuel_laurel', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(481, 5, 'rafael_beltran', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(482, 5, 'kevin_valdez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(483, 5, 'danica_flores', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(484, 5, 'sean_cabrera', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(485, 5, 'cedric_valencia', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(486, 5, 'jonathan_romero', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(487, 5, 'paula_laurel', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(488, 5, 'maureen_ortega', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(489, 5, 'arnold_borja', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(490, 5, 'patricia_laurel', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(491, 5, 'anna_ferrer', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(492, 5, 'christian_morales', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(493, 5, 'carlos_torres', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(494, 5, 'leah_torres', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(495, 5, 'michelle_aquino', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(496, 5, 'andrea_evangelista', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(497, 5, 'irene_garcia', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(498, 5, 'joseph_mercado', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(499, 5, 'gloria_austria', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15'),
(500, 5, 'elaine_hernandez', '$2y$12$2bMGUsJw2CSgAQvrux5h.eP5kPRIjm7nRGg2783Rjr/Y5Gwb0rxpK', 'Active', '2026-10-19 08:24:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`achievement_id`),
  ADD UNIQUE KEY `uq_achievements_achievement_name` (`achievement_name`);

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `fk_activities_activity_type_id` (`activity_type_id`),
  ADD KEY `fk_activities_quarter_id` (`quarter_id`),
  ADD KEY `fk_activities_subject_id` (`subject_id`),
  ADD KEY `fk_activities_teacher_id` (`teacher_id`),
  ADD KEY `fk_activities_section_id` (`section_id`);

--
-- Indexes for table `activity_types`
--
ALTER TABLE `activity_types`
  ADD PRIMARY KEY (`activity_type_id`),
  ADD UNIQUE KEY `uq_activity_types_type_name` (`type_name`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `fk_announcements_user_id` (`user_id`),
  ADD KEY `fk_announcements_audience_id` (`audience_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`attendance_id`),
  ADD UNIQUE KEY `uq_attendance_student_date` (`student_id`,`attendance_date`),
  ADD KEY `fk_attendances_section_id` (`section_id`),
  ADD KEY `fk_attendances_quarter_id` (`quarter_id`),
  ADD KEY `fk_attendances_attendance_status_id` (`attendance_status_id`);

--
-- Indexes for table `attendance_statuses`
--
ALTER TABLE `attendance_statuses`
  ADD PRIMARY KEY (`attendance_status_id`),
  ADD UNIQUE KEY `uq_attendance_statuses_status_name` (`status_name`);

--
-- Indexes for table `audience`
--
ALTER TABLE `audience`
  ADD PRIMARY KEY (`audience_id`),
  ADD UNIQUE KEY `uq_audience_audience_name` (`audience_name`);

--
-- Indexes for table `behavior_records`
--
ALTER TABLE `behavior_records`
  ADD PRIMARY KEY (`behavior_id`),
  ADD KEY `fk_behavior_records_student_id` (`student_id`),
  ADD KEY `fk_behavior_records_teacher_id` (`teacher_id`),
  ADD KEY `fk_behavior_records_school_year_id` (`school_year_id`),
  ADD KEY `fk_behavior_records_quarter_id` (`quarter_id`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`billing_id`),
  ADD KEY `fk_billing_student_id` (`student_id`),
  ADD KEY `fk_billing_school_year_id` (`school_year_id`);

--
-- Indexes for table `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD UNIQUE KEY `uq_schedule_section_slot` (`section_id`,`day_id`,`start_time`),
  ADD UNIQUE KEY `uq_schedule_teacher_slot` (`teacher_id`,`day_id`,`start_time`),
  ADD KEY `fk_class_schedules_subject_id` (`subject_id`),
  ADD KEY `fk_class_schedules_day_id` (`day_id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`day_id`),
  ADD UNIQUE KEY `uq_days_day_name` (`day_name`);

--
-- Indexes for table `document_type`
--
ALTER TABLE `document_type`
  ADD PRIMARY KEY (`document_type_id`),
  ADD UNIQUE KEY `uq_document_type_document_name` (`document_name`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD UNIQUE KEY `uq_enrollment_student_year` (`student_id`,`school_year_id`),
  ADD KEY `fk_enrollments_grade_level_id` (`grade_level_id`),
  ADD KEY `fk_enrollments_school_year_id` (`school_year_id`),
  ADD KEY `fk_enrollments_section_id` (`section_id`),
  ADD KEY `fk_enrollments_enrollment_type_id` (`enrollment_type_id`);

--
-- Indexes for table `enrollment_type`
--
ALTER TABLE `enrollment_type`
  ADD PRIMARY KEY (`enrollment_type_id`),
  ADD UNIQUE KEY `uq_enrollment_type_enrollment_name` (`enrollment_name`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `fk_events_school_year_id` (`school_year_id`),
  ADD KEY `fk_events_user_id` (`user_id`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`gender_id`),
  ADD UNIQUE KEY `uq_genders_gender_name` (`gender_name`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`),
  ADD KEY `fk_grades_student_id` (`student_id`),
  ADD KEY `fk_grades_subject_id` (`subject_id`),
  ADD KEY `fk_grades_teacher_id` (`teacher_id`),
  ADD KEY `fk_grades_school_year_id` (`school_year_id`),
  ADD KEY `fk_grades_quarter_id` (`quarter_id`);

--
-- Indexes for table `grade_details`
--
ALTER TABLE `grade_details`
  ADD PRIMARY KEY (`grade_detail_id`),
  ADD KEY `fk_grade_details_grade_id` (`grade_id`),
  ADD KEY `fk_grade_details_activity_type_id` (`activity_type_id`),
  ADD KEY `fk_grade_details_transmutation_id` (`transmutation_id`);

--
-- Indexes for table `grade_levels`
--
ALTER TABLE `grade_levels`
  ADD PRIMARY KEY (`grade_level_id`);

--
-- Indexes for table `guardians`
--
ALTER TABLE `guardians`
  ADD PRIMARY KEY (`guardian_id`),
  ADD KEY `fk_guardians_user_id` (`user_id`),
  ADD KEY `fk_guardians_gender_id` (`gender_id`),
  ADD KEY `fk_guardians_marital_status_id` (`marital_status_id`);

--
-- Indexes for table `guardian_relationship`
--
ALTER TABLE `guardian_relationship`
  ADD PRIMARY KEY (`relationship_id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`holiday_id`),
  ADD KEY `fk_holidays_school_year_id` (`school_year_id`);

--
-- Indexes for table `marital_statuses`
--
ALTER TABLE `marital_statuses`
  ADD PRIMARY KEY (`marital_status_id`),
  ADD UNIQUE KEY `uq_marital_statuses_status_name` (`status_name`);

--
-- Indexes for table `online_classes`
--
ALTER TABLE `online_classes`
  ADD PRIMARY KEY (`online_class_id`),
  ADD KEY `fk_online_classes_section_id` (`section_id`),
  ADD KEY `fk_online_classes_subject_id` (`subject_id`),
  ADD KEY `fk_online_classes_teacher_id` (`teacher_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `uq_payments_receipt_number` (`receipt_number`),
  ADD KEY `fk_payments_billing_id` (`billing_id`),
  ADD KEY `fk_payments_payment_method_id` (`payment_method_id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`payment_method_id`),
  ADD UNIQUE KEY `uq_payment_method_method_name` (`method_name`);

--
-- Indexes for table `quarters`
--
ALTER TABLE `quarters`
  ADD PRIMARY KEY (`quarter_id`),
  ADD UNIQUE KEY `uq_quarters_quarter_name` (`quarter_name`);

--
-- Indexes for table `question_options`
--
ALTER TABLE `question_options`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `fk_question_options_question_id` (`question_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`quiz_id`),
  ADD KEY `fk_quizzes_teacher_id` (`teacher_id`),
  ADD KEY `fk_quizzes_subject_id` (`subject_id`),
  ADD KEY `fk_quizzes_grade_level_id` (`grade_level_id`);

--
-- Indexes for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD PRIMARY KEY (`answer_id`),
  ADD UNIQUE KEY `uq_quiz_answers_attempt_question` (`attempt_id`,`question_id`),
  ADD KEY `fk_quiz_answers_question_id` (`question_id`);

--
-- Indexes for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD PRIMARY KEY (`attempt_id`),
  ADD KEY `fk_quiz_attempts_quiz_id` (`quiz_id`),
  ADD KEY `fk_quiz_attempts_student_id` (`student_id`);

--
-- Indexes for table `quiz_items`
--
ALTER TABLE `quiz_items`
  ADD PRIMARY KEY (`quiz_item_id`),
  ADD UNIQUE KEY `uq_quiz_items_quiz_question` (`quiz_id`,`question_id`),
  ADD KEY `fk_quiz_items_question_id` (`question_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `fk_quiz_questions_teacher_id` (`teacher_id`),
  ADD KEY `fk_quiz_questions_subject_id` (`subject_id`),
  ADD KEY `fk_quiz_questions_grade_level_id` (`grade_level_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `fk_reports_user_id` (`user_id`),
  ADD KEY `fk_reports_school_year_id` (`school_year_id`),
  ADD KEY `fk_reports_report_type_id` (`report_type_id`);

--
-- Indexes for table `report_type`
--
ALTER TABLE `report_type`
  ADD PRIMARY KEY (`report_type_id`),
  ADD UNIQUE KEY `uq_report_type_report_name` (`report_name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `uq_roles_role_name` (`role_name`);

--
-- Indexes for table `school_years`
--
ALTER TABLE `school_years`
  ADD PRIMARY KEY (`school_year_id`),
  ADD UNIQUE KEY `uq_school_years_school_year` (`school_year`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `fk_sections_grade_level_id` (`grade_level_id`),
  ADD KEY `fk_sections_school_year_id` (`school_year_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `uq_students_lrn` (`lrn`),
  ADD KEY `fk_students_user_id` (`user_id`),
  ADD KEY `fk_students_gender_id` (`gender_id`);

--
-- Indexes for table `student_achievements`
--
ALTER TABLE `student_achievements`
  ADD PRIMARY KEY (`student_achievement_id`),
  ADD KEY `fk_student_achievements_student_id` (`student_id`),
  ADD KEY `fk_student_achievements_achievement_id` (`achievement_id`),
  ADD KEY `fk_student_achievements_school_year_id` (`school_year_id`),
  ADD KEY `fk_student_achievements_teacher_id` (`teacher_id`);

--
-- Indexes for table `student_documents`
--
ALTER TABLE `student_documents`
  ADD PRIMARY KEY (`document_id`),
  ADD KEY `fk_student_documents_student_id` (`student_id`),
  ADD KEY `fk_student_documents_document_type_id` (`document_type_id`);

--
-- Indexes for table `student_follow_ups`
--
ALTER TABLE `student_follow_ups`
  ADD PRIMARY KEY (`follow_up_id`),
  ADD KEY `fk_student_follow_ups_student_id` (`student_id`),
  ADD KEY `fk_student_follow_ups_teacher_id` (`teacher_id`);

--
-- Indexes for table `student_guardians`
--
ALTER TABLE `student_guardians`
  ADD PRIMARY KEY (`student_guardian_id`),
  ADD UNIQUE KEY `uq_student_guardian` (`student_id`,`guardian_id`),
  ADD KEY `fk_student_guardians_guardian_id` (`guardian_id`),
  ADD KEY `fk_student_guardians_relationship_id` (`relationship_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `uq_subjects_subject_code` (`subject_code`),
  ADD KEY `fk_subjects_grade_level_id` (`grade_level_id`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`submission_id`),
  ADD KEY `fk_submissions_activity_id` (`activity_id`),
  ADD KEY `fk_submissions_student_id` (`student_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `uq_teachers_employee_number` (`employee_number`),
  ADD KEY `fk_teachers_user_id` (`user_id`);

--
-- Indexes for table `transmutation_table`
--
ALTER TABLE `transmutation_table`
  ADD PRIMARY KEY (`transmutation_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `uq_users_username` (`username`),
  ADD KEY `fk_users_role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `achievement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_types`
--
ALTER TABLE `activity_types`
  MODIFY `activity_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_statuses`
--
ALTER TABLE `attendance_statuses`
  MODIFY `attendance_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `audience`
--
ALTER TABLE `audience`
  MODIFY `audience_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `behavior_records`
--
ALTER TABLE `behavior_records`
  MODIFY `behavior_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `billing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_schedules`
--
ALTER TABLE `class_schedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `day_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `document_type`
--
ALTER TABLE `document_type`
  MODIFY `document_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrollment_type`
--
ALTER TABLE `enrollment_type`
  MODIFY `enrollment_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grade_details`
--
ALTER TABLE `grade_details`
  MODIFY `grade_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grade_levels`
--
ALTER TABLE `grade_levels`
  MODIFY `grade_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `guardians`
--
ALTER TABLE `guardians`
  MODIFY `guardian_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guardian_relationship`
--
ALTER TABLE `guardian_relationship`
  MODIFY `relationship_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `holiday_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marital_statuses`
--
ALTER TABLE `marital_statuses`
  MODIFY `marital_status_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_classes`
--
ALTER TABLE `online_classes`
  MODIFY `online_class_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `payment_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quarters`
--
ALTER TABLE `quarters`
  MODIFY `quarter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `question_options`
--
ALTER TABLE `question_options`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  MODIFY `attempt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_items`
--
ALTER TABLE `quiz_items`
  MODIFY `quiz_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_type`
--
ALTER TABLE `report_type`
  MODIFY `report_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `school_years`
--
ALTER TABLE `school_years`
  MODIFY `school_year_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_achievements`
--
ALTER TABLE `student_achievements`
  MODIFY `student_achievement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_documents`
--
ALTER TABLE `student_documents`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_follow_ups`
--
ALTER TABLE `student_follow_ups`
  MODIFY `follow_up_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_guardians`
--
ALTER TABLE `student_guardians`
  MODIFY `student_guardian_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `submission_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transmutation_table`
--
ALTER TABLE `transmutation_table`
  MODIFY `transmutation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `fk_activities_activity_type_id` FOREIGN KEY (`activity_type_id`) REFERENCES `activity_types` (`activity_type_id`),
  ADD CONSTRAINT `fk_activities_quarter_id` FOREIGN KEY (`quarter_id`) REFERENCES `quarters` (`quarter_id`),
  ADD CONSTRAINT `fk_activities_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`),
  ADD CONSTRAINT `fk_activities_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `fk_activities_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_announcements_audience_id` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`audience_id`),
  ADD CONSTRAINT `fk_announcements_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `fk_attendances_attendance_status_id` FOREIGN KEY (`attendance_status_id`) REFERENCES `attendance_statuses` (`attendance_status_id`),
  ADD CONSTRAINT `fk_attendances_quarter_id` FOREIGN KEY (`quarter_id`) REFERENCES `quarters` (`quarter_id`),
  ADD CONSTRAINT `fk_attendances_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`),
  ADD CONSTRAINT `fk_attendances_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `behavior_records`
--
ALTER TABLE `behavior_records`
  ADD CONSTRAINT `fk_behavior_records_quarter_id` FOREIGN KEY (`quarter_id`) REFERENCES `quarters` (`quarter_id`),
  ADD CONSTRAINT `fk_behavior_records_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`),
  ADD CONSTRAINT `fk_behavior_records_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `fk_behavior_records_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `fk_billing_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`),
  ADD CONSTRAINT `fk_billing_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD CONSTRAINT `fk_class_schedules_day_id` FOREIGN KEY (`day_id`) REFERENCES `days` (`day_id`),
  ADD CONSTRAINT `fk_class_schedules_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`),
  ADD CONSTRAINT `fk_class_schedules_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `fk_class_schedules_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `fk_enrollments_enrollment_type_id` FOREIGN KEY (`enrollment_type_id`) REFERENCES `enrollment_type` (`enrollment_type_id`),
  ADD CONSTRAINT `fk_enrollments_grade_level_id` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_levels` (`grade_level_id`),
  ADD CONSTRAINT `fk_enrollments_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`),
  ADD CONSTRAINT `fk_enrollments_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`),
  ADD CONSTRAINT `fk_enrollments_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_events_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`),
  ADD CONSTRAINT `fk_events_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `fk_grades_quarter_id` FOREIGN KEY (`quarter_id`) REFERENCES `quarters` (`quarter_id`),
  ADD CONSTRAINT `fk_grades_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`),
  ADD CONSTRAINT `fk_grades_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `fk_grades_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `fk_grades_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `grade_details`
--
ALTER TABLE `grade_details`
  ADD CONSTRAINT `fk_grade_details_activity_type_id` FOREIGN KEY (`activity_type_id`) REFERENCES `activity_types` (`activity_type_id`),
  ADD CONSTRAINT `fk_grade_details_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`),
  ADD CONSTRAINT `fk_grade_details_transmutation_id` FOREIGN KEY (`transmutation_id`) REFERENCES `transmutation_table` (`transmutation_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `guardians`
--
ALTER TABLE `guardians`
  ADD CONSTRAINT `fk_guardians_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`),
  ADD CONSTRAINT `fk_guardians_marital_status_id` FOREIGN KEY (`marital_status_id`) REFERENCES `marital_statuses` (`marital_status_id`),
  ADD CONSTRAINT `fk_guardians_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `fk_holidays_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`);

--
-- Constraints for table `online_classes`
--
ALTER TABLE `online_classes`
  ADD CONSTRAINT `fk_online_classes_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`),
  ADD CONSTRAINT `fk_online_classes_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `fk_online_classes_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_billing_id` FOREIGN KEY (`billing_id`) REFERENCES `billing` (`billing_id`),
  ADD CONSTRAINT `fk_payments_payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`);

--
-- Constraints for table `question_options`
--
ALTER TABLE `question_options`
  ADD CONSTRAINT `fk_question_options_question_id` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`question_id`);

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `fk_quizzes_grade_level_id` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_levels` (`grade_level_id`),
  ADD CONSTRAINT `fk_quizzes_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `fk_quizzes_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD CONSTRAINT `fk_quiz_answers_attempt_id` FOREIGN KEY (`attempt_id`) REFERENCES `quiz_attempts` (`attempt_id`),
  ADD CONSTRAINT `fk_quiz_answers_question_id` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`question_id`);

--
-- Constraints for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD CONSTRAINT `fk_quiz_attempts_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`),
  ADD CONSTRAINT `fk_quiz_attempts_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `quiz_items`
--
ALTER TABLE `quiz_items`
  ADD CONSTRAINT `fk_quiz_items_question_id` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`question_id`),
  ADD CONSTRAINT `fk_quiz_items_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`);

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `fk_quiz_questions_grade_level_id` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_levels` (`grade_level_id`),
  ADD CONSTRAINT `fk_quiz_questions_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `fk_quiz_questions_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `fk_reports_report_type_id` FOREIGN KEY (`report_type_id`) REFERENCES `report_type` (`report_type_id`),
  ADD CONSTRAINT `fk_reports_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`),
  ADD CONSTRAINT `fk_reports_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_sections_grade_level_id` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_levels` (`grade_level_id`),
  ADD CONSTRAINT `fk_sections_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_students_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`),
  ADD CONSTRAINT `fk_students_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `student_achievements`
--
ALTER TABLE `student_achievements`
  ADD CONSTRAINT `fk_student_achievements_achievement_id` FOREIGN KEY (`achievement_id`) REFERENCES `achievements` (`achievement_id`),
  ADD CONSTRAINT `fk_student_achievements_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`),
  ADD CONSTRAINT `fk_student_achievements_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `fk_student_achievements_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `student_documents`
--
ALTER TABLE `student_documents`
  ADD CONSTRAINT `fk_student_documents_document_type_id` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`document_type_id`),
  ADD CONSTRAINT `fk_student_documents_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `student_follow_ups`
--
ALTER TABLE `student_follow_ups`
  ADD CONSTRAINT `fk_student_follow_ups_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `fk_student_follow_ups_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `student_guardians`
--
ALTER TABLE `student_guardians`
  ADD CONSTRAINT `fk_student_guardians_guardian_id` FOREIGN KEY (`guardian_id`) REFERENCES `guardians` (`guardian_id`),
  ADD CONSTRAINT `fk_student_guardians_relationship_id` FOREIGN KEY (`relationship_id`) REFERENCES `guardian_relationship` (`relationship_id`),
  ADD CONSTRAINT `fk_student_guardians_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `fk_subjects_grade_level_id` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_levels` (`grade_level_id`);

--
-- Constraints for table `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `fk_submissions_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`activity_id`),
  ADD CONSTRAINT `fk_submissions_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `fk_teachers_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
