-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2025 at 02:48 PM
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
-- Database: `pos_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `fruit_tea`
--

CREATE TABLE `fruit_tea` (
  `meal_id` int(11) NOT NULL,
  `meal_name` varchar(255) NOT NULL,
  `price_regular` decimal(10,2) NOT NULL,
  `price_large` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fruit_tea`
--

INSERT INTO `fruit_tea` (`meal_id`, `meal_name`, `price_regular`, `price_large`, `stock`) VALUES
(103, 'Strawberry Matcha', 95.00, 115.00, 30),
(105, 'Strawberry Choco', 95.00, 115.00, 30),
(106, 'Strawberry Milk', 80.00, 105.00, 30),
(107, 'Choco Caramel', 95.00, 115.00, 30),
(108, 'Chocolate Milk', 80.00, 105.00, 30),
(109, 'Matcha Latte', 80.00, 105.00, 50);

-- --------------------------------------------------------

--
-- Table structure for table `sales_transactions`
--

CREATE TABLE `sales_transactions` (
  `id` int(11) NOT NULL,
  `meal_id` int(11) NOT NULL,
  `meal_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `discounted_price` decimal(10,2) DEFAULT NULL,
  `batch_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_transactions`
--

INSERT INTO `sales_transactions` (`id`, `meal_id`, `meal_name`, `quantity`, `price`, `total_price`, `transaction_date`, `payment_status`, `discounted_price`, `batch_id`) VALUES
(19, 204, 'Spanish Latte', 2, 75.00, 150.00, '2025-01-14 06:04:44', 'Processed', NULL, 1736831095),
(20, 204, 'Spanish Latte', 2, 100.00, 200.00, '2025-01-14 06:24:29', 'Processed', NULL, 1736832292),
(21, 206, 'Caramel Latte', 3, 75.00, 225.00, '2025-01-14 06:24:36', 'Processed', NULL, 1736832292),
(22, 103, 'Strawberry Matcha', 1, 95.00, 95.00, '2025-01-14 06:24:42', 'Processed', NULL, 1736832292),
(23, 204, 'Spanish Latte', 1, 75.00, 75.00, '2025-01-14 06:45:41', 'Processed', 71.25, 1736833547),
(24, 204, 'Spanish Latte', 1, 75.00, 75.00, '2025-01-14 06:52:15', 'Processed', 71.25, 1736833946),
(25, 206, 'Caramel Latte', 3, 100.00, 300.00, '2025-01-14 08:22:57', 'Processed', 285.00, 1736839382),
(26, 204, 'Spanish Latte', 2, 100.00, 200.00, '2025-01-16 06:45:40', 'Processed', 190.00, 1737006347),
(27, 204, 'Spanish Latte', 2, 75.00, 150.00, '2025-01-16 13:43:45', 'Processed', NULL, 1737031450),
(28, 103, 'Strawberry Matcha', 2, 95.00, 190.00, '2025-01-16 13:44:00', 'Processed', NULL, 1737031450);

-- --------------------------------------------------------

--
-- Table structure for table `sizzling_meals`
--

CREATE TABLE `sizzling_meals` (
  `meal_id` int(11) NOT NULL,
  `meal_name` varchar(100) NOT NULL,
  `price_regular` decimal(10,2) NOT NULL,
  `price_large` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sizzling_meals`
--

INSERT INTO `sizzling_meals` (`meal_id`, `meal_name`, `price_regular`, `price_large`, `stock`) VALUES
(205, 'Vanilla Latte', 75.00, 105.00, 50),
(206, 'Caramel Latte', 75.00, 100.00, 30),
(207, 'Salted Caramel', 85.00, 110.00, 30),
(208, 'Caramel Macchiato', 85.00, 110.00, 30),
(209, 'White Mocha Latte', 85.00, 110.00, 30),
(210, 'Mocha Latte', 85.00, 110.00, 30),
(212, 'Brown Sugar Latte', 85.00, 110.00, 30),
(213, 'Spanish Latte', 75.00, 100.00, 30);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `marital_status` varchar(50) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `staff_id` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `dob`, `gender`, `marital_status`, `nationality`, `address`, `phone_number`, `email`, `staff_id`, `password`) VALUES
(0, 'mama', 'meme', 'mimi', '0312-03-02', 'Male', 'single', 'filipino', 'agaegaeg', '2143525', 'mama@gmail.com', '123', '$2y$10$lcu1IJzQ9OZNB5MCrzhQsumKGffNorMz0.KwJx4v7lB7K96WiP6hG'),
(0, 'Cedric', 'Gonzales', 'Cruto', '2004-06-18', 'Male', 'single', 'Filipino', 'Palangue 1 Naic, Cavite', '09358432422', 'nc.paulcedric.cruto@cvsu.edu.ph', 'cedric', '$2y$10$QSaeaNyRKOylfD6EBKCGHOHfnGnlm5Kvizzf.9Sjbb8QUaILb2wPq'),
(0, 'pri', 'm', 'nce', '2025-01-31', 'Male', 'Married', 'bisaya', '033 kalugkog', '09055916497', 'ashley33@gmail.com', 'pri', '$2y$10$yOTaSAUhzfT5Wqojxu/SD.08fFRvA.ATro0HU8Hj87cdHw//HSqaW'),
(0, 'yuri', 'd', 'manalo', '2004-01-20', 'Male', 'Single', 'Filipino', 'naic', '09358432422', 'yuri12@gmail.com', 'cashier', '$2y$10$1gOEIVLkzH2aC7L6Nr3pBONeODXuUQVeEpWdAOb5GvPv730yhmlxO'),
(0, 'kim', 'g', 'escasinas', '2020-06-18', 'Female', 'Single', 'american', 'los angeles', '09055916497', 'kim123@gmail.com', 'cashier1', '$2y$10$ha.TqFavk8w2ygB9Tj23eORdreIQ9tUaL.UpG.whNmoHfomtkO8ki');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fruit_tea`
--
ALTER TABLE `fruit_tea`
  ADD PRIMARY KEY (`meal_id`);

--
-- Indexes for table `sales_transactions`
--
ALTER TABLE `sales_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizzling_meals`
--
ALTER TABLE `sizzling_meals`
  ADD PRIMARY KEY (`meal_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fruit_tea`
--
ALTER TABLE `fruit_tea`
  MODIFY `meal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `sales_transactions`
--
ALTER TABLE `sales_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `sizzling_meals`
--
ALTER TABLE `sizzling_meals`
  MODIFY `meal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
