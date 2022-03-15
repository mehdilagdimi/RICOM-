-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2022 at 10:45 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ricom`
--

-- --------------------------------------------------------

--
-- Table structure for table `dicomslice`
--

CREATE TABLE `dicomslice` (
  `sliceID` int(11) NOT NULL,
  `modalityID` int(11) DEFAULT NULL,
  `serieID` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `examinationorder`
--

CREATE TABLE `examinationorder` (
  `orderID` int(11) NOT NULL,
  `physicianID` int(11) DEFAULT NULL,
  `radiologistID` int(11) DEFAULT NULL,
  `orderTest` varchar(500) DEFAULT NULL,
  `orderState` varchar(30) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `headofdepart`
--

CREATE TABLE `headofdepart` (
  `headID` int(11) NOT NULL,
  `fName` varchar(30) NOT NULL,
  `lName` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `passw` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `it_admin`
--

CREATE TABLE `it_admin` (
  `adminID` int(11) NOT NULL,
  `fName` varchar(30) NOT NULL,
  `lName` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `passw` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `modality`
--

CREATE TABLE `modality` (
  `modalityID` int(11) NOT NULL,
  `modality` varchar(30) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientID` int(11) NOT NULL,
  `fName` varchar(30) NOT NULL,
  `lName` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `birthDate` date DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `physician`
--

CREATE TABLE `physician` (
  `physicianID` int(11) NOT NULL,
  `fName` varchar(30) NOT NULL,
  `lName` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `passw` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `radiologist`
--

CREATE TABLE `radiologist` (
  `radiologistID` int(11) NOT NULL,
  `fName` varchar(30) NOT NULL,
  `lName` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `passw` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `reportID` int(11) NOT NULL,
  `serieID` int(11) DEFAULT NULL,
  `orderID` int(11) DEFAULT NULL,
  `physicianID` int(11) DEFAULT NULL,
  `radiologistID` int(11) DEFAULT NULL,
  `reportRadiologist` varchar(1000) DEFAULT NULL,
  `reportPhysician` varchar(1000) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `serie`
--

CREATE TABLE `serie` (
  `serieID` int(11) NOT NULL,
  `patientID` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dicomslice`
--
ALTER TABLE `dicomslice`
  ADD PRIMARY KEY (`sliceID`),
  ADD KEY `modalityID` (`modalityID`),
  ADD KEY `serieID` (`serieID`);

--
-- Indexes for table `examinationorder`
--
ALTER TABLE `examinationorder`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `physicianID` (`physicianID`),
  ADD KEY `radiologistID` (`radiologistID`);

--
-- Indexes for table `headofdepart`
--
ALTER TABLE `headofdepart`
  ADD PRIMARY KEY (`headID`);

--
-- Indexes for table `it_admin`
--
ALTER TABLE `it_admin`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `modality`
--
ALTER TABLE `modality`
  ADD PRIMARY KEY (`modalityID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientID`);

--
-- Indexes for table `physician`
--
ALTER TABLE `physician`
  ADD PRIMARY KEY (`physicianID`);

--
-- Indexes for table `radiologist`
--
ALTER TABLE `radiologist`
  ADD PRIMARY KEY (`radiologistID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`reportID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `serieID` (`serieID`),
  ADD KEY `physicianID` (`physicianID`),
  ADD KEY `radiologistID` (`radiologistID`);

--
-- Indexes for table `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`serieID`),
  ADD KEY `patientID` (`patientID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dicomslice`
--
ALTER TABLE `dicomslice`
  MODIFY `sliceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `examinationorder`
--
ALTER TABLE `examinationorder`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `headofdepart`
--
ALTER TABLE `headofdepart`
  MODIFY `headID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `it_admin`
--
ALTER TABLE `it_admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modality`
--
ALTER TABLE `modality`
  MODIFY `modalityID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `physician`
--
ALTER TABLE `physician`
  MODIFY `physicianID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radiologist`
--
ALTER TABLE `radiologist`
  MODIFY `radiologistID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `reportID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serie`
--
ALTER TABLE `serie`
  MODIFY `serieID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dicomslice`
--
ALTER TABLE `dicomslice`
  ADD CONSTRAINT `dicomslice_ibfk_1` FOREIGN KEY (`modalityID`) REFERENCES `modality` (`modalityID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dicomslice_ibfk_2` FOREIGN KEY (`serieID`) REFERENCES `serie` (`serieID`) ON DELETE CASCADE;

--
-- Constraints for table `examinationorder`
--
ALTER TABLE `examinationorder`
  ADD CONSTRAINT `examinationorder_ibfk_1` FOREIGN KEY (`physicianID`) REFERENCES `physician` (`physicianID`) ON DELETE CASCADE,
  ADD CONSTRAINT `examinationorder_ibfk_2` FOREIGN KEY (`radiologistID`) REFERENCES `radiologist` (`radiologistID`) ON UPDATE CASCADE;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `examinationorder` (`orderID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`serieID`) REFERENCES `serie` (`serieID`) ON DELETE CASCADE,
  ADD CONSTRAINT `report_ibfk_3` FOREIGN KEY (`physicianID`) REFERENCES `physician` (`physicianID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `report_ibfk_4` FOREIGN KEY (`radiologistID`) REFERENCES `radiologist` (`radiologistID`) ON UPDATE CASCADE;

--
-- Constraints for table `serie`
--
ALTER TABLE `serie`
  ADD CONSTRAINT `serie_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
