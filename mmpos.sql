-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2020 at 01:50 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mmpos`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(10) NOT NULL,
  `discount_item` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `item_id`, `price`, `qty`, `discount_item`, `total`, `user_id`) VALUES
(1, 41, 105000, 2, 0, 210000, 5),
(2, 41, 105000, 2, 0, 210000, 6),
(3, 4, 140000, 2, 0, 280000, 6);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `created`, `updated`) VALUES
(1, 'Hot Black Coffee', '0000-00-00 00:00:00', '2020-11-02 02:06:26'),
(2, 'Snack And Food', '0000-00-00 00:00:00', '2020-11-02 02:09:00'),
(3, 'Milk Base', '0000-00-00 00:00:00', '2020-11-02 02:08:19'),
(4, 'Roast Bean', '0000-00-00 00:00:00', '2020-11-02 02:08:28'),
(5, 'Green Bean', '0000-00-00 00:00:00', NULL),
(6, 'Non - Coffee', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `gender`, `phone`, `address`, `created`, `updated`) VALUES
(2, 'Umum', 'L', '-', 'Default', '0000-00-00 00:00:00', NULL),
(3, 'Tulus Harry', 'L', '088845615452', 'Bandung', '0000-00-00 00:00:00', '2020-11-16 12:59:42'),
(9, 'Dodo', 'L', '0850457455', 'Pangalengan', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `barcode` varchar(128) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `stock` int(10) NOT NULL DEFAULT 0,
  `image` varchar(128) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `barcode`, `name`, `category_id`, `unit_id`, `price`, `stock`, `image`, `created`, `updated`) VALUES
(2, 'MM002', 'GB Full Wash', 5, 6, 110000, 893, NULL, '2020-11-01 20:13:47', '2020-11-16 13:02:19'),
(3, 'MM003', 'GB Red Honey', 5, 6, 125000, 1037, NULL, '2020-11-01 20:15:19', '2020-11-16 13:02:27'),
(4, 'MM004', 'GB Natural', 5, 6, 140000, 980, NULL, '2020-11-01 20:15:56', '2020-11-16 13:02:36'),
(5, 'MM005', 'Hot / Ice Tea', 6, 3, 5000, 147, 'item-201116-6b42ced29f.JPG', '2020-11-01 20:16:32', '2020-11-16 10:49:22'),
(6, 'MM006', 'V60 Full Wash', 1, 3, 20000, 500, NULL, '2020-11-01 20:19:43', NULL),
(7, 'MM007', 'V60 Red Honey', 1, 3, 25000, 0, NULL, '2020-11-01 20:20:10', NULL),
(8, 'MM008', 'V60 Natural', 1, 3, 25000, 999, 'item-201116-a27b90b7da.JPG', '2020-11-01 20:25:14', '2020-11-16 10:49:54'),
(9, 'MM009', 'V60 Nature', 1, 3, 25000, 0, NULL, '2020-11-01 20:27:51', NULL),
(10, 'MM010', 'Toebroek', 1, 3, 15000, 98, 'item-201116-b388b2435c.JPG', '2020-11-01 20:28:21', '2020-11-16 10:50:37'),
(11, 'MM011', 'Long Black', 1, 3, 20000, 0, NULL, '2020-11-01 20:28:47', NULL),
(12, 'MM012', 'Americano', 1, 3, 20000, 100, 'item-201116-fa3adac000.JPG', '2020-11-01 20:29:42', '2020-11-16 10:52:15'),
(13, 'MM013', 'Espresso Single', 1, 3, 10000, 900, 'item-201116-e0563b3d39.JPG', '2020-11-01 20:30:16', '2020-11-16 10:50:56'),
(14, 'MM014', 'Espresso Double', 1, 3, 15000, 0, NULL, '2020-11-01 20:30:42', NULL),
(15, 'MM015', 'Natural 250g', 4, 5, 90000, 0, 'item-201116-862f8e0545.JPG', '2020-11-01 20:33:20', '2020-11-16 10:52:39'),
(16, 'MM016', 'Natural 500g', 4, 5, 160000, 0, NULL, '2020-11-01 20:37:38', NULL),
(17, 'Mm017', 'Natural 1000g', 4, 5, 290000, 0, NULL, '2020-11-01 20:38:11', NULL),
(18, 'MM018', 'Nature 250g', 4, 5, 75000, 0, NULL, '2020-11-01 20:38:52', NULL),
(19, 'MM019', 'Nature 500g', 4, 5, 125000, 0, NULL, '2020-11-01 20:39:37', NULL),
(20, 'MM020', 'Nature 1000g', 4, 5, 225000, 0, NULL, '2020-11-01 20:40:16', NULL),
(21, 'MM021', 'Red Honey 250g', 4, 5, 80000, 0, NULL, '2020-11-01 20:41:07', NULL),
(22, 'MM022', 'Red Honey 500g', 4, 5, 135000, 0, NULL, '2020-11-01 20:41:39', NULL),
(23, 'MM023', 'Red Honey 1000g', 4, 5, 240000, 0, NULL, '2020-11-01 20:46:52', NULL),
(24, 'MM024', 'Full Wash 250g', 4, 5, 70000, 0, NULL, '2020-11-01 20:47:38', NULL),
(25, 'MM025', 'Full Wash 500g', 4, 5, 120000, 0, NULL, '2020-11-01 20:48:15', NULL),
(26, 'MM026', 'Full Wash 1000g', 4, 5, 210000, 0, NULL, '2020-11-01 20:48:48', NULL),
(27, 'MM027', 'Specialty Blend 250g', 4, 5, 75000, 0, NULL, '2020-11-01 20:50:04', NULL),
(28, 'MM028', 'Specialty Blend 500g', 4, 5, 125000, 0, NULL, '2020-11-01 20:50:43', NULL),
(29, 'MM029', 'Specialty Blend 1000g', 4, 5, 225000, 0, NULL, '2020-11-01 20:51:58', NULL),
(30, 'MM030', 'Premium Blend 250g', 4, 5, 60000, 0, NULL, '2020-11-01 20:54:14', NULL),
(31, 'MM031', 'Premium Blend 500g', 4, 5, 110000, 0, NULL, '2020-11-01 20:54:49', NULL),
(32, 'MM032', 'Premium Blend 1000g', 4, 5, 200000, 0, NULL, '2020-11-01 20:55:17', NULL),
(33, 'MM033', 'Cappucino', 3, 3, 20000, 0, NULL, '2020-11-01 20:56:03', NULL),
(34, 'MM034', 'Latte', 3, 3, 20000, 950, 'item-201116-441d484b23.JPG', '2020-11-01 20:56:25', '2020-11-16 10:53:01'),
(35, 'MM035', 'Hot / Ice Coffee Milk', 3, 3, 25000, 0, NULL, '2020-11-01 20:57:20', NULL),
(36, 'MM036', 'Fried Sausage', 2, 14, 15000, 0, 'item-201117-005d94a528.JPG', '2020-11-01 20:58:37', '2020-11-17 02:49:31'),
(37, 'MM037', 'French Fries', 2, 14, 10000, 0, 'item-201117-9fdf4ad62f.JPG', '2020-11-01 20:58:59', '2020-11-17 02:49:47'),
(38, 'MM038', 'Noodle', 2, 14, 7000, 0, 'item-201117-bdf8b3025a.JPG', '2020-11-01 21:00:29', '2020-11-17 02:50:22'),
(39, 'MM039', 'Noodle With Egg', 2, 14, 10000, 0, NULL, '2020-11-01 21:01:05', NULL),
(40, 'MM040', 'Fried Cassava', 2, 14, 10000, 0, NULL, '2020-11-01 21:01:33', NULL),
(41, 'MM001', 'GB Semi Wash', 5, 6, 105000, 842, 'item-201116-b075858a58.JPG', '2020-11-04 19:26:34', '2020-11-16 10:48:55'),
(42, 'MM041', 'Vanila Latte', 3, 3, 19000, 450, 'item-201116-4bea839bbb.JPG', '2020-11-04 20:32:34', '2020-11-16 10:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `kasir_id` int(11) NOT NULL,
  `invoice` varchar(64) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total_price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `final_price` int(11) NOT NULL,
  `cash` int(11) NOT NULL,
  `remaining` int(11) NOT NULL,
  `note` text NOT NULL,
  `no_meja` varchar(128) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`kasir_id`, `invoice`, `customer_id`, `total_price`, `discount`, `final_price`, `cash`, `remaining`, `note`, `no_meja`, `date`, `user_id`, `created`) VALUES
(27, 'MM2011100001', 2, 215000, 0, 215000, 220000, 5000, '', '', '2020-11-10', 1, '2020-11-10 13:34:21'),
(28, 'MM2011100002', 2, 8400000, 1000000, 7400000, 7500000, 100000, 'Lunas', '', '2020-11-10', 1, '2020-11-10 13:42:01'),
(29, 'MM2011130001', 2, 3920000, 1000000, 2920000, 3000000, 80000, 'Terimakasih Silahkan Kembali :)', '', '2020-11-13', 1, '2020-11-13 11:43:47'),
(31, 'MM2011130002', 2, 17325000, 0, 17325000, 20000000, 2675000, '', '', '2020-11-13', 1, '2020-11-13 20:58:04'),
(32, 'MM2011150001', 2, 630000, 0, 630000, 700000, 70000, '', '', '2020-11-15', 1, '2020-11-15 14:16:01'),
(33, 'MM2011160001', 0, 105000, 0, 105000, 110000, 5000, 'Lunas', '', '2020-11-16', 1, '2020-11-16 21:43:20'),
(34, 'MM2011160002', 2, 105000, 0, 105000, 120000, 15000, 'Lunas', '', '2020-11-16', 1, '2020-11-16 21:45:50'),
(35, 'MM2011170001', 2, 55000, 0, 55000, 100000, 45000, '', '', '2020-11-17', 5, '2020-11-17 10:23:50'),
(36, 'MM2012170001', 2, 230000, 0, 230000, 230000, 0, '', '', '2020-12-17', 1, '2020-12-17 09:34:05'),
(37, 'MM2012170002', 0, 105000, 10000, 95000, 100000, 5000, '', '', '2020-12-17', 1, '2020-12-17 10:00:24'),
(38, 'MM2012170003', 0, 1050000, 0, 1050000, 10000000, 8950000, '', '', '2020-12-17', 1, '2020-12-17 11:17:49'),
(39, 'MM2012170004', 0, 105000, 0, 105000, 200000, 95000, '', '', '2020-12-17', 1, '2020-12-17 11:25:42'),
(40, 'MM2012170005', 2, 105000, 0, 105000, 105000, 0, '', '', '2020-12-17', 1, '2020-12-17 16:19:03'),
(41, 'MM2012170006', 2, 210000, 0, 210000, 210000, 0, '', '01', '2020-12-17', 1, '2020-12-17 18:12:19'),
(42, 'MM2012170007', 2, 5500000, 0, 5500000, 5500000, 0, '', '01', '2020-12-17', 1, '2020-12-17 18:28:08'),
(43, 'MM2012170008', 2, 110000, 0, 110000, 110000, 0, '', 'MM20121701', '2020-12-17', 1, '2020-12-17 18:47:26'),
(44, 'MM2012170009', 2, 125000, 0, 125000, 125000, 0, '', '02', '2020-12-17', 1, '2020-12-17 18:47:59'),
(45, 'MM2012170010', 2, 1400000, 0, 1400000, 1500000, 100000, '', '20121702', '2020-12-17', 1, '2020-12-17 18:51:50'),
(46, 'MM2012170011', 2, 105000, 0, 105000, 105000, 0, '', 'MM20121702', '2020-12-17', 1, '2020-12-17 18:52:20'),
(47, 'MM2012170012', 2, 125000, 0, 125000, 125000, 0, '', '20121718', '2020-12-17', 1, '2020-12-17 19:30:30'),
(48, 'MM2012170013', 2, 110000, 0, 110000, 110000, 0, '', '03', '2020-12-17', 1, '2020-12-17 19:32:47'),
(49, 'MM2012170014', 2, 110000, 0, 110000, 110000, 0, '', 'MM2012170003', '2020-12-17', 1, '2020-12-17 19:33:30'),
(50, 'MM2012170015', 2, 105000, 0, 105000, 110000, 5000, '', 'MM2012170003', '2020-12-17', 1, '2020-12-17 19:34:10'),
(51, 'MM2012170016', 2, 105000, 0, 105000, 105000, 0, '', 'MM2012170003', '2020-12-17', 1, '2020-12-17 19:35:54'),
(52, 'MM2012170017', 2, 110000, 0, 110000, 110000, 0, '', 'MM2012170003', '2020-12-17', 1, '2020-12-17 19:36:51'),
(53, 'MM2012170018', 2, 5000, 0, 5000, 5000, 0, '', 'MM20121703', '2020-12-17', 1, '2020-12-17 19:40:26'),
(54, 'MM2012170019', 2, 105000, 0, 105000, 105000, 0, '', '04', '2020-12-17', 1, '2020-12-17 19:41:10'),
(55, 'MM2012170020', 2, 110000, 0, 110000, 110000, 0, '', '20121704', '2020-12-17', 1, '2020-12-17 19:41:34'),
(56, 'MM2012170021', 2, 125000, 0, 125000, 125000, 0, '', 'MM20121704', '2020-12-17', 1, '2020-12-17 19:41:53'),
(57, 'MM2012170022', 2, 110000, 0, 110000, 110000, 0, '', '01', '2020-12-17', 1, '2020-12-17 20:24:31'),
(58, 'MM2012170023', 2, 5000, 0, 5000, 5000, 0, '', '02', '2020-12-17', 1, '2020-12-17 20:24:54'),
(59, 'MM2012190001', 2, 115000, 0, 115000, 115000, 0, '', '01', '2020-12-19', 1, '2020-12-19 18:01:14');

--
-- Triggers `kasir`
--
DELIMITER $$
CREATE TRIGGER `del_detail` AFTER DELETE ON `kasir` FOR EACH ROW BEGIN
	DELETE FROM kasir_detail
    WHERE kasir_id = OLD.kasir_id;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kasir_detail`
--

CREATE TABLE `kasir_detail` (
  `detail_id` int(11) NOT NULL,
  `kasir_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(10) NOT NULL,
  `discount_item` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kasir_detail`
--

INSERT INTO `kasir_detail` (`detail_id`, `kasir_id`, `item_id`, `price`, `qty`, `discount_item`, `total`) VALUES
(32, 27, 41, 105000, 1, 0, 105000),
(33, 27, 2, 110000, 1, 0, 110000),
(34, 28, 2, 110000, 84, 10000, 8400000),
(35, 29, 41, 105000, 24, 0, 2520000),
(36, 29, 4, 140000, 10, 0, 1400000),
(38, 31, 41, 105000, 165, 0, 17325000),
(39, 32, 41, 105000, 6, 0, 630000),
(40, 33, 41, 105000, 1, 0, 105000),
(41, 34, 41, 105000, 1, 0, 105000),
(42, 35, 8, 25000, 1, 0, 25000),
(43, 35, 10, 15000, 2, 0, 30000),
(44, 36, 3, 125000, 1, 0, 125000),
(45, 36, 41, 105000, 1, 0, 105000),
(46, 37, 41, 105000, 1, 0, 105000),
(47, 38, 41, 105000, 10, 0, 1050000),
(48, 39, 41, 105000, 1, 0, 105000),
(49, 40, 41, 105000, 1, 0, 105000),
(50, 41, 41, 105000, 2, 0, 210000),
(51, 42, 2, 110000, 50, 0, 5500000),
(52, 43, 2, 110000, 1, 0, 110000),
(53, 44, 3, 125000, 1, 0, 125000),
(54, 45, 4, 140000, 10, 0, 1400000),
(55, 46, 41, 105000, 1, 0, 105000),
(56, 47, 3, 125000, 1, 0, 125000),
(57, 48, 2, 110000, 1, 0, 110000),
(58, 49, 2, 110000, 1, 0, 110000),
(59, 50, 41, 105000, 1, 0, 105000),
(60, 51, 41, 105000, 1, 0, 105000),
(61, 52, 2, 110000, 1, 0, 110000),
(62, 53, 5, 5000, 1, 0, 5000),
(63, 54, 41, 105000, 1, 0, 105000),
(64, 55, 2, 110000, 1, 0, 110000),
(65, 56, 3, 125000, 1, 0, 125000),
(66, 57, 2, 110000, 1, 0, 110000),
(67, 58, 5, 5000, 1, 0, 5000),
(68, 59, 2, 110000, 1, 0, 110000),
(69, 59, 5, 5000, 1, 0, 5000);

--
-- Triggers `kasir_detail`
--
DELIMITER $$
CREATE TRIGGER `stock_min` AFTER INSERT ON `kasir_detail` FOR EACH ROW BEGIN
	UPDATE item SET stock = stock - 		NEW.qty
    WHERE item_id = NEW.item_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `stock_return` AFTER DELETE ON `kasir_detail` FOR EACH ROW BEGIN
	UPDATE item SET stock = stock + 		OLD.qty
    WHERE item_id = OLD.item_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log_id` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `created_by` varchar(256) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`log_id`, `keterangan`, `created_by`, `created`) VALUES
(17, 'Stock Masuk | Item : 8 | Type : Masuk | Detail : 100 | Supplier :  | Qty : 100 | Tanggal : 2020-11-04', 'Grace Christian', '2020-11-05 05:49:34'),
(18, 'Stock Masuk | Item : 1 | Type : Masuk | Detail : Kopi Baru | Supplier : 2 | Qty : 100 | Tanggal : 2020-11-04', 'Grace Christian', '2020-11-05 05:51:53'),
(19, 'Stock Keluar | Item : 1 | Type : Keluar | Detail : Salah Masukin Stock | Qty : 100 | Tanggal : 2020-11-05', 'Grace Christian', '2020-11-05 06:37:46'),
(20, 'Stock Keluar | Item : 8 | Type : Keluar | Detail : Salah Masukin Stock | Qty : 100 | Tanggal : 2020-11-05', 'Grace Christian', '2020-11-05 06:39:11'),
(21, 'Stock Masuk | Item : 2 | Type : Masuk | Detail : Tambah stock | Supplier :  | Qty : 1000 | Tanggal : 2020-11-05', 'Grace Christian', '2020-11-05 06:41:20'),
(22, 'Stock Keluar | Item : 2 | Type : Keluar | Detail : Salah Masukin Stock | Qty : 1000 | Tanggal : 2020-11-05', 'Grace Christian', '2020-11-05 06:41:45'),
(23, 'Stock Keluar | Item : 41 | Type : Keluar | Detail : Tambah stock | Qty : 1000 | Tanggal : 2020-11-05', 'Grace Christian', '2020-11-05 07:26:52'),
(24, 'Stock Masuk | Item : 2 | Type : Masuk | Detail : Tambah stock | Supplier :  | Qty : 1000 | Tanggal : 2020-11-05', 'Grace Christian', '2020-11-05 07:33:19'),
(25, 'Stock Masuk | Item : 3 | Type : Masuk | Detail : Tambah stock | Supplier :  | Qty : 100 | Tanggal : 2020-11-05', 'Grace Christian', '2020-11-05 08:07:41'),
(26, 'Stock Keluar | Item : 3 | Type : Keluar | Detail : Salah Masukin Stock | Qty : 100 | Tanggal : 2020-11-05', 'Grace Christian', '2020-11-05 08:08:10'),
(27, 'Stock Masuk | Item : 41 | Type : Masuk | Detail : Tambah stock | Supplier : 2 | Qty : 1000 | Tanggal : 2020-11-05', 'Grace Christian', '2020-11-05 08:09:27'),
(28, 'Stock Keluar | Item : 41 | Type : Keluar | Detail : Salah Masukin Stock | Qty : 1000 | Tanggal : 2020-11-05', 'Grace Christian', '2020-11-05 08:09:53'),
(29, 'Stock Masuk | Item : 41 | Type : Masuk | Detail : Tambah stock | Supplier : 2 | Qty : -100 | Tanggal : 2020-11-05', 'Grace Christian', '2020-11-05 08:11:22'),
(30, 'Tambah User | Nama : Joko | Username : admin3 | Alamat : Bandung | Level : 1', 'Grace Christian', '2020-11-05 08:14:57'),
(31, 'Tambah Supplier | Nama : asdasda | No Telpon : 514654465 | Alamat : asdasdadadw | Deskripsi : ', 'Grace Christian', '2020-11-05 08:22:41'),
(32, 'Tambah Supplier | Nama : asdasdaddakdhadha | No Telpon : 414444444 | Alamat : asdasdw dawee  | Deskripsi : ', 'Grace Christian', '2020-11-05 08:23:57'),
(33, 'Ubah User | Nama : Joko Sasongko | Username : admin3 | Alamat : Bandung | Level : 1', 'Grace Christian', '2020-11-05 21:42:46'),
(34, 'Stock Masuk | Item : 41 | Type : Masuk | Detail : Tambah stock | Supplier : 2 | Qty : 100 | Tanggal : 2020-11-05', 'Grace Christian', '2020-11-05 21:46:20'),
(35, 'Stock Keluar | Item : 41 | Type : Keluar | Detail : Rusak | Qty : 100 | Tanggal : 2020-11-05', 'Grace Christian', '2020-11-05 21:46:48'),
(36, 'Tambah User | Nama : David | Username : kasir3 | Alamat : asdasdasd\r\n | Level : 2', 'Grace Christian', '2020-11-06 00:27:02'),
(37, 'Ubah User | Nama : David | Username : kasir3 | Alamat : asdasdasd\r\n | Level : 2', 'Grace Christian', '2020-11-05 12:43:34'),
(38, 'Hapus Unit | Nama : Porsi ', 'Grace Christian', '2020-11-05 15:50:15'),
(39, 'Tambah Supplier | Nama : sadasd | No Telpon : 54165445 | Alamat : jakskadsas | Deskripsi : asdasdsad', 'Grace Christian', '2020-11-09 20:28:41'),
(40, 'Stock Masuk | Item : 2 | Type : Masuk | Detail : Tambah stock | Supplier : 3 | Qty : 100 | Tanggal : 2020-11-09', 'Grace Christian', '2020-11-09 20:30:15'),
(41, 'Stock Masuk | Item : 41 | Type : Masuk | Detail : Tambah stock | Supplier : 1 | Qty : 1000 | Tanggal : 2020-11-10', 'admin', '2020-11-10 13:26:58'),
(42, 'Stock Masuk | Item : 3 | Type : Masuk | Detail : Tambah stock | Supplier : 1 | Qty : 1000 | Tanggal : 2020-11-10', 'admin', '2020-11-10 13:27:18'),
(43, 'Stock Masuk | Item : 4 | Type : Masuk | Detail : Tambah stock | Supplier : 1 | Qty : 1000 | Tanggal : 2020-11-10', 'admin', '2020-11-10 13:27:30'),
(44, 'Stock Masuk | Item : 8 | Type : Masuk | Detail : Tambah stock | Supplier : 1 | Qty : 1000 | Tanggal : 2020-11-10', 'admin', '2020-11-10 13:27:51'),
(45, 'Stock Masuk | Item : 13 | Type : Masuk | Detail : Tambah stock | Supplier : 1 | Qty : 1000 | Tanggal : 2020-11-10', 'admin', '2020-11-10 13:28:08'),
(46, 'Stock Masuk | Item : 34 | Type : Masuk | Detail : Tambah stock | Supplier : 1 | Qty : 1000 | Tanggal : 2020-11-10', 'admin', '2020-11-10 13:28:45'),
(47, 'Stock Keluar | Item : 2 | Type : Keluar | Detail : Barang Rusak | Qty : 50 | Tanggal : 2020-11-13', 'admin', '2020-11-13 09:29:54'),
(48, 'Stock Keluar | Item : 3 | Type : Keluar | Detail : Barang Rusak | Qty : 25 | Tanggal : 2020-11-13', 'admin', '2020-11-13 09:30:08'),
(49, 'Stock Keluar | Item : 13 | Type : Keluar | Detail : Barang Rusak | Qty : 100 | Tanggal : 2020-11-13', 'admin', '2020-11-13 09:30:37'),
(50, 'Tambah Supplier | Nama : Bp. Amir Udin | No Telpon : 085546951542 | Alamat : Pangalengan | Deskripsi : Pemasok Green Bean Natural', 'admin', '2020-11-13 10:28:00'),
(51, 'Tambah Supplier | Nama : asdasd | No Telpon : 456456 | Alamat : dsfasff | Deskripsi : asfasfawda', 'admin', '2020-11-13 10:28:30'),
(52, 'ubah Supplier | Nama : asdasd | No Telpon : 45645621313 | Alamat : dsfasff | Deskripsi : asfasfawda', 'admin', '2020-11-13 10:28:39'),
(75, 'Stock Masuk | Item : 12 | Type : Masuk | Detail : Tambah Stock | Supplier : 1 | Qty : 100 | Tanggal : 2020-11-16', 'admin', '2020-11-16 09:02:28'),
(76, 'Stock Masuk | Item : 6 | Type : Masuk | Detail : Tambah Stock | Supplier : 1 | Qty : 500 | Tanggal : 2020-11-16', 'admin', '2020-11-16 09:02:50'),
(77, 'Stock Masuk | Item : 42 | Type : Masuk | Detail : Tambah Stock | Supplier : 1 | Qty : 450 | Tanggal : 2020-11-16', 'admin', '2020-11-16 09:03:11'),
(78, 'Stock Keluar | Item : 41 | Type : Keluar | Detail : Barang Rusak | Qty : 50 | Tanggal : 2020-11-16', 'admin', '2020-11-16 09:03:46'),
(79, 'Tambah Supplier | Nama : Joko Santoni | No Telpon : 088815462551 | Alamat : Jl. Sukamenak No 15  | Deskripsi : Pemasok Grean Bean Natural', 'admin', '2020-11-16 17:16:03'),
(80, 'Ubah Supplier | Nama : Amir Udin | No Telpon : 085546951542 | Alamat : Pangalengan | Deskripsi : Pemasok Green Bean Natural', 'admin', '2020-11-16 17:16:26'),
(81, 'Ubah Supplier | Nama : Amir Udin | No Telpon : 085546951542 | Alamat : Pangalengan | Deskripsi : Pemasok Green Bean Full Wash\r\n', 'admin', '2020-11-16 17:17:54'),
(89, 'Tambah Supplier | Nama : Yulianti | No Telpon : 088879485563 | Alamat : Jl. Pangalengan ( Depan Polres ) | Deskripsi : Toko Frozen Food', 'admin', '2020-11-16 18:56:35'),
(90, 'Ubah Supplier | Nama : Joko Santoni | No Telpon : 088815462551 | Alamat : Jl. Sukamenak No 15  | Deskripsi : Pemasok Grean Bean Natural', 'admin', '2020-11-16 18:58:16'),
(91, 'Ubah Customer | Nama : Tulus Harry | No Telpon : 088845615452 | Alamat : Bandung | Jenis Kelamin : L', 'admin', '2020-11-16 18:59:42'),
(92, 'Tambah Kategori | Nama Kategori : Testing ', 'admin', '2020-11-16 19:00:30'),
(93, 'Ubah Kategori | Nama Kategori : Test ', 'admin', '2020-11-16 19:01:23'),
(94, 'Hapus Kategori | Nama Kategori : Test ', 'admin', '2020-11-16 19:01:27'),
(95, 'Tambah Satuan | Nama Satuan : Testing ', 'admin', '2020-11-16 19:01:39'),
(96, 'Ubah Satuan | Nama Satuan : Test ', 'admin', '2020-11-16 19:01:45'),
(97, 'Hapus Satuan | Nama Satuan : Test ', 'admin', '2020-11-16 19:01:49'),
(98, 'Tambah Satuan | Nama Satuan : Porsi ', 'admin', '2020-11-16 19:01:58'),
(99, 'Ubah Item | Kode Item : MM002 | Nama Item : GB Full Wash | Kategory : 5 | Satuan : 6 | Harga : 110000 | Gambar Item : ', 'admin', '2020-11-16 19:02:19'),
(100, 'Ubah Item | Kode Item : MM003 | Nama Item : GB Red Honey | Kategory : 5 | Satuan : 6 | Harga : 125000 | Gambar Item : ', 'admin', '2020-11-16 19:02:27'),
(101, 'Ubah Item | Kode Item : MM004 | Nama Item : GB Natural | Kategory : 5 | Satuan : 6 | Harga : 140000 | Gambar Item : ', 'admin', '2020-11-16 19:02:36'),
(102, 'Tambah Satuan | Nama Satuan : ss ', 'admin', '2020-11-16 19:32:48'),
(103, 'Hapus Satuan | Nama Satuan : ss ', 'admin', '2020-11-16 19:32:53'),
(104, 'Stock Masuk | Item : 10 | Type : Masuk | Detail : Tambah Stock | Supplier : 1 | Qty : 100 | Tanggal : 2020-11-16', 'admin', '2020-11-16 19:34:27'),
(105, 'Tambah Item | Kode Item : MM099 | Nama Item : Testing | Kategory : 1 | Satuan : 3 | Harga : 1000 | Gambar Item : ', 'admin', '2020-11-16 19:46:10'),
(106, 'Hapus Item | Kode Item : MM099 | Nama Item : Testing | Kategory : 1 | Satuan : 3 | Harga : 1000 | Gambar Item : ', 'admin', '2020-11-16 19:46:18'),
(107, 'Tambah Kategori | Nama Kategori : asdasdw ', 'admin', '2020-11-16 20:13:50'),
(108, 'Tambah Item | Kode Item : MM100 | Nama Item : Testing Lagi | Kategory : 12 | Satuan : 14 | Harga : 100000 | Gambar Item : ', 'admin', '2020-11-16 21:28:44'),
(109, 'Stock Masuk | Item : 49 | Type : Masuk | Detail : Tambah Stock | Supplier : 8 | Qty : 1000 | Tanggal : 2020-11-16', 'admin', '2020-11-16 21:29:13'),
(110, 'Hapus Supplier | Nama : Yulianti | No Telpon : 088879485563 | Alamat : Jl. Pangalengan ( Depan Polres ) | Deskripsi : Toko Frozen Food', 'admin', '2020-11-16 21:29:20'),
(111, 'Hapus Item | Kode Item : MM100 | Nama Item : Testing Lagi | Kategory : 12 | Satuan : 14 | Harga : 100000 | Gambar Item : ', 'admin', '2020-11-16 21:29:54'),
(112, 'Stock Masuk | Item : 7 | Type : Masuk | Detail : Tambah Stock | Supplier : 4 | Qty : 100 | Tanggal : 2020-11-16', 'admin', '2020-11-16 21:35:08'),
(113, 'Hapus Supplier | Nama : Joko Santoni | No Telpon : 088815462551 | Alamat : Jl. Sukamenak No 15  | Deskripsi : Pemasok Grean Bean Natural', 'admin', '2020-11-16 21:35:18'),
(114, 'Tambah Item | Kode Item : MM111 | Nama Item : asduygawh | Kategory : 12 | Satuan : 5 | Harga : 100000 | Gambar Item : ', 'admin', '2020-11-16 22:11:28'),
(115, 'Hapus Kategori | Nama Kategori : asdasdw ', 'admin', '2020-11-16 22:38:38'),
(116, 'Tambah Kategori | Nama Kategori : asdadwdasdwdasdw ', 'admin', '2020-11-16 22:39:48'),
(117, 'Tambah Item | Kode Item : MM783 | Nama Item : Testing | Kategory : 13 | Satuan : 5 | Harga : 124124 | Gambar Item : ', 'admin', '2020-11-16 22:40:09'),
(118, 'Hapus Kategori | Nama Kategori : asdadwdasdwdasdw ', 'admin', '2020-11-16 22:40:17'),
(119, 'Tambah Kategori | Nama Kategori : saedwavgarfas ', 'admin', '2020-11-16 22:41:12'),
(120, 'Tambah Item | Kode Item : MM7438 | Nama Item : TES | Kategory : 14 | Satuan : 4 | Harga : 231123123 | Gambar Item : ', 'admin', '2020-11-16 22:41:45'),
(121, 'Hapus Kategori | Nama Kategori : saedwavgarfas ', 'admin', '2020-11-16 22:41:50'),
(122, 'Tambah Kategori | Nama Kategori : sadasdsadwdasd ', 'admin', '2020-11-17 08:22:34'),
(123, 'Tambah Item | Kode Item : MM987 | Nama Item : wrws | Kategory : 15 | Satuan : 3 | Harga : 123414 | Gambar Item : ', 'admin', '2020-11-17 08:22:55'),
(124, 'Hapus Kategori | Nama Kategori : sadasdsadwdasd ', 'admin', '2020-11-17 08:23:03'),
(125, 'Tambah User | Nama : Farhan Naufal | Username : kasir | Alamat : Cianjur | Level : 2', 'admin', '2020-11-17 08:36:45'),
(126, 'Tambah User | Nama : Grace Christian | Username : admin2 | Alamat : Medan | Level : 1', 'admin', '2020-11-17 08:39:52'),
(127, 'Tambah Kategori | Nama Kategori : Testing ', 'admin', '2020-11-17 08:44:58'),
(128, 'Tambah Satuan | Nama Satuan : Test ', 'admin', '2020-11-17 08:45:05'),
(129, 'Tambah Item | Kode Item : TESTING009 | Nama Item : Testing Food | Kategory : 16 | Satuan : 16 | Harga : 2131231 | Gambar Item : ', 'admin', '2020-11-17 08:45:29'),
(130, 'Hapus Kategori | Nama Kategori : Testing ', 'admin', '2020-11-17 08:45:38'),
(131, 'Hapus Satuan | Nama Satuan : Test ', 'admin', '2020-11-17 08:45:43'),
(132, 'Ubah Item | Kode Item : MM036 | Nama Item : Fried Sausage | Kategory : 2 | Satuan : 14 | Harga : 15000 | Gambar Item : item-201117-005d94a528.JPG', 'admin', '2020-11-17 08:49:31'),
(133, 'Ubah Item | Kode Item : MM037 | Nama Item : French Fries | Kategory : 2 | Satuan : 14 | Harga : 10000 | Gambar Item : item-201117-9fdf4ad62f.JPG', 'admin', '2020-11-17 08:49:47'),
(134, 'Ubah Item | Kode Item : MM038 | Nama Item : Noodle | Kategory : 2 | Satuan : 14 | Harga : 7000 | Gambar Item : item-201117-bdf8b3025a.JPG', 'admin', '2020-11-17 08:50:22'),
(135, 'Tambah Customer | Nama : Testing | No Telpon : 08852754574 | Alamat : test | Jenis Kelamin : L', 'admin', '2020-11-17 08:52:53'),
(136, 'Ubah Customer | Nama : Testing | No Telpon : 08852754574 | Alamat : testing tempat | Jenis Kelamin : L', 'admin', '2020-11-17 08:53:02'),
(137, 'Hapus Customer | Nama : Testing | No Telpon : 08852754574 | Alamat : testing tempat | Jenis Kelamin : L', 'admin', '2020-11-17 08:53:06'),
(138, 'Tambah Supplier | Nama : Joni Sasongko | No Telpon : 088878456448 | Alamat : Jl. Pangalengan No. 145 | Deskripsi : Pemasok Green Bean Red Honey', 'admin', '2020-11-17 08:54:23'),
(139, 'Stock Masuk | Item : 3 | Type : Masuk | Detail : Tambah Stock | Supplier : 9 | Qty : 100 | Tanggal : 2020-11-17', 'admin', '2020-11-17 08:54:54'),
(140, 'Stock Keluar | Item : 3 | Type : Keluar | Detail : Barang Rusak | Qty : 50 | Tanggal : 2020-11-17', 'admin', '2020-11-17 08:55:16'),
(141, 'Tambah Supplier | Nama : Laswi | No Telpon : 088451255 | Alamat : Jl. Ciputat | Deskripsi : Pemasok Green Bean Natural', 'admin', '2020-11-17 09:32:31'),
(142, 'Ubah Supplier | Nama : Laswi | No Telpon : 08881523 | Alamat : Jl. Ciputat | Deskripsi : Pemasok Green Bean Natural', 'admin', '2020-11-17 09:35:32'),
(143, 'Ubah Supplier | Nama : Laswi | No Telpon : 0 | Alamat : Jl. Ciputat | Deskripsi : Pemasok Green Bean Natural', 'admin', '2020-11-17 09:35:41'),
(144, 'Ubah Supplier | Nama : Laswi | No Telpon : 0850457455 | Alamat : Jl. Ciputat | Deskripsi : Pemasok Green Bean Natural', 'admin', '2020-11-17 09:36:29'),
(145, 'Tambah Customer | Nama : Dodo | No Telpon : 0850457455 | Alamat : Pangalengan | Jenis Kelamin : L', 'Farhan Naufal', '2020-11-17 10:29:54'),
(146, 'Stock Masuk | Item : 41 | Type : Masuk | Detail : Tambah Stock | Supplier :  | Qty : 10 | Tanggal : 2020-12-17', 'admin', '2020-12-17 09:45:17'),
(147, 'Stock Masuk | Item : 41 | Type : Masuk | Detail : Tambah Stock | Supplier :  | Qty : 100 | Tanggal : 2020-12-17', 'admin', '2020-12-17 09:45:50'),
(148, 'Stock Masuk | Item : 3 | Type : Masuk | Detail : Tambah Stock | Qty : 16 | Tanggal : 2020-12-17', 'admin', '2020-12-17 09:51:19'),
(149, 'Hapus Customer | Nama : Syah Ra | No Telpon : 088457429954 | Alamat : Purwakarta | Jenis Kelamin : P', 'admin', '2020-12-17 11:09:33');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `type` enum('in','out') NOT NULL,
  `detail` varchar(256) NOT NULL,
  `qty` int(10) NOT NULL,
  `date` date NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_id`, `item_id`, `type`, `detail`, `qty`, `date`, `created`, `user_id`) VALUES
(30, 41, 'in', 'Tambah stock', 1000, '2020-11-10', '2020-11-10 13:26:58', 1),
(31, 3, 'in', 'Tambah stock', 1000, '2020-11-10', '2020-11-10 13:27:18', 1),
(32, 4, 'in', 'Tambah stock', 1000, '2020-11-10', '2020-11-10 13:27:30', 1),
(33, 8, 'in', 'Tambah stock', 1000, '2020-11-10', '2020-11-10 13:27:51', 1),
(34, 13, 'in', 'Tambah stock', 1000, '2020-11-10', '2020-11-10 13:28:08', 1),
(35, 34, 'in', 'Tambah stock', 1000, '2020-11-10', '2020-11-10 13:28:45', 1),
(36, 2, 'out', 'Barang Rusak', 50, '2020-11-13', '2020-11-13 09:29:54', 1),
(37, 3, 'out', 'Barang Rusak', 25, '2020-11-13', '2020-11-13 09:30:08', 1),
(38, 13, 'out', 'Barang Rusak', 100, '2020-11-13', '2020-11-13 09:30:37', 1),
(39, 5, 'in', 'Tambah Stock', 150, '2020-11-13', '2020-11-13 11:41:00', 1),
(40, 34, 'out', 'Barang Rusak', 50, '2020-11-13', '2020-11-13 11:41:41', 1),
(42, 12, 'in', 'Tambah Stock', 100, '2020-11-16', '2020-11-16 09:02:28', 1),
(43, 6, 'in', 'Tambah Stock', 500, '2020-11-16', '2020-11-16 09:02:50', 1),
(44, 42, 'in', 'Tambah Stock', 450, '2020-11-16', '2020-11-16 09:03:11', 1),
(45, 41, 'out', 'Barang Rusak', 50, '2020-11-16', '2020-11-16 09:03:46', 1),
(46, 10, 'in', 'Tambah Stock', 100, '2020-11-16', '2020-11-16 19:34:27', 1),
(47, 49, 'in', 'Tambah Stock', 1000, '2020-11-16', '2020-11-16 21:29:13', 1),
(49, 3, 'in', 'Tambah Stock', 100, '2020-11-17', '2020-11-17 08:54:54', 1),
(50, 3, 'out', 'Barang Rusak', 50, '2020-11-17', '2020-11-17 08:55:15', 1),
(51, 41, 'in', 'Tambah Stock', 10, '2020-12-17', '2020-12-17 09:45:17', 1),
(52, 41, 'in', 'Tambah Stock', 100, '2020-12-17', '2020-12-17 09:45:49', 1),
(53, 3, 'in', 'Tambah Stock', 16, '2020-12-17', '2020-12-17 09:51:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unit_id`, `name`, `created`, `updated`) VALUES
(3, 'Cup', '0000-00-00 00:00:00', NULL),
(4, 'Bag', '0000-00-00 00:00:00', NULL),
(5, 'Gram', '0000-00-00 00:00:00', NULL),
(6, 'Kilogram', '0000-00-00 00:00:00', NULL),
(14, 'Porsi', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `name` varchar(128) NOT NULL,
  `address` varchar(256) DEFAULT NULL,
  `level` int(1) NOT NULL COMMENT '1:admin,2:kasir'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `name`, `address`, `level`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin', '-', 1),
(5, 'kasir', '8691e4fc53b99da544ce86e22acba62d13352eff', 'Farhan Naufal', 'Cianjur', 2),
(6, 'admin2', '315f166c5aca63a157f7d41007675cb44a948b33', 'Grace Christian', 'Medan', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`kasir_id`);

--
-- Indexes for table `kasir_detail`
--
ALTER TABLE `kasir_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `kasir`
--
ALTER TABLE `kasir`
  MODIFY `kasir_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `kasir_detail`
--
ALTER TABLE `kasir_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
