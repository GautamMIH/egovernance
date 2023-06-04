-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2023 at 01:30 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nea`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `BID` int(11) NOT NULL,
  `BDate` date DEFAULT NULL,
  `BYear` varchar(20) DEFAULT NULL,
  `BMonth` varchar(20) DEFAULT NULL,
  `CUSID` int(11) DEFAULT NULL,
  `Current_Reading` int(11) DEFAULT NULL,
  `Prev_reading` int(11) DEFAULT NULL,
  `Bamount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `Branch_ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `SCNO` int(11) DEFAULT NULL,
  `CUSID` int(11) NOT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `MobileNo` varchar(10) DEFAULT NULL,
  `Branch_ID` int(11) DEFAULT NULL,
  `Demand_type_ID` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demandtype`
--

CREATE TABLE `demandtype` (
  `Demand_Type_ID` int(11) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demand_rate`
--

CREATE TABLE `demand_rate` (
  `ID` int(11) NOT NULL,
  `Demand_Type_ID` int(11) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `issuement` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PID` int(11) NOT NULL,
  `BID` int(11) DEFAULT NULL,
  `PDate` date DEFAULT NULL,
  `PAmount` int(11) DEFAULT NULL,
  `POID` int(11) DEFAULT NULL,
  `Rebeat_Amt` int(11) DEFAULT NULL,
  `Fine_Amt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_option`
--

CREATE TABLE `payment_option` (
  `POID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`BID`),
  ADD KEY `CUSID` (`CUSID`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`Branch_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CUSID`),
  ADD KEY `Branch_ID` (`Branch_ID`),
  ADD KEY `Demand_type_ID` (`Demand_type_ID`);

--
-- Indexes for table `demandtype`
--
ALTER TABLE `demandtype`
  ADD PRIMARY KEY (`Demand_Type_ID`);

--
-- Indexes for table `demand_rate`
--
ALTER TABLE `demand_rate`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Demand_Type_ID` (`Demand_Type_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PID`),
  ADD KEY `BID` (`BID`),
  ADD KEY `POID` (`POID`);

--
-- Indexes for table `payment_option`
--
ALTER TABLE `payment_option`
  ADD PRIMARY KEY (`POID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `BID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `Branch_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CUSID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `demandtype`
--
ALTER TABLE `demandtype`
  MODIFY `Demand_Type_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `demand_rate`
--
ALTER TABLE `demand_rate`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_option`
--
ALTER TABLE `payment_option`
  MODIFY `POID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`CUSID`) REFERENCES `customer` (`CUSID`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`CUSID`) REFERENCES `customer` (`CUSID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Branch_ID`) REFERENCES `branch` (`Branch_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`Demand_type_ID`) REFERENCES `demandtype` (`Demand_Type_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `demand_rate`
--
ALTER TABLE `demand_rate`
  ADD CONSTRAINT `demand_rate_ibfk_1` FOREIGN KEY (`Demand_Type_ID`) REFERENCES `demandtype` (`Demand_Type_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BID`) REFERENCES `bill` (`BID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`POID`) REFERENCES `payment_option` (`POID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
