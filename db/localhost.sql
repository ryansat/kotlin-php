-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 07, 2018 at 08:39 PM
-- Server version: 5.6.39-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_lokasi`
--
CREATE DATABASE IF NOT EXISTS `db_lokasi` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_lokasi`;

-- --------------------------------------------------------

--
-- Table structure for table `boundary`
--

CREATE TABLE `boundary` (
  `id` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `boundary`
--

INSERT INTO `boundary` (`id`, `latitude`, `longitude`) VALUES
(1, 21.426117, 39.8170513),
(2, 21.426954, 39.830096),
(3, 21.421716, 39.832523),
(4, 21.42256, 39.821529);

-- --------------------------------------------------------

--
-- Table structure for table `callcenter`
--

CREATE TABLE `callcenter` (
  `id` int(11) NOT NULL,
  `number` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `callcenter`
--

INSERT INTO `callcenter` (`id`, `number`) VALUES
(1, '081330018291');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `userid` varchar(32) NOT NULL,
  `jamaah` varchar(200) NOT NULL,
  `jeniskelamin` varchar(100) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `isupdated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`userid`, `jamaah`, `jeniskelamin`, `longitude`, `latitude`, `isupdated`) VALUES
('1', 'Budi', 'Pria', 112.716415, -7.4280415, 0),
('2', 'Mirna', 'Wanita', 112.736244, -7.314993, 0),
('3', 'Fajar', 'Pria', 39.8240889, 21.4224829, 0);

-- --------------------------------------------------------

--
-- Table structure for table `testcrud`
--

CREATE TABLE `testcrud` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testcrud`
--

INSERT INTO `testcrud` (`id`, `name`) VALUES
(2, 'qwet'),
(1, 'fajar'),
(3, 'satria'),
(1, 'fajars');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `jabatan` varchar(200) NOT NULL,
  `user` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `password`, `jabatan`, `user`) VALUES
('0', 'fajar@gmail.com', '1234t6', 'Admin', 'fajar'),
('1', 'budi@gmail.com', '123456', 'user', 'budi'),
('2', 'mirna@gmail.com', '123456', 'user', 'mirna'),
('3', 'fajar@yahoo.com', '123456', 'user', 'fajar');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boundary`
--
ALTER TABLE `boundary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `callcenter`
--
ALTER TABLE `callcenter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boundary`
--
ALTER TABLE `boundary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `callcenter`
--
ALTER TABLE `callcenter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
