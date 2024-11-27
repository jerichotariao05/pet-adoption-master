-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2024 at 08:42 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpetadoption`
--

-- --------------------------------------------------------

--
-- Table structure for table `adoption_process`
--

CREATE TABLE `adoption_process` (
  `id` int(11) NOT NULL,
  `adopter_id` int(11) DEFAULT NULL,
  `pet_id` int(11) DEFAULT NULL,
  `request_status` enum('Request in review','Accepted','Rejected','Cancelled') DEFAULT 'Request in review',
  `review_completed_at` datetime DEFAULT NULL,
  `interview_status` enum('Pending','Passed','Failed','No show') DEFAULT 'Pending',
  `interview_scheduled_at` datetime DEFAULT NULL,
  `adoption_status` enum('In process','Adoption successful','Cancelled') DEFAULT 'In process',
  `pickup_date` date DEFAULT NULL,
  `current_phase` enum('Request','Interview','Adoption_completion','Cancelled') DEFAULT 'Request',
  `adoption_request_id` int(11) NOT NULL,
  `requested_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adoption_process`
--

INSERT INTO `adoption_process` (`id`, `adopter_id`, `pet_id`, `request_status`, `review_completed_at`, `interview_status`, `interview_scheduled_at`, `adoption_status`, `pickup_date`, `current_phase`, `adoption_request_id`, `requested_at`) VALUES
(1, 1, 2, 'Rejected', '2024-10-19 14:03:36', 'Pending', NULL, 'In process', NULL, 'Request', 1, '2024-10-19 14:02:20'),
(2, 1, 3, 'Accepted', '2024-10-19 14:03:27', 'Passed', '2024-10-19 14:03:00', 'Adoption successful', '2024-10-20', 'Adoption_completion', 2, '2024-10-19 14:02:47'),
(3, 1, 1, 'Accepted', '2024-10-19 14:14:25', 'Pending', '2024-10-19 14:14:00', 'In process', NULL, 'Interview', 3, '2024-10-19 14:08:13'),
(4, 1, 2, 'Rejected', '2024-10-19 14:40:42', 'Pending', NULL, 'In process', NULL, 'Request', 4, '2024-10-19 14:08:17'),
(5, 1, 5, 'Accepted', '2024-10-19 14:38:57', 'Pending', '2024-10-19 14:37:00', 'In process', NULL, 'Interview', 5, '2024-10-19 14:08:21');

-- --------------------------------------------------------

--
-- Table structure for table `banned_adopters`
--

CREATE TABLE `banned_adopters` (
  `attempt_id` int(11) NOT NULL,
  `adopter_id` int(11) NOT NULL,
  `cancel_count` int(11) NOT NULL DEFAULT 0,
  `banned` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banned_adopters`
--

INSERT INTO `banned_adopters` (`attempt_id`, `adopter_id`, `cancel_count`, `banned`) VALUES
(2, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `avatar` text DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `first_name`, `last_name`, `avatar`, `email`, `password`) VALUES
(1, 'Charls', 'Pacaldo', NULL, 'vargas02@gmail.com', '$2y$10$WL6eFQsezilHpqhogJ4psuKXZF5vvJLPWA/39ei1R8yGx2.l8eRVC');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_adopter`
--

CREATE TABLE `tbl_adopter` (
  `adopter_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `contact_number` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('Active','Deactivate') NOT NULL DEFAULT 'Active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_adopter`
--

INSERT INTO `tbl_adopter` (`adopter_id`, `first_name`, `last_name`, `contact_number`, `email`, `address`, `avatar`, `username`, `password`, `status`, `created_at`) VALUES
(1, 'Jericho', 'Tariao', '09078996678', 'jerichotariao15@gmail.com', 'Carmen', '6711565c70610_20241017202428_1721091160_avatar_4.png', 'Charls_02', '$2y$10$C6FjQGknzyPUcT8LVJx.VuZNndy22FEETITe5qrfLCtwaTmA1Opm6', 'Active', '2024-09-27 00:35:18'),
(2, 'Charls', 'Opiso', '09078996678', 'vargascharls02@gmail.com', 'KSY', NULL, 'Cape_02', '$2y$10$uk4t.i.Nuo7n4vMOzMxMNerYtne7rJjgddQio4zVc3FuLBhXD/i1u', 'Active', '2024-10-19 04:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_adopter_profile`
--

CREATE TABLE `tbl_adopter_profile` (
  `profile_id` int(11) NOT NULL,
  `adopter_id` int(11) NOT NULL,
  `household_size` int(11) NOT NULL,
  `home_type` varchar(25) NOT NULL,
  `salary` float NOT NULL,
  `live_with` varchar(50) NOT NULL,
  `availability_to_care` text NOT NULL,
  `other_pets` text NOT NULL,
  `pet_experiences` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_adopter_profile`
--

INSERT INTO `tbl_adopter_profile` (`profile_id`, `adopter_id`, `household_size`, `home_type`, `salary`, `live_with`, `availability_to_care`, `other_pets`, `pet_experiences`) VALUES
(1, 1, 6, 'Apartment', 20000, 'Parents and relatives', 'I will do my best to take care of my future pets, making sure that my pets will feel loved.', 'I have kitten and a puppy.', 'I have a cat and a puppy.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_adoption_history`
--

CREATE TABLE `tbl_adoption_history` (
  `adoption_id` int(11) NOT NULL,
  `pet_id` int(11) DEFAULT NULL,
  `adopter_id` int(11) DEFAULT NULL,
  `adoption_date` date DEFAULT NULL,
  `pickup_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_adoption_history`
--

INSERT INTO `tbl_adoption_history` (`adoption_id`, `pet_id`, `adopter_id`, `adoption_date`, `pickup_date`, `created_at`) VALUES
(1, 1, 1, '2024-10-19', '2024-10-19', '2024-10-19 11:17:04'),
(2, 3, 1, '2024-10-26', '2024-10-20', '2024-10-19 14:04:08');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_adoption_request`
--

CREATE TABLE `tbl_adoption_request` (
  `adoption_request_id` int(11) NOT NULL,
  `pet_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `request_date` datetime DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected','Cancelled') NOT NULL,
  `approval_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_adoption_request`
--

INSERT INTO `tbl_adoption_request` (`adoption_request_id`, `pet_id`, `profile_id`, `request_date`, `status`, `approval_date`) VALUES
(1, 2, 1, '2024-10-19 14:02:20', 'Rejected', NULL),
(2, 3, 1, '2024-10-19 14:02:47', 'Approved', '2024-10-19 14:03:19'),
(3, 1, 1, '2024-10-19 14:08:13', 'Approved', '2024-10-19 14:14:18'),
(4, 2, 1, '2024-10-19 14:08:17', 'Rejected', NULL),
(5, 5, 1, '2024-10-19 14:08:21', 'Approved', '2024-10-19 14:38:50');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_interview`
--

CREATE TABLE `tbl_interview` (
  `interview_id` int(11) NOT NULL,
  `adoption_request_id` int(11) DEFAULT NULL,
  `interview_datetime` datetime DEFAULT NULL,
  `status` enum('Pending','Passed','Failed','No-show') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_interview`
--

INSERT INTO `tbl_interview` (`interview_id`, `adoption_request_id`, `interview_datetime`, `status`) VALUES
(1, 4, '2024-10-19 11:15:00', 'No-show'),
(2, 2, '2024-10-19 11:16:00', 'Failed'),
(3, 1, '2024-10-19 11:16:00', 'Passed'),
(4, 2, '2024-10-19 14:03:00', 'Passed'),
(5, 3, '2024-10-19 14:14:00', 'Pending'),
(6, 5, '2024-10-19 14:37:00', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pet`
--

CREATE TABLE `tbl_pet` (
  `pet_id` int(11) NOT NULL,
  `pet_name` varchar(100) NOT NULL,
  `pet_image` varchar(255) DEFAULT NULL,
  `pet_type_id` int(11) NOT NULL,
  `breed_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `adoption_fee` float NOT NULL,
  `adoption_status` enum('Available','Pending','Adopted') NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pet`
--

INSERT INTO `tbl_pet` (`pet_id`, `pet_name`, `pet_image`, `pet_type_id`, `breed_id`, `description`, `age`, `gender`, `adoption_fee`, `adoption_status`, `created_at`) VALUES
(1, 'precious', '670c021f937d5_20241013192343_ASPIN-removebg-preview.png', 1, 1, 'Shemenet', 1, 'Female', 1000, 'Pending', '2024-10-14 01:23:43'),
(2, 'Bantay', '670cbba5346fd_20241014083517_ASPIN_2-removebg-preview.png', 1, 1, 'Very protective', 1, 'Male', 1000, 'Available', '2024-10-14 14:35:17'),
(3, 'Sassy', '670cbbd18ccae_20241014083601_Sphynx-Cat.png', 2, 4, 'Very smart', 1, 'Female', 1500, 'Adopted', '2024-10-14 14:36:01'),
(4, 'Hairey', '670cbc21caa4c_20241014083721_Persian cat.png', 2, 3, 'Very playful', 1, 'Male', 1500, 'Pending', '2024-10-14 14:37:21'),
(5, 'Parry', '670cbc4b41fe3_20241014083803_Macaw-removebg-preview.png', 3, 5, 'Parry\'s story began in an apple tree, where he was rescued after being spotted by a kind passerby. Alone but not discouraged, he chirped cheerfully from the branches, winning over the hearts of his rescuers with his upbeat demeanor. Now, Parry is looking for a forever home where he can continue to share his vibrant personality and bring endless joy to those around him. He loves human interaction and would thrive in a home that appreciates his lively spirit and endless curiosity.', 1, 'Female', 800, 'Pending', '2024-10-14 14:38:03'),
(6, 'aquaboy', '670cbc8fcf035_20241014083911_wood-turtle.jpg', 6, 7, 'Very calm and mindful', 1, 'Male', 1500, 'Available', '2024-10-14 14:39:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pet_breed`
--

CREATE TABLE `tbl_pet_breed` (
  `breed_id` int(11) NOT NULL,
  `pet_type_id` int(11) NOT NULL,
  `breed_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pet_breed`
--

INSERT INTO `tbl_pet_breed` (`breed_id`, `pet_type_id`, `breed_name`) VALUES
(1, 1, 'German Shepherd'),
(2, 1, 'Bulldog'),
(3, 2, 'Siamese cat'),
(4, 2, 'Sphynx cat'),
(5, 3, 'Border Canary'),
(6, 5, 'Fantail'),
(7, 6, 'Bangs');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pet_type`
--

CREATE TABLE `tbl_pet_type` (
  `pet_type_id` int(11) NOT NULL,
  `pet_type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pet_type`
--

INSERT INTO `tbl_pet_type` (`pet_type_id`, `pet_type_name`) VALUES
(1, 'Dog'),
(2, 'Cat'),
(3, 'Bird'),
(4, 'Rabbit'),
(5, 'Fish'),
(6, 'Turtle'),
(7, 'Horsey'),
(8, 'Goat'),
(9, 'Sigbvyn'),
(10, 'Test 3 -updated'),
(11, 'Test 2'),
(12, 'test 4'),
(13, 'test 5'),
(14, 'test 7'),
(15, 'test 8'),
(16, 'test 8'),
(17, 'test 9 -update'),
(18, 'test 10'),
(19, 'test 11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adoption_process`
--
ALTER TABLE `adoption_process`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adopter_id` (`adopter_id`),
  ADD KEY `pet_id` (`pet_id`),
  ADD KEY `adoption_request_id` (`adoption_request_id`);

--
-- Indexes for table `banned_adopters`
--
ALTER TABLE `banned_adopters`
  ADD PRIMARY KEY (`attempt_id`),
  ADD KEY `adopter_id` (`adopter_id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_adopter`
--
ALTER TABLE `tbl_adopter`
  ADD PRIMARY KEY (`adopter_id`);

--
-- Indexes for table `tbl_adopter_profile`
--
ALTER TABLE `tbl_adopter_profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `adopter_id` (`adopter_id`);

--
-- Indexes for table `tbl_adoption_history`
--
ALTER TABLE `tbl_adoption_history`
  ADD PRIMARY KEY (`adoption_id`),
  ADD KEY `pet_id` (`pet_id`),
  ADD KEY `adopter_id` (`adopter_id`);

--
-- Indexes for table `tbl_adoption_request`
--
ALTER TABLE `tbl_adoption_request`
  ADD PRIMARY KEY (`adoption_request_id`),
  ADD KEY `pet_id` (`pet_id`),
  ADD KEY `profile_id` (`profile_id`);

--
-- Indexes for table `tbl_interview`
--
ALTER TABLE `tbl_interview`
  ADD PRIMARY KEY (`interview_id`),
  ADD KEY `adoption_request_id` (`adoption_request_id`);

--
-- Indexes for table `tbl_pet`
--
ALTER TABLE `tbl_pet`
  ADD PRIMARY KEY (`pet_id`),
  ADD KEY `breed_id` (`breed_id`),
  ADD KEY `pet_type_id` (`pet_type_id`),
  ADD KEY `breed_id_2` (`breed_id`);

--
-- Indexes for table `tbl_pet_breed`
--
ALTER TABLE `tbl_pet_breed`
  ADD PRIMARY KEY (`breed_id`),
  ADD KEY `pet_type_id` (`pet_type_id`);

--
-- Indexes for table `tbl_pet_type`
--
ALTER TABLE `tbl_pet_type`
  ADD PRIMARY KEY (`pet_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adoption_process`
--
ALTER TABLE `adoption_process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `banned_adopters`
--
ALTER TABLE `banned_adopters`
  MODIFY `attempt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_adopter`
--
ALTER TABLE `tbl_adopter`
  MODIFY `adopter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_adopter_profile`
--
ALTER TABLE `tbl_adopter_profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_adoption_history`
--
ALTER TABLE `tbl_adoption_history`
  MODIFY `adoption_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_adoption_request`
--
ALTER TABLE `tbl_adoption_request`
  MODIFY `adoption_request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_interview`
--
ALTER TABLE `tbl_interview`
  MODIFY `interview_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_pet`
--
ALTER TABLE `tbl_pet`
  MODIFY `pet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_pet_breed`
--
ALTER TABLE `tbl_pet_breed`
  MODIFY `breed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_pet_type`
--
ALTER TABLE `tbl_pet_type`
  MODIFY `pet_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adoption_process`
--
ALTER TABLE `adoption_process`
  ADD CONSTRAINT `adoption_process_ibfk_1` FOREIGN KEY (`adopter_id`) REFERENCES `tbl_adopter` (`adopter_id`),
  ADD CONSTRAINT `adoption_process_ibfk_2` FOREIGN KEY (`pet_id`) REFERENCES `tbl_pet` (`pet_id`),
  ADD CONSTRAINT `adoption_process_ibfk_3` FOREIGN KEY (`adoption_request_id`) REFERENCES `tbl_adoption_request` (`adoption_request_id`);

--
-- Constraints for table `banned_adopters`
--
ALTER TABLE `banned_adopters`
  ADD CONSTRAINT `banned_adopters_ibfk_1` FOREIGN KEY (`adopter_id`) REFERENCES `tbl_adopter` (`adopter_id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_adopter_profile`
--
ALTER TABLE `tbl_adopter_profile`
  ADD CONSTRAINT `tbl_adopter_profile_ibfk_1` FOREIGN KEY (`adopter_id`) REFERENCES `tbl_adopter` (`adopter_id`);

--
-- Constraints for table `tbl_adoption_history`
--
ALTER TABLE `tbl_adoption_history`
  ADD CONSTRAINT `tbl_adoption_history_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `tbl_pet` (`pet_id`),
  ADD CONSTRAINT `tbl_adoption_history_ibfk_2` FOREIGN KEY (`adopter_id`) REFERENCES `tbl_adopter` (`adopter_id`);

--
-- Constraints for table `tbl_adoption_request`
--
ALTER TABLE `tbl_adoption_request`
  ADD CONSTRAINT `tbl_adoption_request_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `tbl_pet` (`pet_id`),
  ADD CONSTRAINT `tbl_adoption_request_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `tbl_adopter_profile` (`profile_id`);

--
-- Constraints for table `tbl_interview`
--
ALTER TABLE `tbl_interview`
  ADD CONSTRAINT `tbl_interview_ibfk_1` FOREIGN KEY (`adoption_request_id`) REFERENCES `tbl_adoption_request` (`adoption_request_id`);

--
-- Constraints for table `tbl_pet`
--
ALTER TABLE `tbl_pet`
  ADD CONSTRAINT `tbl_pet_ibfk_1` FOREIGN KEY (`pet_type_id`) REFERENCES `tbl_pet_type` (`pet_type_id`),
  ADD CONSTRAINT `tbl_pet_ibfk_2` FOREIGN KEY (`breed_id`) REFERENCES `tbl_pet_breed` (`breed_id`);

--
-- Constraints for table `tbl_pet_breed`
--
ALTER TABLE `tbl_pet_breed`
  ADD CONSTRAINT `tbl_pet_breed_ibfk_1` FOREIGN KEY (`pet_type_id`) REFERENCES `tbl_pet_type` (`pet_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
