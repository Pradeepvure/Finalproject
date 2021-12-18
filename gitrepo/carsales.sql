-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2021 at 08:50 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carsales`
--
CREATE DATABASE IF NOT EXISTS `carsales` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `carsales`;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `price` int(11) NOT NULL,
  `specifications` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `name`, `price`, `specifications`) VALUES
(2, 'AUDI', 14000000, 'Business'),
(3, 'Farari', 2000000, 'super'),
(5, 'DataX', 2000, 'sdfff');

--
-- Triggers `cars`
--
DROP TRIGGER IF EXISTS `price_sum`;
DELIMITER $$
CREATE TRIGGER `price_sum` BEFORE INSERT ON `cars` FOR EACH ROW SET @sum = @sum + NEW.price
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(4) NOT NULL,
  `name` varchar(128) NOT NULL,
  `mobile` varchar(56) NOT NULL,
  `addr` varchar(256) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `mobile`, `addr`, `status`) VALUES
(1, 'XYZ', '97463210', 'sdasdadfsdfsdfgdfgdfg', '1'),
(2, 'gfh', '9874563210', 'dfsdfsdfsdfsdf', '1'),
(3, 'XYZ', '97463210', 'sdasdadfsdfsdfgdfgdfg', '1'),
(4, 'gfh', '9874563210', 'dfsdfsdfsdfsdf', '1'),
(5, 'dsds', '97463210', 'dsdsda', '1');

-- --------------------------------------------------------

--
-- Stand-in structure for view `customerview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `customerview`;
CREATE TABLE `customerview` (
`id` int(4)
,`name` varchar(128)
,`mobile` varchar(56)
,`addr` varchar(256)
,`status` enum('0','1')
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `orgid` int(11) NOT NULL,
  `custid` int(11) NOT NULL,
  `delievery_status` int(4) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `orgid`, `custid`, `delievery_status`, `total`) VALUES
(1, 2, 2, 2, 140000),
(2, 2, 2, 1, 2400000);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `ordid` int(11) NOT NULL,
  `car` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `ordid`, `car`) VALUES
(1, 1, 2),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `org`
--

DROP TABLE IF EXISTS `org`;
CREATE TABLE `org` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `location` int(4) NOT NULL,
  `addr` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `org`
--

INSERT INTO `org` (`id`, `name`, `location`, `addr`) VALUES
(1, 'tstesss', 1, 'dfasdfasdfasdfasdf'),
(2, 'test2', 1, 'qwerty');

-- --------------------------------------------------------

--
-- Table structure for table `org_emp`
--

DROP TABLE IF EXISTS `org_emp`;
CREATE TABLE `org_emp` (
  `id` int(11) NOT NULL,
  `name` varchar(126) NOT NULL,
  `orgid` int(11) NOT NULL,
  `contactnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `org_emp`
--

INSERT INTO `org_emp` (`id`, `name`, `orgid`, `contactnum`) VALUES
(1, 'XNAME', 1, 7894563),
(2, 'YNAME', 2, 78459632);

-- --------------------------------------------------------

--
-- Stand-in structure for view `sampleview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `sampleview`;
CREATE TABLE `sampleview` (
`id` int(11)
,`name` varchar(128)
,`price` int(11)
,`specifications` text
);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(4) NOT NULL,
  `name` varchar(128) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`, `status`) VALUES
(1, 'Pending', '1'),
(2, 'Delievered', '1');

-- --------------------------------------------------------

--
-- Structure for view `customerview`
--
DROP TABLE IF EXISTS `customerview`;

DROP VIEW IF EXISTS `customerview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customerview`  AS SELECT `customer`.`id` AS `id`, `customer`.`name` AS `name`, `customer`.`mobile` AS `mobile`, `customer`.`addr` AS `addr`, `customer`.`status` AS `status` FROM `customer` WHERE `customer`.`name` = 'gfh' ;

-- --------------------------------------------------------

--
-- Structure for view `sampleview`
--
DROP TABLE IF EXISTS `sampleview`;

DROP VIEW IF EXISTS `sampleview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sampleview`  AS SELECT `cars`.`id` AS `id`, `cars`.`name` AS `name`, `cars`.`price` AS `price`, `cars`.`specifications` AS `specifications` FROM `cars` WHERE `cars`.`name` = 'Audi' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orgid` (`orgid`),
  ADD KEY `custid` (`custid`),
  ADD KEY `delievery_status` (`delievery_status`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordid` (`ordid`),
  ADD KEY `car` (`car`);

--
-- Indexes for table `org`
--
ALTER TABLE `org`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `org_emp`
--
ALTER TABLE `org_emp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orgid` (`orgid`) USING BTREE;

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `org`
--
ALTER TABLE `org`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `org_emp`
--
ALTER TABLE `org_emp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`orgid`) REFERENCES `org` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`custid`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`delievery_status`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`ordid`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`car`) REFERENCES `cars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `org_emp`
--
ALTER TABLE `org_emp`
  ADD CONSTRAINT `org_emp_ibfk_1` FOREIGN KEY (`orgid`) REFERENCES `org` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
