-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2024 at 04:32 AM
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
-- Database: `ujikom2_laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(9) NOT NULL,
  `customer_name` varchar(55) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `customer_name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(7, 'anissa', '0838', 'jl kidul 12', '2024-12-03 02:37:42', '2024-12-03 02:37:42'),
(8, 'si doel', '0896', 'jl jakarte', '2024-12-03 02:45:16', '2024-12-03 02:45:16');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `nama_level` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `nama_level`, `created_at`, `updated_at`) VALUES
(7, 'paket hemat', '2024-11-15 02:07:33', '2024-12-03 02:09:30'),
(10, 'murah meriah', '2024-12-03 01:24:06', '2024-12-03 01:24:06');

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id` int(11) NOT NULL,
  `nama_paket` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id`, `nama_paket`, `harga`, `deskripsi`, `created_at`, `updated_at`) VALUES
(3, 'cuci besar paket hemat', 7000, 'karpet, mantel dan sprei my love ', '2024-11-15 06:43:25', '2024-12-03 02:07:07'),
(4, 'paket hemat', 5000, 'cuci dan gosok', '2024-12-02 09:26:05', '2024-12-03 02:08:04'),
(5, 'paket murah meriah', 5000, 'gosok', '2024-12-03 01:25:57', '2024-12-03 01:25:57'),
(6, ' paket hemat', 4500, 'cuci', '2024-12-03 02:39:32', '2024-12-03 02:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `trans_laundry_pickup`
--

CREATE TABLE `trans_laundry_pickup` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `pickup_date` date NOT NULL,
  `pickup_pay` double(10,2) NOT NULL,
  `pickup_change` double(10,2) NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trans_laundry_pickup`
--

INSERT INTO `trans_laundry_pickup` (`id`, `id_customer`, `id_order`, `pickup_date`, `pickup_pay`, `pickup_change`, `note`, `created_at`, `updated_at`) VALUES
(6, 4, 13, '2024-12-02', 20000.00, 9000.00, '', '2024-12-02 09:15:11', '2024-12-02 09:15:11'),
(7, 1, 14, '2024-12-02', 30000.00, 8000.00, '', '2024-12-02 09:15:57', '2024-12-02 09:15:57'),
(8, 1, 15, '2024-12-02', 50000.00, 28000.00, '', '2024-12-02 09:22:11', '2024-12-02 09:22:11'),
(9, 1, 16, '2024-12-03', 20000.00, 6000.00, '', '2024-12-03 00:55:23', '2024-12-03 00:55:23'),
(10, 5, 17, '2024-12-03', 50000.00, 22000.00, '', '2024-12-03 02:40:57', '2024-12-03 02:40:57'),
(11, 7, 18, '2024-12-03', 20000.00, 10500.00, '', '2024-12-03 02:42:08', '2024-12-03 02:42:08'),
(12, 5, 19, '2024-12-03', 20000.00, 6000.00, '', '2024-12-03 02:43:16', '2024-12-03 02:43:16'),
(13, 8, 20, '2024-12-03', 0.00, 0.00, '', '2024-12-03 02:46:03', '2024-12-03 02:46:03');

-- --------------------------------------------------------

--
-- Table structure for table `trans_order`
--

CREATE TABLE `trans_order` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `no_transaksi` varchar(50) NOT NULL,
  `tanggal_laundry` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trans_order`
--

INSERT INTO `trans_order` (`id`, `id_customer`, `no_transaksi`, `tanggal_laundry`, `status`, `created_at`, `updated_at`) VALUES
(17, 5, '#INV03122400017', '2024-12-23 00:00:00', 1, '2024-12-03 00:57:30', '2024-12-03 02:40:57'),
(18, 7, '#INV03122400018', '2024-12-07 00:00:00', 1, '2024-12-03 02:41:50', '2024-12-03 02:42:08'),
(19, 5, '#INV03122400019', '2024-12-28 00:00:00', 1, '2024-12-03 02:43:00', '2024-12-03 02:43:16'),
(21, 8, '#INV03122400020', '2025-01-04 00:00:00', 0, '2024-12-03 02:46:35', '2024-12-03 02:46:35');

-- --------------------------------------------------------

--
-- Table structure for table `trans_order_detail`
--

CREATE TABLE `trans_order_detail` (
  `id` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `catatan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trans_order_detail`
--

INSERT INTO `trans_order_detail` (`id`, `id_order`, `id_paket`, `qty`, `subtotal`, `catatan`, `created_at`, `updated_at`) VALUES
(18, 13, 2, 1, 4000, '', '2024-12-02 09:14:50', '2024-12-02 09:14:50'),
(19, 13, 3, 1, 7000, '', '2024-12-02 09:14:50', '2024-12-02 09:14:50'),
(20, 14, 3, 2, 14000, '', '2024-12-02 09:15:40', '2024-12-02 09:15:40'),
(21, 14, 2, 2, 8000, '', '2024-12-02 09:15:40', '2024-12-02 09:15:40'),
(22, 15, 2, 2, 8000, '', '2024-12-02 09:21:58', '2024-12-02 09:21:58'),
(23, 15, 3, 2, 14000, '', '2024-12-02 09:21:58', '2024-12-02 09:21:58'),
(24, 16, 3, 1, 7000, '', '2024-12-03 00:55:09', '2024-12-03 00:55:09'),
(25, 16, 3, 1, 7000, '', '2024-12-03 00:55:09', '2024-12-03 00:55:09'),
(26, 17, 3, 2, 14000, '', '2024-12-03 00:57:30', '2024-12-03 00:57:30'),
(27, 17, 3, 2, 14000, '', '2024-12-03 00:57:30', '2024-12-03 00:57:30'),
(28, 18, 6, 1, 4500, '', '2024-12-03 02:41:50', '2024-12-03 02:41:50'),
(29, 18, 4, 1, 5000, '', '2024-12-03 02:41:50', '2024-12-03 02:41:50'),
(30, 19, 3, 1, 7000, '', '2024-12-03 02:43:00', '2024-12-03 02:43:00'),
(31, 19, 3, 1, 7000, '', '2024-12-03 02:43:00', '2024-12-03 02:43:00'),
(32, 20, 3, 2, 14000, '', '2024-12-03 02:45:52', '2024-12-03 02:45:52'),
(33, 20, 3, 2, 14000, '', '2024-12-03 02:45:52', '2024-12-03 02:45:52'),
(34, 21, 3, 1, 7000, '', '2024-12-03 02:46:35', '2024-12-03 02:46:35'),
(35, 21, 3, 1, 7000, '', '2024-12-03 02:46:35', '2024-12-03 02:46:35');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `id_level`, `nama`, `email`, `username`, `password`, `created_at`, `updated_at`) VALUES
(30, 10, 'operator', 'test913@example.com', 'ridwan00', '852', '2024-12-03 02:09:57', '2024-12-03 02:15:03'),
(31, 10, 'Administrator ', 'tes0@example.com', '', '', '2024-12-03 02:14:31', '2024-12-03 02:14:31'),
(32, 7, 'pimpinan', 'admin@gmail.com', 'admin12', '963.', '2024-12-03 02:15:32', '2024-12-03 02:15:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trans_laundry_pickup`
--
ALTER TABLE `trans_laundry_pickup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trans_order`
--
ALTER TABLE `trans_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trans_order_detail`
--
ALTER TABLE `trans_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_ibfk_1` (`id_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `trans_laundry_pickup`
--
ALTER TABLE `trans_laundry_pickup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `trans_order`
--
ALTER TABLE `trans_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `trans_order_detail`
--
ALTER TABLE `trans_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
