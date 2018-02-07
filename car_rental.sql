-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2018 at 10:05 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE `agency` (
  `agency_id` int(11) NOT NULL,
  `agency_name` varchar(55) DEFAULT NULL,
  `agency_address` varchar(55) DEFAULT NULL,
  `agency_phone` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL,
  `fk_return_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`agency_id`, `agency_name`, `agency_address`, `agency_phone`, `fk_employee_id`, `fk_return_id`) VALUES
(1, 'Royall Car', 'Margreten Gurtel', 1665524, 1, 1),
(2, 'Royall Car', 'Hutelldorf', 1665524, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `car_type` varchar(55) DEFAULT NULL,
  `car_name` varchar(55) DEFAULT NULL,
  `car_model` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `car_type`, `car_name`, `car_model`) VALUES
(1, 'sport', 'Volkswagen', 'Atlas'),
(2, 'sport', 'Volkswagen', 'passat');

-- --------------------------------------------------------

--
-- Table structure for table `car_rental_office`
--

CREATE TABLE `car_rental_office` (
  `car_rental_office_id` int(11) NOT NULL,
  `car_rental_office_name` varchar(55) DEFAULT NULL,
  `car_rental_office_address` varchar(55) DEFAULT NULL,
  `liecense_no` int(11) DEFAULT NULL,
  `fuel_level` varchar(11) DEFAULT NULL,
  `invoice` int(11) DEFAULT NULL,
  `odometer` int(11) DEFAULT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_rental_office`
--

INSERT INTO `car_rental_office` (`car_rental_office_id`, `car_rental_office_name`, `car_rental_office_address`, `liecense_no`, `fuel_level`, `invoice`, `odometer`, `fk_reservation_id`) VALUES
(1, 'Golden car', 'Eichen Strasse', 12345, 'Full', 4444, 24300, 1),
(2, 'Crazy car', 'Mayar Strasse', 65445, 'Full', 3333, 25600, 2);

-- --------------------------------------------------------

--
-- Table structure for table `car_service`
--

CREATE TABLE `car_service` (
  `service_id` int(11) NOT NULL,
  `fuel_level` varchar(11) DEFAULT NULL,
  `car_status` varchar(55) DEFAULT NULL,
  `fk_agency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_service`
--

INSERT INTO `car_service` (`service_id`, `fuel_level`, `car_status`, `fk_agency_id`) VALUES
(1, 'Full', 'Good', 1),
(2, 'Half', 'Good', 2);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `fk_car_rental_office_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `fk_car_rental_office_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `address` varchar(55) DEFAULT NULL,
  `mobile_no` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `address`, `mobile_no`) VALUES
(1, 'Henry', 'Rayan', 'Eichen Strasse', '06994577389'),
(2, 'Lionardo', 'Salmon', 'Mayar gasse', '2147483647');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `mobile_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `mobile_no`) VALUES
(1, 'John', 'Herman', 69988442),
(2, 'simona', 'Fischer', 693322442);

-- --------------------------------------------------------

--
-- Table structure for table `online_rental_office`
--

CREATE TABLE `online_rental_office` (
  `online_id` int(11) NOT NULL,
  `office_name` varchar(55) DEFAULT NULL,
  `office_url` varchar(55) DEFAULT NULL,
  `office_phone` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `online_rental_office`
--

INSERT INTO `online_rental_office` (`online_id`, `office_name`, `office_url`, `office_phone`, `fk_customer_id`, `fk_car_id`) VALUES
(1, 'Golden Car', 'https:/goldencar.wien', 1555999, 1, 1),
(2, 'Crazy Car', 'www.crazycar.com', 177530, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `start_reservation` date DEFAULT NULL,
  `end_reservation` date DEFAULT NULL,
  `fk_online_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `start_reservation`, `end_reservation`, `fk_online_id`) VALUES
(1, '2018-02-05', '2018-02-08', 1),
(2, '2018-02-15', '2018-02-20', 2);

-- --------------------------------------------------------

--
-- Table structure for table `return`
--

CREATE TABLE `return` (
  `return_id` int(11) NOT NULL,
  `return_date` date DEFAULT NULL,
  `fk_client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `return`
--

INSERT INTO `return` (`return_id`, `return_date`, `fk_client_id`) VALUES
(1, '2018-02-08', 1),
(2, '2018-02-20', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`agency_id`),
  ADD KEY `fk_return_id` (`fk_return_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `car_rental_office`
--
ALTER TABLE `car_rental_office`
  ADD PRIMARY KEY (`car_rental_office_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Indexes for table `car_service`
--
ALTER TABLE `car_service`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `fk_agency_id` (`fk_agency_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `fk_car_rental_office_id` (`fk_car_rental_office_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `online_rental_office`
--
ALTER TABLE `online_rental_office`
  ADD PRIMARY KEY (`online_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_online_id` (`fk_online_id`);

--
-- Indexes for table `return`
--
ALTER TABLE `return`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `fk_client_id` (`fk_client_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agency`
--
ALTER TABLE `agency`
  ADD CONSTRAINT `agency_ibfk_1` FOREIGN KEY (`fk_return_id`) REFERENCES `return` (`return_id`),
  ADD CONSTRAINT `agency_ibfk_2` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `car_rental_office`
--
ALTER TABLE `car_rental_office`
  ADD CONSTRAINT `car_rental_office_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints for table `car_service`
--
ALTER TABLE `car_service`
  ADD CONSTRAINT `car_service_ibfk_1` FOREIGN KEY (`fk_agency_id`) REFERENCES `agency` (`agency_id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`fk_car_rental_office_id`) REFERENCES `car_rental_office` (`car_rental_office_id`);

--
-- Constraints for table `online_rental_office`
--
ALTER TABLE `online_rental_office`
  ADD CONSTRAINT `online_rental_office_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `online_rental_office_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_online_id`) REFERENCES `online_rental_office` (`online_id`);

--
-- Constraints for table `return`
--
ALTER TABLE `return`
  ADD CONSTRAINT `return_ibfk_1` FOREIGN KEY (`fk_client_id`) REFERENCES `client` (`client_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
