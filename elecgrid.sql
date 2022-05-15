-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2022 at 02:45 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elecgrid`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `bill_id` int(11) NOT NULL,
  `bill_no` varchar(255) NOT NULL,
  `bill_desc` varchar(255) NOT NULL,
  `bill_type` varchar(255) NOT NULL,
  `unit` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `curr_date` date NOT NULL DEFAULT current_timestamp(),
  `update_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`bill_id`, `bill_no`, `bill_desc`, `bill_type`, `unit`, `cus_id`, `curr_date`, `update_date`) VALUES
(1, '0001', 'Red Notice', 'a', 25, 1, '2022-04-15', '2022-05-15'),
(2, '0002', 'Bill', 'b', 24, 12, '2022-04-15', '2022-05-15');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cus_id` int(11) NOT NULL,
  `cus_name` varchar(255) NOT NULL,
  `cus_mobile` varchar(255) NOT NULL,
  `cus_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cus_id`, `cus_name`, `cus_mobile`, `cus_email`) VALUES
(1, 'john', '0112327747', 'john@gmail.com'),
(12, 'Jane', '0710432425', 'frompostmanupdate@gmail.com');

-- --------------------------------------------------------


--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `cus_id_fk` (`cus_id`);


--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;


--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `cus_id_fk_2` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON DELETE CASCADE ON UPDATE CASCADE;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
