-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2019 at 07:28 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toolmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `toolgroups`
--

CREATE TABLE `toolgroups` (
  `tgid` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `owner` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `toolgroups`
--

INSERT INTO `toolgroups` (`tgid`, `name`, `owner`) VALUES
(1, 'Hand tools', 1),
(2, 'Power tools', 4),
(3, 'Machine tools', 2),
(4, 'Other tools', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tools`
--

CREATE TABLE `tools` (
  `toolid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `purchase_date` date NOT NULL,
  `cost_price` decimal(10,0) NOT NULL,
  `tgroup` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tools`
--

INSERT INTO `tools` (`toolid`, `name`, `purchase_date`, `cost_price`, `tgroup`) VALUES
(1, 'screwdrivers', '2019-07-10', '40', 1),
(2, 'brushes', '2019-08-15', '35', 1),
(3, 'mixers', '2019-07-09', '5000', 2),
(4, 'saws', '2019-07-18', '3000', 2),
(5, 'cutters', '2019-05-22', '1200', 3),
(6, 'drills', '2019-04-27', '8200', 3),
(7, 'grinders', '2019-05-17', '405', 4),
(8, 'breakers', '2019-09-01', '55000', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='contains User details';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `password`) VALUES
(1, 'rajnish', '6a8ce1ee9e0fc443ed190ac8d03f3da4'),
(2, 'user11', '21232f297a57a5a743894a0e4a801fc3'),
(3, 'randomuser', '7ddf32e17a6ac5ce04a8ecbf782ca509'),
(4, 'someuser', '1be81c3d17831f66762187b4d3cd08d0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `toolgroups`
--
ALTER TABLE `toolgroups`
  ADD PRIMARY KEY (`tgid`),
  ADD KEY `owner` (`owner`);

--
-- Indexes for table `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`toolid`),
  ADD KEY `tgroup` (`tgroup`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `toolgroups`
--
ALTER TABLE `toolgroups`
  MODIFY `tgid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tools`
--
ALTER TABLE `tools`
  MODIFY `toolid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `toolgroups`
--
ALTER TABLE `toolgroups`
  ADD CONSTRAINT `toolgroups_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tools`
--
ALTER TABLE `tools`
  ADD CONSTRAINT `tools_ibfk_1` FOREIGN KEY (`tgroup`) REFERENCES `toolgroups` (`tgid`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
