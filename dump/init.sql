-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jun 10, 2019 at 04:06 PM
-- Server version: 8.0.15
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `rss_feeds`
--

CREATE TABLE `rss_feeds` (
  `id` int(11) NOT NULL,
  `source_id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `pub_date` timestamp NOT NULL,
  `added_date` timestamp NOT NULL,
  `updated_date` timestamp NOT NULL,
  `status` tinyint(1) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `rss_sources`
--

CREATE TABLE `rss_sources` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_data` timestamp NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
);

--
-- Dumping data for table `rss_sources`
--

INSERT INTO `rss_sources` (`id`, `name`, `link`, `updated_data`, `status`) VALUES
(1, 'Al Jazeera English', 'https://www.aljazeera.com/xml/rss/all.xml', '2019-06-10 15:42:00', 1),
(2, 'The New York Times', 'https://www.nytimes.com/svc/collections/v1/publish/https://www.nytimes.com/section/world/rss.xml', '2019-06-10 15:45:30', 1),
(3, 'Defence Blog', 'https://defence-blog.com/feed', '2019-06-10 15:45:30', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rss_feeds`
--
ALTER TABLE `rss_feeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rss_sources`
--
ALTER TABLE `rss_sources`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rss_feeds`
--
ALTER TABLE `rss_feeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rss_sources`
--
ALTER TABLE `rss_sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
