-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 03, 2025 at 01:24 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecourier`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_method_id` bigint NOT NULL,
  `account_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1=active, 0=inactive',
  `created_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `payment_method_id`, `account_no`, `holder_name`, `balance`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hand Cash', 'Self', '130600.00', 1, 1, 1, '2025-02-26 04:40:39', '2025-07-01 17:38:09'),
(2, 2, 'Investment Capital', 'Self', '0.00', 1, 1, NULL, '2025-02-26 04:41:05', '2025-05-17 07:31:11'),
(3, 3, '0181211111', 'Wonder Tech', '0.00', 1, 1, 1, '2025-05-30 06:46:08', '2025-06-20 06:39:43'),
(4, 7, '0171211111', 'Khan', '10000.00', 1, 1, 1, '2025-05-30 06:46:44', '2025-06-20 06:40:41'),
(5, 10, '147.151.38.5602', 'Khan', '140000.00', 1, 1, 1, '2025-05-30 06:47:42', '2025-07-01 17:43:47'),
(6, 8, '206850422160001', 'Wonder Tech', '0.00', 1, 1, 1, '2025-05-30 06:48:23', '2025-06-20 06:38:41'),
(7, 9, '1264390059001', 'Wonder Tech', '0.00', 1, 1, 1, '2025-05-30 06:49:06', '2025-06-20 06:38:22');

-- --------------------------------------------------------

--
-- Table structure for table `account_ledgers`
--

CREATE TABLE `account_ledgers` (
  `id` bigint UNSIGNED NOT NULL,
  `account_id` bigint NOT NULL,
  `debit_amount` double(20,2) DEFAULT NULL COMMENT 'Withdrawal',
  `credit_amount` double(20,2) DEFAULT NULL COMMENT 'Deposit',
  `current_balance` double(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `transaction_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_ledgers`
--

INSERT INTO `account_ledgers` (`id`, `account_id`, `debit_amount`, `credit_amount`, `current_balance`, `reference_number`, `description`, `transaction_date`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1312000.00, 1312000.00, NULL, 'Investment Deposit', '2025-05-31', '2025-05-31 10:01:02', '2025-05-31 10:01:02'),
(2, 1, 62000.00, NULL, 1250000.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 10:53:15', '2025-05-31 10:53:15'),
(3, 1, 81000.00, NULL, 1169000.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 10:53:20', '2025-05-31 10:53:20'),
(4, 1, 281000.00, NULL, 888000.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 10:53:23', '2025-05-31 10:53:23'),
(5, 1, 50000.00, NULL, 838000.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 10:53:26', '2025-05-31 10:53:26'),
(6, 1, 187000.00, NULL, 651000.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 10:53:30', '2025-05-31 10:53:30'),
(7, 1, 176000.00, NULL, 475000.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 10:53:33', '2025-05-31 10:53:33'),
(8, 1, 300000.00, NULL, 175000.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 10:53:37', '2025-05-31 10:53:37'),
(9, 1, 110000.00, NULL, 65000.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 10:53:42', '2025-05-31 10:53:42'),
(10, 1, 65000.00, NULL, 0.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 10:53:47', '2025-05-31 10:53:47'),
(11, 1, NULL, 790000.00, 790000.00, NULL, 'Investment Deposit', '2025-05-31', '2025-05-31 15:59:49', '2025-05-31 15:59:49'),
(12, 1, 340000.00, NULL, 450000.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 16:12:24', '2025-05-31 16:12:24'),
(13, 1, 175000.00, NULL, 275000.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 16:12:27', '2025-05-31 16:12:27'),
(14, 1, 275000.00, NULL, 0.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 16:12:30', '2025-05-31 16:12:30'),
(15, 1, NULL, 498000.00, 498000.00, NULL, 'Investment Deposit', '2025-05-31', '2025-05-31 16:24:23', '2025-05-31 16:24:23'),
(16, 1, 200000.00, NULL, 298000.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 16:34:07', '2025-05-31 16:34:07'),
(17, 1, 93000.00, NULL, 205000.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 16:34:10', '2025-05-31 16:34:10'),
(18, 1, 205000.00, NULL, 0.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 16:34:13', '2025-05-31 16:34:13'),
(19, 1, NULL, 165000.00, 165000.00, NULL, 'Investment Deposit', '2025-05-31', '2025-05-31 16:43:32', '2025-05-31 16:43:32'),
(20, 1, NULL, 253000.00, 418000.00, NULL, 'Investment Deposit', '2025-05-31', '2025-05-31 16:43:36', '2025-05-31 16:43:36'),
(21, 1, NULL, 104000.00, 522000.00, NULL, 'Investment Deposit', '2025-05-31', '2025-05-31 16:47:58', '2025-05-31 16:47:58'),
(22, 1, 104000.00, NULL, 418000.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 17:01:26', '2025-05-31 17:01:26'),
(23, 1, 165000.00, NULL, 253000.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 17:01:29', '2025-05-31 17:01:29'),
(24, 1, 146000.00, NULL, 107000.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 17:01:32', '2025-05-31 17:01:32'),
(25, 1, 107000.00, NULL, 0.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 17:01:35', '2025-05-31 17:01:35'),
(26, 1, NULL, 125000.00, 125000.00, NULL, 'Investment Deposit', '2025-05-31', '2025-05-31 17:03:16', '2025-05-31 17:03:16'),
(27, 1, 125000.00, NULL, 0.00, NULL, 'Bike Purchase', '2025-05-31', '2025-05-31 17:05:43', '2025-05-31 17:05:43'),
(28, 1, 12500.00, NULL, -12500.00, NULL, 'Regular Purchase', '2025-06-14', '2025-06-14 14:17:16', '2025-06-14 14:17:16'),
(29, 1, 23000.00, NULL, -35500.00, NULL, 'Expenses', '2025-06-18', '2025-06-18 17:58:13', '2025-06-18 17:58:13'),
(30, 1, NULL, 200.00, -35300.00, NULL, 'Sale Payment', '2025-06-20', '2025-06-20 06:31:27', '2025-06-20 06:31:27'),
(31, 1, NULL, 135000.00, 99700.00, NULL, 'Bike Sales', '2025-06-20', '2025-06-20 06:36:53', '2025-06-20 06:36:53'),
(32, 1, 10000.00, NULL, 89700.00, NULL, 'Transfered to other account', '2025-06-20', '2025-06-20 06:40:41', '2025-06-20 06:40:41'),
(33, 4, NULL, 10000.00, 10000.00, 'To Purchase parts', 'Received from other account', '2025-06-20', '2025-06-20 06:40:41', '2025-06-20 06:40:41'),
(34, 1, 1500.00, NULL, 88200.00, NULL, 'Bike Service Expense', '2025-06-20', '2025-06-20 06:42:36', '2025-06-20 06:42:36'),
(35, 1, NULL, 1900.00, 90100.00, NULL, 'Sale Payment', '2025-06-20', '2025-06-20 06:46:10', '2025-06-20 06:46:10'),
(36, 1, NULL, 5500.00, 95600.00, NULL, 'Sale Payment', '2025-06-20', '2025-06-20 07:09:30', '2025-06-20 07:09:30'),
(37, 1, NULL, 180000.00, 275600.00, NULL, 'Bike Sales', '2025-06-28', '2025-06-28 08:57:52', '2025-06-28 08:57:52'),
(38, 1, 125000.00, NULL, 150600.00, 'NA', 'Bike Purchase', '2025-06-28', '2025-06-28 10:58:58', '2025-06-28 10:58:58'),
(39, 5, NULL, 250000.00, 250000.00, NULL, 'Investment Deposit', '2025-07-01', '2025-07-01 17:25:35', '2025-07-01 17:25:35'),
(40, 1, 20000.00, NULL, 130600.00, NULL, 'Investment Withdrawal', '2025-07-01', '2025-07-01 17:38:09', '2025-07-01 17:38:09'),
(41, 5, 110000.00, NULL, 140000.00, NULL, 'Bike Purchase', '2025-07-01', '2025-07-01 17:43:47', '2025-07-01 17:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `investor_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `agent_id` bigint DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int NOT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `investor_id`, `employee_id`, `agent_id`, `branch_id`, `name`, `username`, `type`, `mobile`, `email`, `password`, `image`, `status`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, 1, 1, 1, 1, 'Super Admin', NULL, 1, '01763634878', 'admin@gmail.com', '$2y$10$HgJ9WCVRevM1e8yXz1ts7OCGRb29MdtDpBQLDhb.QObJmLPnP4ZOm', 'admin-1753071086.png', 1, '2024-08-30 13:03:44', '2025-07-21 11:51:29', 'AEWvPKZjyWInIIaqtutlD6ciFtm4ExkAsbjH03kCuQqhqUeHOA7JmB3X26uw'),
(2, NULL, 3, 2, 2, 'Nowab Shorif', NULL, 3, '01839317038', 'nsanoman@gmail.com', '$2y$10$MG.kymzcIgDLbbiwTyLAe.uj2bhcB8Tef.XoM/T05tIbYj9AGuXDO', NULL, 1, '2025-07-21 06:52:23', '2025-07-21 07:26:08', NULL),
(3, NULL, 4, NULL, 2, 'Malek Azad', NULL, 3, '01839317038', 'malekazad@gmail.com', '$2y$10$oBCsjoWQ0ei91hx3DY1kmO3oXw0mIvtFxEB5gweTlHi1nazHWgfly', NULL, 1, '2025-07-21 07:25:50', '2025-07-21 07:46:13', NULL),
(4, NULL, NULL, 1, 6, 'Aquila Mendoza', NULL, 3, '65', 'xilyqiso@mailinator.com', '$2y$10$UuuDxN821Ge0j2H8R8694eW0BJwMcyl6f8nzcIcMzjbHSBKiq0gfq', NULL, 1, '2025-07-23 03:38:53', '2025-07-23 03:41:21', NULL),
(5, NULL, NULL, 2, 3, 'Nowab Shorif', NULL, 3, '2345678', 'noman@gmail.com', '$2y$10$Gr2OiWKHtQ6MXpA3OEWMgOYDQPEMyTvngY94wY15lFqwJoG5YsXFO', NULL, 0, '2025-07-23 04:43:12', '2025-07-23 04:44:35', NULL),
(6, NULL, NULL, 3, 7, 'Khairul Islam', NULL, 3, '018456789', 'khairulislam@gmail.com', '$2y$10$zXihtGLpBoTM/xzZUKx6N.0/AWlRsX1pQoIfRvPwSzSMnJUXCbbk.', NULL, 1, '2025-07-23 08:17:29', '2025-07-23 08:19:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_balance` double(20,2) NOT NULL DEFAULT '0.00',
  `is_default` tinyint DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `branch_id`, `name`, `email`, `contact`, `address`, `current_balance`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Super Admin', 'admin@gmail.com', '01839317038', '', 0.00, 1, 1, '2025-07-23 03:38:53', '2025-07-23 03:38:53'),
(2, 2, 'Nowab Shorif', 'noman@gmail.com', '2345678', '', 0.00, 0, 1, '2025-07-23 04:43:12', '2025-07-23 04:43:12'),
(3, 7, 'Khairul Islam', 'khairulislam@gmail.com', '018456789', '', 0.00, 0, 1, '2025-07-23 08:17:29', '2025-07-23 08:17:29');

-- --------------------------------------------------------

--
-- Table structure for table `basic_infos`
--

CREATE TABLE `basic_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `web_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `facebook_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `twitter_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `linkedin_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `youtube_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `assets_value` int NOT NULL,
  `total_employees` int NOT NULL,
  `total_companies` int NOT NULL,
  `start_year` int NOT NULL,
  `map_embed` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_embed_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_embed_2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_embed_3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_infos`
--

INSERT INTO `basic_infos` (`id`, `title`, `meta_keywords`, `meta_description`, `logo`, `favicon`, `phone`, `telephone`, `fax`, `email`, `location`, `address`, `web_link`, `facebook_link`, `twitter_link`, `linkedin_link`, `youtube_link`, `assets_value`, `total_employees`, `total_companies`, `start_year`, `map_embed`, `video_embed_1`, `video_embed_2`, `video_embed_3`, `currency_symbol`, `created_at`, `updated_at`) VALUES
(1, 'E-Courier', 'In consequuntur quib', 'Iusto Nam consectetu', 'logo-1753070794.png', 'favicon-1753070903.png', '+88 01680764091', '456', '23456', 'wondertech9100@gmail.com', 'Velit quia corrupti', 'Dhaka, Bangladesh.', 'Quia atque nostrum q', 'Enim neque culpa ex', 'Deserunt odio cum ad', 'Deserunt in ducimus', 'Obcaecati autem reru', 60, 23, 72, 1993, 'Sit placeat et ut o', 'Vel dolore necessita', 'Consequuntur ex nesc', 'Proident dolore off', '৳', NULL, '2025-07-21 04:08:23');

-- --------------------------------------------------------

--
-- Table structure for table `bike_profits`
--

CREATE TABLE `bike_profits` (
  `id` bigint UNSIGNED NOT NULL,
  `bike_sale_id` bigint NOT NULL,
  `investor_id` bigint NOT NULL,
  `profit_amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `profit_share_amount` decimal(20,2) DEFAULT NULL,
  `profit_entry_date` date NOT NULL,
  `profit_share_last_date` date DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '(To Share Profit) 0=Open, 1=Closed',
  `created_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bike_profits`
--

INSERT INTO `bike_profits` (`id`, `bike_sale_id`, `investor_id`, `profit_amount`, `profit_share_amount`, `profit_entry_date`, `profit_share_last_date`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '25000.00', NULL, '2025-06-20', NULL, 0, 1, NULL, '2025-06-20 06:36:53', '2025-06-20 06:36:53'),
(2, 2, 2, '4000.00', NULL, '2025-06-28', NULL, 0, 1, NULL, '2025-06-28 08:57:52', '2025-06-28 08:57:52');

-- --------------------------------------------------------

--
-- Table structure for table `bike_profit_share_records`
--

CREATE TABLE `bike_profit_share_records` (
  `id` bigint UNSIGNED NOT NULL,
  `bike_profit_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `date` date NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bike_services`
--

CREATE TABLE `bike_services` (
  `id` bigint UNSIGNED NOT NULL,
  `bike_service_category_id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `trade_price` double(20,2) NOT NULL DEFAULT '0.00',
  `price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '0=Inactive, 1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bike_services`
--

INSERT INTO `bike_services` (`id`, `bike_service_category_id`, `name`, `trade_price`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'General Bike Inspection', 0.00, '1200.00', 1, '2025-03-05 07:03:49', '2025-03-05 07:07:00'),
(2, 1, 'Periodic Oil Change', 0.00, '1000.00', 1, '2025-03-05 07:04:03', '2025-03-05 07:04:03'),
(3, 2, 'Engine Tuning', 0.00, '1500.00', 1, '2025-03-05 07:04:22', '2025-03-05 07:06:44'),
(4, 2, 'Engine Oil (Mobil)', 0.00, '1000.00', 1, '2025-03-05 07:04:34', '2025-05-30 08:48:21'),
(5, 3, 'Brake Pad', 0.00, '500.00', 1, '2025-03-05 07:04:51', '2025-05-30 08:47:31'),
(6, 3, 'Clutch Cable', 0.00, '400.00', 1, '2025-03-05 07:05:04', '2025-05-30 08:47:12'),
(7, 4, 'Fork Oil Change', 0.00, '2000.00', 1, '2025-03-05 07:05:19', '2025-03-05 07:05:19'),
(8, 4, 'Steering Bearing Replacement', 0.00, '2000.00', 1, '2025-03-05 07:05:43', '2025-03-05 07:05:43'),
(9, 5, 'Battery Charging', 0.00, '100.00', 1, '2025-03-05 07:06:08', '2025-05-30 08:42:30'),
(10, 5, 'Headlight & Indicator Check', 0.00, '3000.00', 1, '2025-03-05 07:06:23', '2025-03-05 07:06:23'),
(11, 11, 'Stamp', 0.00, '100.00', 1, '2025-05-25 09:22:48', '2025-05-25 09:22:48'),
(12, 13, 'CAM', 0.00, '1000.00', 1, '2025-05-27 11:02:57', '2025-05-30 08:12:18'),
(13, 14, 'Spray,Shiner,Wash', 0.00, '600.00', 1, '2025-05-30 08:42:02', '2025-05-30 08:42:02'),
(14, 15, 'Meter Tampering', 0.00, '500.00', 1, '2025-05-30 08:44:00', '2025-05-30 08:44:00'),
(15, 16, 'Expenses', 0.00, '100.00', 1, '2025-05-30 08:45:27', '2025-05-30 08:45:27'),
(16, 17, 'Carrying Cost', 0.00, '1000.00', 1, '2025-05-30 08:46:18', '2025-05-30 08:46:18'),
(17, 10, 'Grip', 0.00, '500.00', 1, '2025-05-30 08:49:15', '2025-05-30 08:49:15'),
(18, 10, 'Gutli', 0.00, '200.00', 1, '2025-05-30 08:49:32', '2025-05-30 08:49:32'),
(19, 7, 'Chain Set', 0.00, '2500.00', 1, '2025-05-30 08:50:13', '2025-05-30 08:50:13'),
(20, 7, 'Front Sprocket', 0.00, '200.00', 1, '2025-05-30 08:50:47', '2025-05-30 08:50:47'),
(21, 7, 'Rare Sprocket', 0.00, '500.00', 1, '2025-05-30 08:51:11', '2025-05-30 08:51:11'),
(22, 8, 'Fuel Motor', 0.00, '1200.00', 1, '2025-05-30 08:51:38', '2025-05-30 08:51:38'),
(23, 10, 'Plug', 0.00, '250.00', 1, '2025-05-30 08:51:56', '2025-05-30 08:51:56'),
(24, 18, 'Headlight Musk', 0.00, '700.00', 1, '2025-05-30 08:54:02', '2025-05-30 08:54:02'),
(25, 10, 'Carburetor', 0.00, '3000.00', 1, '2025-05-30 08:54:30', '2025-05-30 08:55:31'),
(26, 10, 'Carburetor Piston', 0.00, '900.00', 1, '2025-05-30 08:55:13', '2025-05-30 08:55:13'),
(27, 12, 'Zhalay', 0.00, '200.00', 1, '2025-05-30 08:56:22', '2025-05-30 08:56:22'),
(28, 18, 'Fearing', 0.00, '1200.00', 1, '2025-05-30 08:56:57', '2025-05-30 08:56:57'),
(29, 10, 'Foot Rest', 0.00, '500.00', 1, '2025-05-30 08:57:35', '2025-05-30 08:57:35'),
(30, 2, 'Clutch Plate & Pressure Plate', 0.00, '1000.00', 1, '2025-05-30 08:58:26', '2025-05-30 08:58:26'),
(31, 2, 'Clutch Side Full Set', 0.00, '3000.00', 1, '2025-05-30 08:59:00', '2025-05-30 08:59:00'),
(32, 10, 'Rubber', 0.00, '100.00', 1, '2025-05-30 08:59:23', '2025-05-30 08:59:23'),
(33, 10, 'Conduct Switch', 0.00, '400.00', 1, '2025-05-30 08:59:49', '2025-05-30 08:59:49'),
(34, 10, 'Screw', 0.00, '100.00', 1, '2025-05-30 09:00:21', '2025-05-30 09:00:21'),
(35, 10, 'Push Clip', 0.00, '100.00', 1, '2025-05-30 09:00:45', '2025-05-30 09:00:45'),
(36, 10, 'Self Carbon', 0.00, '500.00', 1, '2025-05-30 09:01:36', '2025-05-30 09:01:36'),
(37, 10, 'Looking Glass', 0.00, '300.00', 1, '2025-05-30 09:02:03', '2025-05-30 09:02:03'),
(38, 2, 'Hub Center', 0.00, '2000.00', 1, '2025-05-30 15:04:14', '2025-05-30 15:04:14'),
(39, 18, '7/8 Part', 0.00, '1000.00', 1, '2025-05-30 15:07:16', '2025-05-30 15:07:16'),
(40, 10, 'ACC Cable', 0.00, '300.00', 1, '2025-05-30 15:07:43', '2025-05-30 15:07:43'),
(41, 10, 'Back light Cover', 0.00, '1000.00', 1, '2025-05-30 15:08:23', '2025-05-30 15:08:23'),
(42, 10, 'Back Light', 0.00, '1000.00', 1, '2025-05-30 15:08:40', '2025-05-30 15:08:40'),
(43, 18, 'Back Panel', 0.00, '500.00', 1, '2025-05-30 15:09:10', '2025-05-30 15:09:10'),
(44, 10, 'Ball reacher', 0.00, '1000.00', 1, '2025-05-30 15:09:47', '2025-05-30 15:09:47'),
(45, 10, 'Bearing', 0.00, '200.00', 1, '2025-05-30 15:10:10', '2025-05-30 15:10:10'),
(46, 10, 'Boket', 0.00, '200.00', 1, '2025-05-30 15:10:54', '2025-05-30 15:10:54'),
(47, 10, 'Hos Pipe', 0.00, '300.00', 1, '2025-05-30 15:11:21', '2025-05-30 15:11:21'),
(48, 10, 'Break Padel', 0.00, '1000.00', 1, '2025-05-30 15:11:49', '2025-05-30 15:11:49'),
(49, 10, 'Back Chassis Bush', 0.00, '2000.00', 1, '2025-05-30 15:12:52', '2025-05-30 15:12:52'),
(50, 10, 'Break Caliper', 0.00, '2000.00', 1, '2025-05-30 15:13:24', '2025-05-30 15:13:24'),
(51, 10, 'Break Switch', 0.00, '200.00', 1, '2025-05-30 15:13:48', '2025-05-30 15:13:48'),
(52, 2, 'Carburetor Hos Pipe', 0.00, '200.00', 1, '2025-05-30 15:15:30', '2025-05-30 15:15:30'),
(53, 10, 'CDI', 0.00, '4000.00', 1, '2025-05-30 15:15:46', '2025-05-30 15:15:46'),
(54, 10, 'Rectifier', 0.00, '3000.00', 1, '2025-05-30 15:16:31', '2025-05-30 15:16:31'),
(55, 18, 'Chain Cover', 0.00, '500.00', 1, '2025-05-30 15:16:55', '2025-05-30 15:16:55'),
(56, 10, 'Chok Cable', 0.00, '500.00', 1, '2025-05-30 15:17:13', '2025-05-30 15:17:13'),
(57, 2, 'Cylinder', 0.00, '5000.00', 1, '2025-05-30 15:17:57', '2025-05-30 15:17:57'),
(58, 18, '1/2 Part', 0.00, '6000.00', 1, '2025-05-30 15:18:35', '2025-05-30 15:18:35'),
(59, 18, 'Tank Cover', 0.00, '4000.00', 1, '2025-05-30 15:18:59', '2025-05-30 15:18:59'),
(60, 18, 'Tank Middle Part', 0.00, '1000.00', 1, '2025-05-30 15:19:22', '2025-05-30 15:19:22'),
(61, 18, 'Engine Cover', 0.00, '2000.00', 1, '2025-05-30 15:19:48', '2025-05-30 15:19:48'),
(62, 10, 'Crankshaft', 0.00, '8000.00', 1, '2025-05-30 15:21:19', '2025-05-30 15:21:19'),
(63, 2, 'Connecting Rod', 0.00, '2000.00', 1, '2025-05-30 15:21:38', '2025-05-30 15:21:38'),
(64, 10, 'Drum Rubber', 0.00, '500.00', 1, '2025-05-30 15:22:03', '2025-05-30 15:22:03'),
(65, 10, 'Double Stand', 0.00, '1500.00', 1, '2025-05-30 15:22:21', '2025-05-30 15:22:21'),
(66, 10, 'Single Stand', 0.00, '700.00', 1, '2025-05-30 15:22:39', '2025-05-30 15:22:39'),
(67, 18, 'Head Light Glass', 0.00, '1200.00', 1, '2025-05-30 15:23:07', '2025-05-30 15:23:07'),
(68, 10, 'Clutch Leaver', 0.00, '300.00', 1, '2025-05-30 15:23:34', '2025-05-30 15:23:34'),
(69, 10, 'Break Leaver', 0.00, '300.00', 1, '2025-05-30 15:23:51', '2025-05-30 15:23:51'),
(70, 10, 'Visor', 0.00, '1000.00', 1, '2025-05-30 15:24:15', '2025-05-30 15:24:15'),
(71, 15, 'Meter Casing', 0.00, '1000.00', 1, '2025-05-30 15:24:39', '2025-05-30 15:24:39'),
(72, 4, 'Suspension', 0.00, '5000.00', 1, '2025-05-30 15:25:18', '2025-05-30 15:25:18'),
(73, 4, 'Suspension Oil', 0.00, '350.00', 1, '2025-05-30 15:25:45', '2025-05-30 15:25:45'),
(74, 4, 'Suspension Oil Sill', 0.00, '400.00', 1, '2025-05-30 15:26:08', '2025-05-30 15:26:08'),
(75, 4, 'Suspension Spring', 0.00, '2000.00', 1, '2025-05-30 15:26:24', '2025-05-30 15:26:24'),
(76, 10, 'Handle', 0.00, '700.00', 1, '2025-05-30 15:26:42', '2025-05-30 15:26:42'),
(77, 10, 'Chapa', 0.00, '1500.00', 1, '2025-05-30 15:27:02', '2025-05-30 15:27:02'),
(78, 10, 'Lock Set', 0.00, '2000.00', 1, '2025-05-30 15:27:20', '2025-05-30 15:27:20'),
(79, 10, 'Key', 0.00, '200.00', 1, '2025-05-30 15:27:35', '2025-05-30 15:27:35'),
(80, 10, 'Indicator', 0.00, '300.00', 1, '2025-05-30 15:28:02', '2025-05-30 15:28:02'),
(81, 10, 'Back Carrier', 0.00, '1200.00', 1, '2025-05-30 15:28:44', '2025-05-30 15:28:44'),
(82, 18, 'Cover Five', 0.00, '700.00', 1, '2025-05-30 15:29:05', '2025-05-30 15:29:05'),
(83, 10, 'Silencer Cover', 0.00, '1200.00', 1, '2025-05-30 15:29:39', '2025-05-30 15:29:39'),
(84, 10, 'Silencer Cap', 0.00, '1000.00', 1, '2025-05-30 15:30:06', '2025-05-30 15:30:06'),
(85, 6, 'Tyre Change', 0.00, '200.00', 1, '2025-05-30 15:31:13', '2025-05-30 15:31:13'),
(86, 6, 'Tyre', 0.00, '4000.00', 1, '2025-05-30 15:31:30', '2025-05-30 15:31:30'),
(87, 10, 'Logo', 0.00, '300.00', 1, '2025-05-30 15:32:05', '2025-05-30 15:32:05'),
(88, 10, 'Sticker', 0.00, '1000.00', 1, '2025-05-30 15:32:23', '2025-05-30 15:32:23'),
(89, 10, 'Hydraulic Disk', 0.00, '2000.00', 1, '2025-05-30 15:33:21', '2025-05-30 15:33:21'),
(90, 10, 'Out Coil', 0.00, '1000.00', 1, '2025-05-30 15:33:52', '2025-05-30 15:33:52'),
(91, 18, 'Tank Cap', 0.00, '1000.00', 1, '2025-05-30 15:34:15', '2025-05-30 15:34:15'),
(92, 10, 'Battery', 0.00, '1200.00', 1, '2025-05-30 15:35:21', '2025-05-30 15:35:21'),
(93, 10, 'Fuse', 0.00, '30.00', 1, '2025-05-30 15:35:45', '2025-05-30 15:35:45'),
(94, 10, 'Air Filter', 0.00, '500.00', 1, '2025-05-30 15:36:02', '2025-05-30 15:36:02'),
(95, 10, 'Oil Filter', 0.00, '300.00', 1, '2025-05-30 15:36:26', '2025-05-30 15:36:26'),
(96, 10, 'Throttle Body', 0.00, '5000.00', 1, '2025-05-30 15:37:13', '2025-05-30 15:37:13'),
(97, 10, 'Dim Light', 0.00, '200.00', 1, '2025-05-30 15:38:04', '2025-05-30 15:38:04'),
(98, 10, 'Sit Cover', 0.00, '300.00', 1, '2025-05-30 15:39:50', '2025-05-30 15:39:50'),
(99, 18, 'Side Cover', 0.00, '1000.00', 1, '2025-05-30 15:41:20', '2025-05-30 15:41:20'),
(100, 10, 'Kick', 0.00, '1000.00', 1, '2025-05-30 15:41:57', '2025-05-30 15:41:57'),
(101, 10, 'Fuel Pump', 0.00, '4000.00', 1, '2025-05-30 15:42:28', '2025-05-30 15:42:28'),
(102, 10, 'Fuel Injector', 0.00, '2000.00', 1, '2025-05-30 15:42:48', '2025-05-30 15:42:48'),
(103, 2, 'Adjuster', 0.00, '500.00', 1, '2025-05-30 15:43:16', '2025-05-30 15:43:16'),
(104, 2, 'Guarder', 0.00, '1000.00', 1, '2025-05-30 15:44:12', '2025-05-30 15:44:12'),
(105, 2, 'Timing Chain', 0.00, '1000.00', 1, '2025-05-30 15:45:13', '2025-05-30 15:45:13'),
(106, 2, 'Rocker', 0.00, '2000.00', 1, '2025-05-30 15:46:25', '2025-05-30 15:46:25'),
(107, 2, 'Piston', 0.00, '1200.00', 1, '2025-05-30 15:47:19', '2025-05-30 15:47:19'),
(108, 2, 'Lead Work', 0.00, '500.00', 1, '2025-05-30 15:48:14', '2025-05-30 15:48:14'),
(109, 10, 'Self Motor', 0.00, '1000.00', 1, '2025-05-30 15:50:53', '2025-05-30 15:50:53'),
(110, 10, 'Self Roller', 0.00, '1000.00', 1, '2025-05-30 15:51:34', '2025-05-30 15:51:34'),
(111, 2, 'Valve', 0.00, '2000.00', 1, '2025-05-30 15:52:18', '2025-05-30 15:52:18'),
(112, 2, 'Rocker Pin', 0.00, '500.00', 1, '2025-05-30 15:53:03', '2025-05-30 15:53:03'),
(113, 2, 'Head Rubber', 0.00, '500.00', 1, '2025-05-30 15:53:52', '2025-05-30 15:53:52'),
(114, 2, 'Gaskit', 0.00, '500.00', 1, '2025-05-30 15:54:27', '2025-05-30 15:54:27'),
(115, 2, 'Gear Penium', 0.00, '2000.00', 1, '2025-05-30 15:55:26', '2025-05-30 15:55:26'),
(116, 10, 'Gear Leaver', 0.00, '500.00', 1, '2025-05-30 15:55:53', '2025-05-30 15:55:53'),
(117, 10, 'Coolant', 0.00, '500.00', 1, '2025-05-30 15:56:42', '2025-05-30 15:56:42'),
(118, 14, 'Kerosine', 0.00, '100.00', 1, '2025-05-30 15:57:12', '2025-05-30 15:57:12'),
(119, 14, 'WD-40', 0.00, '350.00', 1, '2025-05-30 15:58:00', '2025-05-30 15:58:00'),
(120, 19, 'Muster Services', 0.00, '2000.00', 1, '2025-05-30 20:26:30', '2025-05-30 20:26:30'),
(121, 19, 'Muster Services', 0.00, '2000.00', 1, '2025-05-30 20:26:30', '2025-05-30 20:26:30'),
(122, 19, 'General Service', 0.00, '1000.00', 1, '2025-05-30 20:27:24', '2025-05-30 20:27:24'),
(123, 19, 'General Service', 0.00, '1000.00', 1, '2025-05-30 20:27:25', '2025-05-30 20:27:25');

-- --------------------------------------------------------

--
-- Table structure for table `bike_service_categories`
--

CREATE TABLE `bike_service_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '0=Inactive, 1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `boxes`
--

CREATE TABLE `boxes` (
  `id` bigint UNSIGNED NOT NULL,
  `box_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `box_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `box_type` enum('small','medium','large') COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` decimal(10,2) DEFAULT NULL COMMENT 'Weight in kg',
  `dimensions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boxes`
--

INSERT INTO `boxes` (`id`, `box_name`, `box_code`, `box_type`, `weight`, `dimensions`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Small Box A', 'BX-S-01', 'medium', '1.20', '20x15x10 cm', 1, NULL, NULL),
(2, 'Small Box B', 'BX-S-02', 'small', '1.30', '21x16x11 cm', 1, NULL, NULL),
(3, 'Small Box C', 'BX-S-03', 'small', '1.25', '22x17x12 cm', 1, NULL, NULL),
(4, 'Small Box D', 'BX-S-04', 'small', '1.10', '19x14x9 cm', 1, NULL, NULL),
(5, 'Medium Box A', 'BX-M-01', 'medium', '3.50', '40x30x20 cm', 1, NULL, NULL),
(6, 'Medium Box B', 'BX-M-02', 'medium', '3.80', '42x32x22 cm', 1, NULL, NULL),
(7, 'Medium Box C', 'BX-M-03', 'medium', '4.00', '45x35x25 cm', 1, NULL, NULL),
(8, 'Large Box A', 'BX-L-01', 'large', '6.50', '60x45x40 cm', 1, NULL, NULL),
(9, 'Large Box B', 'BX-L-02', 'large', '7.00', '65x50x45 cm', 1, NULL, NULL),
(10, 'Large Box C', 'BX-L-03', 'large', '7.20', '70x55x50 cm', 1, NULL, NULL),
(11, 'Large Box D', 'BX-L-04', 'large', '7.80', '75x60x55 cm', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint NOT NULL DEFAULT '0',
  `branch_type` enum('Branch','Hub') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Branch',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_main_branch` tinyint NOT NULL DEFAULT '0',
  `commission_percentage` double(20,2) NOT NULL DEFAULT '0.00',
  `status` tinyint NOT NULL DEFAULT '0',
  `created_by_id` int NOT NULL,
  `updated_by_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `parent_id`, `branch_type`, `code`, `title`, `phone`, `address`, `is_main_branch`, `commission_percentage`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 0, 'Branch', 'B-1212', 'Dhaka Branch', '+1 (865) 461-2564', 'Aut in maiores omnis', 1, 5.00, 1, 0, 0, '2025-07-21 06:00:53', '2025-07-23 05:29:35'),
(2, 1, 'Branch', '456789', 'Sylhet Branch', '34567890', 'Labore ipsa natus a', 0, 4.75, 1, 0, 0, '2025-07-21 06:45:42', '2025-07-23 05:07:06'),
(3, 1, 'Branch', 'B12345', 'Noakhali', '3456789', NULL, 0, 5.00, 1, 0, 0, '2025-07-21 10:48:30', '2025-07-21 10:48:30'),
(4, 3, 'Hub', '34567890-', 'Companigonj', '5467890', NULL, 0, 6.89, 1, 0, 0, '2025-07-21 10:48:56', '2025-07-23 05:32:49'),
(5, 4, 'Branch', '567890', 'Hazarihat', '7890-', NULL, 0, 5.00, 1, 0, 0, '2025-07-21 10:49:41', '2025-07-21 10:49:41'),
(6, 5, 'Branch', '567890-', 'Charparboti', '34567890', 'fghjk', 0, 7.00, 1, 0, 0, '2025-07-21 11:27:10', '2025-07-21 11:27:10'),
(7, 2, 'Hub', '23456', 'Moulvibazar', '+88 01839317038', 'Moulvibazar, Karamotiya.', 0, 8.50, 1, 0, 0, '2025-07-21 11:46:22', '2025-07-28 10:17:18');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_cat_id` int NOT NULL DEFAULT '0',
  `cat_type_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_cat_id`, `cat_type_id`, `title`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Safety Gear', NULL, 1, '2025-03-15 04:32:37', '2025-03-15 04:32:37'),
(2, 0, 1, 'Comfort & Convenience', NULL, 1, '2025-03-15 04:32:46', '2025-03-15 04:32:46'),
(3, 0, 1, 'Storage & Luggage', NULL, 1, '2025-03-15 04:33:00', '2025-03-15 04:33:00'),
(4, 0, 1, 'Lighting & Electrical', NULL, 1, '2025-03-15 04:33:11', '2025-03-15 04:33:11'),
(5, 0, 1, 'Aesthetic & Styling', NULL, 1, '2025-03-15 04:33:27', '2025-03-15 04:33:27'),
(6, 0, 2, 'Engine & Transmission', NULL, 1, '2025-03-15 04:33:38', '2025-03-15 04:33:38'),
(7, 0, 2, 'Braking System', NULL, 1, '2025-03-15 04:33:48', '2025-03-15 04:33:48'),
(8, 0, 2, 'Suspension & Chassis', NULL, 1, '2025-03-15 04:34:01', '2025-03-15 04:34:01'),
(9, 0, 2, 'Fuel System', NULL, 1, '2025-03-15 04:34:07', '2025-03-15 04:34:07'),
(11, 1, 1, 'Head Protection', NULL, 1, '2025-03-15 04:42:40', '2025-03-15 04:48:58'),
(12, 1, 1, 'Body Protection', NULL, 1, '2025-03-15 04:42:49', '2025-03-15 04:49:22'),
(13, 2, 1, 'Seating Comfort', NULL, 1, '2025-03-15 04:43:09', '2025-03-15 04:49:51'),
(14, 2, 1, 'Handle Enhancements', NULL, 1, '2025-03-15 04:43:21', '2025-03-15 04:50:15'),
(15, 3, 1, 'On-Bike Storage', NULL, 1, '2025-03-15 04:43:35', '2025-03-15 04:50:35'),
(16, 3, 1, 'Lockable Storage', NULL, 1, '2025-03-15 04:43:48', '2025-03-15 04:50:47'),
(17, 4, 1, 'Exterior Lighting', NULL, 1, '2025-03-15 04:44:00', '2025-03-15 04:52:06'),
(18, 4, 1, 'Electrical Accessories', NULL, 1, '2025-03-15 04:53:04', '2025-03-15 04:53:04'),
(19, 5, 1, 'Exterior Decoration', NULL, 1, '2025-03-15 04:53:21', '2025-03-15 04:53:21'),
(20, 5, 1, 'Functional Aesthetics', NULL, 1, '2025-03-15 04:53:45', '2025-03-15 04:53:45'),
(21, 6, 2, 'Internal Components', NULL, 1, '2025-03-15 04:54:00', '2025-03-15 04:54:00'),
(22, 6, 2, 'Transmission Parts', NULL, 1, '2025-03-15 04:54:10', '2025-03-15 04:54:10'),
(23, 7, 2, 'Brake Components', NULL, 1, '2025-03-15 04:54:21', '2025-03-15 04:54:21'),
(24, 7, 2, 'Hydraulic Systems', NULL, 1, '2025-03-15 04:54:29', '2025-03-15 04:54:29'),
(25, 0, 1, 'Helmet', NULL, 1, '2025-05-26 15:52:09', '2025-05-26 15:52:09'),
(26, 25, 1, 'ILM', NULL, 1, '2025-05-26 15:55:26', '2025-05-26 15:55:26'),
(27, 0, 1, 'Wheels', NULL, 1, '2025-06-14 14:09:33', '2025-06-14 14:09:56'),
(28, 27, 1, 'Chain Badge', NULL, 1, '2025-06-14 14:11:04', '2025-06-14 14:11:04'),
(29, 27, 1, 'Spoke', NULL, 1, '2025-06-14 14:11:25', '2025-06-14 14:11:25');

-- --------------------------------------------------------

--
-- Table structure for table `category_types`
--

CREATE TABLE `category_types` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_types`
--

INSERT INTO `category_types` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Accessories', '2025-03-15 04:05:13', '2025-03-15 04:05:13'),
(2, 'Spare Parts', '2025-03-15 04:05:13', '2025-03-15 04:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', 1, NULL, NULL),
(2, 'AL', 'Albania', 1, NULL, NULL),
(3, 'DZ', 'Algeria', 1, NULL, NULL),
(4, 'AS', 'American Samoa', 1, NULL, NULL),
(5, 'AD', 'Andorra', 1, NULL, NULL),
(6, 'AO', 'Angola', 1, NULL, NULL),
(7, 'AI', 'Anguilla', 1, NULL, NULL),
(8, 'AQ', 'Antarctica', 1, NULL, NULL),
(9, 'AG', 'Antigua and Barbuda', 1, NULL, NULL),
(10, 'AR', 'Argentina', 1, NULL, NULL),
(11, 'AM', 'Armenia', 1, NULL, NULL),
(12, 'AW', 'Aruba', 1, NULL, NULL),
(13, 'AU', 'Australia', 1, NULL, NULL),
(14, 'AT', 'Austria', 1, NULL, NULL),
(15, 'AZ', 'Azerbaijan', 1, NULL, NULL),
(16, 'BS', 'Bahamas', 1, NULL, NULL),
(17, 'BH', 'Bahrain', 1, NULL, NULL),
(18, 'BD', 'Bangladesh', 1, NULL, NULL),
(19, 'BB', 'Barbados', 1, NULL, NULL),
(20, 'BY', 'Belarus', 1, NULL, NULL),
(21, 'BE', 'Belgium', 1, NULL, NULL),
(22, 'BZ', 'Belize', 1, NULL, NULL),
(23, 'BJ', 'Benin', 1, NULL, NULL),
(24, 'BM', 'Bermuda', 1, NULL, NULL),
(25, 'BT', 'Bhutan', 1, NULL, NULL),
(26, 'BO', 'Bolivia', 1, NULL, NULL),
(27, 'BA', 'Bosnia and Herzegovina', 1, NULL, NULL),
(28, 'BW', 'Botswana', 1, NULL, NULL),
(29, 'BV', 'Bouvet Island', 1, NULL, NULL),
(30, 'BR', 'Brazil', 1, NULL, NULL),
(31, 'IO', 'British Indian Ocean Territory', 1, NULL, NULL),
(32, 'BN', 'Brunei Darussalam', 1, NULL, NULL),
(33, 'BG', 'Bulgaria', 1, NULL, NULL),
(34, 'BF', 'Burkina Faso', 1, NULL, NULL),
(35, 'BI', 'Burundi', 1, NULL, NULL),
(36, 'KH', 'Cambodia', 1, NULL, NULL),
(37, 'CM', 'Cameroon', 1, NULL, NULL),
(38, 'CA', 'Canada', 1, NULL, NULL),
(39, 'CV', 'Cape Verde', 1, NULL, NULL),
(40, 'KY', 'Cayman Islands', 1, NULL, NULL),
(41, 'CF', 'Central African Republic', 1, NULL, NULL),
(42, 'TD', 'Chad', 1, NULL, NULL),
(43, 'CL', 'Chile', 1, NULL, NULL),
(44, 'CN', 'China', 1, NULL, NULL),
(45, 'CX', 'Christmas Island', 1, NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', 1, NULL, NULL),
(47, 'CO', 'Colombia', 1, NULL, NULL),
(48, 'KM', 'Comoros', 1, NULL, NULL),
(49, 'CD', 'Democratic Republic of the Congo', 1, NULL, NULL),
(50, 'CG', 'Republic of Congo', 1, NULL, NULL),
(51, 'CK', 'Cook Islands', 1, NULL, NULL),
(52, 'CR', 'Costa Rica', 1, NULL, NULL),
(53, 'HR', 'Croatia (Hrvatska)', 1, NULL, NULL),
(54, 'CU', 'Cuba', 1, NULL, NULL),
(55, 'CY', 'Cyprus', 1, NULL, NULL),
(56, 'CZ', 'Czech Republic', 1, NULL, NULL),
(57, 'DK', 'Denmark', 1, NULL, NULL),
(58, 'DJ', 'Djibouti', 1, NULL, NULL),
(59, 'DM', 'Dominica', 1, NULL, NULL),
(60, 'DO', 'Dominican Republic', 1, NULL, NULL),
(61, 'TL', 'East Timor', 1, NULL, NULL),
(62, 'EC', 'Ecuador', 1, NULL, NULL),
(63, 'EG', 'Egypt', 1, NULL, NULL),
(64, 'SV', 'El Salvador', 1, NULL, NULL),
(65, 'GQ', 'Equatorial Guinea', 1, NULL, NULL),
(66, 'ER', 'Eritrea', 1, NULL, NULL),
(67, 'EE', 'Estonia', 1, NULL, NULL),
(68, 'ET', 'Ethiopia', 1, NULL, NULL),
(69, 'FK', 'Falkland Islands (Malvinas)', 1, NULL, NULL),
(70, 'FO', 'Faroe Islands', 1, NULL, NULL),
(71, 'FJ', 'Fiji', 1, NULL, NULL),
(72, 'FI', 'Finland', 1, NULL, NULL),
(73, 'FR', 'France', 1, NULL, NULL),
(74, 'FX', 'France, Metropolitan', 1, NULL, NULL),
(75, 'GF', 'French Guiana', 1, NULL, NULL),
(76, 'PF', 'French Polynesia', 1, NULL, NULL),
(77, 'TF', 'French Southern Territories', 1, NULL, NULL),
(78, 'GA', 'Gabon', 1, NULL, NULL),
(79, 'GM', 'Gambia', 1, NULL, NULL),
(80, 'GE', 'Georgia', 1, NULL, NULL),
(81, 'DE', 'Germany', 1, NULL, NULL),
(82, 'GH', 'Ghana', 1, NULL, NULL),
(83, 'GI', 'Gibraltar', 1, NULL, NULL),
(84, 'GG', 'Guernsey', 1, NULL, NULL),
(85, 'GR', 'Greece', 1, NULL, NULL),
(86, 'GL', 'Greenland', 1, NULL, NULL),
(87, 'GD', 'Grenada', 1, NULL, NULL),
(88, 'GP', 'Guadeloupe', 1, NULL, NULL),
(89, 'GU', 'Guam', 1, NULL, NULL),
(90, 'GT', 'Guatemala', 1, NULL, NULL),
(91, 'GN', 'Guinea', 1, NULL, NULL),
(92, 'GW', 'Guinea-Bissau', 1, NULL, NULL),
(93, 'GY', 'Guyana', 1, NULL, NULL),
(94, 'HT', 'Haiti', 1, NULL, NULL),
(95, 'HM', 'Heard and Mc Donald Islands', 1, NULL, NULL),
(96, 'HN', 'Honduras', 1, NULL, NULL),
(97, 'HK', 'Hong Kong', 1, NULL, NULL),
(98, 'HU', 'Hungary', 1, NULL, NULL),
(99, 'IS', 'Iceland', 1, NULL, NULL),
(100, 'IN', 'India', 1, NULL, NULL),
(101, 'IM', 'Isle of Man', 1, NULL, NULL),
(102, 'ID', 'Indonesia', 1, NULL, NULL),
(103, 'IR', 'Iran (Islamic Republic of)', 1, NULL, NULL),
(104, 'IQ', 'Iraq', 1, NULL, NULL),
(105, 'IE', 'Ireland', 1, NULL, NULL),
(106, 'IL', 'Israel', 1, NULL, NULL),
(107, 'IT', 'Italy', 1, NULL, NULL),
(108, 'CI', 'Ivory Coast', 1, NULL, NULL),
(109, 'JE', 'Jersey', 1, NULL, NULL),
(110, 'JM', 'Jamaica', 1, NULL, NULL),
(111, 'JP', 'Japan', 1, NULL, NULL),
(112, 'JO', 'Jordan', 1, NULL, NULL),
(113, 'KZ', 'Kazakhstan', 1, NULL, NULL),
(114, 'KE', 'Kenya', 1, NULL, NULL),
(115, 'KI', 'Kiribati', 1, NULL, NULL),
(116, 'KP', 'Korea, Democratic People\'s Republic of', 1, NULL, NULL),
(117, 'KR', 'Korea, Republic of', 1, NULL, NULL),
(118, 'XK', 'Kosovo', 1, NULL, NULL),
(119, 'KW', 'Kuwait', 1, NULL, NULL),
(120, 'KG', 'Kyrgyzstan', 1, NULL, NULL),
(121, 'LA', 'Lao People\'s Democratic Republic', 1, NULL, NULL),
(122, 'LV', 'Latvia', 1, NULL, NULL),
(123, 'LB', 'Lebanon', 1, NULL, NULL),
(124, 'LS', 'Lesotho', 1, NULL, NULL),
(125, 'LR', 'Liberia', 1, NULL, NULL),
(126, 'LY', 'Libyan Arab Jamahiriya', 1, NULL, NULL),
(127, 'LI', 'Liechtenstein', 1, NULL, NULL),
(128, 'LT', 'Lithuania', 1, NULL, NULL),
(129, 'LU', 'Luxembourg', 1, NULL, NULL),
(130, 'MO', 'Macau', 1, NULL, NULL),
(131, 'MK', 'North Macedonia', 1, NULL, NULL),
(132, 'MG', 'Madagascar', 1, NULL, NULL),
(133, 'MW', 'Malawi', 1, NULL, NULL),
(134, 'MY', 'Malaysia', 1, NULL, NULL),
(135, 'MV', 'Maldives', 1, NULL, NULL),
(136, 'ML', 'Mali', 1, NULL, NULL),
(137, 'MT', 'Malta', 1, NULL, NULL),
(138, 'MH', 'Marshall Islands', 1, NULL, NULL),
(139, 'MQ', 'Martinique', 1, NULL, NULL),
(140, 'MR', 'Mauritania', 1, NULL, NULL),
(141, 'MU', 'Mauritius', 1, NULL, NULL),
(142, 'YT', 'Mayotte', 1, NULL, NULL),
(143, 'MX', 'Mexico', 1, NULL, NULL),
(144, 'FM', 'Micronesia, Federated States of', 1, NULL, NULL),
(145, 'MD', 'Moldova, Republic of', 1, NULL, NULL),
(146, 'MC', 'Monaco', 1, NULL, NULL),
(147, 'MN', 'Mongolia', 1, NULL, NULL),
(148, 'ME', 'Montenegro', 1, NULL, NULL),
(149, 'MS', 'Montserrat', 1, NULL, NULL),
(150, 'MA', 'Morocco', 1, NULL, NULL),
(151, 'MZ', 'Mozambique', 1, NULL, NULL),
(152, 'MM', 'Myanmar', 1, NULL, NULL),
(153, 'NA', 'Namibia', 1, NULL, NULL),
(154, 'NR', 'Nauru', 1, NULL, NULL),
(155, 'NP', 'Nepal', 1, NULL, NULL),
(156, 'NL', 'Netherlands', 1, NULL, NULL),
(157, 'AN', 'Netherlands Antilles', 1, NULL, NULL),
(158, 'NC', 'New Caledonia', 1, NULL, NULL),
(159, 'NZ', 'New Zealand', 1, NULL, NULL),
(160, 'NI', 'Nicaragua', 1, NULL, NULL),
(161, 'NE', 'Niger', 1, NULL, NULL),
(162, 'NG', 'Nigeria', 1, NULL, NULL),
(163, 'NU', 'Niue', 1, NULL, NULL),
(164, 'NF', 'Norfolk Island', 1, NULL, NULL),
(165, 'MP', 'Northern Mariana Islands', 1, NULL, NULL),
(166, 'NO', 'Norway', 1, NULL, NULL),
(167, 'OM', 'Oman', 1, NULL, NULL),
(168, 'PK', 'Pakistan', 1, NULL, NULL),
(169, 'PW', 'Palau', 1, NULL, NULL),
(170, 'PS', 'Palestine', 1, NULL, NULL),
(171, 'PA', 'Panama', 1, NULL, NULL),
(172, 'PG', 'Papua New Guinea', 1, NULL, NULL),
(173, 'PY', 'Paraguay', 1, NULL, NULL),
(174, 'PE', 'Peru', 1, NULL, NULL),
(175, 'PH', 'Philippines', 1, NULL, NULL),
(176, 'PN', 'Pitcairn', 1, NULL, NULL),
(177, 'PL', 'Poland', 1, NULL, NULL),
(178, 'PT', 'Portugal', 1, NULL, NULL),
(179, 'PR', 'Puerto Rico', 1, NULL, NULL),
(180, 'QA', 'Qatar', 1, NULL, NULL),
(181, 'RE', 'Reunion', 1, NULL, NULL),
(182, 'RO', 'Romania', 1, NULL, NULL),
(183, 'RU', 'Russian Federation', 1, NULL, NULL),
(184, 'RW', 'Rwanda', 1, NULL, NULL),
(185, 'KN', 'Saint Kitts and Nevis', 1, NULL, NULL),
(186, 'LC', 'Saint Lucia', 1, NULL, NULL),
(187, 'VC', 'Saint Vincent and the Grenadines', 1, NULL, NULL),
(188, 'WS', 'Samoa', 1, NULL, NULL),
(189, 'SM', 'San Marino', 1, NULL, NULL),
(190, 'ST', 'Sao Tome and Principe', 1, NULL, NULL),
(191, 'SA', 'Saudi Arabia', 1, NULL, NULL),
(192, 'SN', 'Senegal', 1, NULL, NULL),
(193, 'RS', 'Serbia', 1, NULL, NULL),
(194, 'SC', 'Seychelles', 1, NULL, NULL),
(195, 'SL', 'Sierra Leone', 1, NULL, NULL),
(196, 'SG', 'Singapore', 1, NULL, NULL),
(197, 'SK', 'Slovakia', 1, NULL, NULL),
(198, 'SI', 'Slovenia', 1, NULL, NULL),
(199, 'SB', 'Solomon Islands', 1, NULL, NULL),
(200, 'SO', 'Somalia', 1, NULL, NULL),
(201, 'ZA', 'South Africa', 1, NULL, NULL),
(202, 'GS', 'South Georgia South Sandwich Islands', 1, NULL, NULL),
(203, 'SS', 'South Sudan', 1, NULL, NULL),
(204, 'ES', 'Spain', 1, NULL, NULL),
(205, 'LK', 'Sri Lanka', 1, NULL, NULL),
(206, 'SH', 'St. Helena', 1, NULL, NULL),
(207, 'PM', 'St. Pierre and Miquelon', 1, NULL, NULL),
(208, 'SD', 'Sudan', 1, NULL, NULL),
(209, 'SR', 'Suriname', 1, NULL, NULL),
(210, 'SJ', 'Svalbard and Jan Mayen Islands', 1, NULL, NULL),
(211, 'SZ', 'Eswatini', 1, NULL, NULL),
(212, 'SE', 'Sweden', 1, NULL, NULL),
(213, 'CH', 'Switzerland', 1, NULL, NULL),
(214, 'SY', 'Syrian Arab Republic', 1, NULL, NULL),
(215, 'TW', 'Taiwan', 1, NULL, NULL),
(216, 'TJ', 'Tajikistan', 1, NULL, NULL),
(217, 'TZ', 'Tanzania, United Republic of', 1, NULL, NULL),
(218, 'TH', 'Thailand', 1, NULL, NULL),
(219, 'TG', 'Togo', 1, NULL, NULL),
(220, 'TK', 'Tokelau', 1, NULL, NULL),
(221, 'TO', 'Tonga', 1, NULL, NULL),
(222, 'TT', 'Trinidad and Tobago', 1, NULL, NULL),
(223, 'TN', 'Tunisia', 1, NULL, NULL),
(224, 'TR', 'Turkey', 1, NULL, NULL),
(225, 'TM', 'Turkmenistan', 1, NULL, NULL),
(226, 'TC', 'Turks and Caicos Islands', 1, NULL, NULL),
(227, 'TV', 'Tuvalu', 1, NULL, NULL),
(228, 'UG', 'Uganda', 1, NULL, NULL),
(229, 'UA', 'Ukraine', 1, NULL, NULL),
(230, 'AE', 'United Arab Emirates', 1, NULL, NULL),
(231, 'GB', 'United Kingdom', 1, NULL, NULL),
(232, 'US', 'United States', 1, NULL, NULL),
(233, 'UM', 'United States minor outlying islands', 1, NULL, NULL),
(234, 'UY', 'Uruguay', 1, NULL, NULL),
(235, 'UZ', 'Uzbekistan', 1, NULL, NULL),
(236, 'VU', 'Vanuatu', 1, NULL, NULL),
(237, 'VA', 'Vatican City State', 1, NULL, NULL),
(238, 'VE', 'Venezuela', 1, NULL, NULL),
(239, 'VN', 'Vietnam', 1, NULL, NULL),
(240, 'VG', 'Virgin Islands (British)', 1, NULL, NULL),
(241, 'VI', 'Virgin Islands (U.S.)', 1, NULL, NULL),
(242, 'WF', 'Wallis and Futuna Islands', 1, NULL, NULL),
(243, 'EH', 'Western Sahara', 1, NULL, NULL),
(244, 'YE', 'Yemen', 1, NULL, NULL),
(245, 'ZM', 'Zambia', 1, NULL, NULL),
(246, 'ZW', 'Zimbabwe', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Walk-in Customer',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `organization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_balance` double(20,2) NOT NULL DEFAULT '0.00',
  `customer_type` tinyint NOT NULL DEFAULT '0' COMMENT '0=General Customer, 1=Default Customer',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `organization`, `current_balance`, `customer_type`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 'Barun Shaha', NULL, '0145111111', 'Dhaka', NULL, 0.00, 0, '1', NULL, NULL, '2025-06-20 06:31:20', '2025-06-20 06:31:27'),
(2, 'Rana Dash', NULL, NULL, NULL, NULL, 0.00, 0, '1', NULL, NULL, '2025-06-20 06:46:03', '2025-06-20 06:46:10'),
(3, 'Mamun', NULL, NULL, NULL, NULL, 0.00, 0, '1', NULL, NULL, '2025-06-20 07:09:25', '2025-06-20 07:09:30');

-- --------------------------------------------------------

--
-- Table structure for table `customer_ledgers`
--

CREATE TABLE `customer_ledgers` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` int NOT NULL,
  `sale_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `particular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `debit_amount` decimal(20,2) DEFAULT NULL,
  `credit_amount` decimal(20,2) DEFAULT NULL,
  `current_balance` decimal(20,2) NOT NULL,
  `reference_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_ledgers`
--

INSERT INTO `customer_ledgers` (`id`, `customer_id`, `sale_id`, `payment_id`, `account_id`, `particular`, `date`, `debit_amount`, `credit_amount`, `current_balance`, `reference_number`, `note`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, 'Sale', '2025-06-20', NULL, '200.00', '200.00', NULL, NULL, 1, NULL, '2025-06-20 06:31:27', '2025-06-20 06:31:27'),
(2, 1, NULL, 1, 1, 'Payment', '2025-06-20', '200.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-06-20 06:31:27', '2025-06-20 06:31:27'),
(3, 2, 2, NULL, NULL, 'Sale', '2025-06-20', NULL, '1900.00', '1900.00', NULL, NULL, 1, NULL, '2025-06-20 06:46:10', '2025-06-20 06:46:10'),
(4, 2, NULL, 2, 1, 'Payment', '2025-06-20', '1900.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-06-20 06:46:10', '2025-06-20 06:46:10'),
(5, 3, 3, NULL, NULL, 'Sale', '2025-06-20', NULL, '5500.00', '5500.00', NULL, NULL, 1, NULL, '2025-06-20 07:09:30', '2025-06-20 07:09:30'),
(6, 3, NULL, 3, 1, 'Payment', '2025-06-20', '5500.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-06-20 07:09:30', '2025-06-20 07:09:30');

-- --------------------------------------------------------

--
-- Table structure for table `customer_payments`
--

CREATE TABLE `customer_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `sale_id` bigint DEFAULT NULL,
  `date` date NOT NULL,
  `amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_payments`
--

INSERT INTO `customer_payments` (`id`, `customer_id`, `account_id`, `sale_id`, `date`, `amount`, `reference_number`, `note`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2025-06-20', 200.00, NULL, NULL, 1, 1, NULL, '2025-06-20 06:31:27', '2025-06-20 06:31:27'),
(2, 2, 1, 2, '2025-06-20', 1900.00, NULL, NULL, 1, 1, NULL, '2025-06-20 06:46:10', '2025-06-20 06:46:10'),
(3, 3, 1, 3, '2025-06-20', 5500.00, NULL, NULL, 1, 1, NULL, '2025-06-20 07:09:30', '2025-06-20 07:09:30');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'IT', '2025-07-21 05:59:59', '2025-07-21 05:59:59');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Manager', '2025-07-21 06:00:08', '2025-07-21 06:00:08');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint UNSIGNED NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  `branch_id` int NOT NULL,
  `department_id` int NOT NULL,
  `designation_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `is_default`, `branch_id`, `department_id`, `designation_id`, `name`, `email`, `contact`, `date_of_birth`, `date_of_joining`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 'Super Admin', 'admin@gmail.com', '01839317038', '2025-07-21', '2025-07-21', 1, '2025-07-21 06:02:11', '2025-07-21 06:02:11'),
(3, 0, 2, 1, 1, 'Nowab Shorif', 'nsanoman@gmail.com', '01839317038', '2025-07-21', '2025-07-26', 1, '2025-07-21 06:52:23', '2025-07-21 06:52:23'),
(4, 0, 2, 1, 1, 'Malek Azad', 'malekazad@gmail.com', '01839317038', '2025-07-21', NULL, 1, '2025-07-21 07:25:50', '2025-07-21 07:46:13');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `account_id` bigint NOT NULL,
  `expense_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `total_amount` decimal(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `account_id`, `expense_no`, `date`, `total_amount`, `reference_number`, `note`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, '0000001', '2025-06-18', '23000.00', NULL, NULL, 1, 1, 1, '2025-06-18 17:58:08', '2025-06-18 17:58:13');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `cat_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `cat_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Rent & Utilities', 1, '2025-03-12 04:18:47', '2025-03-12 04:18:47'),
(2, 'Employee Salaries', 1, '2025-03-12 04:18:59', '2025-03-12 04:18:59'),
(3, 'Bike Parts & Accessories', 1, '2025-03-12 04:19:10', '2025-03-12 04:19:10'),
(4, 'Supplier Payments', 1, '2025-03-12 04:19:16', '2025-03-12 04:19:16'),
(5, 'Marketing & Advertising', 1, '2025-03-12 04:19:22', '2025-03-12 04:19:22'),
(6, 'Maintenance & Repairs', 1, '2025-03-12 04:19:29', '2025-03-12 04:19:29'),
(7, 'Insurance Costs', 1, '2025-03-12 04:19:34', '2025-03-12 04:19:34'),
(8, 'Software & Subscriptions', 1, '2025-03-12 04:19:41', '2025-03-12 04:19:41'),
(9, 'Office Supplies', 1, '2025-03-12 04:19:46', '2025-03-12 04:19:46'),
(10, 'Miscellaneous Expenses', 1, '2025-03-12 04:19:52', '2025-03-12 04:34:14');

-- --------------------------------------------------------

--
-- Table structure for table `expense_details`
--

CREATE TABLE `expense_details` (
  `id` bigint UNSIGNED NOT NULL,
  `expense_id` int NOT NULL,
  `expense_head_id` int NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_details`
--

INSERT INTO `expense_details` (`id`, `expense_id`, `expense_head_id`, `amount`, `quantity`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '23000.00', '1.00', NULL, '2025-06-18 17:58:08', '2025-06-18 17:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `expense_heads`
--

CREATE TABLE `expense_heads` (
  `id` bigint UNSIGNED NOT NULL,
  `expense_category_id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_heads`
--

INSERT INTO `expense_heads` (`id`, `expense_category_id`, `title`, `code`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Office Rent', '8082', 1, 1, NULL, '2025-03-12 05:26:50', '2025-03-12 05:26:50'),
(2, 1, 'Electricity Bills', NULL, 1, 1, NULL, '2025-03-12 05:36:58', '2025-03-12 05:36:58'),
(3, 2, 'Monthly Salaries', NULL, 1, 1, NULL, '2025-03-12 05:49:49', '2025-03-12 05:49:49'),
(4, 2, 'Bonus & Incentives', NULL, 1, 1, NULL, '2025-03-12 05:50:02', '2025-03-12 05:50:02'),
(5, 3, 'Engine Parts', NULL, 1, 1, NULL, '2025-03-12 05:50:16', '2025-03-12 05:50:16'),
(6, 3, 'Tires & Tubes', NULL, 1, 1, NULL, '2025-03-12 05:50:24', '2025-03-12 05:50:24'),
(7, 4, 'Raw Material Payments', NULL, 1, 1, NULL, '2025-03-12 05:50:34', '2025-03-12 05:50:34'),
(8, 4, 'Supplier Service Fees', NULL, 1, 1, NULL, '2025-03-12 05:50:45', '2025-03-12 05:50:45'),
(9, 5, 'Digital Advertising', NULL, 1, 1, NULL, '2025-03-12 05:51:00', '2025-03-12 05:51:00'),
(10, 5, 'Print Advertising', NULL, 1, 1, NULL, '2025-03-12 05:51:09', '2025-03-12 05:51:09'),
(11, 6, 'Workshop Equipment Maintenance', NULL, 1, 1, NULL, '2025-03-12 05:51:27', '2025-03-12 05:51:27'),
(12, 5, 'Bike Repair Tools', NULL, 1, 1, NULL, '2025-03-12 05:51:36', '2025-03-12 05:51:36'),
(13, 7, 'Property Insurance', NULL, 1, 1, NULL, '2025-03-12 05:51:45', '2025-03-12 05:51:45'),
(14, 1, 'Showroom Rent', NULL, 1, 1, 1, '2025-03-12 05:51:56', '2025-05-26 14:00:04'),
(15, 8, 'Point of Sale (POS) Software Subscription', NULL, 1, 1, NULL, '2025-03-12 05:52:21', '2025-03-12 05:52:21'),
(16, 8, 'Inventory Management Software', NULL, 1, 1, NULL, '2025-03-12 05:52:35', '2025-03-12 05:52:35'),
(17, 9, 'Stationery', NULL, 1, 1, NULL, '2025-03-12 05:52:50', '2025-03-12 05:52:50'),
(18, 9, 'Office Furniture', NULL, 1, 1, NULL, '2025-03-12 05:53:05', '2025-03-12 05:53:05'),
(19, 10, 'Bank Fees', NULL, 1, 1, NULL, '2025-03-12 05:53:23', '2025-03-12 05:53:23'),
(20, 10, 'Travel Expenses', NULL, 1, 1, 1, '2025-03-12 05:53:34', '2025-03-12 06:01:22');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `id` bigint UNSIGNED NOT NULL,
  `hub_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flight_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flight_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`id`, `hub_id`, `flight_name`, `flight_code`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', 'AIRSHIP', 'FL0043', 1, '2025-07-28 10:32:42', '2025-07-28 10:32:42'),
(2, '4', 'Kessie Wall', 'FL0043', 1, '2025-07-28 10:35:17', '2025-07-28 11:21:36');

-- --------------------------------------------------------

--
-- Table structure for table `frontend_menus`
--

CREATE TABLE `frontend_menus` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `srln` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_in_menus` tinyint NOT NULL DEFAULT '1',
  `is_in_pages` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfer_histories`
--

CREATE TABLE `fund_transfer_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `transfer_date` date NOT NULL,
  `from_account_id` bigint UNSIGNED NOT NULL,
  `to_account_id` bigint UNSIGNED NOT NULL,
  `amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `updated_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fund_transfer_histories`
--

INSERT INTO `fund_transfer_histories` (`id`, `transfer_date`, `from_account_id`, `to_account_id`, `amount`, `reference_number`, `description`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, '2025-06-20', 1, 4, 10000.00, 'To Purchase parts', NULL, 1, 1, NULL, '2025-06-20 06:40:21', '2025-06-20 06:40:41');

-- --------------------------------------------------------

--
-- Table structure for table `investors`
--

CREATE TABLE `investors` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date NOT NULL,
  `nid` bigint NOT NULL,
  `investment_capital` double(20,2) NOT NULL DEFAULT '0.00',
  `balance` double(20,2) NOT NULL DEFAULT '0.00',
  `is_self` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '0=Not Self, 1=Self',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1=active, 0=inactive',
  `created_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investors`
--

INSERT INTO `investors` (`id`, `name`, `email`, `contact`, `address`, `dob`, `nid`, `investment_capital`, `balance`, `is_self`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 'Wonder Tech BD', 'admin@gmail.com', '01712114756', 'Shop-357,  Dhaka-1219, Bangladesh', '1994-04-11', 2402451401, 14125.00, -125400.00, 1, 1, 1, 1, '2025-04-16 04:20:15', '2025-06-28 10:58:58'),
(2, 'Karim Rana', 'sohel@gmail.com', '017121111111', 'Aftabnagar, Rampura, Dhaka', '1980-01-01', 123456789, 1437000.00, 286000.00, 0, 1, 1, 1, '2025-05-31 09:58:59', '2025-06-28 08:57:52'),
(3, 'Saju Khan', 'alauddin@gmail.com', '01611145444', 'Feni', '1995-01-01', 123456789, 790000.00, 0.00, 0, 1, 1, 1, '2025-05-31 15:57:10', '2025-06-20 06:27:19'),
(4, 'Ravel Ullah', 'konok@gmail.com', '01712111111', 'Badda,Dhaka', '1994-04-11', 123456789, 498000.00, 0.00, 0, 1, 1, 1, '2025-05-31 16:23:06', '2025-06-20 06:26:14'),
(5, 'Rasin Khan', 'rasin@gmail.com', '017121111111', 'Banasree,Rampura,Dhaka', '2003-01-01', 123456789, 253000.00, 0.00, 0, 1, 1, 1, '2025-05-31 16:40:22', '2025-06-20 06:25:51'),
(6, 'Shaon', 'shaon@gmail.com', '01712111111', 'Banasree,Rampura,Dhaka', '1994-01-01', 123456789, 165000.00, 0.00, 0, 1, 1, 1, '2025-05-31 16:41:37', '2025-06-20 06:27:32'),
(7, 'Istiak Ahmmed', 'Shishir@gmail.com', '0171211111', 'Feni', '1993-11-20', 123456789, 104000.00, 0.00, 0, 1, 1, 1, '2025-05-31 16:45:10', '2025-06-20 06:25:06'),
(8, 'Test001', 'test001@gmail.com', '0171211111', 'Mirpur, Dhaka', '2001-11-11', 5011111111111111, 230000.00, 120000.00, 0, 1, 1, NULL, '2025-07-01 17:23:28', '2025-07-01 17:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `investor_ledgers`
--

CREATE TABLE `investor_ledgers` (
  `id` bigint UNSIGNED NOT NULL,
  `investor_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `particular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit_amount` decimal(20,2) DEFAULT NULL COMMENT 'Withdrawal',
  `credit_amount` decimal(20,2) DEFAULT NULL COMMENT 'Deposit',
  `current_balance` decimal(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `created_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investor_ledgers`
--

INSERT INTO `investor_ledgers` (`id`, `investor_id`, `account_id`, `particular`, `debit_amount`, `credit_amount`, `current_balance`, `reference_number`, `transaction_date`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Investment', NULL, '1312000.00', '1312000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 10:01:02', '2025-05-31 10:01:02'),
(2, 2, 1, 'Bike Purchase', '62000.00', NULL, '1250000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 10:53:15', '2025-05-31 10:53:15'),
(3, 2, 1, 'Bike Purchase', '81000.00', NULL, '1169000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 10:53:20', '2025-05-31 10:53:20'),
(4, 2, 1, 'Bike Purchase', '281000.00', NULL, '888000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 10:53:23', '2025-05-31 10:53:23'),
(5, 2, 1, 'Bike Purchase', '50000.00', NULL, '838000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 10:53:26', '2025-05-31 10:53:26'),
(6, 2, 1, 'Bike Purchase', '187000.00', NULL, '651000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 10:53:30', '2025-05-31 10:53:30'),
(7, 2, 1, 'Bike Purchase', '176000.00', NULL, '475000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 10:53:33', '2025-05-31 10:53:33'),
(8, 2, 1, 'Bike Purchase', '300000.00', NULL, '175000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 10:53:37', '2025-05-31 10:53:37'),
(9, 2, 1, 'Bike Purchase', '110000.00', NULL, '65000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 10:53:42', '2025-05-31 10:53:42'),
(10, 2, 1, 'Bike Purchase', '65000.00', NULL, '0.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 10:53:47', '2025-05-31 10:53:47'),
(11, 3, 1, 'Investment', NULL, '790000.00', '790000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 15:59:49', '2025-05-31 15:59:49'),
(12, 3, 1, 'Bike Purchase', '340000.00', NULL, '450000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 16:12:24', '2025-05-31 16:12:24'),
(13, 3, 1, 'Bike Purchase', '175000.00', NULL, '275000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 16:12:27', '2025-05-31 16:12:27'),
(14, 3, 1, 'Bike Purchase', '275000.00', NULL, '0.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 16:12:30', '2025-05-31 16:12:30'),
(15, 4, 1, 'Investment', NULL, '498000.00', '498000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 16:24:23', '2025-05-31 16:24:23'),
(16, 4, 1, 'Bike Purchase', '200000.00', NULL, '298000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 16:34:07', '2025-05-31 16:34:07'),
(17, 4, 1, 'Bike Purchase', '93000.00', NULL, '205000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 16:34:10', '2025-05-31 16:34:10'),
(18, 4, 1, 'Bike Purchase', '205000.00', NULL, '0.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 16:34:13', '2025-05-31 16:34:13'),
(19, 6, 1, 'Investment', NULL, '165000.00', '165000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 16:43:32', '2025-05-31 16:43:32'),
(20, 5, 1, 'Investment', NULL, '253000.00', '253000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 16:43:36', '2025-05-31 16:43:36'),
(21, 7, 1, 'Investment', NULL, '104000.00', '104000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 16:47:58', '2025-05-31 16:47:58'),
(22, 7, 1, 'Bike Purchase', '104000.00', NULL, '0.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 17:01:26', '2025-05-31 17:01:26'),
(23, 6, 1, 'Bike Purchase', '165000.00', NULL, '0.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 17:01:29', '2025-05-31 17:01:29'),
(24, 5, 1, 'Bike Purchase', '146000.00', NULL, '107000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 17:01:32', '2025-05-31 17:01:32'),
(25, 5, 1, 'Bike Purchase', '107000.00', NULL, '0.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 17:01:35', '2025-05-31 17:01:35'),
(26, 2, 1, 'Investment', NULL, '125000.00', '125000.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 17:03:16', '2025-05-31 17:03:16'),
(27, 2, 1, 'Bike Purchase', '125000.00', NULL, '0.00', NULL, '2025-05-31', NULL, NULL, '2025-05-31 17:05:43', '2025-05-31 17:05:43'),
(28, 1, 2, 'Opening Stock Investment', NULL, '1500.00', '1500.00', NULL, '2025-06-14', NULL, NULL, '2025-06-14 14:13:54', '2025-06-14 14:13:54'),
(29, 1, 2, 'Opening Stock Purchase', '1500.00', NULL, '0.00', NULL, '2025-06-14', NULL, NULL, '2025-06-14 14:13:54', '2025-06-14 14:13:54'),
(30, 1, 2, 'Opening Stock Investment', NULL, '12500.00', '12500.00', NULL, '2025-06-14', NULL, NULL, '2025-06-14 14:14:59', '2025-06-14 14:14:59'),
(31, 1, 2, 'Opening Stock Purchase', '12500.00', NULL, '0.00', NULL, '2025-06-14', NULL, NULL, '2025-06-14 14:14:59', '2025-06-14 14:14:59'),
(32, 1, 1, 'Regular Purchase Payment', '12500.00', NULL, '-12500.00', NULL, '2025-06-14', NULL, NULL, '2025-06-14 14:17:16', '2025-06-14 14:17:16'),
(33, 1, 2, 'Opening Stock Investment', NULL, '125.00', '-12375.00', NULL, '2025-06-16', NULL, NULL, '2025-06-16 17:12:16', '2025-06-16 17:12:16'),
(34, 1, 2, 'Opening Stock Purchase', '125.00', NULL, '-12500.00', NULL, '2025-06-16', NULL, NULL, '2025-06-16 17:12:16', '2025-06-16 17:12:16'),
(35, 1, 1, 'Expenses', '23000.00', NULL, '-35500.00', NULL, '2025-06-18', NULL, NULL, '2025-06-18 17:58:13', '2025-06-18 17:58:13'),
(36, 1, 1, 'Sale Payment', NULL, '200.00', '-35300.00', NULL, '2025-06-20', NULL, NULL, '2025-06-20 06:31:27', '2025-06-20 06:31:27'),
(37, 2, 1, 'Bike Sales', NULL, '110000.00', '110000.00', NULL, '2025-06-20', NULL, NULL, '2025-06-20 06:36:53', '2025-06-20 06:36:53'),
(38, 1, 1, 'Bike Sales Profit', NULL, '25000.00', '-10300.00', NULL, '2025-06-20', NULL, NULL, '2025-06-20 06:36:53', '2025-06-20 06:36:53'),
(39, 1, 1, 'Bike Service Expense', '1500.00', NULL, '-11800.00', NULL, '2025-06-20', NULL, NULL, '2025-06-20 06:42:36', '2025-06-20 06:42:36'),
(40, 1, 1, 'Sale Payment', NULL, '1900.00', '-9900.00', NULL, '2025-06-20', NULL, NULL, '2025-06-20 06:46:10', '2025-06-20 06:46:10'),
(41, 1, 1, 'Sale Payment', NULL, '5500.00', '-4400.00', NULL, '2025-06-20', NULL, NULL, '2025-06-20 07:09:30', '2025-06-20 07:09:30'),
(42, 2, 1, 'Bike Sales', NULL, '176000.00', '286000.00', NULL, '2025-06-28', NULL, NULL, '2025-06-28 08:57:52', '2025-06-28 08:57:52'),
(43, 1, 1, 'Bike Sales Profit', NULL, '4000.00', '-400.00', NULL, '2025-06-28', NULL, NULL, '2025-06-28 08:57:52', '2025-06-28 08:57:52'),
(44, 1, 1, 'Bike Purchase', '125000.00', NULL, '-125400.00', 'NA', '2025-06-28', NULL, NULL, '2025-06-28 10:58:58', '2025-06-28 10:58:58'),
(45, 8, 5, 'Investment', NULL, '250000.00', '250000.00', NULL, '2025-07-01', NULL, NULL, '2025-07-01 17:25:35', '2025-07-01 17:25:35'),
(46, 8, 1, 'Withdrawal', '20000.00', NULL, '230000.00', NULL, '2025-07-01', NULL, NULL, '2025-07-01 17:38:09', '2025-07-01 17:38:09'),
(47, 8, 5, 'Bike Purchase', '110000.00', NULL, '120000.00', NULL, '2025-07-01', NULL, NULL, '2025-07-01 17:43:47', '2025-07-01 17:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `investor_transactions`
--

CREATE TABLE `investor_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `investor_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `transaction_type` tinyint NOT NULL,
  `particular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_amount` decimal(20,2) DEFAULT NULL COMMENT 'Deposit',
  `debit_amount` decimal(20,2) DEFAULT NULL COMMENT 'Withdrawal',
  `current_balance` decimal(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investor_transactions`
--

INSERT INTO `investor_transactions` (`id`, `investor_id`, `account_id`, `transaction_type`, `particular`, `credit_amount`, `debit_amount`, `current_balance`, `reference_number`, `transaction_date`, `description`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 0, NULL, '1312000.00', NULL, '1312000.00', NULL, '2025-05-31', 'Stock Bike Calculation', 1, 1, 1, '2025-05-31 10:00:57', '2025-05-31 10:01:02'),
(2, 3, 1, 0, NULL, '790000.00', NULL, '790000.00', NULL, '2025-05-31', 'Stock Bike Calculation', 1, 1, 1, '2025-05-31 15:59:44', '2025-05-31 15:59:49'),
(3, 4, 1, 0, NULL, '498000.00', NULL, '498000.00', NULL, '2025-05-31', 'Stock Bike Calculation', 1, 1, 1, '2025-05-31 16:24:16', '2025-05-31 16:24:23'),
(4, 5, 1, 0, NULL, '253000.00', NULL, '253000.00', NULL, '2025-05-31', 'Stock Bike Calculation', 1, 1, 1, '2025-05-31 16:42:57', '2025-05-31 16:43:36'),
(5, 6, 1, 0, NULL, '165000.00', NULL, '165000.00', NULL, '2025-05-31', 'Stock Bike Calculation', 1, 1, 1, '2025-05-31 16:43:27', '2025-05-31 16:43:32'),
(6, 7, 1, 0, NULL, '104000.00', NULL, '104000.00', NULL, '2025-05-31', 'Stock Bike Calculation', 1, 1, 1, '2025-05-31 16:47:51', '2025-05-31 16:47:58'),
(7, 2, 1, 0, NULL, '125000.00', NULL, '1437000.00', NULL, '2025-05-31', 'Stock Bike Calculation', 1, 1, 1, '2025-05-31 17:03:11', '2025-05-31 17:03:16'),
(8, 1, 2, 1, 'Opening Stock Investment', '1500.00', NULL, '1500.00', NULL, '2025-06-14', NULL, 1, 1, NULL, '2025-06-14 14:13:54', '2025-06-14 14:13:54'),
(9, 1, 2, 1, 'Opening Stock Investment', '12500.00', NULL, '14000.00', NULL, '2025-06-14', NULL, 1, 1, NULL, '2025-06-14 14:14:59', '2025-06-14 14:14:59'),
(10, 1, 2, 1, 'Opening Stock Investment', '125.00', NULL, '14125.00', NULL, '2025-06-16', NULL, 1, 1, NULL, '2025-06-16 17:12:16', '2025-06-16 17:12:16'),
(11, 8, 5, 0, NULL, '250000.00', NULL, '250000.00', NULL, '2025-07-01', NULL, 1, 1, 1, '2025-07-01 17:25:07', '2025-07-01 17:25:35'),
(12, 8, 1, 0, NULL, NULL, '20000.00', '230000.00', NULL, '2025-07-01', NULL, 1, 1, 1, '2025-07-01 17:37:59', '2025-07-01 17:38:09');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint UNSIGNED NOT NULL,
  `cat_type_id` tinyint NOT NULL,
  `cat_id` int NOT NULL,
  `sub_cat_id` int DEFAULT NULL,
  `unit_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_price` double(20,2) NOT NULL DEFAULT '0.00',
  `sale_price` double(20,2) NOT NULL DEFAULT '0.00',
  `vat` double(5,2) NOT NULL DEFAULT '0.00',
  `sold_qty` double(20,2) NOT NULL DEFAULT '0.00',
  `current_stock` double(20,2) NOT NULL DEFAULT '0.00',
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `cat_type_id`, `cat_id`, `sub_cat_id`, `unit_id`, `name`, `description`, `image`, `purchase_price`, `sale_price`, `vat`, `sold_qty`, `current_stock`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 27, 29, 1, 'small spoke', NULL, NULL, 150.00, 200.00, 2.00, 0.00, 9.00, 1, '2025-06-14 14:13:54', '2025-06-20 06:31:27'),
(4, 1, 27, 28, 1, 'Chain Box', NULL, NULL, 2500.00, 2800.00, 0.00, 0.00, 20.00, 1, '2025-06-14 14:14:59', '2025-06-20 07:09:30'),
(8, 1, 27, 28, 1, 'Short 3\"', NULL, NULL, 125.00, 180.00, 1.00, 0.00, 1.00, 1, '2025-06-16 17:12:16', '2025-06-16 17:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `srln` int NOT NULL DEFAULT '1',
  `menu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `navicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_side_menu` tinyint NOT NULL DEFAULT '0',
  `create_route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `srln`, `menu_name`, `navicon`, `is_side_menu`, `create_route`, `route`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', '<i class=\"nav-icon fas fa-tachometer-alt\"></i>', 1, NULL, 'dashboard.index', 1, '2024-10-26 02:56:54', '2024-10-27 22:37:52'),
(2, 0, 2, 'Settings', '<i class=\"nav-icon fa-solid fa-gear\"></i>', 1, NULL, 'basic-infos.index', 1, '2024-10-26 03:11:38', '2025-05-21 22:32:26'),
(3, 0, 3, 'Admin Manage', '<i class=\"nav-icon fa-solid fa-users-line\"></i>', 1, NULL, NULL, 1, '2024-10-26 03:16:45', '2024-11-03 22:01:46'),
(4, 3, 1, 'Roles', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'roles.create', 'roles.index', 1, '2024-10-26 03:17:46', '2024-10-27 00:44:02'),
(5, 3, 2, 'Admins', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'admins.create', 'admins.index', 1, '2024-10-26 03:34:05', '2024-10-26 05:40:22'),
(6, 4, 1, 'Add', NULL, 0, NULL, 'roles.create', 1, '2024-10-26 03:37:12', '2024-10-27 05:12:43'),
(7, 4, 2, 'Edit', NULL, 0, NULL, 'roles.edit', 1, '2024-10-26 03:37:49', '2024-10-26 03:37:49'),
(8, 4, 3, 'Delete', NULL, 0, NULL, 'roles.destroy', 1, '2024-10-26 03:38:13', '2024-10-26 03:38:13'),
(9, 5, 1, 'Add', NULL, 0, NULL, 'admins.create', 1, '2024-10-26 03:47:35', '2024-10-27 04:57:28'),
(10, 5, 2, 'Edit', NULL, 0, NULL, 'admins.edit', 1, '2024-10-26 03:47:54', '2024-10-27 01:00:26'),
(11, 5, 3, 'Delete', NULL, 0, NULL, 'admins.destroy', 1, '2024-10-26 03:48:07', '2024-10-27 00:51:02'),
(12, 0, 4, 'Frontend Menus', '<i class=\"nav-icon fas fa-wrench\"></i>', 1, 'frontend-menus.create', 'frontend-menus.index', 0, '2024-10-27 04:13:54', '2024-12-17 02:49:59'),
(13, 0, 5, 'Backend Menus', '<i class=\"nav-icon fas fa-clipboard-list\"></i>', 0, 'menus.create', 'menus.index', 0, '2024-10-27 05:17:41', '2025-03-10 22:21:38'),
(15, 29, 1, 'Payment Methods', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'payment-methods.create', 'payment-methods.index', 1, '2024-10-27 06:09:17', '2025-02-19 06:42:44'),
(17, 29, 2, 'Accounts', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'accounts.create', 'accounts.index', 1, '2024-10-28 05:21:04', '2025-02-19 06:00:01'),
(21, 19, 1, 'Add', NULL, 0, NULL, 'service-types.create', 1, '2024-10-31 04:28:22', '2024-10-31 04:31:33'),
(23, 19, 3, 'Delete', NULL, 0, NULL, 'service-types.destroy', 1, '2024-10-31 04:29:54', '2024-10-31 04:31:16'),
(24, 16, 1, 'Add', NULL, 0, NULL, 'colors.create', 1, '2024-10-31 04:32:07', '2025-03-11 02:45:06'),
(25, 16, 2, 'Edit', NULL, 0, NULL, 'colors.edit', 1, '2024-10-31 04:32:22', '2025-03-11 02:45:11'),
(29, 0, 6, 'Account Manage', '<i class=\"nav-icon fa fa-credit-card\"></i>', 1, NULL, NULL, 1, '2024-11-03 02:16:54', '2025-04-21 00:28:17'),
(30, 0, 10, 'Service Manage', '<i class=\"nav-icon fa fa-tools\"></i>', 1, NULL, NULL, 1, '2024-11-03 04:01:16', '2025-03-07 11:19:14'),
(33, 2, 1, 'Edit', NULL, 0, NULL, 'basic-infos.edit', 1, '2024-11-09 04:07:19', '2024-11-09 04:07:19'),
(34, 207, 1, 'Branch', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'branches.create', 'branches.index', 1, '2024-12-21 22:37:22', '2025-07-22 05:10:03'),
(36, 30, 2, 'Services', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, 'bike-services.create', 'bike-services.index', 1, '2024-12-29 05:01:41', '2025-03-08 00:15:52'),
(37, 20, 1, 'Add', NULL, 0, NULL, 'transfer-requisitions.create', 1, '2024-12-30 06:04:19', '2024-12-30 06:04:19'),
(38, 20, 2, 'Edit', NULL, 0, NULL, 'transfer-requisitions.edit', 1, '2024-12-30 06:04:54', '2024-12-30 06:04:54'),
(39, 20, 3, 'Delete', NULL, 0, NULL, 'transfer-requisitions.destroy', 1, '2024-12-30 06:05:24', '2024-12-30 06:05:24'),
(41, 40, 1, 'Add', '<i class=\"nav-icon fas fa-check-circle\"></i>', 0, NULL, 'assets-statuses.create', 1, '2025-01-04 00:21:56', '2025-01-04 00:21:56'),
(42, 36, 1, 'Edit', NULL, 0, NULL, 'transfer-requisitions.edit-incoming', 0, '2025-01-06 06:01:59', '2025-02-27 04:44:36'),
(43, 0, 12, 'Employee Manage', '<i class=\"nav-icon fas fa-users\"></i>', 1, NULL, NULL, 1, '2025-01-12 05:17:06', '2025-07-21 05:35:05'),
(44, 43, 1, 'Departments', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'departments.create', 'departments.index', 1, '2025-01-12 05:20:43', '2025-01-12 05:22:11'),
(45, 43, 4, 'Employee', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'employees.create', 'employees.index', 1, '2025-01-12 05:37:35', '2025-01-19 12:31:03'),
(46, 184, 1, 'Bike Stock', NULL, 0, NULL, NULL, 1, '2025-01-19 02:34:20', '2025-03-19 00:27:09'),
(47, 184, 2, 'Investors Bike', NULL, 0, NULL, NULL, 1, '2025-01-19 02:34:37', '2025-04-16 04:32:00'),
(49, 184, 4, 'Total Sold', NULL, 0, NULL, NULL, 1, '2025-01-19 02:35:06', '2025-04-16 04:32:29'),
(50, 184, 5, 'Today\'s Purchase', NULL, 0, NULL, NULL, 1, '2025-01-19 03:07:13', '2025-04-22 04:22:10'),
(51, 43, 3, 'Designation', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'designations.create', 'designations.index', 1, '2025-01-19 12:29:53', '2025-01-19 12:32:16'),
(52, 0, 13, 'All Reports', '<i class=\"nav-icon fas fa-file-alt\"></i>', 1, NULL, NULL, 1, '2025-01-28 22:26:54', '2025-03-19 01:35:24'),
(53, 52, 1, 'Asset Inventory', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'asset-innventory.assetInventoryIndex', 0, '2025-01-28 22:29:32', '2025-02-25 23:38:09'),
(56, 52, 4, 'Monthly Expense', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.monthly-expenses', 1, '2025-01-28 22:33:07', '2025-03-22 12:01:30'),
(57, 52, 5, 'Profit Loss Statement', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.profit-loss-statement', 1, '2025-01-28 22:36:00', '2025-04-13 03:24:28'),
(58, 52, 6, 'Accounts Ledger', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.account-ledger', 1, '2025-01-28 22:36:22', '2025-04-15 22:37:51'),
(59, 52, 7, 'Stock Reports', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.stock-reports', 1, '2025-01-28 22:36:39', '2025-04-19 23:42:15'),
(60, 52, 8, 'Stock History', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.stock-histories', 1, '2025-01-28 22:36:58', '2025-04-20 02:33:56'),
(61, 52, 9, 'Procurement History', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, NULL, 0, '2025-01-28 22:37:22', '2025-03-21 21:35:16'),
(62, 52, 10, 'Compliance', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, NULL, 0, '2025-01-28 22:37:43', '2025-03-21 21:35:25'),
(63, 167, 1, 'Investors', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'investors.create', 'investors.index', 1, '2025-02-19 01:06:17', '2025-04-21 01:05:52'),
(64, 167, 2, 'Investor Transaction', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'investor-transactions.create', 'investor-transactions.index', 1, '2025-02-19 22:28:14', '2025-04-21 01:08:53'),
(65, 64, 1, 'Edit', NULL, 0, NULL, 'investor-transactions.edit', 1, '2025-02-25 23:36:31', '2025-02-25 23:36:31'),
(66, 64, 2, 'Delete', NULL, 0, NULL, 'investor-transactions.destroy', 1, '2025-02-25 23:37:01', '2025-02-25 23:37:01'),
(67, 64, 3, 'Approve', NULL, 0, NULL, 'investor-transactions.approve', 1, '2025-02-25 23:38:40', '2025-02-25 23:38:40'),
(68, 64, 1, 'Add', NULL, 0, NULL, 'investor-transactions.create', 1, '2025-02-26 00:09:30', '2025-02-26 00:09:30'),
(71, 29, 3, 'Fund Transfer', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'fundtransfers.create', 'fundtransfers.index', 1, '2025-03-03 03:31:14', '2025-04-20 22:32:15'),
(72, 30, 1, 'Service Category', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'bike-service-categories.create', 'bike-service-categories.index', 1, '2025-03-04 23:33:32', '2025-03-08 00:15:47'),
(74, 30, 4, 'Cust Service Records', '<i class=\"far fa-dot-circle nav-icon\"></i>', 0, NULL, NULL, 1, '2025-03-08 00:14:26', '2025-03-10 22:35:03'),
(75, 72, 2, 'Add', NULL, 0, NULL, 'bike-service-categories.create', 1, '2025-03-08 03:30:58', '2025-03-08 03:31:30'),
(76, 72, 2, 'Edit', NULL, 0, NULL, 'bike-service-categories.edit', 1, '2025-03-08 03:32:41', '2025-03-08 03:32:41'),
(77, 36, 1, 'Add', NULL, 0, NULL, 'create-route:- bike-services.create', 1, '2025-03-08 03:34:17', '2025-03-08 03:34:17'),
(78, 36, 2, 'Edit', NULL, 0, NULL, 'bike-services.edit', 1, '2025-03-08 03:34:53', '2025-03-08 03:34:53'),
(79, 73, 1, 'Add', NULL, 0, NULL, 'bike-service-records.create', 1, '2025-03-08 03:35:53', '2025-03-08 03:35:53'),
(80, 73, 2, 'Edit', NULL, 0, NULL, 'bike-service-records.edit', 1, '2025-03-08 03:36:36', '2025-03-08 03:36:36'),
(81, 73, 3, 'Delete', NULL, 0, NULL, 'bike-service-records.destroy', 1, '2025-03-08 03:37:16', '2025-03-08 03:37:16'),
(82, 73, 4, 'Approve', NULL, 0, NULL, 'bike-service-records.approve', 1, '2025-03-08 03:38:04', '2025-03-08 03:38:04'),
(85, 167, 8, 'Investor Profit Share', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, NULL, 'bike-profits.index', 1, '2025-03-10 01:21:36', '2025-07-21 04:42:07'),
(86, 63, 1, 'Edit', NULL, 0, NULL, 'investors.edit', 1, '2025-03-11 02:14:15', '2025-03-11 02:14:15'),
(87, 63, -1, 'Add', NULL, 0, NULL, 'investors.create', 1, '2025-03-11 02:14:52', '2025-03-11 02:14:52'),
(88, 15, 1, 'Add', NULL, 0, NULL, 'payment-methods.create', 1, '2025-03-11 02:15:34', '2025-03-11 02:15:34'),
(89, 15, 2, 'Edit', NULL, 0, NULL, 'payment-methods.edit', 1, '2025-03-11 02:15:51', '2025-03-11 02:15:51'),
(90, 17, 1, 'Add', NULL, 0, NULL, 'accounts.create', 1, '2025-03-11 02:16:27', '2025-03-11 02:16:27'),
(91, 17, 2, 'Edit', NULL, 0, NULL, 'accounts.edit', 1, '2025-03-11 02:16:42', '2025-03-11 02:16:42'),
(92, 70, 1, 'Add', NULL, 0, NULL, 'brands.create', 1, '2025-03-11 02:38:46', '2025-03-11 02:38:46'),
(93, 70, 2, 'Edit', NULL, 0, NULL, 'brands.edit', 1, '2025-03-11 02:38:59', '2025-03-11 02:38:59'),
(94, 40, 2, 'Edit', NULL, 0, NULL, 'bike-models.edit', 1, '2025-03-11 02:41:05', '2025-03-11 02:41:05'),
(95, 35, 1, 'Add', NULL, 0, NULL, 'bike-purchases.create', 1, '2025-03-11 02:46:20', '2025-03-17 22:35:27'),
(96, 35, 2, 'Edit', NULL, 0, NULL, 'bike-purchases.edit', 1, '2025-03-11 02:46:31', '2025-03-17 22:35:31'),
(97, 35, 3, 'Delete', NULL, 0, NULL, 'bike-purchases.destroy', 1, '2025-03-11 02:47:19', '2025-03-17 22:35:35'),
(98, 35, 4, 'Approve', NULL, 0, NULL, 'bike-purchases.approve', 1, '2025-03-11 02:48:25', '2025-03-17 22:35:39'),
(99, 84, 1, 'Add', NULL, 0, NULL, 'bike-sales.create', 1, '2025-03-11 02:49:28', '2025-03-11 02:49:28'),
(100, 84, 2, 'Edit', NULL, 0, NULL, 'bike-sales.edit', 1, '2025-03-11 02:49:39', '2025-03-11 02:49:39'),
(101, 84, 3, 'Delete', NULL, 0, NULL, 'bike-sales.destroy', 1, '2025-03-11 02:49:56', '2025-03-11 02:49:56'),
(102, 84, 4, 'Approve', NULL, 0, NULL, 'bike-sales.approve', 1, '2025-03-11 02:50:23', '2025-03-11 02:50:23'),
(103, 85, 1, 'Edit', NULL, 0, NULL, 'bike-profits.edit', 1, '2025-03-11 02:51:17', '2025-03-11 02:51:17'),
(104, 85, 2, 'Close', NULL, 0, NULL, 'bike-profits.change-status', 1, '2025-03-11 02:51:37', '2025-03-14 14:05:47'),
(105, 0, 10, 'Expense Manage', '<i class=\"nav-icon fa-solid fa-money-bill-wave\"></i>', 1, NULL, NULL, 1, '2025-03-11 21:50:17', '2025-03-11 21:50:51'),
(106, 105, 1, 'Category', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'expense-categories.create', 'expense-categories.index', 1, '2025-03-11 21:50:17', '2025-03-11 22:32:03'),
(107, 106, 1, 'Add', NULL, 0, 'expense-categories.create', 'expense-categories.create', 1, '2025-03-11 22:32:22', '2025-03-11 22:33:55'),
(108, 106, 2, 'Edit', NULL, 0, NULL, 'expense-categories.edit', 1, '2025-03-11 22:33:32', '2025-03-11 22:33:32'),
(109, 105, 1, 'Expense Heads', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'expense-heads.create', 'expense-heads.index', 1, '2025-03-11 23:14:34', '2025-03-11 23:14:34'),
(110, 105, 3, 'Expenses', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'expenses.create', 'expenses.index', 1, '2025-03-12 00:35:41', '2025-03-12 00:35:41'),
(111, 109, 1, 'Add', NULL, 0, NULL, 'expense-heads.create', 1, '2025-03-12 00:36:37', '2025-03-12 00:36:37'),
(112, 109, 2, 'Edit', NULL, 0, NULL, 'expense-heads.edit', 1, '2025-03-12 00:36:58', '2025-03-12 00:36:58'),
(113, 110, 1, 'Add', NULL, 0, NULL, 'expenses.create', 1, '2025-03-12 00:38:33', '2025-03-12 00:38:33'),
(114, 110, 2, 'Edit', NULL, 0, NULL, 'expenses.edit', 1, '2025-03-12 00:38:50', '2025-03-12 00:38:50'),
(115, 110, 3, 'Delete', NULL, 0, NULL, 'expenses.destroy', 1, '2025-03-12 00:39:22', '2025-03-12 00:39:22'),
(116, 110, 4, 'Approve', NULL, 0, NULL, 'expenses.approve', 1, '2025-03-12 00:39:54', '2025-03-12 00:39:54'),
(117, 73, 5, 'View', NULL, 0, NULL, 'bike-service-records.view', 1, '2025-03-12 03:21:49', '2025-03-20 02:05:57'),
(118, 110, 5, 'View', NULL, 0, NULL, 'expenses.view', 1, '2025-03-12 03:53:02', '2025-03-12 03:53:02'),
(119, 85, 3, 'View Records', NULL, 0, NULL, 'bike-profits.share-records', 1, '2025-03-14 14:06:39', '2025-03-14 14:06:39'),
(120, 119, 1, 'Edit', NULL, 0, NULL, 'bike-profits.share-records.edit', 1, '2025-03-14 14:08:04', '2025-03-14 14:08:04'),
(121, 119, 2, 'Delete', NULL, 0, NULL, 'bike-profits.share-records.destroy', 1, '2025-03-14 14:08:50', '2025-03-14 14:10:43'),
(122, 119, 3, 'Approve', NULL, 0, NULL, 'bike-profits.share-records.approve', 1, '2025-03-14 14:09:29', '2025-03-14 14:09:29'),
(123, 119, 0, 'Create', NULL, 0, NULL, 'bike-profits.share-records.create', 1, '2025-03-14 14:11:31', '2025-03-14 14:11:50'),
(124, 130, 1, 'Setup', '<i class=\"fa-solid fa-users-gear nav-icon\"></i>', 1, NULL, NULL, 1, '2025-03-14 22:25:16', '2025-03-16 21:32:06'),
(125, 124, 1, 'Category', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'categories.create', 'categories.index', 1, '2025-03-14 22:26:40', '2025-03-14 22:37:43'),
(126, 124, 2, 'Sub Category', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'sub-categories.create', 'sub-categories.index', 1, '2025-03-14 22:39:29', '2025-03-14 22:39:29'),
(127, 124, 3, 'Items', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'items.create', 'items.index', 1, '2025-03-14 22:58:29', '2025-03-14 22:58:29'),
(128, 124, 4, 'Suppliers', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'suppliers.create', 'suppliers.index', 1, '2025-03-15 12:51:51', '2025-03-16 21:49:08'),
(129, 130, 4, 'Supplier Payments', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'payments.create', 'payments.index', 1, '2025-03-15 13:14:30', '2025-03-23 03:39:42'),
(130, 0, 11, 'Inventory Manage', '<i class=\"nav-icon fas fa-warehouse\"></i>', 1, NULL, NULL, 1, '2025-03-15 13:22:44', '2025-03-15 13:27:15'),
(131, 130, 2, 'Purchase', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'purchases.create', 'purchases.index', 1, '2025-03-16 03:00:54', '2025-03-23 03:38:41'),
(133, 73, 6, 'Print', NULL, 0, NULL, 'bike-service-records.print', 1, '2025-03-20 02:05:40', '2025-05-27 03:19:46'),
(134, 35, 5, 'View', NULL, 0, NULL, 'bike-purchases.invoice', 1, '2025-03-20 03:05:09', '2025-03-20 03:05:09'),
(135, 35, 6, 'Print', NULL, 0, NULL, 'bike-purchases.invoice.print', 1, '2025-03-20 03:05:32', '2025-03-20 03:05:32'),
(136, 124, 5, 'Customers', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'customers.create', 'customers.index', 1, '2025-03-22 13:17:08', '2025-03-22 13:17:35'),
(137, 130, 3, 'Sales', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'sales.create', 'sales.index', 1, '2025-03-22 14:31:30', '2025-03-23 03:39:11'),
(138, 130, 5, 'Customer Payment', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'customer-payments.create', 'customer-payments.index', 1, '2025-03-23 02:47:00', '2025-03-23 02:47:00'),
(139, 0, 12, 'Loan Manage', '<i class=\"nav-icon fas fa-hand-holding-usd\"></i>', 1, NULL, NULL, 0, '2025-04-08 23:37:41', '2025-07-27 05:40:32'),
(140, 139, 1, 'Party Manage', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'parties.create', 'parties.index', 1, '2025-04-08 23:39:23', '2025-04-08 23:39:23'),
(141, 139, 2, 'Loans', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'loans.create', 'loans.index', 1, '2025-04-09 22:25:30', '2025-04-09 22:25:41'),
(142, 139, 3, 'Party Payments', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, NULL, 'party-payments.index', 1, '2025-04-10 12:01:23', '2025-04-10 12:03:56'),
(143, 141, 1, 'Add', NULL, 0, NULL, 'loans.create', 1, '2025-04-11 11:13:03', '2025-04-11 11:13:03'),
(144, 141, 2, 'Edit', NULL, 0, NULL, 'loans.edit', 1, '2025-04-11 11:15:09', '2025-04-11 11:15:09'),
(145, 141, 3, 'Delete', NULL, 0, NULL, 'loans.destroy', 1, '2025-04-11 11:15:28', '2025-04-11 11:15:28'),
(146, 141, 4, 'Approve', NULL, 0, NULL, 'loans.approve', 1, '2025-04-11 11:16:04', '2025-04-11 11:16:04'),
(147, 141, 5, 'View', NULL, 0, NULL, 'loans.invoice', 1, '2025-04-11 11:17:32', '2025-04-11 11:17:32'),
(148, 141, 6, 'Print', NULL, 0, NULL, 'loans.invoice.print', 1, '2025-04-11 11:17:58', '2025-04-11 11:17:58'),
(149, 131, 1, 'Add', NULL, 0, NULL, 'purchases.create', 1, '2025-04-13 01:08:40', '2025-04-13 01:08:40'),
(150, 131, 2, 'Edit', NULL, 0, NULL, 'purchases.edit', 1, '2025-04-13 01:09:15', '2025-04-13 01:09:15'),
(151, 131, 3, 'Delete', NULL, 0, NULL, 'purchases.destroy', 1, '2025-04-13 01:09:32', '2025-04-13 01:09:32'),
(152, 131, 5, 'View', NULL, 0, NULL, 'purchases.vouchar', 1, '2025-04-13 01:11:25', '2025-04-13 01:11:25'),
(153, 131, 6, 'Print', NULL, 0, NULL, 'purchases.vouchar.print', 1, '2025-04-13 01:11:48', '2025-04-13 01:11:48'),
(154, 131, 4, 'Add Payment', NULL, 0, NULL, 'purchases.payment.store', 1, '2025-04-13 01:12:31', '2025-04-13 01:13:29'),
(155, 137, 1, 'Add', NULL, 0, NULL, 'sales.create', 1, '2025-04-13 02:50:15', '2025-04-13 02:50:15'),
(156, 137, 2, 'Edit', NULL, 0, NULL, 'sales.edit', 1, '2025-04-13 02:50:37', '2025-04-13 02:50:37'),
(157, 137, 3, 'Delete', NULL, 0, NULL, 'sales.destroy', 1, '2025-04-13 02:50:52', '2025-04-13 02:50:52'),
(158, 137, 4, 'Approve', NULL, 0, NULL, 'sales.approve', 1, '2025-04-13 02:51:25', '2025-04-13 02:51:25'),
(159, 137, 5, 'View', NULL, 0, NULL, 'sales.invoice', 1, '2025-04-13 02:52:47', '2025-04-13 02:52:47'),
(160, 137, 6, 'Print', NULL, 0, NULL, 'sales.invoice.print', 1, '2025-04-13 02:53:16', '2025-04-13 02:53:16'),
(161, 137, 7, 'Payment', NULL, 0, NULL, 'sales.payment.store', 1, '2025-04-13 02:53:58', '2025-04-13 02:53:58'),
(162, 35, 8, 'Repurchase', NULL, 0, NULL, 'bike-purchases.repurchase', 1, '2025-04-19 23:24:13', '2025-04-19 23:24:13'),
(163, 71, 1, 'Add', NULL, 0, NULL, 'fundtransfers.create', 1, '2025-04-21 00:57:36', '2025-04-21 00:57:36'),
(164, 71, 2, 'Edit', NULL, 0, NULL, 'fundtransfers.edit', 1, '2025-04-21 00:57:55', '2025-04-21 00:57:55'),
(165, 71, 3, 'Delete', NULL, 0, NULL, 'fundtransfers.destroy', 1, '2025-04-21 00:58:14', '2025-04-21 00:58:14'),
(166, 71, 4, 'Approve', NULL, 0, NULL, 'fundtransfers.approve', 1, '2025-04-21 00:58:30', '2025-04-21 00:58:30'),
(167, 0, 5, 'Investor Manage', '<i class=\"nav-icon fas fa-user-tie\"></i>', 1, NULL, NULL, 0, '2025-04-21 01:05:14', '2025-07-27 05:40:05'),
(168, 184, 6, 'Today\'s Sale', NULL, 0, NULL, NULL, 1, '2025-04-22 04:22:35', '2025-04-22 04:22:35'),
(169, 182, 6, 'Expense', NULL, 0, NULL, NULL, 1, '2025-04-22 04:22:53', '2025-04-22 04:22:53'),
(170, 182, 1, 'Accessories Sales', NULL, 0, NULL, NULL, 1, '2025-04-22 04:23:13', '2025-04-22 04:23:30'),
(171, 182, 2, 'Service Sales', NULL, 0, NULL, NULL, 1, '2025-04-22 04:23:49', '2025-04-22 04:23:49'),
(172, 182, 3, 'Spare Parts Sales', NULL, 0, NULL, NULL, 1, '2025-04-22 04:24:04', '2025-04-22 04:24:04'),
(173, 183, 1, 'Today\'s Investor\'s Profit Payment', NULL, 0, NULL, NULL, 1, '2025-04-22 04:24:26', '2025-04-22 04:24:26'),
(174, 183, 2, 'Today\'s New Investment', NULL, 0, NULL, NULL, 1, '2025-04-22 04:24:47', '2025-04-22 04:24:47'),
(175, 183, 3, 'Today\'s Investment Withdraw', NULL, 0, NULL, NULL, 1, '2025-04-22 04:25:10', '2025-04-22 04:25:10'),
(176, 52, 5, 'Accounts Reports', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, NULL, 'reports.accounts-reports', 1, '2025-04-22 21:17:35', '2025-04-22 21:17:35'),
(177, 52, 11, 'Supplier Ledgers', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.supplier-ledger', 1, '2025-04-22 21:54:35', '2025-06-22 00:02:10'),
(178, 182, 4, 'Total Item & Service Sales', NULL, 0, NULL, NULL, 1, '2025-04-23 04:50:23', '2025-04-23 04:50:23'),
(179, 182, 5, 'Purchase', NULL, 0, NULL, NULL, 1, '2025-04-23 04:53:52', '2025-05-23 21:19:42'),
(180, 183, 4, 'Investors Investment Capital', NULL, 0, NULL, NULL, 1, '2025-04-23 04:56:04', '2025-04-23 04:56:04'),
(181, 183, 5, 'My Investment Capital', NULL, 0, NULL, NULL, 1, '2025-04-23 04:57:37', '2025-04-23 04:57:37'),
(182, 1, 3, 'Purchase, Sales & Expense Info', NULL, 0, NULL, NULL, 1, '2025-04-23 04:58:23', '2025-05-23 21:20:05'),
(183, 1, 4, 'Investement Info', NULL, 0, NULL, NULL, 0, '2025-04-23 05:00:28', '2025-07-21 11:50:00'),
(184, 1, 5, 'Bike Info', NULL, 0, NULL, NULL, 0, '2025-04-23 05:01:24', '2025-07-21 11:49:21'),
(186, 52, 1, 'Investment Report', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, NULL, 'reports.investment', 1, '2025-05-18 00:39:44', '2025-05-18 00:39:44'),
(187, 52, 1, 'Profit Report', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, NULL, 'reports.bike-profit', 1, '2025-05-18 05:07:55', '2025-07-21 04:49:29'),
(188, 52, 1, 'Investor Ledger', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, NULL, 'reports.investor-ledger', 1, '2025-05-18 22:08:11', '2025-05-18 22:08:11'),
(189, 1, 2, 'Loan Status', NULL, 0, NULL, NULL, 1, '2025-05-21 04:52:15', '2025-05-21 04:52:15'),
(190, 1, 1, 'Financial Status', NULL, 0, NULL, NULL, 0, '2025-05-21 04:53:32', '2025-07-21 11:49:03'),
(191, 190, 1, 'Total Investment Capital', NULL, 0, NULL, NULL, 1, '2025-05-21 04:55:27', '2025-05-21 04:55:27'),
(192, 190, 2, 'Total Item Stock Value', NULL, 0, NULL, NULL, 1, '2025-05-21 04:55:36', '2025-05-21 04:55:36'),
(193, 190, 3, 'Total Bike Stock Value', NULL, 0, NULL, NULL, 1, '2025-05-21 04:55:45', '2025-05-21 04:55:45'),
(194, 190, 4, 'Cash Balance', NULL, 0, NULL, NULL, 1, '2025-05-21 04:55:54', '2025-05-21 04:55:54'),
(195, 190, 5, 'Total Expense', NULL, 0, NULL, NULL, 1, '2025-05-21 04:56:20', '2025-05-21 04:56:20'),
(196, 190, 6, 'Total Purchase', NULL, 0, NULL, NULL, 1, '2025-05-21 04:56:32', '2025-05-21 04:56:32'),
(197, 190, 7, 'Total Sale', NULL, 0, NULL, NULL, 1, '2025-05-21 04:56:42', '2025-05-21 04:56:42'),
(198, 189, 1, 'Total Loan Amount Receiveable', NULL, 0, NULL, NULL, 1, '2025-05-21 04:58:47', '2025-05-21 04:58:47'),
(199, 189, 2, 'Total Loan Amount Payable', NULL, 0, NULL, NULL, 1, '2025-05-21 04:59:03', '2025-05-21 04:59:03'),
(200, 183, 6, 'My Available Balance', NULL, 0, NULL, NULL, 1, '2025-05-21 06:07:28', '2025-05-21 06:07:28'),
(201, 190, 7, 'Total Bike Service Expense', NULL, 0, NULL, NULL, 1, '2025-05-28 02:28:24', '2025-05-28 02:37:46'),
(203, 84, 6, 'View', NULL, 0, NULL, 'bike-sales.invoice', 1, '2025-05-29 05:09:45', '2025-05-29 05:09:45'),
(204, 84, 7, 'Print', NULL, 0, NULL, 'bike-sales.invoice.print', 1, '2025-05-29 05:10:04', '2025-05-29 05:10:04'),
(205, 52, 12, 'Purchase Report', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, NULL, 'reports.purchase-report', 1, '2025-06-28 03:50:42', '2025-06-28 03:50:42'),
(206, 52, 13, 'Sales Report', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, NULL, 'reports.sales-report', 1, '2025-06-28 03:51:14', '2025-06-28 03:51:14'),
(207, 0, 6, 'Branch Manage', '<i class=\"fas fa-code-branch nav-icon\"></i>', 1, NULL, NULL, 1, '2025-07-21 05:25:20', '2025-07-22 05:09:35'),
(208, 207, 2, 'Agents', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'agents.create', 'agents.index', 1, '2025-07-22 05:27:25', '2025-07-22 05:27:25'),
(209, 208, 1, 'Add', NULL, 0, NULL, 'agents.create', 1, '2025-07-22 05:28:08', '2025-07-22 05:28:08'),
(210, 208, 2, 'Edit', NULL, 0, NULL, 'agents.edit', 1, '2025-07-22 05:28:28', '2025-07-22 05:28:28'),
(211, 208, 3, 'Delete', NULL, 0, NULL, 'agents.destroy', 1, '2025-07-22 05:29:01', '2025-07-22 05:29:01'),
(212, 0, 3, 'Parcel Manage', '<i class=\"fas fa-shipping-fast nav-icon\"></i>', 1, NULL, NULL, 1, '2025-07-23 05:13:09', '2025-07-23 05:13:23'),
(213, 212, 1, 'Parcels', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'parcel-invoices.create', 'parcel-invoices.index', 1, '2025-07-23 05:15:36', '2025-07-23 12:06:18'),
(214, 213, 1, 'Add', NULL, 0, NULL, 'parcel-invoices.create', 1, '2025-07-27 11:14:06', '2025-07-27 11:14:06'),
(215, 213, 2, 'Edit', NULL, 0, NULL, 'parcel-invoices.edit', 1, '2025-07-27 11:14:16', '2025-07-27 11:14:16'),
(216, 213, 3, 'Delete', NULL, 0, NULL, 'parcel-invoices.destroy', 1, '2025-07-27 11:14:36', '2025-07-27 11:14:36'),
(217, 213, 4, 'Approve', NULL, 0, NULL, 'parcel-invoices.approve', 1, '2025-07-27 11:15:03', '2025-07-27 11:15:03'),
(218, 213, 5, 'Invoice View', NULL, 0, NULL, 'parcel-invoices.invoice', 1, '2025-07-27 11:15:41', '2025-07-27 11:15:41'),
(219, 213, 6, 'Invoice Print', NULL, 0, NULL, 'parcel-invoices.invoice.print', 1, '2025-07-27 11:16:02', '2025-07-27 11:16:02'),
(220, 0, 5, 'Flight', '<i class=\"fa-solid fa-plane-departure nav-icon\"></i>', 1, 'flights.create', 'flights.index', 1, '2025-07-28 10:03:40', '2025-07-28 10:06:38'),
(221, 0, 4, 'Box Manage', '<i class=\"fas fa-box nav-icon\"></i>', 1, 'boxes.create', 'boxes.index', 1, '2025-07-31 04:45:02', '2025-07-31 04:57:00'),
(222, 221, 1, 'Add', NULL, 0, NULL, 'boxes.create', 1, '2025-07-31 05:21:56', '2025-07-31 05:21:56'),
(223, 221, 2, 'Edit', NULL, 0, NULL, 'boxes.edit', 1, '2025-07-31 05:22:09', '2025-07-31 05:22:09'),
(224, 212, 2, 'Shipment Box', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'shipment-boxes.create', 'shipment-boxes.index', 1, '2025-08-17 04:47:39', '2025-08-17 04:47:39'),
(225, 212, 3, 'Parcel Transfer', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'parcel-transfers.create', 'parcel-transfers.index', 1, '2025-08-18 09:19:21', '2025-08-18 09:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 2),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 3),
(4, '2014_10_12_000000_create_users_table', 4),
(5, '2024_01_30_123321_create_roles_table', 5),
(6, '2024_01_30_123933_create_privileges_table', 6),
(7, '2023_12_26_114309_create_admins_table', 7),
(8, '2023_10_21_001204_create_basic_infos_table', 8),
(9, '2024_01_30_140322_create_menus_table', 9),
(10, '2024_10_26_114524_create_frontend_menus_table', 10),
(15, '2025_02_19_124857_create_investors_table', 11),
(17, '2025_02_19_163817_create_payment_methods_table', 12),
(18, '2025_02_19_174328_create_accounts_table', 13),
(20, '2025_02_20_091126_create_account_ledgers_table', 14),
(22, '2025_02_20_100226_create_investor_transactions_table', 15),
(38, '2025_03_05_104328_create_bike_service_categories_table', 23),
(39, '2025_03_05_120928_create_bike_services_table', 24),
(51, '2024_06_25_122016_create_expense_categories_table', 29),
(52, '2024_02_25_120043_create_expense_heads_table', 30),
(55, '2024_02_25_122743_create_expenses_table', 31),
(56, '2024_02_25_123102_create_expense_details_table', 31),
(58, '2025_03_09_152703_create_bike_profits_table', 32),
(60, '2025_03_14_233414_create_bike_profit_share_records_table', 33),
(61, '2023_12_13_144516_create_categories_table', 34),
(63, '2024_04_22_164354_create_category_types_table', 34),
(64, '2024_04_21_135934_create_units_table', 35),
(65, '2024_04_27_130014_create_stock_histories_table', 36),
(66, '2024_04_21_154700_create_suppliers_table', 37),
(71, '2023_12_26_170202_create_items_table', 40),
(75, '2024_04_28_171201_create_supplier_payments_table', 43),
(80, '2024_04_21_190732_create_purchase_details_table', 45),
(81, '2024_04_28_171225_create_supplier_ledgers_table', 46),
(91, '2025_03_23_005944_create_customer_ledgers_table', 47),
(94, '2025_03_23_121648_create_customer_payments_table', 48),
(95, '2025_04_09_103313_create_parties_table', 49),
(98, '2025_04_09_111223_create_party_loans_table', 50),
(99, '2025_04_09_105706_create_party_ledgers_table', 51),
(102, '2025_04_09_110301_create_party_payments_table', 53),
(106, '2025_03_23_005302_create_customers_table', 54),
(108, '2025_03_23_010022_create_sales_table', 55),
(117, '2025_03_23_010039_create_sale_details_table', 58),
(119, '2024_04_21_174416_create_purchases_table', 59),
(122, '2025_04_21_094759_create_fund_transfer_histories_table', 61),
(123, '2025_05_17_092258_create_investor_ledgers_table', 62),
(125, '2024_12_22_100832_create_branches_table', 63),
(126, '2024_05_06_120259_create_designations_table', 64),
(127, '2024_05_06_143612_create_employees_table', 64),
(128, '2024_05_06_145650_create_departments_table', 64),
(129, '2025_07_21_120613_add_employee_id_and_branch_id_to_admins_table', 65),
(130, '2025_07_21_135326_add_type_to_branches_table', 66),
(131, '2025_07_22_111101_add_agent_id_to_admins_table', 67),
(134, '2025_07_22_112244_add_commission_percentage_to_branches_table', 68),
(135, '2025_07_22_111634_create_agents_table', 69),
(137, '2025_07_23_161922_create_parcel_invoice_details_table', 70),
(138, '2025_07_24_162500_create_parcel_items_table', 71),
(139, '2025_07_23_145516_create_parcel_invoices_table', 72),
(140, '2025_07_28_154725_create_flights_table', 73),
(142, '2025_07_30_181837_create_boxes_table', 74),
(143, '2025_08_17_103506_create_shipment_boxes_table', 75),
(144, '2025_08_17_103717_create_shipment_box_items_table', 75);

-- --------------------------------------------------------

--
-- Table structure for table `parcel_invoices`
--

CREATE TABLE `parcel_invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` double(20,2) NOT NULL,
  `vat_tax` double(20,2) DEFAULT '0.00',
  `discount_method` tinyint NOT NULL DEFAULT '1' COMMENT '0=Percentage, 1=Solid',
  `discount_rate` double(20,2) NOT NULL,
  `discount` double(20,2) NOT NULL,
  `total_payable` double(20,2) NOT NULL,
  `paid_amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `hawb_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'house air waybill no',
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pieces` int NOT NULL,
  `product_value` int DEFAULT NULL,
  `billing_weight_kg` int NOT NULL,
  `billing_weight_gm` int NOT NULL,
  `gross_weight_kg` decimal(10,2) DEFAULT NULL,
  `payment_mode` enum('Prepaid','Collect') COLLATE utf8mb4_unicode_ci NOT NULL,
  `cod_amount` decimal(10,2) NOT NULL COMMENT 'Cash On Delivery',
  `item_type` enum('SPX','DOCS') COLLATE utf8mb4_unicode_ci NOT NULL,
  `all_item_names` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_description` text COLLATE utf8mb4_unicode_ci,
  `length` decimal(10,2) DEFAULT NULL COMMENT 'weight in cm',
  `height` decimal(10,2) DEFAULT NULL COMMENT 'weight in cm',
  `width` decimal(10,2) DEFAULT NULL COMMENT 'weight in cm',
  `weight` decimal(10,2) DEFAULT NULL COMMENT 'weight in kg',
  `sender_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_address` text COLLATE utf8mb4_unicode_ci,
  `sender_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_country_id` int NOT NULL,
  `sender_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_origin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_address` text COLLATE utf8mb4_unicode_ci,
  `receiver_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_zip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_country_id` int NOT NULL,
  `receiver_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_origin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_date` date NOT NULL,
  `export_date` date NOT NULL,
  `created_branch_id` int NOT NULL,
  `agent_id` int NOT NULL,
  `current_branch_id` int NOT NULL,
  `hub_id` int NOT NULL,
  `flight_id` int NOT NULL,
  `service_id` int NOT NULL,
  `payment_type` enum('Cash','Due') COLLATE utf8mb4_unicode_ci NOT NULL,
  `usa_country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picked_up_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picked_up_date_time` timestamp NOT NULL,
  `mawb_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Master Air Waybill',
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `showing_weight_kgs` int DEFAULT NULL,
  `showing_weight_gms` int DEFAULT NULL,
  `showing_weight_kgs_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_by_id` int DEFAULT NULL,
  `is_packed` tinyint NOT NULL DEFAULT '0' COMMENT '0=no, 1=yes',
  `payment_status` enum('unpaid','partial','paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `parcel_status` enum('pending','approved','in_transit','delivered','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parcel_invoices`
--

INSERT INTO `parcel_invoices` (`id`, `invoice_no`, `total_price`, `vat_tax`, `discount_method`, `discount_rate`, `discount`, `total_payable`, `paid_amount`, `reference_number`, `note`, `hawb_no`, `reference`, `pieces`, `product_value`, `billing_weight_kg`, `billing_weight_gm`, `gross_weight_kg`, `payment_mode`, `cod_amount`, `item_type`, `all_item_names`, `item_description`, `length`, `height`, `width`, `weight`, `sender_name`, `sender_company`, `sender_address`, `sender_city`, `sender_zip`, `sender_country_id`, `sender_phone`, `sender_email`, `sender_origin`, `receiver_name`, `receiver_company`, `receiver_address`, `receiver_city`, `receiver_zip`, `receiver_country_id`, `receiver_phone`, `receiver_email`, `receiver_origin`, `booking_date`, `export_date`, `created_branch_id`, `agent_id`, `current_branch_id`, `hub_id`, `flight_id`, `service_id`, `payment_type`, `usa_country_code`, `picked_up_by`, `picked_up_date_time`, `mawb_no`, `remarks`, `updated_by_id`, `showing_weight_kgs`, `showing_weight_gms`, `showing_weight_kgs_total`, `created_by_id`, `is_packed`, `payment_status`, `parcel_status`, `created_at`, `updated_at`) VALUES
(1, '0000001', 0.00, 0.00, 1, 0.00, 0.00, 0.00, 0.00, NULL, NULL, '1000001', 'Ut est consectetur f', 71, 15, 24, 7, '24.01', 'Collect', '64.00', 'DOCS', 'Sean Beard', 'Distinctio Hic sunt', '28.00', '39.00', '83.00', '18.13', 'Otto Bowman', 'Ayers Daniel Trading', 'Irure quaerat sunt', 'Obcaecati occaecat e', '24325', 123, '4', 'fepehucycy@mailinator.com', 'Sunt quis aliquid qu', 'Destiny Newman', 'Klein Daugherty Plc', 'Laudantium pariatur', 'Dolor facere quo lab', '60046', 58, '11', 'mezebofuzo@mailinator.com', 'Molestiae sint nisi', '2007-09-11', '1985-05-14', 1, 1, 1, 60, 2, 33, 'Cash', 'Perspiciatis veniam', 'Sed quas veritatis p', '2008-09-25 00:27:00', 'Voluptate aliqua Ut', 'Sint tenetur vel ull', NULL, 67, 5, '67.01', 1, 1, 'paid', 'approved', '2025-07-29 05:41:10', '2025-08-17 11:43:14'),
(2, '0000002', 0.00, 0.00, 1, 0.00, 0.00, 0.00, 0.00, NULL, NULL, '1000002', 'Earum dolor blanditi', 98, 4, 19, 21, '19.02', 'Prepaid', '54.00', 'DOCS', 'Maryam Holman', 'Est optio aliquid e', '43.00', '22.00', '56.00', '10.60', 'Shoriful Islam', 'Ollyo', NULL, 'In ut ullam lorem cu', '26130', 163, '98', 'qylinilihu@mailinator.com', 'Irure laboris laboru', 'Imogene Bell', 'Medina and Burgess Trading', 'Et voluptates qui nu', 'Commodi dolorem est', '52540', 72, '71', 'vamejiwoq@mailinator.com', 'Optio sint id obca', '1994-05-21', '2016-03-18', 1, 1, 1, 39, 2, 94, 'Due', 'Ut dicta reprehender', 'Et nostrud deserunt', '1989-06-12 01:11:00', 'Vel enim laborum bla', 'Id pariatur Illo en', 1, 10, 1, '10.00', 1, 1, 'paid', 'approved', '2025-07-29 05:55:59', '2025-08-17 11:43:14'),
(3, '0000003', 0.00, 0.00, 1, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 'Ipsum molestiae ver', 'Sed non modi quidem', 19, 73, 44, 37, '44.04', 'Collect', '57.00', 'SPX', 'Hayden Hopper', 'Vel voluptas dolores', '84.00', '26.00', '24.00', '10.48', 'Hanae Foreman', 'Pratt Moon Co', 'Nostrud delectus id', 'Proident dolore inc', '25122', 246, '9', 'qigosaxo@mailinator.com', NULL, 'Ivan Larson', 'Nielsen Hammond Inc', 'Enim rerum sunt labo', 'Corrupti distinctio', '11874', 193, '99', 'gidyde@mailinator.com', NULL, '1975-11-09', '2008-10-27', 1, 1, 1, 63, 2, 16, 'Due', 'Illum reprehenderit', 'Repudiandae in dolor', '1995-09-20 16:14:00', 'Reprehenderit neces', 'Inventore aliqua La', NULL, 44, 63, '44.06', 1, 1, 'paid', 'approved', '2025-08-17 04:18:46', '2025-08-17 11:43:14'),
(4, '0000004', 0.00, 0.00, 1, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 'Omnis sunt et aute s', 'A non ab expedita ad', 16, 37, 78, 27, '78.03', 'Collect', '37.00', 'SPX', 'Austin Hull', 'Pariatur Similique', '6.00', '70.00', '71.00', '5.96', 'Ora Barry', 'Richmond and Franklin Co', 'Placeat architecto', 'In libero eum eos ei', '99532', 76, '8', 'zeqoxez@mailinator.com', NULL, 'Demetrius Wooten', 'Charles Waller Co', 'Animi explicabo Do', 'Est et delectus nih', '29385', 81, '29', 'zemenabyz@mailinator.com', NULL, '2006-07-26', '1992-07-15', 1, 1, 1, 36, 2, 49, 'Cash', 'Impedit quaerat atq', 'Perspiciatis conseq', '2003-06-26 22:50:00', 'Rem velit aliquip ma', 'Minima aliquam ut qu', NULL, 46, 92, '46.09', 1, 1, 'paid', 'approved', '2025-08-17 06:37:51', '2025-08-17 11:43:14'),
(5, '0000005', 0.00, 0.00, 1, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 'Maxime aspernatur ad', 'Ipsum voluptate iur', 61, 56, 63, 92, '63.09', 'Prepaid', '89.00', 'DOCS', 'Eden Roach', 'Officiis in iste nos', '47.00', '44.00', '88.00', '36.40', 'Byron Hinton', 'Hartman and Pratt Plc', 'Voluptatem vitae pr', 'Totam excepteur culp', '40520', 24, '18', 'wofyceruve@mailinator.com', NULL, 'Clarke Mayer', 'Gates Dale LLC', 'Eius expedita iste u', 'Dolor in aut et simi', '94425', 243, '20', 'qivoni@mailinator.com', NULL, '2014-10-20', '1980-09-04', 1, 1, 1, 64, 2, 47, 'Due', 'Voluptas animi nisi', 'Voluptatem aliquip', '2003-02-12 22:39:00', 'Temporibus qui sed a', 'Asperiores necessita', NULL, 32, 5, '32.01', 1, 1, 'paid', 'approved', '2025-08-17 06:37:59', '2025-08-17 12:25:46'),
(6, '0000006', 0.00, 0.00, 1, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 'Quia maiores quasi c', 'Ut obcaecati rem lib', 55, 92, 23, 59, '23.06', 'Collect', '82.00', 'SPX', 'Liberty Compton', 'Tempora eius quia cu', '96.00', '5.00', '8.00', '0.77', 'Carissa Keller', 'Booker and David Co', 'Nisi asperiores cumq', 'Mollit similique lab', '31739', 68, '63', 'mevymop@mailinator.com', NULL, 'Laith Golden', 'Webster and Schwartz Co', 'Autem autem et quia', 'Reprehenderit qui vo', '51522', 208, '99', 'xikemocehi@mailinator.com', NULL, '2004-12-21', '1997-02-20', 1, 1, 1, 38, 1, 14, 'Cash', 'Laudantium quasi do', 'Nam molestiae et aut', '2018-03-21 01:16:00', 'Quo quaerat consecte', 'Et debitis soluta co', NULL, 80, 65, '80.07', 1, 0, 'paid', 'approved', '2025-08-17 06:38:07', '2025-08-17 11:35:41'),
(7, '0000007', 0.00, 0.00, 1, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 'Neque sint ut labore', 'Iure repudiandae cum', 75, 74, 17, 77, '17.08', 'Collect', '76.00', 'DOCS', 'Colleen Sellers', 'Et officiis sit ius', '17.00', '3.00', '64.00', '0.65', 'Michelle Sandoval', 'English and Miles LLC', 'Nihil et ut occaecat', 'Sunt proident adip', '62712', 118, '7', 'detiwejip@mailinator.com', NULL, 'MacKenzie Swanson', 'Terry Miller Associates', 'Vitae consequatur in', 'Sed optio veniam a', '12270', 48, '24', 'cerojeni@mailinator.com', NULL, '1987-12-12', '1970-09-20', 1, 1, 1, 84, 1, 38, 'Cash', 'Aliqua Occaecat asp', 'Dolor omnis ea place', '2004-01-04 01:10:00', 'Nam nihil culpa dist', 'Odio officia nisi qu', NULL, 83, 49, '83.05', 1, 1, 'paid', 'approved', '2025-08-17 06:38:14', '2025-08-17 12:25:46'),
(8, '0000008', 0.00, 0.00, 1, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 'Enim cupiditate pers', 'Amet tempora nisi a', 21, 12, 81, 22, '81.02', 'Prepaid', '29.00', 'SPX', 'Jason Rivers', 'Explicabo Ut non qu', '81.00', '30.00', '31.00', '15.07', 'Geraldine Porter', 'Mcdowell and Franklin LLC', 'Ipsa tempora nihil', 'Et voluptates eligen', '85439', 219, '99', 'fyborewo@mailinator.com', NULL, 'Bradley Gallegos', 'Bryant Jarvis Associates', 'Cumque facere placea', 'Sequi soluta exercit', '45423', 138, '5', 'feqokezeh@mailinator.com', NULL, '2018-07-13', '2001-07-30', 1, 1, 1, 7, 1, 92, 'Cash', 'Aliquid ea eiusmod b', 'Dolorem totam dolore', '2002-01-11 01:00:00', 'Voluptate atque tota', 'Aliquid sit commodi', NULL, 24, 19, '24.02', 1, 0, 'paid', 'approved', '2025-08-17 06:38:20', '2025-08-17 11:35:41'),
(9, '0000009', 0.00, 0.00, 1, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 'Cum modi soluta veri', 'Iste eos neque amet', 74, 37, 91, 97, '91.10', 'Prepaid', '52.00', 'SPX', 'Hollee Holt', 'Consequatur Praesen', '31.00', '32.00', '99.00', '19.64', 'William Travis', 'Booth Dickson Associates', 'Tenetur ut delectus', 'Consequat Dolor qui', '73691', 55, '36', 'wucikahox@mailinator.com', NULL, 'Denton Boyer', 'Burton and Guy Co', 'Ut sit deserunt quam', 'Sit consequuntur sit', '81012', 105, '38', 'namatileh@mailinator.com', NULL, '1971-07-10', '2015-02-09', 1, 1, 1, 68, 2, 28, 'Due', 'Assumenda quaerat co', 'Qui esse esse dolor', '1988-08-07 06:23:00', 'Est aperiam eveniet', 'Animi cumque itaque', NULL, 67, 24, '67.02', 1, 1, 'paid', 'approved', '2025-08-17 06:38:28', '2025-08-17 12:25:46'),
(10, '0000010', 0.00, 0.00, 1, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 'Iste ut qui nostrum', 'In eum non aliquip d', 55, 7, 21, 1, '21.00', 'Collect', '1.00', 'SPX', 'Phoebe Vega', 'Veritatis irure qui', '73.00', '54.00', '59.00', '46.52', 'Mia English', 'Mccall Romero LLC', 'In consequuntur iure', 'Sit magna minima au', '87794', 113, '84', 'rynu@mailinator.com', NULL, 'Graiden Fox', 'Oneal and Jacobs LLC', 'Ut et eveniet aut q', 'Et aut dolorem aliqu', '19833', 145, '13', 'tokuciwa@mailinator.com', NULL, '1998-04-16', '1992-08-29', 1, 1, 1, 2, 1, 96, 'Due', 'Perspiciatis harum', 'Ipsum dolorem exerci', '2003-06-14 22:48:00', 'Ea distinctio Est', 'Totam ex debitis qua', NULL, 54, 4, '54.00', 1, 0, 'paid', 'approved', '2025-08-17 06:38:36', '2025-08-17 11:35:41'),
(11, '0000011', 0.00, 0.00, 1, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 'Eaque in et eius ut', 'Fugit aut debitis c', 87, 14, 28, 89, '28.09', 'Prepaid', '15.00', 'DOCS', 'Althea Dickson', 'Rerum harum aut ab e', '73.00', '98.00', '8.00', '11.45', 'Malachi Sparks', 'Harding Cabrera Traders', 'Do aut rerum ut pers', 'Dicta ea ipsum offic', '65218', 65, '97', 'tapu@mailinator.com', NULL, 'Aline Herman', 'Sykes and Peterson Trading', 'Laborum officia dist', 'Libero iusto tempora', '69832', 11, '77', 'giziwuh@mailinator.com', NULL, '2022-12-21', '1973-09-25', 1, 1, 1, 41, 2, 94, 'Cash', 'Facere cupidatat eaq', 'Voluptatem Nam ut s', '2024-06-25 02:26:00', 'Qui soluta voluptate', 'Lorem minim sed quis', NULL, 36, 24, '36.02', 1, 1, 'paid', 'approved', '2025-08-17 06:38:42', '2025-08-17 12:25:46'),
(12, '0000012', 0.00, 0.00, 1, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 'Nobis repellendus C', 'Unde quis officia pe', 65, 92, 5, 62, '5.06', 'Collect', '95.00', 'DOCS', 'Ralph Robles', 'Blanditiis eiusmod r', '87.00', '59.00', '96.00', '98.55', 'Vladimir Waters', 'Trujillo Odom Trading', 'Est recusandae Pari', 'Voluptatem Minim id', '78701', 138, '62', 'disel@mailinator.com', NULL, 'Jenna Payne', 'Maxwell and Head Associates', 'Officiis delectus a', 'Accusamus dolore omn', '46158', 119, '20', 'wuqivu@mailinator.com', NULL, '1984-06-28', '1995-06-20', 1, 1, 1, 44, 1, 70, 'Due', 'Animi ad fugiat id', 'Nulla accusamus moll', '1971-06-11 14:43:00', 'Minim quo officiis i', 'Quidem officia fuga', NULL, 36, 22, '36.02', 1, 0, 'paid', 'approved', '2025-08-17 06:38:48', '2025-08-17 11:35:41'),
(13, '0000013', 0.00, 0.00, 1, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 'Nostrum dolor error', 'Beatae nesciunt imp', 65, 40, 61, 37, '61.04', 'Prepaid', '64.00', 'SPX', 'Sigourney Caldwell', 'Veniam perferendis', '49.00', '26.00', '2.00', '0.51', 'Tyrone Floyd', 'Burris and Schwartz LLC', 'Vitae velit ex aut m', 'Expedita est harum', '67283', 4, '93', 'jigona@mailinator.com', NULL, 'Macey Herrera', 'Solis Carver Plc', 'Non libero repudiand', 'Eaque unde eum occae', '90929', 142, '19', 'vopiwoz@mailinator.com', NULL, '2018-05-30', '1990-08-21', 1, 1, 1, 3, 1, 63, 'Due', 'Eos ea asperiores q', 'Voluptatum neque dol', '2003-06-18 07:29:00', 'Asperiores ea qui si', 'Ipsum ipsam modi con', NULL, 89, 54, '89.05', 1, 0, 'paid', 'approved', '2025-08-17 06:38:54', '2025-08-17 11:35:41');

-- --------------------------------------------------------

--
-- Table structure for table `parcel_invoice_details`
--

CREATE TABLE `parcel_invoice_details` (
  `id` bigint UNSIGNED NOT NULL,
  `parcel_invoice_id` int NOT NULL,
  `item_id` bigint NOT NULL,
  `quantity` double(20,2) NOT NULL,
  `unit_price` double(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parcel_items`
--

CREATE TABLE `parcel_items` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parcel_items`
--

INSERT INTO `parcel_items` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'laptops', '2025-07-24 12:40:52', '2025-07-24 12:40:52'),
(2, 'vaccines', '2025-07-24 12:40:59', '2025-07-24 12:40:59'),
(3, 'salmon', '2025-07-24 12:41:07', '2025-07-24 12:41:07'),
(4, 'watches', '2025-07-24 12:41:14', '2025-07-24 12:41:14'),
(5, 'roses', '2025-07-24 12:41:25', '2025-07-24 12:41:25'),
(6, 'batteries', '2025-07-24 12:41:32', '2025-07-24 12:41:32'),
(7, 'bank documents', '2025-07-24 12:41:58', '2025-07-24 12:41:58'),
(8, 'cottons', '2025-07-24 12:42:05', '2025-07-24 12:42:05'),
(9, 'gold', '2025-07-24 12:42:14', '2025-07-24 12:42:14'),
(10, 'engines', '2025-07-24 12:42:20', '2025-07-24 12:42:20'),
(11, 'air buds', '2025-07-24 12:49:43', '2025-07-24 12:49:43'),
(12, 'haviva porter', '2025-07-24 12:52:39', '2025-07-24 12:52:39'),
(13, 'molly saunders', '2025-07-24 12:53:07', '2025-07-24 12:53:07'),
(14, 'orange', '2025-07-24 12:53:16', '2025-07-24 12:53:16'),
(15, 'aubrey langley', '2025-07-24 13:04:23', '2025-07-24 13:04:23'),
(16, 'joel jacobson', '2025-07-24 13:08:25', '2025-07-24 13:08:25'),
(17, 'oil', '2025-07-24 13:09:07', '2025-07-24 13:09:07'),
(18, 'apple', '2025-07-24 13:16:11', '2025-07-24 13:16:11'),
(19, 'cream', '2025-07-24 13:16:28', '2025-07-24 13:16:28'),
(20, 'cherry', '2025-07-24 13:19:01', '2025-07-24 13:19:01'),
(21, 'fish', '2025-07-24 13:19:07', '2025-07-24 13:19:07'),
(22, 'book', '2025-07-24 13:20:09', '2025-07-24 13:20:09'),
(23, 'lotion', '2025-07-24 13:20:19', '2025-07-24 13:20:19'),
(24, 'bottol', '2025-07-24 13:20:41', '2025-07-24 13:20:41'),
(25, 'pant', '2025-07-24 13:20:44', '2025-07-24 13:20:44'),
(26, 'cap', '2025-07-24 13:21:44', '2025-07-24 13:21:44'),
(27, 'mog', '2025-07-27 05:42:13', '2025-07-27 05:42:13'),
(28, 'ambrella', '2025-07-27 05:42:19', '2025-07-27 05:42:19'),
(29, 'shirt', '2025-07-27 10:42:42', '2025-07-27 10:42:42'),
(30, 'cloth', '2025-07-28 04:47:15', '2025-07-28 04:47:15'),
(31, 'paper', '2025-07-28 09:03:39', '2025-07-28 09:03:39');

-- --------------------------------------------------------

--
-- Table structure for table `parties`
--

CREATE TABLE `parties` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nid_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `current_balance` double(20,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parties`
--

INSERT INTO `parties` (`id`, `name`, `email`, `phone`, `address`, `nid_number`, `date_of_birth`, `current_balance`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 'Nowab Shorif', 'nsanoman@gmail.com', '01839317038', 'Companigonj, Noakhali.', '234565432', '1997-03-01', 0.00, '1', 1, NULL, '2025-04-10 04:21:00', '2025-05-21 06:05:45'),
(2, 'Nyssa Griffith', 'rubekem@mailinator.com', '43', 'Ab unde et ad sint c', '719', '2002-04-04', 0.00, '1', 1, NULL, '2025-04-10 04:23:21', '2025-05-20 05:10:56'),
(3, 'Metro DP', 'jerucece@mailinator.com', '99', 'Temporibus mollit au', '681', '1989-08-31', 0.00, '1', 1, NULL, '2025-04-10 04:23:26', '2025-05-26 14:10:34');

-- --------------------------------------------------------

--
-- Table structure for table `party_ledgers`
--

CREATE TABLE `party_ledgers` (
  `id` bigint UNSIGNED NOT NULL,
  `party_id` int NOT NULL,
  `loan_id` int DEFAULT NULL,
  `loan_type` tinyint NOT NULL COMMENT '0 = loan_given, 1 = loan_taken',
  `payment_id` int DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `particular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `debit_amount` decimal(20,2) DEFAULT NULL,
  `credit_amount` decimal(20,2) DEFAULT NULL,
  `current_balance` decimal(20,2) NOT NULL,
  `reference_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `party_loans`
--

CREATE TABLE `party_loans` (
  `id` bigint UNSIGNED NOT NULL,
  `party_id` bigint UNSIGNED NOT NULL,
  `account_id` bigint UNSIGNED DEFAULT NULL,
  `loan_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_type` tinyint NOT NULL COMMENT '0 = loan_given, 1 = loan_taken',
  `amount` double(20,2) NOT NULL,
  `loan_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `last_payment_date` date DEFAULT NULL,
  `paid_amount` double(20,2) NOT NULL DEFAULT '0.00',
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` tinyint NOT NULL DEFAULT '0' COMMENT '0 = pending, -1 = partial, 1 = paid',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by_id` int UNSIGNED DEFAULT NULL,
  `updated_by_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `party_payments`
--

CREATE TABLE `party_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `party_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `payment_type` tinyint NOT NULL COMMENT '0=paid to party, 1=collection from party',
  `loan_id` bigint DEFAULT NULL,
  `date` date NOT NULL,
  `amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_virtual` int NOT NULL DEFAULT '0' COMMENT '0=not virtual, 1=virtual',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1=active, 0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `is_virtual`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 0, 1, NULL, NULL),
(2, 'Investment Capital', 1, 1, NULL, NULL),
(3, 'Nagad', 0, 1, NULL, NULL),
(4, 'Islami Bank', 0, 1, NULL, NULL),
(5, 'Sonali Bank', 0, 1, NULL, NULL),
(6, 'Rupali Bank', 0, 1, NULL, NULL),
(7, 'Bkash', 0, 1, NULL, NULL),
(8, 'BRAC Bank PLC', 0, 1, '2025-05-30 06:44:18', '2025-05-30 06:44:18'),
(9, 'The City Bank', 0, 1, '2025-05-30 06:44:55', '2025-05-30 06:44:55'),
(10, 'DBBL', 0, 1, '2025-05-30 06:45:14', '2025-05-30 06:45:14');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(151, 2, 1, '2025-05-21 12:09:11', '2025-05-21 12:09:11'),
(152, 2, 183, '2025-05-21 12:09:11', '2025-05-21 12:09:11'),
(153, 2, 181, '2025-05-21 12:09:11', '2025-05-21 12:09:11'),
(154, 2, 200, '2025-05-21 12:09:11', '2025-05-21 12:09:11'),
(155, 2, 184, '2025-05-21 12:09:11', '2025-05-21 12:09:11'),
(156, 2, 48, '2025-05-21 12:09:11', '2025-05-21 12:09:11'),
(157, 2, 49, '2025-05-21 12:09:11', '2025-05-21 12:09:11'),
(158, 2, 50, '2025-05-21 12:09:11', '2025-05-21 12:09:11'),
(159, 2, 168, '2025-05-21 12:09:11', '2025-05-21 12:09:11'),
(160, 2, 52, '2025-05-21 12:09:11', '2025-05-21 12:09:11'),
(161, 2, 185, '2025-05-21 12:09:11', '2025-05-21 12:09:11'),
(162, 2, 186, '2025-05-21 12:09:11', '2025-05-21 12:09:11'),
(163, 2, 187, '2025-05-21 12:09:11', '2025-05-21 12:09:11'),
(164, 2, 188, '2025-05-21 12:09:11', '2025-05-21 12:09:11'),
(404, 9, 1, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(405, 9, 182, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(406, 9, 170, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(407, 9, 171, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(408, 9, 172, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(409, 9, 178, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(410, 9, 169, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(411, 9, 179, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(412, 9, 69, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(413, 9, 35, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(414, 9, 95, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(415, 9, 96, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(416, 9, 97, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(417, 9, 98, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(418, 9, 134, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(419, 9, 135, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(420, 9, 162, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(421, 9, 84, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(422, 9, 99, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(423, 9, 100, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(424, 9, 101, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(425, 9, 102, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(426, 9, 132, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(427, 9, 73, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(428, 9, 79, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(429, 9, 80, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(430, 9, 81, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(431, 9, 82, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(432, 9, 117, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(433, 9, 133, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(434, 9, 85, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(435, 9, 103, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(436, 9, 104, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(437, 9, 119, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(438, 9, 123, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(439, 9, 120, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(440, 9, 121, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(441, 9, 122, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(442, 9, 105, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(443, 9, 110, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(444, 9, 113, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(445, 9, 114, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(446, 9, 115, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(447, 9, 116, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(448, 9, 118, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(449, 9, 130, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(450, 9, 131, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(451, 9, 149, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(452, 9, 150, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(453, 9, 151, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(454, 9, 154, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(455, 9, 152, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(456, 9, 153, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(457, 9, 137, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(458, 9, 155, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(459, 9, 156, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(460, 9, 157, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(461, 9, 158, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(462, 9, 159, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(463, 9, 160, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(464, 9, 161, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(465, 9, 129, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(466, 9, 138, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(467, 9, 139, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(468, 9, 141, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(469, 9, 143, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(470, 9, 144, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(471, 9, 145, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(472, 9, 146, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(473, 9, 147, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(474, 9, 148, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(475, 9, 142, '2025-05-21 12:37:17', '2025-05-21 12:37:17'),
(649, 11, 1, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(650, 11, 190, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(651, 11, 192, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(652, 11, 193, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(653, 11, 195, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(654, 11, 196, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(655, 11, 197, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(656, 11, 182, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(657, 11, 170, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(658, 11, 171, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(659, 11, 172, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(660, 11, 178, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(661, 11, 179, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(662, 11, 169, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(663, 11, 184, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(664, 11, 46, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(665, 11, 47, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(666, 11, 48, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(667, 11, 49, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(668, 11, 50, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(669, 11, 168, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(670, 11, 69, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(671, 11, 70, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(672, 11, 92, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(673, 11, 93, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(674, 11, 40, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(675, 11, 41, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(676, 11, 94, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(677, 11, 16, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(678, 11, 24, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(679, 11, 25, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(680, 11, 35, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(681, 11, 95, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(682, 11, 96, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(683, 11, 97, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(684, 11, 134, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(685, 11, 135, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(686, 11, 162, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(687, 11, 84, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(688, 11, 99, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(689, 11, 100, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(690, 11, 101, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(691, 11, 132, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(692, 11, 73, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(693, 11, 79, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(694, 11, 80, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(695, 11, 81, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(696, 11, 117, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(697, 11, 133, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(698, 11, 30, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(699, 11, 72, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(700, 11, 75, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(701, 11, 76, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(702, 11, 36, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(703, 11, 77, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(704, 11, 78, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(705, 11, 74, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(706, 11, 105, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(707, 11, 106, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(708, 11, 107, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(709, 11, 108, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(710, 11, 109, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(711, 11, 111, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(712, 11, 112, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(713, 11, 110, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(714, 11, 113, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(715, 11, 114, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(716, 11, 115, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(717, 11, 116, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(718, 11, 118, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(719, 11, 130, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(720, 11, 124, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(721, 11, 125, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(722, 11, 126, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(723, 11, 127, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(724, 11, 128, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(725, 11, 136, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(726, 11, 131, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(727, 11, 149, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(728, 11, 150, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(729, 11, 151, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(730, 11, 154, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(731, 11, 152, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(732, 11, 153, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(733, 11, 137, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(734, 11, 155, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(735, 11, 156, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(736, 11, 157, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(737, 11, 159, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(738, 11, 160, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(739, 11, 161, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(740, 11, 129, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(741, 11, 138, '2025-05-27 11:25:18', '2025-05-27 11:25:18'),
(742, 10, 1, '2025-06-02 11:48:10', '2025-06-02 11:48:10'),
(743, 10, 183, '2025-06-02 11:48:10', '2025-06-02 11:48:10'),
(744, 10, 181, '2025-06-02 11:48:10', '2025-06-02 11:48:10'),
(745, 10, 200, '2025-06-02 11:48:10', '2025-06-02 11:48:10'),
(746, 10, 184, '2025-06-02 11:48:10', '2025-06-02 11:48:10'),
(747, 10, 48, '2025-06-02 11:48:10', '2025-06-02 11:48:10'),
(748, 10, 49, '2025-06-02 11:48:10', '2025-06-02 11:48:10'),
(749, 10, 50, '2025-06-02 11:48:10', '2025-06-02 11:48:10'),
(750, 10, 168, '2025-06-02 11:48:10', '2025-06-02 11:48:10'),
(751, 10, 52, '2025-06-02 11:48:10', '2025-06-02 11:48:10'),
(752, 10, 185, '2025-06-02 11:48:10', '2025-06-02 11:48:10'),
(753, 10, 186, '2025-06-02 11:48:10', '2025-06-02 11:48:10'),
(754, 10, 187, '2025-06-02 11:48:10', '2025-06-02 11:48:10'),
(755, 10, 188, '2025-06-02 11:48:10', '2025-06-02 11:48:10'),
(756, 3, 1, '2025-07-23 06:36:53', '2025-07-23 06:36:53'),
(757, 3, 212, '2025-07-23 06:36:53', '2025-07-23 06:36:53'),
(758, 3, 213, '2025-07-23 06:36:53', '2025-07-23 06:36:53'),
(759, 3, 29, '2025-07-23 06:36:53', '2025-07-23 06:36:53'),
(760, 3, 17, '2025-07-23 06:36:53', '2025-07-23 06:36:53'),
(761, 3, 90, '2025-07-23 06:36:53', '2025-07-23 06:36:53'),
(762, 3, 91, '2025-07-23 06:36:53', '2025-07-23 06:36:53');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `supplier_id` int NOT NULL,
  `account_id` bigint DEFAULT NULL,
  `vouchar_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `total_price` double(20,2) NOT NULL,
  `vat_tax` double(20,2) DEFAULT '0.00',
  `discount_method` tinyint NOT NULL DEFAULT '1' COMMENT '0=Percentage, 1=Solid',
  `discount_rate` double(20,2) NOT NULL,
  `discount` double(20,2) NOT NULL,
  `total_payable` double(20,2) NOT NULL,
  `paid_amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `supplier_id`, `account_id`, `vouchar_no`, `date`, `total_price`, `vat_tax`, `discount_method`, `discount_rate`, `discount`, `total_payable`, `paid_amount`, `reference_number`, `note`, `payment_status`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0000001', '2025-06-14', 12500.00, 12500.00, 1, 0.00, 0.00, 12500.00, 12500.00, NULL, NULL, '1', '1', 1, NULL, '2025-06-14 14:17:10', '2025-06-14 14:17:16'),
(2, 2, 1, '0000002', '2025-06-20', 30000.00, 30000.00, 1, 0.00, 300.00, 29700.00, 0.00, NULL, 'Due', '0', '1', 1, NULL, '2025-06-20 07:04:11', '2025-06-20 07:04:18');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` decimal(20,2) NOT NULL,
  `unit_price` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_details`
--

INSERT INTO `purchase_details` (`id`, `purchase_id`, `item_id`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '5.00', '2500.00', '2025-06-14 14:17:10', '2025-06-14 14:17:10'),
(2, 2, 4, '12.00', '2500.00', '2025-06-20 07:04:11', '2025-06-20 07:04:11');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `is_superadmin` tinyint NOT NULL DEFAULT '0',
  `created_by` int DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `is_superadmin`, `created_by`, `role`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Super Admin', 1, NULL, NULL),
(2, 0, 1, 'Investor', 1, NULL, NULL),
(3, 0, 1, 'Branch Manager', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` int DEFAULT NULL,
  `bike_reg_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint DEFAULT NULL,
  `invoice_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `total_price` double(20,2) NOT NULL,
  `vat_tax` double(20,2) DEFAULT '0.00',
  `discount_method` tinyint NOT NULL DEFAULT '1' COMMENT '0=Percentage, 1=Solid',
  `discount_rate` double(20,2) NOT NULL,
  `discount` double(20,2) NOT NULL,
  `total_payable` double(20,2) NOT NULL,
  `paid_amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `customer_id`, `bike_reg_no`, `account_id`, `invoice_no`, `date`, `total_price`, `vat_tax`, `discount_method`, `discount_rate`, `discount`, `total_payable`, `paid_amount`, `reference_number`, `note`, `payment_status`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, '0000001', '2025-06-20', 200.00, 0.00, 0, 0.00, 0.00, 200.00, 200.00, NULL, NULL, '1', '1', 1, NULL, '2025-06-20 06:31:20', '2025-06-20 06:31:27'),
(2, 2, 'DM-T-21004', 1, '0000002', '2025-06-20', 2000.00, 0.00, 1, 100.00, 100.00, 1900.00, 1900.00, NULL, NULL, '1', '1', 1, NULL, '2025-06-20 06:46:03', '2025-06-20 06:46:10'),
(3, 3, NULL, 1, '0000003', '2025-06-20', 5600.00, 0.00, 1, 100.00, 100.00, 5500.00, 5500.00, NULL, NULL, '1', '1', 1, NULL, '2025-06-20 07:09:25', '2025-06-20 07:09:30');

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` bigint UNSIGNED NOT NULL,
  `sale_id` int NOT NULL,
  `item_type` int NOT NULL COMMENT '0=item, 1=service',
  `item_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `quantity` double(20,2) NOT NULL,
  `unit_price` double(20,2) NOT NULL,
  `purchase_price` double(20,2) DEFAULT NULL,
  `profit` double(20,2) DEFAULT NULL,
  `net_sale_price` double(20,2) DEFAULT NULL,
  `net_profit` double(20,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_details`
--

INSERT INTO `sale_details` (`id`, `sale_id`, `item_type`, `item_id`, `service_id`, `quantity`, `unit_price`, `purchase_price`, `profit`, `net_sale_price`, `net_profit`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 2, NULL, 1.00, 200.00, 150.00, 50.00, 200.00, 50.00, '2025-06-20 06:31:20', '2025-06-20 06:31:27'),
(2, 2, 1, NULL, 7, 1.00, 2000.00, 1600.00, 400.00, 1900.00, 300.00, '2025-06-20 06:46:03', '2025-06-20 06:46:10'),
(3, 3, 0, 4, NULL, 2.00, 2800.00, 2500.00, 600.00, 2750.00, 500.00, '2025-06-20 07:09:25', '2025-06-20 07:09:30');

-- --------------------------------------------------------

--
-- Table structure for table `shipment_boxes`
--

CREATE TABLE `shipment_boxes` (
  `id` bigint UNSIGNED NOT NULL,
  `box_id` int NOT NULL,
  `shipment_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipment_boxes`
--

INSERT INTO `shipment_boxes` (`id`, `box_id`, `shipment_no`, `status`, `created_at`, `updated_at`) VALUES
(4, 1, '0000001', 'approved', '2025-08-17 11:43:11', '2025-08-17 11:43:14'),
(5, 5, '0000002', 'approved', '2025-08-17 12:08:09', '2025-08-17 12:25:46');

-- --------------------------------------------------------

--
-- Table structure for table `shipment_box_items`
--

CREATE TABLE `shipment_box_items` (
  `id` bigint UNSIGNED NOT NULL,
  `box_shipment_id` int NOT NULL,
  `invoice_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipment_box_items`
--

INSERT INTO `shipment_box_items` (`id`, `box_shipment_id`, `invoice_id`, `created_at`, `updated_at`) VALUES
(30, 4, 1, '2025-08-17 11:43:11', '2025-08-17 11:43:11'),
(31, 4, 2, '2025-08-17 11:43:11', '2025-08-17 11:43:11'),
(32, 4, 3, '2025-08-17 11:43:11', '2025-08-17 11:43:11'),
(33, 4, 4, '2025-08-17 11:43:11', '2025-08-17 11:43:11'),
(40, 5, 5, '2025-08-17 12:25:15', '2025-08-17 12:25:15'),
(41, 5, 7, '2025-08-17 12:25:15', '2025-08-17 12:25:15'),
(42, 5, 9, '2025-08-17 12:25:15', '2025-08-17 12:25:15'),
(43, 5, 11, '2025-08-17 12:25:15', '2025-08-17 12:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `stock_histories`
--

CREATE TABLE `stock_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` int NOT NULL,
  `date` date NOT NULL,
  `particular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_in_qty` double(20,2) DEFAULT NULL,
  `stock_out_qty` double(20,2) DEFAULT NULL,
  `rate` double(20,2) NOT NULL DEFAULT '0.00',
  `current_stock` double(20,2) NOT NULL DEFAULT '0.00',
  `created_by_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_histories`
--

INSERT INTO `stock_histories` (`id`, `item_id`, `date`, `particular`, `stock_in_qty`, `stock_out_qty`, `rate`, `current_stock`, `created_by_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2025-06-14', 'Opening Stock', 10.00, NULL, 150.00, 10.00, 1, '2025-06-14 14:13:54', '2025-06-14 14:13:54'),
(2, 4, '2025-06-14', 'Opening Stock', 5.00, NULL, 2500.00, 5.00, 1, '2025-06-14 14:14:59', '2025-06-14 14:14:59'),
(3, 4, '2025-06-14', 'Purchase', 5.00, NULL, 2500.00, 10.00, 1, '2025-06-14 14:17:16', '2025-06-14 14:17:16'),
(4, 8, '2025-06-16', 'Opening Stock', 1.00, NULL, 125.00, 1.00, 1, '2025-06-16 17:12:16', '2025-06-16 17:12:16'),
(5, 2, '2025-06-20', 'Sale', NULL, 1.00, 200.00, 9.00, 1, '2025-06-20 06:31:27', '2025-06-20 06:31:27'),
(6, 4, '2025-06-20', 'Purchase', 12.00, NULL, 2500.00, 22.00, 1, '2025-06-20 07:04:18', '2025-06-20 07:04:18'),
(7, 4, '2025-06-20', 'Sale', NULL, 2.00, 2800.00, 20.00, 1, '2025-06-20 07:09:30', '2025-06-20 07:09:30');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `organization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_payable` double(20,2) NOT NULL DEFAULT '0.00',
  `opening_receivable` double(20,2) NOT NULL DEFAULT '0.00',
  `current_balance` double(20,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `phone`, `address`, `organization`, `opening_payable`, `opening_receivable`, `current_balance`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 'Karim Traders', NULL, '0178901789', NULL, 'Karim Traders', 0.00, 0.00, 0.00, '1', 1, NULL, '2025-06-14 14:16:27', '2025-06-14 14:17:16'),
(2, 'Jamalpur Enterprise', NULL, '017122222', 'Mirpur 10', 'Jamalpur Enterprise', 0.00, 0.00, 29700.00, '1', 1, NULL, '2025-06-20 06:29:55', '2025-06-20 07:04:18');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_ledgers`
--

CREATE TABLE `supplier_ledgers` (
  `id` bigint UNSIGNED NOT NULL,
  `supplier_id` int NOT NULL,
  `purchase_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `particular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `debit_amount` decimal(20,2) DEFAULT NULL,
  `credit_amount` decimal(20,2) DEFAULT NULL,
  `current_balance` decimal(20,2) NOT NULL,
  `reference_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_ledgers`
--

INSERT INTO `supplier_ledgers` (`id`, `supplier_id`, `purchase_id`, `payment_id`, `account_id`, `particular`, `date`, `debit_amount`, `credit_amount`, `current_balance`, `reference_number`, `note`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, 'Purchase', '2025-06-14', '12500.00', NULL, '12500.00', NULL, NULL, 1, NULL, '2025-06-14 14:17:16', '2025-06-14 14:17:16'),
(2, 1, NULL, 1, 1, 'Payment', '2025-06-14', NULL, '12500.00', '0.00', NULL, NULL, 1, NULL, '2025-06-14 14:17:16', '2025-06-14 14:17:16'),
(3, 2, 2, NULL, NULL, 'Purchase', '2025-06-20', '29700.00', NULL, '29700.00', NULL, 'Due', 1, NULL, '2025-06-20 07:04:18', '2025-06-20 07:04:18');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_payments`
--

CREATE TABLE `supplier_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `supplier_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `purchase_id` bigint DEFAULT NULL,
  `date` date NOT NULL,
  `amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_payments`
--

INSERT INTO `supplier_payments` (`id`, `supplier_id`, `account_id`, `purchase_id`, `date`, `amount`, `reference_number`, `note`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2025-06-14', 12500.00, NULL, NULL, 1, 1, NULL, '2025-06-14 14:17:16', '2025-06-14 14:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `is_default` tinyint NOT NULL,
  `unit_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `is_default`, `unit_type`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'quantity', 'Piece', 1, NULL, NULL),
(2, 0, 'quantity', 'Pair', 1, NULL, NULL),
(3, 0, 'quantity', 'Set', 1, NULL, NULL),
(4, 0, 'quantity', 'Box', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_ledgers`
--
ALTER TABLE `account_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basic_infos`
--
ALTER TABLE `basic_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bike_profits`
--
ALTER TABLE `bike_profits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bike_profit_share_records`
--
ALTER TABLE `bike_profit_share_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bike_services`
--
ALTER TABLE `bike_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bike_service_categories`
--
ALTER TABLE `bike_service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boxes`
--
ALTER TABLE `boxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `branches_code_unique` (`code`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_types`
--
ALTER TABLE `category_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_ledgers`
--
ALTER TABLE `customer_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_details`
--
ALTER TABLE `expense_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_heads`
--
ALTER TABLE `expense_heads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontend_menus`
--
ALTER TABLE `frontend_menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `frontend_menus_slug_unique` (`slug`);

--
-- Indexes for table `fund_transfer_histories`
--
ALTER TABLE `fund_transfer_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investors`
--
ALTER TABLE `investors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investor_ledgers`
--
ALTER TABLE `investor_ledgers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `investor_ledgers_reference_number_unique` (`reference_number`);

--
-- Indexes for table `investor_transactions`
--
ALTER TABLE `investor_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `investor_transactions_reference_number_unique` (`reference_number`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parcel_invoices`
--
ALTER TABLE `parcel_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parcel_invoice_details`
--
ALTER TABLE `parcel_invoice_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parcel_items`
--
ALTER TABLE `parcel_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parties`
--
ALTER TABLE `parties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `party_ledgers`
--
ALTER TABLE `party_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `party_loans`
--
ALTER TABLE `party_loans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `party_loans_loan_no_unique` (`loan_no`);

--
-- Indexes for table `party_payments`
--
ALTER TABLE `party_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipment_boxes`
--
ALTER TABLE `shipment_boxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shipment_boxes_shipment_no_unique` (`shipment_no`);

--
-- Indexes for table `shipment_box_items`
--
ALTER TABLE `shipment_box_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_histories`
--
ALTER TABLE `stock_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_ledgers`
--
ALTER TABLE `supplier_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_payments`
--
ALTER TABLE `supplier_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `account_ledgers`
--
ALTER TABLE `account_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `basic_infos`
--
ALTER TABLE `basic_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bike_profits`
--
ALTER TABLE `bike_profits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bike_profit_share_records`
--
ALTER TABLE `bike_profit_share_records`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bike_services`
--
ALTER TABLE `bike_services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `bike_service_categories`
--
ALTER TABLE `bike_service_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `boxes`
--
ALTER TABLE `boxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `category_types`
--
ALTER TABLE `category_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_ledgers`
--
ALTER TABLE `customer_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_payments`
--
ALTER TABLE `customer_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `expense_details`
--
ALTER TABLE `expense_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_heads`
--
ALTER TABLE `expense_heads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `frontend_menus`
--
ALTER TABLE `frontend_menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fund_transfer_histories`
--
ALTER TABLE `fund_transfer_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `investors`
--
ALTER TABLE `investors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `investor_ledgers`
--
ALTER TABLE `investor_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `investor_transactions`
--
ALTER TABLE `investor_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `parcel_invoices`
--
ALTER TABLE `parcel_invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `parcel_invoice_details`
--
ALTER TABLE `parcel_invoice_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parcel_items`
--
ALTER TABLE `parcel_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `parties`
--
ALTER TABLE `parties`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `party_ledgers`
--
ALTER TABLE `party_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `party_loans`
--
ALTER TABLE `party_loans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `party_payments`
--
ALTER TABLE `party_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=763;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipment_boxes`
--
ALTER TABLE `shipment_boxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shipment_box_items`
--
ALTER TABLE `shipment_box_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `stock_histories`
--
ALTER TABLE `stock_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supplier_ledgers`
--
ALTER TABLE `supplier_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier_payments`
--
ALTER TABLE `supplier_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
