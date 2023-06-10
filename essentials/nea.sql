-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2023 at 10:57 AM
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
  `Bamount` int(11) DEFAULT NULL,
  `payment_status` tinyint(1) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`BID`, `BDate`, `BYear`, `BMonth`, `CUSID`, `Current_Reading`, `Prev_reading`, `Bamount`, `payment_status`, `payment_id`) VALUES
(4, '2023-06-07', '2023', 'May', 12312, 500, 600, 5000, 1, NULL),
(5, '2023-06-14', '2023', 'March', 12312, 4000, 5000, 132123, 1, NULL),
(8, '2023-06-23', '2016', 'March', 12312, 1231231231, 123123, 30000, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `Branch_ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`Branch_ID`, `Name`, `Status`) VALUES
(1, 'balaju', 1),
(234539, 'kathmandu', 1),
(234540, 'koteshor', 1),
(234541, 'Bhupesh', 1),
(234542, 'bishal', 1),
(234543, 'kathmandu', 1);

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

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`SCNO`, `CUSID`, `FullName`, `Address`, `MobileNo`, `Branch_ID`, `Demand_type_ID`, `dob`) VALUES
(1, 1, 'abhijeet pandey', 'ghattaghar', '091749872', 234539, 124, NULL),
(89, 9, 'hari', 'ktm', '90000', 1, 124, NULL),
(77, 88, 'Bhupesh Upadhyaya', 'koteshwor-34', '998844', 234541, 124, NULL),
(123, 12312, 'hari', 'lokanthali', '9898234', 1, 124, NULL),
(0, 12313, ' bishal pahari', 'maitighar', '9812222222', 234540, 124, '1997-07-25'),
(NULL, 12314, ' bishal pahari', 'maitighar', '9812222222', 234540, 124, '1997-07-25'),
(NULL, 12315, 'Bishal Budhakshetri', 'Taplejung', '9823677799', 234539, 124, '2023-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `demandtype`
--

CREATE TABLE `demandtype` (
  `Demand_Type_ID` int(11) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `demandtype`
--

INSERT INTO `demandtype` (`Demand_Type_ID`, `Description`, `Status`) VALUES
(124, '5A', 1);

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

--
-- Dumping data for table `demand_rate`
--

INSERT INTO `demand_rate` (`ID`, `Demand_Type_ID`, `rate`, `effective_date`, `issuement`) VALUES
(3, 124, 1234, '0000-00-00', 0);

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

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PID`, `BID`, `PDate`, `PAmount`, `POID`, `Rebeat_Amt`, `Fine_Amt`) VALUES
(4, 4, '2023-06-01', 123, 11, 123, 123),
(5, 5, '2023-06-20', 123, 11, 123123, 123);

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
-- Dumping data for table `payment_option`
--

INSERT INTO `payment_option` (`POID`, `Name`, `Status`) VALUES
(11, 'esewa', 1),
(12, 'kathmandu', 1);

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
  MODIFY `BID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `Branch_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234544;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CUSID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12316;

--
-- AUTO_INCREMENT for table `demandtype`
--
ALTER TABLE `demandtype`
  MODIFY `Demand_Type_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `demand_rate`
--
ALTER TABLE `demand_rate`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_option`
--
ALTER TABLE `payment_option`
  MODIFY `POID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
