-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2016 at 05:13 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bestdealdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_address`
--

CREATE TABLE IF NOT EXISTS `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_address`
--

INSERT INTO `oc_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `custom_field`) VALUES
(1, 1, 'Amritesh', 'Kumar', '', 'Hinjewadi', '', 'Pune', '411057', 99, 1493, '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_activity`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_login`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_amazon_login_pay_order`
--

CREATE TABLE IF NOT EXISTS `oc_amazon_login_pay_order` (
  `amazon_login_pay_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `amazon_order_reference_id` varchar(255) NOT NULL,
  `amazon_authorization_id` varchar(255) NOT NULL,
  `free_shipping` tinyint(4) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `capture_status` int(1) DEFAULT NULL,
  `cancel_status` int(1) DEFAULT NULL,
  `refund_status` int(1) DEFAULT NULL,
  `currency_code` char(3) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`amazon_login_pay_order_id`),
  KEY `amazon_order_reference_id` (`amazon_order_reference_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_amazon_login_pay_order_total_tax`
--

CREATE TABLE IF NOT EXISTS `oc_amazon_login_pay_order_total_tax` (
  `order_total_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(255) DEFAULT NULL,
  `tax` decimal(10,4) NOT NULL,
  PRIMARY KEY (`order_total_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_amazon_login_pay_order_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_amazon_login_pay_order_transaction` (
  `amazon_login_pay_order_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `amazon_login_pay_order_id` int(11) NOT NULL,
  `amazon_authorization_id` varchar(255) DEFAULT NULL,
  `amazon_capture_id` varchar(255) DEFAULT NULL,
  `amazon_refund_id` varchar(255) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `type` enum('authorization','capture','refund','cancel') DEFAULT NULL,
  `status` enum('Open','Pending','Completed','Suspended','Declined','Closed','Canceled') DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`amazon_login_pay_order_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_api`
--

CREATE TABLE IF NOT EXISTS `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `name`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'zKRbXXj89zGKUI50rPgdJPfhEfoXPMjoSdmS0MMlVnCXxLruQjyaYSdN9zfR7z2apmp53ZR7cXegtyhLd9TszC48SWfHQehCIvNTxGki1ByqQeeJObUvop82MGWoz79uk5c8n9uo1qbJ2urRXtYEfGslb1QHcaOJaFiA7YwdyvHAL0nAmFbRgiSwxGeTl31AFvb8cYPCiFC3f0KkqIsmj53O3IbP05tU6oaF9ZUy3ObKosjdO4AQDM86BRTcR71y', 1, '2016-03-09 11:43:47', '2016-03-09 11:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `oc_api_ip`
--

CREATE TABLE IF NOT EXISTS `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_api_ip`
--

INSERT INTO `oc_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(1, 1, '127.0.0.1'),
(2, 1, '::1');

-- --------------------------------------------------------

--
-- Table structure for table `oc_api_session`
--

CREATE TABLE IF NOT EXISTS `oc_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_api_session`
--

INSERT INTO `oc_api_session` (`api_session_id`, `api_id`, `token`, `session_id`, `session_name`, `ip`, `date_added`, `date_modified`) VALUES
(6, 1, 'xqnOpjpmBenuRYxmcUJ0towqxu3ASiz8', '277e58b3a501cb4663a23f63fc81fa87', 'temp_session_571b3c80a62c6', '::1', '2016-04-23 14:42:32', '2016-04-23 14:42:32'),
(5, 1, 'zBmjtCugdgPmSqYlli0iSXWLpwiwVzX0', '277e58b3a501cb4663a23f63fc81fa87', 'temp_session_571b3c77e148a', '::1', '2016-04-23 14:42:23', '2016-04-23 14:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 7, 1),
(5, 7, 2),
(6, 7, 3),
(7, 7, 4),
(8, 7, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8),
(12, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(5, 1, 'Ideal For'),
(6, 1, 'Heel Height'),
(7, 1, 'Outer Material'),
(8, 1, 'Color'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed'),
(12, 1, 'Material'),
(4, 1, 'Occasion');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4),
(7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor'),
(7, 1, 'Shoes');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner`
--

CREATE TABLE IF NOT EXISTS `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=137 ;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(135, 7, '', 'catalog/slideshowimages/ucbbanner.jpg', 0),
(136, 7, '', 'catalog/slideshowimages/waterresistant.jpg', 0),
(115, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(125, 8, '', 'catalog/demo/manufacturer/starbucks.png', 0),
(126, 8, '', 'catalog/demo/manufacturer/nintendo.png', 0),
(124, 8, '', 'catalog/demo/manufacturer/disney.png', 0),
(123, 8, '', 'catalog/demo/manufacturer/nfl.png', 0),
(121, 8, '', 'catalog/demo/manufacturer/sony.png', 0),
(122, 8, '', 'catalog/demo/manufacturer/redbull.png', 0),
(120, 8, '', 'catalog/demo/manufacturer/cocacola.png', 0),
(119, 8, '', 'catalog/demo/manufacturer/burgerking.png', 0),
(118, 8, '', 'catalog/demo/manufacturer/canon.png', 0),
(117, 8, '', 'catalog/demo/manufacturer/harley.png', 0),
(116, 8, '', 'catalog/demo/manufacturer/dell.png', 0),
(134, 7, '', 'catalog/slideshowimages/jwellerybanner.jpg', 0),
(133, 7, '', 'catalog/slideshowimages/referandearn.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image_description`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(115, 1, 6, 'HP Banner'),
(124, 1, 8, 'Disney'),
(123, 1, 8, 'NFL'),
(122, 1, 8, 'RedBull'),
(121, 1, 8, 'Sony'),
(136, 1, 7, 'waterresistant'),
(120, 1, 8, 'Coca Cola'),
(119, 1, 8, 'Burger King'),
(118, 1, 8, 'Canon'),
(135, 1, 7, 'ucbbanner'),
(117, 1, 8, 'Harley Davidson'),
(116, 1, 8, 'Dell'),
(125, 1, 8, 'Starbucks'),
(126, 1, 8, 'Nintendo'),
(134, 1, 7, 'Jwellerybanner'),
(133, 1, 7, 'referalrewardbanner');

-- --------------------------------------------------------

--
-- Table structure for table `oc_cart`
--

CREATE TABLE IF NOT EXISTS `oc_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`customer_id`,`session_id`,`product_id`,`recurring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category`
--

CREATE TABLE IF NOT EXISTS `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2016-03-09 13:10:58'),
(27, '', 20, 0, 0, 2, 1, '2009-01-31 01:55:34', '2016-03-09 16:04:50'),
(20, 'catalog/demo/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2016-03-09 13:07:29'),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2016-03-09 13:13:12'),
(18, 'catalog/demo/hp_2.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2016-03-09 14:23:04'),
(17, '', 0, 1, 1, 4, 1, '2009-01-03 21:08:57', '2016-03-09 13:12:08'),
(28, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2010-08-22 06:32:46'),
(26, '', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2016-03-09 16:05:07'),
(29, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2010-08-22 06:32:39'),
(30, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:59', '2010-08-22 06:33:00'),
(31, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:24', '2010-08-22 06:33:06'),
(32, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2010-08-22 06:33:12'),
(33, '', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2016-03-09 13:14:00'),
(34, 'catalog/demo/ipod_touch_4.jpg', 0, 1, 4, 7, 1, '2009-02-03 14:18:11', '2016-03-09 13:15:05'),
(35, '', 28, 0, 0, 0, 1, '2010-09-17 10:06:48', '2010-09-18 14:02:42'),
(36, '', 28, 0, 0, 0, 1, '2010-09-17 10:07:13', '2010-09-18 14:02:55'),
(37, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:39', '2011-04-22 01:55:08'),
(38, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:51', '2010-09-18 14:03:51'),
(39, '', 34, 0, 0, 0, 1, '2010-09-18 14:04:17', '2011-04-22 01:55:20'),
(40, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:36', '2010-09-18 14:05:36'),
(41, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:49', '2011-04-22 01:55:30'),
(42, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:34', '2010-11-07 20:31:04'),
(43, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:49', '2011-04-22 01:55:40'),
(44, '', 34, 0, 0, 0, 1, '2010-09-21 15:39:21', '2010-11-07 20:30:55'),
(47, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:16', '2010-11-07 11:13:16'),
(48, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:33', '2010-11-07 11:13:33'),
(49, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:04', '2010-11-07 11:14:04'),
(50, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:23', '2011-04-22 01:16:01'),
(51, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:38', '2011-04-22 01:16:13'),
(52, '', 34, 0, 0, 0, 1, '2010-11-07 11:16:09', '2011-04-22 01:54:57'),
(53, '', 34, 0, 0, 0, 1, '2010-11-07 11:28:53', '2011-04-22 01:14:36'),
(54, '', 34, 0, 0, 0, 1, '2010-11-07 11:29:16', '2011-04-22 01:16:50'),
(55, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:32', '2010-11-08 10:31:32'),
(56, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:50', '2011-04-22 01:16:37'),
(57, '', 0, 1, 1, 3, 1, '2011-04-26 08:53:16', '2016-03-09 13:11:35'),
(58, '', 52, 0, 0, 0, 1, '2011-05-08 13:44:16', '2011-05-08 13:44:16'),
(59, '', 18, 0, 2, 0, 1, '2016-03-09 14:58:24', '2016-03-09 14:58:24');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(28, 1, 'Monitors', '', '', '', ''),
(33, 1, 'CAMERAs', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Cameras meta data', '', ''),
(32, 1, 'Web Cameras', '', '', '', ''),
(31, 1, 'Scanners', '', '', '', ''),
(30, 1, 'Printers', '', '', '', ''),
(29, 1, 'Mice and Trackballs', '', '', '', ''),
(27, 1, 'All Clothings', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'All Clothings meta deta', '', ''),
(17, 1, 'SOFTWARES', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Softwares meta data', '', ''),
(24, 1, 'PHONES &amp; PDAs', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Phones &amp; PDAs meta data', '', ''),
(20, 1, 'MEN', '&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n', 'Men meta data', 'Example of category description', ''),
(35, 1, 'test 1', '', '', '', ''),
(36, 1, 'test 2', '', '', '', ''),
(37, 1, 'test 5', '', '', '', ''),
(38, 1, 'test 4', '', '', '', ''),
(39, 1, 'test 6', '', '', '', ''),
(40, 1, 'test 7', '', '', '', ''),
(41, 1, 'test 8', '', '', '', ''),
(42, 1, 'test 9', '', '', '', ''),
(43, 1, 'test 11', '', '', '', ''),
(44, 1, 'test 12', '', '', '', ''),
(59, 1, 'Lehengas', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Lehenga meta data here', '', ''),
(47, 1, 'test 15', '', '', '', ''),
(48, 1, 'test 16', '', '', '', ''),
(49, 1, 'test 17', '', '', '', ''),
(50, 1, 'test 18', '', '', '', ''),
(51, 1, 'test 19', '', '', '', ''),
(52, 1, 'test 20', '', '', '', ''),
(53, 1, 'test 21', '', '', '', ''),
(54, 1, 'test 22', '', '', '', ''),
(55, 1, 'test 23', '', '', '', ''),
(56, 1, 'test 24', '', '', '', ''),
(57, 1, 'TABLETS', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Tablets meta data', '', ''),
(58, 1, 'test 25', '', '', '', ''),
(18, 1, 'WOMEN', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Write women category metadata here', '', ''),
(25, 1, 'COMPONENTS', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Electronics meta data', '', ''),
(34, 1, 'MP3 PLAYERS', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'MP3 PLAYERS', '', ''),
(26, 1, 'All Footwear', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Footwear meta data', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_filter`
--

CREATE TABLE IF NOT EXISTS `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_path`
--

CREATE TABLE IF NOT EXISTS `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(28, 25, 0),
(28, 28, 1),
(35, 25, 0),
(35, 28, 1),
(35, 35, 2),
(36, 25, 0),
(36, 28, 1),
(36, 36, 2),
(29, 25, 0),
(29, 29, 1),
(30, 25, 0),
(30, 30, 1),
(31, 25, 0),
(31, 31, 1),
(32, 25, 0),
(32, 32, 1),
(20, 20, 0),
(27, 20, 0),
(27, 27, 1),
(26, 20, 0),
(26, 26, 1),
(24, 24, 0),
(18, 18, 0),
(59, 59, 1),
(59, 18, 0),
(17, 17, 0),
(33, 33, 0),
(34, 34, 0),
(37, 34, 0),
(37, 37, 1),
(38, 34, 0),
(38, 38, 1),
(39, 34, 0),
(39, 39, 1),
(40, 34, 0),
(40, 40, 1),
(41, 34, 0),
(41, 41, 1),
(42, 34, 0),
(42, 42, 1),
(43, 34, 0),
(43, 43, 1),
(44, 34, 0),
(44, 44, 1),
(47, 34, 0),
(47, 47, 1),
(48, 34, 0),
(48, 48, 1),
(49, 34, 0),
(49, 49, 1),
(50, 34, 0),
(50, 50, 1),
(51, 34, 0),
(51, 51, 1),
(52, 34, 0),
(52, 52, 1),
(58, 34, 0),
(58, 52, 1),
(58, 58, 2),
(53, 34, 0),
(53, 53, 1),
(54, 34, 0),
(54, 54, 1),
(55, 34, 0),
(55, 55, 1),
(56, 34, 0),
(56, 56, 1),
(57, 57, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(18, 0, 0),
(26, 0, 0),
(59, 0, 0),
(20, 0, 0),
(25, 0, 0),
(57, 0, 0),
(17, 0, 0),
(24, 0, 0),
(33, 0, 0),
(34, 0, 0),
(27, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_country`
--

CREATE TABLE IF NOT EXISTS `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=258 ;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'South Korea', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon`
--

CREATE TABLE IF NOT EXISTS `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_category`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_history`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_product`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_currency`
--

CREATE TABLE IF NOT EXISTS `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', 0.01150000, 0, '2016-07-08 17:01:19'),
(2, 'US Dollar', 'USD', '$', '', '2', 0.01490000, 0, '2016-07-08 17:01:19'),
(3, 'Euro', 'EUR', '', '€', '2', 0.01350000, 0, '2016-07-08 17:01:19'),
(4, 'Indian rupees', 'INR', 'Rs ', '', '2', 1.00000000, 1, '2016-07-08 17:01:32');

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_custom_field`
--

INSERT INTO `oc_custom_field` (`custom_field_id`, `type`, `value`, `location`, `status`, `sort_order`) VALUES
(1, 'radio', '', 'account', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_custom_field_customer_group`
--

INSERT INTO `oc_custom_field_customer_group` (`custom_field_id`, `customer_group_id`, `required`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_custom_field_description`
--

INSERT INTO `oc_custom_field_description` (`custom_field_id`, `language_id`, `name`) VALUES
(1, 1, 'Gender');

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_custom_field_value`
--

INSERT INTO `oc_custom_field_value` (`custom_field_value_id`, `custom_field_id`, `sort_order`) VALUES
(1, 1, 0),
(2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_custom_field_value_description`
--

INSERT INTO `oc_custom_field_value_description` (`custom_field_value_id`, `language_id`, `custom_field_id`, `name`) VALUES
(1, 1, 1, 'male'),
(2, 1, 1, 'female');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer`
--

CREATE TABLE IF NOT EXISTS `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_customer`
--

INSERT INTO `oc_customer` (`customer_id`, `customer_group_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `approved`, `safe`, `token`, `date_added`) VALUES
(1, 1, 0, 'Amritesh', 'Kumar', 'amritesh@gmail.com', '8855812862', '', 'e3d824f7a09e938427bcf90b3bf2ef25b981f9f7', 'qVhxENRTL', NULL, NULL, 1, 1, '{"1":"1"}', '::1', 1, 1, 0, '', '2016-04-13 09:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_activity`
--

CREATE TABLE IF NOT EXISTS `oc_customer_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `oc_customer_activity`
--

INSERT INTO `oc_customer_activity` (`activity_id`, `customer_id`, `key`, `data`, `ip`, `date_added`) VALUES
(1, 0, 'order_guest', '{"name":"Mohit Gangil","order_id":1}', '::1', '2016-04-13 08:37:48'),
(2, 1, 'register', '{"customer_id":1,"name":"Amritesh Kumar"}', '::1', '2016-04-13 09:13:37'),
(3, 1, 'login', '{"customer_id":"1","name":"Amritesh Kumar"}', '::1', '2016-04-13 10:11:44'),
(4, 1, 'login', '{"customer_id":"1","name":"Amritesh Kumar"}', '::1', '2016-04-13 10:19:06'),
(5, 1, 'login', '{"customer_id":"1","name":"Amritesh Kumar"}', '::1', '2016-04-23 08:08:13'),
(6, 1, 'order_account', '{"customer_id":"1","name":"Amritesh Kumar","order_id":2}', '::1', '2016-04-23 08:10:59'),
(7, 1, 'order_account', '{"customer_id":"1","name":"Amritesh Kumar","order_id":3}', '::1', '2016-04-23 08:17:51'),
(8, 1, 'login', '{"customer_id":"1","name":"Amritesh Kumar"}', '::1', '2016-04-23 14:41:23'),
(9, 1, 'order_account', '{"customer_id":"1","name":"Amritesh Kumar","order_id":4}', '::1', '2016-04-23 14:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_history`
--

CREATE TABLE IF NOT EXISTS `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_customer_ip`
--

INSERT INTO `oc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '::1', '2016-04-13 09:13:37');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_login`
--

CREATE TABLE IF NOT EXISTS `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_customer_login`
--

INSERT INTO `oc_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1, '', '::1', 1, '2016-04-03 11:25:29', '2016-04-03 11:25:29');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_online`
--

CREATE TABLE IF NOT EXISTS `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_reward`
--

CREATE TABLE IF NOT EXISTS `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_wishlist`
--

CREATE TABLE IF NOT EXISTS `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download`
--

CREATE TABLE IF NOT EXISTS `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download_description`
--

CREATE TABLE IF NOT EXISTS `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_event`
--

CREATE TABLE IF NOT EXISTS `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`) VALUES
(1, 'voucher', 'post.order.history.add', 'total/voucher/send'),
(2, 'amazon_edit_capture', 'post.order.edit', 'payment/amazon_login_pay/capture'),
(3, 'amazon_history_capture', 'post.order.history.add', 'payment/amazon_login_pay/capture');

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

CREATE TABLE IF NOT EXISTS `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'shipping', 'free'),
(24, 'module', 'store'),
(27, 'payment', 'pp_standard'),
(26, 'payment', 'bank_transfer'),
(28, 'payment', 'pp_express'),
(29, 'payment', 'amazon_login_pay');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter`
--

CREATE TABLE IF NOT EXISTS `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information`
--

CREATE TABLE IF NOT EXISTS `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_description`
--

CREATE TABLE IF NOT EXISTS `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 1, 'About Us', '&lt;p&gt;\r\n	Navneet will write about bestdeal company here.&lt;br&gt;&lt;/p&gt;\r\n', 'Meta info of bestdeal will be written here.', '', ''),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', '', '', ''),
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', '', '', ''),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(4, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_language`
--

CREATE TABLE IF NOT EXISTS `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'English', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

CREATE TABLE IF NOT EXISTS `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search'),
(14, 'Journal Blog'),
(15, 'Journal Blog Post');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_module`
--

CREATE TABLE IF NOT EXISTS `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=82 ;

--
-- Dumping data for table `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'affiliate', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(81, 1, 'carousel.29', 'content_top', 3),
(80, 1, 'slideshow.27', 'content_top', 1),
(79, 1, 'featured.28', 'content_top', 2),
(72, 3, 'category', 'column_left', 1),
(73, 3, 'banner.30', 'column_left', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

CREATE TABLE IF NOT EXISTS `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(44, 3, 0, 'product/category'),
(59, 1, 0, 'common/home'),
(56, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search'),
(57, 14, 0, 'journal2/blog'),
(58, 15, 0, 'journal2/blog/post');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class`
--

CREATE TABLE IF NOT EXISTS `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `oc_location`
--

CREATE TABLE IF NOT EXISTS `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0),
(11, 'Krishna', '', 0),
(12, 'Nike', 'catalog/manufacturer_images/nike.png', 0),
(13, 'Wrangler', 'catalog/manufacturer_images/WRANGLER_Logo.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_marketing`
--

CREATE TABLE IF NOT EXISTS `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_modification`
--

CREATE TABLE IF NOT EXISTS `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_module`
--

CREATE TABLE IF NOT EXISTS `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{"name":"Category","banner_id":"6","width":"182","height":"182","status":"1"}'),
(29, 'Home Page', 'carousel', '{"name":"Home Page","banner_id":"8","width":"130","height":"100","status":"1"}'),
(28, 'Home Page', 'featured', '{"name":"Home Page","product":["43","40","42","30"],"limit":"4","width":"200","height":"200","status":"1"}'),
(27, 'Home Page', 'slideshow', '{"name":"Home Page","banner_id":"7","width":"1140","height":"360","status":"1"}'),
(31, 'Banner 1', 'banner', '{"name":"Banner 1","banner_id":"6","width":"182","height":"182","status":"1"}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option`
--

CREATE TABLE IF NOT EXISTS `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order`
--

CREATE TABLE IF NOT EXISTS `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_order`
--

INSERT INTO `oc_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(1, 0, 'INV-2013-00', 0, 'bestdeal', 'http://localhost/ecommerce/upload/', 0, 1, 'Mohit', 'Gangil', 'mohit.gangil06@gmail.com', '9876543210', '', '{"1":"1"}', 'Mohit', 'Gangil', '', 'Flat no. 204, Saz Apartment, Sarovar Housing Society, Walhekarwadi, Akurdi', '', 'Pune', '411033', 'India', 99, 'Maharashtra', 1493, '', '[]', 'Cash On Delivery', 'cod', 'Mohit', 'Gangil', '', 'Flat no. 204, Saz Apartment, Sarovar Housing Society, Walhekarwadi, Akurdi', '', 'Pune', '411033', 'India', 99, 'Maharashtra', 1493, '', '[]', 'Free Shipping', 'free.free', '', '1317.0000', 1, 0, '0.0000', 0, '', 1, 4, 'INR', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36', 'en-US,en;q=0.8', '2016-04-13 08:36:01', '2016-04-13 08:37:46');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_history`
--

CREATE TABLE IF NOT EXISTS `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `oc_order_history`
--

INSERT INTO `oc_order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(1, 1, 1, 0, '', '2016-04-13 08:37:46');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_option`
--

CREATE TABLE IF NOT EXISTS `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_product`
--

CREATE TABLE IF NOT EXISTS `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_order_product`
--

INSERT INTO `oc_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(1, 1, 52, 'Wrangler Solid Men''s Waistcoat', 'WRJK1142-Blue', 1, '1317.0000', '1317.0000', '0.0000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_status`
--

CREATE TABLE IF NOT EXISTS `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_total`
--

CREATE TABLE IF NOT EXISTS `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `oc_order_total`
--

INSERT INTO `oc_order_total` (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(1, 1, 'sub_total', 'Sub-Total', '1317.0000', 1),
(2, 1, 'shipping', 'Free Shipping', '0.0000', 3),
(3, 1, 'total', 'Total', '1317.0000', 9);

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_paypal_order`
--

CREATE TABLE IF NOT EXISTS `oc_paypal_order` (
  `paypal_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `capture_status` enum('Complete','NotComplete') DEFAULT NULL,
  `currency_code` char(3) NOT NULL,
  `authorization_id` varchar(30) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`paypal_order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_paypal_order_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_paypal_order_transaction` (
  `paypal_order_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_order_id` int(11) NOT NULL,
  `transaction_id` char(20) NOT NULL,
  `parent_transaction_id` char(20) NOT NULL,
  `date_added` datetime NOT NULL,
  `note` varchar(255) NOT NULL,
  `msgsubid` char(38) NOT NULL,
  `receipt_id` char(20) NOT NULL,
  `payment_type` enum('none','echeck','instant','refund','void') DEFAULT NULL,
  `payment_status` char(20) NOT NULL,
  `pending_reason` char(50) NOT NULL,
  `transaction_entity` char(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `debug_data` text NOT NULL,
  `call_data` text NOT NULL,
  PRIMARY KEY (`paypal_order_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product`
--

CREATE TABLE IF NOT EXISTS `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(28, 'Product 1', '', '', '', '', '', '', '', 939, 7, 'catalog/demo/htc_touch_hd_1.jpg', 5, 1, '100.0000', 200, 9, '2009-02-03', '146.40000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 16:06:50', '2011-09-30 01:05:39'),
(29, 'Product 2', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/palm_treo_pro_1.jpg', 6, 1, '279.9900', 0, 9, '2009-02-03', '133.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 16:42:17', '2011-09-30 01:06:08'),
(30, 'Product 3', '', '', '', '', '', '', '', 7, 6, 'catalog/demo/canon_eos_5d_1.jpg', 9, 1, '100.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 11, '2009-02-03 16:59:00', '2011-09-30 01:05:23'),
(31, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/nikon_d300_1.jpg', 0, 1, '80.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 17:00:10', '2011-09-30 01:06:00'),
(32, 'Product 5', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/ipod_touch_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 17:07:26', '2011-09-30 01:07:22'),
(33, 'Product 6', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/samsung_syncmaster_941bw.jpg', 0, 1, '200.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 17:08:31', '2011-09-30 01:06:29'),
(34, 'Product 7', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/ipod_shuffle_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:07:54', '2011-09-30 01:07:17'),
(35, 'Product 8', '', '', '', '', '', '', '', 1000, 5, '', 0, 0, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 18:08:31', '2011-09-30 01:06:17'),
(36, 'Product 9', '', '', '', '', '', '', '', 994, 6, 'catalog/demo/ipod_nano_1.jpg', 8, 0, '100.0000', 100, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:09:19', '2011-09-30 01:07:12'),
(40, 'product 11', '', '', '', '', '', '', '', 970, 5, 'catalog/demo/iphone_1.jpg', 8, 1, '101.0000', 0, 9, '2009-02-03', '10.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 5, '2009-02-03 21:07:12', '2011-09-30 01:06:53'),
(52, 'WRJK1142-Blue', '', '', '', '', '', '', '', 0, 6, 'catalog/product_images/MEN/Blazers/front.jpeg', 13, 1, '1317.0000', 0, 0, '2016-03-09', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 13, '2016-03-09 17:24:46', '2016-03-09 17:30:09'),
(42, 'Product 15', '', '', '', '', '', '', '', 990, 5, 'catalog/demo/apple_cinema_30.jpg', 8, 1, '100.0000', 400, 9, '2009-02-04', '12.50000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 2, 0, 1, 4, '2009-02-03 21:07:37', '2011-09-30 00:46:19'),
(43, 'Product 16', '', '', '', '', '', '', '', 929, 5, 'catalog/demo/macbook_1.jpg', 8, 0, '500.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 25, '2009-02-03 21:07:49', '2011-09-30 01:05:46'),
(44, 'Product 17', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/macbook_air_1.jpg', 8, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 1, '2009-02-03 21:08:00', '2011-09-30 01:05:53'),
(45, 'Product 18', '', '', '', '', '', '', '', 998, 5, 'catalog/demo/macbook_pro_1.jpg', 8, 1, '2000.0000', 0, 100, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:17', '2011-09-15 22:22:01'),
(46, 'Product 19', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/sony_vaio_1.jpg', 10, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:29', '2011-09-30 01:06:39'),
(47, 'Product 21', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/hp_1.jpg', 7, 1, '100.0000', 400, 9, '2009-02-03', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 2, '2009-02-03 21:08:40', '2011-09-30 01:05:28'),
(48, 'product 20', 'test 1', '', '', '', '', '', 'test 2', 995, 5, 'catalog/demo/ipod_classic_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-08', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-08 17:21:51', '2011-09-30 01:07:06'),
(49, 'SAM1', '', '', '', '', '', '', '', 0, 8, 'catalog/demo/samsung_tab_1.jpg', 0, 1, '199.9900', 0, 9, '2011-04-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 4, '2011-04-26 08:57:34', '2011-09-30 01:06:23'),
(50, '1001', '', '', '', '', '', '', '', 1, 6, 'catalog/product_images/Lehengas/nf-2008-nitu-fashion-42-400x400-imaebbt8tgacechn.jpeg', 11, 1, '575.0000', 0, 9, '2016-03-09', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 36, '2016-03-09 13:50:14', '2016-03-09 15:04:57'),
(51, '1002', '', '', '', '', '', '', '', 1, 6, 'catalog/product_images/MEN/Sneakers/snkfront.jpeg', 12, 1, '2036.0000', 0, 9, '2016-03-09', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 16, '2016-03-09 16:23:19', '2016-03-09 17:03:07');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(43, 2, 1, '1'),
(47, 4, 1, '16GB'),
(43, 4, 1, '8gb'),
(42, 3, 1, '100mhz'),
(47, 2, 1, '4'),
(51, 8, 1, 'Blue'),
(51, 7, 1, 'Mesh'),
(51, 6, 1, '0 inch'),
(51, 5, 1, 'Men'),
(51, 4, 1, 'Casual'),
(52, 5, 1, 'Men');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_description`
--

CREATE TABLE IF NOT EXISTS `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(35, 1, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', '', '', ''),
(48, 1, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', ''),
(40, 1, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', '', '', ''),
(28, 1, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', ''),
(44, 1, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', '', '', ''),
(45, 1, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', ''),
(29, 1, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', ''),
(36, 1, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', ''),
(46, 1, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', '', '', ''),
(47, 1, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', '', '', ''),
(32, 1, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '', '', ''),
(52, 1, 'Wrangler Solid Men''s Waistcoat', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Suits meta data', '', ''),
(33, 1, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', '', '', ''),
(34, 1, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', ''),
(43, 1, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', ''),
(31, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', ''),
(49, 1, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', '', '', ''),
(42, 1, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there&amp;#39;s no limit to what you can achieve. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it&amp;#39;s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple&amp;#39;s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br /&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170&amp;deg; horizontal; 170&amp;deg; vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br /&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br /&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50&amp;deg; to 95&amp;deg; F (10&amp;deg; to 35&amp;deg; C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40&amp;deg; to 116&amp;deg; F (-40&amp;deg; to 47&amp;deg; C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO &amp;#39;03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br /&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', ''),
(30, 1, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', '', '', ''),
(50, 1, 'Krishna embroided Lehenga', '&lt;p&gt;Write here the product description.&lt;br&gt;&lt;/p&gt;', '', 'Write the meta tag title here', 'Write here the meta tag description', ''),
(51, 1, 'Nike Sneakers', '		\r\n	\r\n\r\n\r\n\r\n\r\n        \r\n    \r\n\r\n\r\n&lt;div class=&quot;gd-row&quot;&gt;\r\n    &lt;div class=&quot;gd-col gu16&quot;&gt;\r\n        \r\n    &lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n\r\n    \r\n        \r\n\r\n        &lt;div class=&quot;keyFeatures specSection&quot;&gt;&lt;br&gt;&lt;/div&gt;\r\n &lt;div class=&quot;hsame-alt-reco&quot;&gt;\r\n            \r\n &lt;/div&gt;\r\n\r\n		&lt;div class=&quot;description specSection&quot;&gt;\r\n				&lt;h3 class=&quot;sectionTitle&quot;&gt;\r\n                        Nike Sneakers\r\n                         Price: Rs. 2,396\r\n				&lt;/h3&gt;\r\n			&lt;div class=&quot;description-text&quot;&gt;A pair of blue casual shoes, has \r\ncentral lace-ups. Suede and mesh upper, Nike Swoosh on both sides of the\r\n midfoot, and a reinforced heel collar. Cushioned footbed. Smooth \r\noutsole with nubs. Warranty: 6 months against manufacturing defects (not\r\n valid on products with more than 20% discount). Featuring a smart and \r\ntrendy look, this pair of casual shoes from Nike is a perfect addition \r\nto your footwear collection. The cool design will add class to your \r\noutfit anytime, anywhere.&lt;/div&gt;\r\n		&lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'sneaker, nike', 'Nike Sneaker meta data', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_discount`
--

CREATE TABLE IF NOT EXISTS `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=441 ;

--
-- Dumping data for table `oc_product_discount`
--

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(440, 42, 1, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(439, 42, 1, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(438, 42, 1, 10, 1, '88.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_filter`
--

CREATE TABLE IF NOT EXISTS `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_image`
--

CREATE TABLE IF NOT EXISTS `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2367 ;

--
-- Dumping data for table `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2345, 30, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2321, 47, 'catalog/demo/hp_3.jpg', 0),
(2035, 28, 'catalog/demo/htc_touch_hd_2.jpg', 0),
(1982, 40, 'catalog/demo/iphone_6.jpg', 0),
(2001, 36, 'catalog/demo/ipod_nano_5.jpg', 0),
(2000, 36, 'catalog/demo/ipod_nano_4.jpg', 0),
(2005, 34, 'catalog/demo/ipod_shuffle_5.jpg', 0),
(2004, 34, 'catalog/demo/ipod_shuffle_4.jpg', 0),
(2011, 32, 'catalog/demo/ipod_touch_7.jpg', 0),
(2010, 32, 'catalog/demo/ipod_touch_6.jpg', 0),
(2009, 32, 'catalog/demo/ipod_touch_5.jpg', 0),
(1971, 43, 'catalog/demo/macbook_5.jpg', 0),
(1970, 43, 'catalog/demo/macbook_4.jpg', 0),
(1974, 44, 'catalog/demo/macbook_air_4.jpg', 0),
(1973, 44, 'catalog/demo/macbook_air_2.jpg', 0),
(1977, 45, 'catalog/demo/macbook_pro_2.jpg', 0),
(1976, 45, 'catalog/demo/macbook_pro_3.jpg', 0),
(1986, 31, 'catalog/demo/nikon_d300_3.jpg', 0),
(1985, 31, 'catalog/demo/nikon_d300_2.jpg', 0),
(1988, 29, 'catalog/demo/palm_treo_pro_3.jpg', 0),
(1995, 46, 'catalog/demo/sony_vaio_5.jpg', 0),
(1994, 46, 'catalog/demo/sony_vaio_4.jpg', 0),
(1991, 48, 'catalog/demo/ipod_classic_4.jpg', 0),
(1990, 48, 'catalog/demo/ipod_classic_3.jpg', 0),
(1981, 40, 'catalog/demo/iphone_2.jpg', 0),
(1980, 40, 'catalog/demo/iphone_5.jpg', 0),
(2344, 30, 'catalog/demo/canon_eos_5d_3.jpg', 0),
(2320, 47, 'catalog/demo/hp_2.jpg', 0),
(2034, 28, 'catalog/demo/htc_touch_hd_3.jpg', 0),
(1979, 40, 'catalog/demo/iphone_3.jpg', 0),
(1978, 40, 'catalog/demo/iphone_4.jpg', 0),
(1989, 48, 'catalog/demo/ipod_classic_2.jpg', 0),
(1999, 36, 'catalog/demo/ipod_nano_2.jpg', 0),
(1998, 36, 'catalog/demo/ipod_nano_3.jpg', 0),
(2003, 34, 'catalog/demo/ipod_shuffle_2.jpg', 0),
(2002, 34, 'catalog/demo/ipod_shuffle_3.jpg', 0),
(2008, 32, 'catalog/demo/ipod_touch_2.jpg', 0),
(2007, 32, 'catalog/demo/ipod_touch_3.jpg', 0),
(2006, 32, 'catalog/demo/ipod_touch_4.jpg', 0),
(1969, 43, 'catalog/demo/macbook_2.jpg', 0),
(1968, 43, 'catalog/demo/macbook_3.jpg', 0),
(1972, 44, 'catalog/demo/macbook_air_3.jpg', 0),
(1975, 45, 'catalog/demo/macbook_pro_4.jpg', 0),
(1984, 31, 'catalog/demo/nikon_d300_4.jpg', 0),
(1983, 31, 'catalog/demo/nikon_d300_5.jpg', 0),
(1987, 29, 'catalog/demo/palm_treo_pro_2.jpg', 0),
(1993, 46, 'catalog/demo/sony_vaio_2.jpg', 0),
(1992, 46, 'catalog/demo/sony_vaio_3.jpg', 0),
(2327, 49, 'catalog/demo/samsung_tab_7.jpg', 0),
(2326, 49, 'catalog/demo/samsung_tab_6.jpg', 0),
(2325, 49, 'catalog/demo/samsung_tab_5.jpg', 0),
(2324, 49, 'catalog/demo/samsung_tab_4.jpg', 0),
(2323, 49, 'catalog/demo/samsung_tab_3.jpg', 0),
(2322, 49, 'catalog/demo/samsung_tab_2.jpg', 0),
(2317, 42, 'catalog/demo/canon_logo.jpg', 0),
(2316, 42, 'catalog/demo/hp_1.jpg', 0),
(2315, 42, 'catalog/demo/compaq_presario.jpg', 0),
(2314, 42, 'catalog/demo/canon_eos_5d_1.jpg', 0),
(2313, 42, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2363, 50, 'catalog/product_images/Lehengas/nf-2008-nitu-fashion-42-400x400-imaebbt8tgacechn.jpeg', 0),
(2364, 50, 'catalog/product_images/Lehengas/1-1-43-pink-lengha-preety-creation-free-400x400-imaeagq8fp9z7agp.jpeg', 1),
(2365, 50, 'catalog/product_images/Lehengas/1-1-43-pink-lengha-preety-creation-free-400x400-imaeagq7bm7ycybr.jpeg', 2),
(2366, 50, 'catalog/product_images/Lehengas/lehenga-choli-surat-fab-tex-xxl-400x400-imae9uyfmetdzjsc.jpeg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option`
--

CREATE TABLE IF NOT EXISTS `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=227 ;

--
-- Dumping data for table `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(224, 35, 11, '', 1),
(225, 47, 12, '2011-04-22', 1),
(223, 42, 2, '', 1),
(217, 42, 5, '', 1),
(209, 42, 6, '', 1),
(218, 42, 1, '', 1),
(208, 42, 4, 'test', 1),
(219, 42, 8, '2011-02-20', 1),
(222, 42, 7, '', 1),
(221, 42, 9, '22:25', 1),
(220, 42, 10, '2011-02-20 22:25', 1),
(226, 30, 5, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(1, 217, 42, 5, 41, 100, 0, '1.0000', '+', 0, '+', '1.00000000', '+'),
(6, 218, 42, 1, 31, 146, 1, '20.0000', '+', 2, '-', '20.00000000', '+'),
(7, 218, 42, 1, 43, 300, 1, '30.0000', '+', 3, '+', '30.00000000', '+'),
(5, 218, 42, 1, 32, 96, 1, '10.0000', '+', 1, '+', '10.00000000', '+'),
(4, 217, 42, 5, 39, 92, 1, '4.0000', '+', 0, '+', '4.00000000', '+'),
(2, 217, 42, 5, 42, 200, 1, '2.0000', '+', 0, '+', '2.00000000', '+'),
(3, 217, 42, 5, 40, 300, 0, '3.0000', '+', 0, '+', '3.00000000', '+'),
(8, 223, 42, 2, 23, 48, 1, '10.0000', '+', 0, '+', '10.00000000', '+'),
(10, 223, 42, 2, 44, 2696, 1, '30.0000', '+', 0, '+', '30.00000000', '+'),
(9, 223, 42, 2, 24, 194, 1, '20.0000', '+', 0, '+', '20.00000000', '+'),
(11, 223, 42, 2, 45, 3998, 1, '40.0000', '+', 0, '+', '40.00000000', '+'),
(12, 224, 35, 11, 46, 0, 1, '5.0000', '+', 0, '+', '0.00000000', '+'),
(13, 224, 35, 11, 47, 10, 1, '10.0000', '+', 0, '+', '0.00000000', '+'),
(14, 224, 35, 11, 48, 15, 1, '15.0000', '+', 0, '+', '0.00000000', '+'),
(16, 226, 30, 5, 40, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(15, 226, 30, 5, 39, 2, 1, '0.0000', '+', 0, '+', '0.00000000', '+');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related`
--

CREATE TABLE IF NOT EXISTS `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_related`
--

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(40, 42),
(42, 40);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_reward`
--

CREATE TABLE IF NOT EXISTS `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=546 ;

--
-- Dumping data for table `oc_product_reward`
--

INSERT INTO `oc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(515, 42, 1, 100),
(519, 47, 1, 300),
(379, 28, 1, 400),
(329, 43, 1, 600),
(339, 29, 1, 0),
(343, 48, 1, 0),
(335, 40, 1, 0),
(539, 30, 1, 200),
(331, 44, 1, 700),
(333, 45, 1, 800),
(337, 31, 1, 0),
(425, 35, 1, 0),
(345, 33, 1, 0),
(347, 46, 1, 0),
(351, 36, 1, 0),
(353, 34, 1, 0),
(355, 32, 1, 0),
(521, 49, 1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_special`
--

CREATE TABLE IF NOT EXISTS `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=440 ;

--
-- Dumping data for table `oc_product_special`
--

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(419, 42, 1, 1, '90.0000', '0000-00-00', '0000-00-00'),
(439, 30, 1, 2, '90.0000', '0000-00-00', '0000-00-00'),
(438, 30, 1, 1, '80.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_category`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(28, 20),
(28, 24),
(29, 20),
(29, 24),
(30, 20),
(30, 33),
(31, 33),
(32, 34),
(33, 20),
(33, 28),
(34, 34),
(35, 20),
(36, 34),
(40, 20),
(40, 24),
(42, 20),
(42, 28),
(43, 18),
(43, 20),
(44, 18),
(44, 20),
(45, 18),
(46, 18),
(46, 20),
(47, 18),
(47, 20),
(48, 20),
(48, 34),
(49, 57),
(50, 59),
(51, 26),
(52, 27);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_download`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(50, 0, 0),
(51, 0, 0),
(52, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring_description`
--

CREATE TABLE IF NOT EXISTS `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return`
--

CREATE TABLE IF NOT EXISTS `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_action`
--

CREATE TABLE IF NOT EXISTS `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_history`
--

CREATE TABLE IF NOT EXISTS `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_reason`
--

CREATE TABLE IF NOT EXISTS `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_status`
--

CREATE TABLE IF NOT EXISTS `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Table structure for table `oc_review`
--

CREATE TABLE IF NOT EXISTS `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_review`
--

INSERT INTO `oc_review` (`review_id`, `product_id`, `customer_id`, `author`, `text`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(1, 50, 0, 'sarveshwar', 'this is good product sjkhskdsjfh skfjh ksh s kfhkfh  ', 5, 1, '2016-03-10 08:18:33', '2016-03-10 08:19:28'),
(3, 52, 1, 'Amritesh', 'This product is a value for money', 4, 1, '2016-04-13 09:37:55', '2016-04-13 10:00:09');

-- --------------------------------------------------------

--
-- Table structure for table `oc_rgen_modules`
--

CREATE TABLE IF NOT EXISTS `oc_rgen_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `group` varchar(64) NOT NULL,
  `section` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_rgen_modules_customize`
--

CREATE TABLE IF NOT EXISTS `oc_rgen_modules_customize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `group` varchar(64) NOT NULL,
  `section` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_rgen_settings`
--

CREATE TABLE IF NOT EXISTS `oc_rgen_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `group` varchar(64) NOT NULL,
  `section` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_rgen_theme`
--

CREATE TABLE IF NOT EXISTS `oc_rgen_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `group` varchar(64) NOT NULL,
  `section` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

CREATE TABLE IF NOT EXISTS `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2261 ;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(1325, 0, 'coupon', 'coupon_sort_order', '4', 0),
(1324, 0, 'coupon', 'coupon_status', '0', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(146, 0, 'category', 'category_status', '1', 0),
(158, 0, 'account', 'account_status', '1', 0),
(159, 0, 'affiliate', 'affiliate_status', '1', 0),
(2258, 0, 'bank_transfer', 'bank_transfer_geo_zone_id', '0', 0),
(2242, 0, 'config', 'config_encryption', 'ieooWJSzXRoTIy5laaXB5SBSPy7ktjmuLvkz7xYwHKZsQRAzi9KO772TxFV4iAJV5fX5XU3riENqgeUnXsqtW9rAnDEIsF2Y6wSzWIHcolzJh3m8iHcI6nZx36i1YJvfbSbaEYkJ52kZGlnouuKfVO76L6GDyjBVpjO8yAKEMIZaWB4fm0tz6CVALqeyXJML15JXFdbIrXP6vnNX4RTr5uTOhSyAGmts8sbQbPaM3gwUGG2DcoGIkSdmVwiN33MGKZYyNf3DTwuTfbkuW9A9Jy7ujUbuR5m6YBo2DSRAIjLv1y0looqoDPpb8WeKZHdLcWXG3MNCEj4Ynbse5OTBCSFkTgkZkaprE0KIr4LdUmK3edpBpxuX19Q4Rq8x146UpcKxB6orJYw2AmtoG88X9DL673pLywDmyUPWvHEtd8zxg6pnuBZEhDDbuktvBi1Kbn7vUoVC6zOu5vV7a9bI8VUeGQGfa4TDg5GjnGoNMqXCotahTkEdR67Wlb0lqCd4NxkTS06LQrXr0oOZAX7CWqhcPc9ApMNUnhONZvIborenxLlKPzQTyYnOzYcqg4zDlSOxeH2JERs1SbD8HLrbaSeD29p9fYyb5RICV6A5uuW8qB9swOqfFC35ulrcUMPEbKPly7rKOfqZc9e3Y0ZM9bKAbfOr538vgXugckSPxC2EL5jOEqWU6Y7qLk4srzyz7OsOHak0tJ4KrVUk7grtZBdFFsEFDLvCShY1mTZ1ZO4P6dR2ixHc8hYVh0lvvorRno3zeOVet2F4Iif60rTGHR8GroReJIkOMBTkbvAiGAAtg3UqzwSwDBnrgVdcAQpavEg2MDoxEU1w8dpb8OetNSEMt4Q4exGAD5eJWdg9lM2jZ8kxhQ1BjKbOVqFL69pDaNBeT2t9BLGfYbNeBFP7sAvUJUPL7NJEszYK7yzTs89k7xwxmxKhTOzbj4IVcuyMsN3XDxaf5IzYlcin8Oyvk1ZkFrvUlb1UBZpyzk9S8pfqn9p9mh4VaEnBQMaBVPyh', 0),
(2238, 0, 'config', 'config_compression', '0', 0),
(2239, 0, 'config', 'config_secure', '0', 0),
(2240, 0, 'config', 'config_password', '1', 0),
(2241, 0, 'config', 'config_shared', '0', 0),
(1327, 0, 'voucher', 'voucher_sort_order', '8', 0),
(1326, 0, 'voucher', 'voucher_status', '0', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(2246, 0, 'config', 'config_error_display', '1', 0),
(2247, 0, 'config', 'config_error_log', '1', 0),
(2248, 0, 'config', 'config_error_filename', 'error.log', 0),
(2245, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(2243, 0, 'config', 'config_file_max_size', '300000', 0),
(2244, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(2236, 0, 'config', 'config_seo_url', '0', 0),
(2237, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(2235, 0, 'config', 'config_maintenance', '0', 0),
(2234, 0, 'config', 'config_mail_alert', '', 0),
(2233, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(2232, 0, 'config', 'config_mail_smtp_port', '25', 0),
(2231, 0, 'config', 'config_mail_smtp_password', '', 0),
(2230, 0, 'config', 'config_mail_smtp_username', '', 0),
(2229, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(2228, 0, 'config', 'config_mail_parameter', '', 0),
(2227, 0, 'config', 'config_mail_protocol', 'mail', 0),
(2225, 0, 'config', 'config_ftp_root', '', 0),
(2226, 0, 'config', 'config_ftp_status', '0', 0),
(2224, 0, 'config', 'config_ftp_password', '', 0),
(2223, 0, 'config', 'config_ftp_username', '', 0),
(2222, 0, 'config', 'config_ftp_port', '21', 0),
(2221, 0, 'config', 'config_ftp_hostname', 'localhost', 0),
(2220, 0, 'config', 'config_image_location_height', '50', 0),
(2219, 0, 'config', 'config_image_location_width', '268', 0),
(2218, 0, 'config', 'config_image_cart_height', '47', 0),
(2217, 0, 'config', 'config_image_cart_width', '47', 0),
(2216, 0, 'config', 'config_image_wishlist_height', '47', 0),
(2215, 0, 'config', 'config_image_wishlist_width', '47', 0),
(2214, 0, 'config', 'config_image_compare_height', '90', 0),
(2213, 0, 'config', 'config_image_compare_width', '90', 0),
(2212, 0, 'config', 'config_image_related_height', '80', 0),
(2211, 0, 'config', 'config_image_related_width', '80', 0),
(2210, 0, 'config', 'config_image_additional_height', '74', 0),
(2209, 0, 'config', 'config_image_additional_width', '74', 0),
(2208, 0, 'config', 'config_image_product_height', '228', 0),
(2207, 0, 'config', 'config_image_product_width', '228', 0),
(2204, 0, 'config', 'config_image_thumb_height', '228', 0),
(2206, 0, 'config', 'config_image_popup_height', '500', 0),
(2205, 0, 'config', 'config_image_popup_width', '500', 0),
(2203, 0, 'config', 'config_image_thumb_width', '228', 0),
(2202, 0, 'config', 'config_image_category_height', '80', 0),
(2200, 0, 'config', 'config_icon', 'catalog/favicon.png', 0),
(2201, 0, 'config', 'config_image_category_width', '80', 0),
(2199, 0, 'config', 'config_logo', 'catalog/BestDealFinal.jpg', 0),
(2198, 0, 'config', 'config_captcha_page', '["review","return","contact"]', 1),
(2197, 0, 'config', 'config_captcha', '', 0),
(2196, 0, 'config', 'config_return_status_id', '2', 0),
(2195, 0, 'config', 'config_return_id', '0', 0),
(2193, 0, 'config', 'config_affiliate_id', '4', 0),
(2194, 0, 'config', 'config_affiliate_mail', '0', 0),
(2192, 0, 'config', 'config_affiliate_commission', '5', 0),
(2191, 0, 'config', 'config_affiliate_auto', '0', 0),
(2190, 0, 'config', 'config_affiliate_approval', '0', 0),
(2189, 0, 'config', 'config_stock_checkout', '0', 0),
(2188, 0, 'config', 'config_stock_warning', '1', 0),
(2187, 0, 'config', 'config_stock_display', '0', 0),
(2186, 0, 'config', 'config_api_id', '1', 0),
(2185, 0, 'config', 'config_order_mail', '0', 0),
(2184, 0, 'config', 'config_fraud_status_id', '7', 0),
(2183, 0, 'config', 'config_complete_status', '["5","3"]', 1),
(2181, 0, 'config', 'config_order_status_id', '1', 0),
(2182, 0, 'config', 'config_processing_status', '["5","1","2","12","3"]', 1),
(2180, 0, 'config', 'config_checkout_id', '5', 0),
(2179, 0, 'config', 'config_checkout_guest', '1', 0),
(2178, 0, 'config', 'config_cart_weight', '0', 0),
(2177, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(2176, 0, 'config', 'config_account_mail', '0', 0),
(2175, 0, 'config', 'config_account_id', '3', 0),
(2174, 0, 'config', 'config_login_attempts', '5', 0),
(2173, 0, 'config', 'config_customer_price', '0', 0),
(2172, 0, 'config', 'config_customer_group_display', '["1"]', 1),
(2171, 0, 'config', 'config_customer_group_id', '1', 0),
(2170, 0, 'config', 'config_customer_online', '0', 0),
(2169, 0, 'config', 'config_tax_customer', 'shipping', 0),
(2168, 0, 'config', 'config_tax_default', 'shipping', 0),
(2167, 0, 'config', 'config_tax', '0', 0),
(2165, 0, 'config', 'config_voucher_min', '1', 0),
(2166, 0, 'config', 'config_voucher_max', '1000', 0),
(2164, 0, 'config', 'config_review_mail', '0', 0),
(2163, 0, 'config', 'config_review_guest', '1', 0),
(2162, 0, 'config', 'config_review_status', '1', 0),
(2161, 0, 'config', 'config_limit_admin', '20', 0),
(2160, 0, 'config', 'config_product_description_length', '100', 0),
(2159, 0, 'config', 'config_product_limit', '15', 0),
(2158, 0, 'config', 'config_product_count', '1', 0),
(2157, 0, 'config', 'config_weight_class_id', '1', 0),
(2156, 0, 'config', 'config_length_class_id', '1', 0),
(2155, 0, 'config', 'config_currency_auto', '1', 0),
(2154, 0, 'config', 'config_currency', 'INR', 0),
(2153, 0, 'config', 'config_admin_language', 'en', 0),
(2152, 0, 'config', 'config_language', 'en', 0),
(2151, 0, 'config', 'config_zone_id', '1493', 0),
(2150, 0, 'config', 'config_country_id', '99', 0),
(2149, 0, 'config', 'config_comment', '', 0),
(2148, 0, 'config', 'config_open', '', 0),
(2146, 0, 'config', 'config_fax', '', 0),
(2147, 0, 'config', 'config_image', 'catalog/logo.png', 0),
(2145, 0, 'config', 'config_telephone', '+91-9527936489', 0),
(2144, 0, 'config', 'config_email', 'hello_navneet@hotmail.com', 0),
(2143, 0, 'config', 'config_geocode', '', 0),
(2142, 0, 'config', 'config_address', '2nd floor, Kasturi Heights, Chinchwad Pune', 0),
(2141, 0, 'config', 'config_owner', 'CareerTech IT Solution', 0),
(2140, 0, 'config', 'config_name', 'bestdeal', 0),
(750, 0, 'free', 'free_total', '500', 0),
(751, 0, 'free', 'free_geo_zone_id', '0', 0),
(752, 0, 'free', 'free_status', '1', 0),
(753, 0, 'free', 'free_sort_order', '', 0),
(2139, 0, 'config', 'config_layout_id', '4', 0),
(2138, 0, 'config', 'config_template', 'default', 0),
(2136, 0, 'config', 'config_meta_description', 'My Store', 0),
(2137, 0, 'config', 'config_meta_keyword', '', 0),
(2135, 0, 'config', 'config_meta_title', 'Your Store', 0),
(2257, 0, 'bank_transfer', 'bank_transfer_order_status_id', '5', 0),
(2256, 0, 'bank_transfer', 'bank_transfer_total', '1', 0),
(2255, 0, 'bank_transfer', 'bank_transfer_bank1', 'Pay using your credit/debit card or internet banking', 0),
(2259, 0, 'bank_transfer', 'bank_transfer_status', '1', 0),
(2260, 0, 'bank_transfer', 'bank_transfer_sort_order', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_stock_status`
--

CREATE TABLE IF NOT EXISTS `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2-3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `oc_store`
--

CREATE TABLE IF NOT EXISTS `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_class`
--

CREATE TABLE IF NOT EXISTS `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rule`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- Dumping data for table `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_upload`
--

CREATE TABLE IF NOT EXISTS `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_url_alias`
--

CREATE TABLE IF NOT EXISTS `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=875 ;

--
-- Dumping data for table `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(824, 'product_id=48', 'ipod-classic'),
(848, 'category_id=20', 'desktops'),
(870, 'manufacturer_id=12', ''),
(730, 'manufacturer_id=8', 'apple'),
(844, 'information_id=4', 'about_us'),
(768, 'product_id=42', 'test'),
(857, 'category_id=34', 'mp3-players'),
(781, 'category_id=36', 'test2'),
(863, 'category_id=18', 'laptop-notebook'),
(874, 'manufacturer_id=13', ''),
(868, 'category_id=59', ''),
(851, 'category_id=25', 'component'),
(778, 'category_id=29', 'mouse'),
(779, 'category_id=28', 'monitor'),
(780, 'category_id=35', 'test1'),
(782, 'category_id=30', 'printer'),
(783, 'category_id=31', 'scanner'),
(784, 'category_id=32', 'web-camera'),
(852, 'category_id=57', 'tablet'),
(853, 'category_id=17', 'software'),
(854, 'category_id=24', 'smartphone'),
(855, 'category_id=33', 'camera'),
(790, 'category_id=43', 'test11'),
(791, 'category_id=44', 'test12'),
(792, 'category_id=47', 'test15'),
(793, 'category_id=48', 'test16'),
(794, 'category_id=49', 'test17'),
(795, 'category_id=50', 'test18'),
(796, 'category_id=51', 'test19'),
(797, 'category_id=52', 'test20'),
(798, 'category_id=58', 'test25'),
(799, 'category_id=53', 'test21'),
(800, 'category_id=54', 'test22'),
(801, 'category_id=55', 'test23'),
(802, 'category_id=56', 'test24'),
(803, 'category_id=38', 'test4'),
(804, 'category_id=37', 'test5'),
(805, 'category_id=39', 'test6'),
(806, 'category_id=40', 'test7'),
(807, 'category_id=41', 'test8'),
(808, 'category_id=42', 'test9'),
(809, 'product_id=30', 'canon-eos-5d'),
(840, 'product_id=47', 'hp-lp3065'),
(811, 'product_id=28', 'htc-touch-hd'),
(812, 'product_id=43', 'macbook'),
(813, 'product_id=44', 'macbook-air'),
(814, 'product_id=45', 'macbook-pro'),
(816, 'product_id=31', 'nikon-d300'),
(817, 'product_id=29', 'palm-treo-pro'),
(818, 'product_id=35', 'product-8'),
(819, 'product_id=49', 'samsung-galaxy-tab-10-1'),
(820, 'product_id=33', 'samsung-syncmaster-941bw'),
(821, 'product_id=46', 'sony-vaio'),
(823, 'product_id=40', 'iphone'),
(825, 'product_id=36', 'ipod-nano'),
(826, 'product_id=34', 'ipod-shuffle'),
(827, 'product_id=32', 'ipod-touch'),
(828, 'manufacturer_id=9', 'canon'),
(829, 'manufacturer_id=5', 'htc'),
(830, 'manufacturer_id=7', 'hewlett-packard'),
(831, 'manufacturer_id=6', 'palm'),
(832, 'manufacturer_id=10', 'sony'),
(841, 'information_id=6', 'delivery'),
(842, 'information_id=3', 'privacy'),
(843, 'information_id=5', 'terms');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user`
--

CREATE TABLE IF NOT EXISTS `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '1fa00fef7357746e13ed1e3a86656da9101a4346', '1jVGkA4Rx', 'Navneet', 'Prakash', 'hello_navneet@hotmail.com', 'catalog/1.jpg', '', '::1', 1, '2016-03-09 11:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

CREATE TABLE IF NOT EXISTS `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{"access":["analytics\\/google_analytics","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","common\\/menu","common\\/profile","common\\/stats","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/layout","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/total","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/affiliate","module\\/amazon_login","module\\/amazon_pay","module\\/banner","module\\/bestseller","module\\/carousel","module\\/category","module\\/ebay_listing","module\\/featured","module\\/filter","module\\/google_hangouts","module\\/html","module\\/information","module\\/latest","module\\/pp_button","module\\/pp_login","module\\/slideshow","module\\/special","module\\/store","openbay\\/amazon","openbay\\/amazon_listing","openbay\\/amazon_product","openbay\\/amazonus","openbay\\/amazonus_listing","openbay\\/amazonus_product","openbay\\/ebay","openbay\\/ebay_profile","openbay\\/ebay_template","openbay\\/etsy","openbay\\/etsy_product","openbay\\/etsy_shipping","openbay\\/etsy_shop","payment\\/amazon_login_pay","payment\\/authorizenet_aim","payment\\/authorizenet_sim","payment\\/bank_transfer","payment\\/bluepay_hosted","payment\\/bluepay_redirect","payment\\/cheque","payment\\/cod","payment\\/firstdata","payment\\/firstdata_remote","payment\\/free_checkout","payment\\/g2apay","payment\\/globalpay","payment\\/globalpay_remote","payment\\/klarna_account","payment\\/klarna_invoice","payment\\/liqpay","payment\\/nochex","payment\\/paymate","payment\\/paypoint","payment\\/payza","payment\\/perpetual_payments","payment\\/pp_express","payment\\/pp_payflow","payment\\/pp_payflow_iframe","payment\\/pp_pro","payment\\/pp_pro_iframe","payment\\/pp_standard","payment\\/realex","payment\\/realex_remote","payment\\/sagepay_direct","payment\\/sagepay_server","payment\\/sagepay_us","payment\\/securetrading_pp","payment\\/securetrading_ws","payment\\/skrill","payment\\/twocheckout","payment\\/web_payment_software","payment\\/worldpay","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","shipping\\/auspost","shipping\\/citylink","shipping\\/fedex","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/parcelforce_48","shipping\\/pickup","shipping\\/royal_mail","shipping\\/ups","shipping\\/usps","shipping\\/weight","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission","shipping\\/free","module\\/filter","module\\/filter","module\\/journal2","module\\/store","module\\/rgen","payment\\/bank_transfer","payment\\/pp_standard","payment\\/pp_express","payment\\/amazon_login_pay"],"modify":["analytics\\/google_analytics","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","common\\/menu","common\\/profile","common\\/stats","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/layout","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/total","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/affiliate","module\\/amazon_login","module\\/amazon_pay","module\\/banner","module\\/bestseller","module\\/carousel","module\\/category","module\\/ebay_listing","module\\/featured","module\\/filter","module\\/google_hangouts","module\\/html","module\\/information","module\\/latest","module\\/pp_button","module\\/pp_login","module\\/slideshow","module\\/special","module\\/store","openbay\\/amazon","openbay\\/amazon_listing","openbay\\/amazon_product","openbay\\/amazonus","openbay\\/amazonus_listing","openbay\\/amazonus_product","openbay\\/ebay","openbay\\/ebay_profile","openbay\\/ebay_template","openbay\\/etsy","openbay\\/etsy_product","openbay\\/etsy_shipping","openbay\\/etsy_shop","payment\\/amazon_login_pay","payment\\/authorizenet_aim","payment\\/authorizenet_sim","payment\\/bank_transfer","payment\\/bluepay_hosted","payment\\/bluepay_redirect","payment\\/cheque","payment\\/cod","payment\\/firstdata","payment\\/firstdata_remote","payment\\/free_checkout","payment\\/g2apay","payment\\/globalpay","payment\\/globalpay_remote","payment\\/klarna_account","payment\\/klarna_invoice","payment\\/liqpay","payment\\/nochex","payment\\/paymate","payment\\/paypoint","payment\\/payza","payment\\/perpetual_payments","payment\\/pp_express","payment\\/pp_payflow","payment\\/pp_payflow_iframe","payment\\/pp_pro","payment\\/pp_pro_iframe","payment\\/pp_standard","payment\\/realex","payment\\/realex_remote","payment\\/sagepay_direct","payment\\/sagepay_server","payment\\/sagepay_us","payment\\/securetrading_pp","payment\\/securetrading_ws","payment\\/skrill","payment\\/twocheckout","payment\\/web_payment_software","payment\\/worldpay","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","shipping\\/auspost","shipping\\/citylink","shipping\\/fedex","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/parcelforce_48","shipping\\/pickup","shipping\\/royal_mail","shipping\\/ups","shipping\\/usps","shipping\\/weight","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission","shipping\\/free","module\\/filter","module\\/filter","module\\/journal2","module\\/store","module\\/rgen","payment\\/bank_transfer","payment\\/pp_standard","payment\\/pp_express","payment\\/amazon_login_pay"]}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_history`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4232 ;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M''Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu''a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark''unik''', 'GEG', 1),
(184, 11, 'Kotayk''', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik''', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots'' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore''s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel''skaya (Homyel'')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George''s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith''s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M''Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O''Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '''Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma''iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa''id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina''', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina''', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d''Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand''Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Puducherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta''mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be''er Sheva', 'BS', 1),
(1613, 104, 'Bika''at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '''Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al ''Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa''', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa''', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma''an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P''yongan-bukto', 'PYB', 1),
(1769, 112, 'P''yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P''yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 1),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al ''Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra''', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale''s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha''s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al ''Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati''', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke''s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa''id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2737, 176, 'Gomo-Altaysk', 'GO', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul''yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust''-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A''ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa''asaleleaga', 'FA', 1),
(2856, 181, 'Gaga''emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa''itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '''Asir', 'AS', 1),
(2882, 184, 'Ha''il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A''ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t''ou', 'NT', 1),
(3145, 206, 'P''eng-hu', 'PH', 1),
(3146, 206, 'P''ing-tung', 'PT', 1),
(3147, 206, 'T''ai-chung', 'TG', 1),
(3148, 206, 'T''ai-nan', 'TA', 1),
(3149, 206, 'T''ai-pei county', 'TP', 1),
(3150, 206, 'T''ai-tung', 'TT', 1),
(3151, 206, 'T''ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T''ai-chung', 'TH', 1),
(3157, 206, 'T''ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T''ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha''apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava''u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkas''ka Oblast''', '71', 1),
(3481, 220, 'Chernihivs''ka Oblast''', '74', 1),
(3482, 220, 'Chernivets''ka Oblast''', '77', 1),
(3483, 220, 'Crimea', '43', 1),
(3484, 220, 'Dnipropetrovs''ka Oblast''', '12', 1),
(3485, 220, 'Donets''ka Oblast''', '14', 1),
(3486, 220, 'Ivano-Frankivs''ka Oblast''', '26', 1),
(3487, 220, 'Khersons''ka Oblast''', '65', 1),
(3488, 220, 'Khmel''nyts''ka Oblast''', '68', 1),
(3489, 220, 'Kirovohrads''ka Oblast''', '35', 1),
(3490, 220, 'Kyiv', '30', 1),
(3491, 220, 'Kyivs''ka Oblast''', '32', 1),
(3492, 220, 'Luhans''ka Oblast''', '09', 1),
(3493, 220, 'L''vivs''ka Oblast''', '46', 1),
(3494, 220, 'Mykolayivs''ka Oblast''', '48', 1),
(3495, 220, 'Odes''ka Oblast''', '51', 1),
(3496, 220, 'Poltavs''ka Oblast''', '53', 1),
(3497, 220, 'Rivnens''ka Oblast''', '56', 1),
(3498, 220, 'Sevastopol''', '40', 1),
(3499, 220, 'Sums''ka Oblast''', '59', 1),
(3500, 220, 'Ternopil''s''ka Oblast''', '61', 1),
(3501, 220, 'Vinnyts''ka Oblast''', '05', 1),
(3502, 220, 'Volyns''ka Oblast''', '07', 1),
(3503, 220, 'Zakarpats''ka Oblast''', '21', 1),
(3504, 220, 'Zaporiz''ka Oblast''', '23', 1),
(3505, 220, 'Zhytomyrs''ka oblast''', '18', 1),
(3506, 221, 'Abu Dhabi', 'ADH', 1),
(3507, 221, '''Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubai', 'DU', 1),
(3511, 221, 'R''as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg''ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma''rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa''dah', 'SD', 1),
(3805, 235, 'San''a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta''izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Kharkivs''ka Oblast''', '63', 1),
(4225, 118, 'Beirut', 'LB-BR', 1),
(4226, 118, 'Bekaa', 'LB-BE', 1),
(4227, 118, 'Mount Lebanon', 'LB-ML', 1),
(4228, 118, 'Nabatieh', 'LB-NB', 1),
(4229, 118, 'North', 'LB-NR', 1),
(4230, 118, 'South', 'LB-ST', 1),
(4231, 99, 'Telangana', 'TS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'Sebastian', 'Sulinski', 'sebastian.sulinski@gmail.com', 'e6a866daadb723bd5379bb0322ae3c5168ac7e7fc5fe41e2715c680291b9696b53ddb642262aab58a282a85d6e72cf638333be48679a8e66a0b56593d5953620');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE IF NOT EXISTS `business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `website` varchar(200) NOT NULL,
  `vat_rate` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `address`, `telephone`, `email`, `website`, `vat_rate`) VALUES
(1, 'Show with us!', '16 London Road\r\nBrighton\r\nEast Sussex\r\nBN16 2PL', '0845 0994 565', 'business@businessemail.com', 'businessemail.com', '17.50');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Biographies & Autobiographies'),
(2, 'Computers & IT'),
(3, 'Art & Architecture');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `town` varchar(255) NOT NULL,
  `county` varchar(255) NOT NULL,
  `post_code` varchar(10) NOT NULL,
  `country` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country` (`country`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `first_name`, `last_name`, `address_1`, `address_2`, `town`, `county`, `post_code`, `country`, `email`, `password`, `date`, `active`, `hash`) VALUES
(1, 'Sebastian', 'Sulinski', 'Some address', '', 'Bognor Regis', 'West Sussex', 'Post Code', 229, 'sebastian.sulinski@gmail.com', 'b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86', '2010-12-14 18:27:56', 1, '133493328520101214182756968055345');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=244 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`) VALUES
(1, 'Afghanistan', 'AF'),
(2, 'Ãland Islands', 'AX'),
(3, 'Albania', 'AL'),
(4, 'Algeria', 'DZ'),
(5, 'American Samoa', 'AS'),
(6, 'Andorra', 'AD'),
(7, 'Angola', 'AO'),
(8, 'Anguilla', 'AI'),
(9, 'Antarctica', 'AQ'),
(10, 'Antigua And Barbuda', 'AG'),
(11, 'Argentina', 'AR'),
(12, 'Armenia', 'AM'),
(13, 'Aruba', 'AW'),
(14, 'Australia', 'AU'),
(15, 'Austria', 'AT'),
(16, 'Azerbaijan', 'AZ'),
(17, 'Bahamas', 'BS'),
(18, 'Bahrain', 'BH'),
(19, 'Bangladesh', 'BD'),
(20, 'Barbados', 'BB'),
(21, 'Belarus', 'BY'),
(22, 'Belgium', 'BE'),
(23, 'Belize', 'BZ'),
(24, 'Benin', 'BJ'),
(25, 'Bermuda', 'BM'),
(26, 'Bhutan', 'BT'),
(27, 'Bolivia', 'BO'),
(28, 'Bosnia And Herzegovina', 'BA'),
(29, 'Botswana', 'BW'),
(30, 'Bouvet Island', 'BV'),
(31, 'Brazil', 'BR'),
(32, 'British Indian Ocean Territory', 'IO'),
(33, 'Brunei Darussalam', 'BN'),
(34, 'Bulgaria', 'BG'),
(35, 'Burkina Faso', 'BF'),
(36, 'Burundi', 'BI'),
(37, 'Cambodia', 'KH'),
(38, 'Cameroon', 'CM'),
(39, 'Canada', 'CA'),
(40, 'Cape Verde', 'CV'),
(41, 'Cayman Islands', 'KY'),
(42, 'Central African Republic', 'CF'),
(43, 'Chad', 'TD'),
(44, 'Chile', 'CL'),
(45, 'China', 'CN'),
(46, 'Christmas Island', 'CX'),
(47, 'Cocos (keeling) Islands', 'CC'),
(48, 'Colombia', 'CO'),
(49, 'Comoros', 'KM'),
(50, 'Congo', 'CG'),
(51, 'Congo, The Democratic Republic Of', 'CD'),
(52, 'Cook Islands', 'CK'),
(53, 'Costa Rica', 'CR'),
(54, 'Cote D''ivoire', 'CI'),
(55, 'Croatia', 'HR'),
(56, 'Cuba', 'CU'),
(57, 'Cyprus', 'CY'),
(58, 'Czech Republic', 'CZ'),
(59, 'Denmark', 'DK'),
(60, 'Djibouti', 'DJ'),
(61, 'Dominica', 'DM'),
(62, 'Dominican Republic', 'DO'),
(63, 'Ecuador', 'EC'),
(64, 'Egypt', 'EG'),
(65, 'El Salvador', 'SV'),
(66, 'Equatorial Guinea', 'GQ'),
(67, 'Eritrea', 'ER'),
(68, 'Estonia', 'EE'),
(69, 'Ethiopia', 'ET'),
(70, 'Falkland Islands (malvinas)', 'FK'),
(71, 'Faroe Islands', 'FO'),
(72, 'Fiji', 'FJ'),
(73, 'Finland', 'FI'),
(74, 'France', 'FR'),
(75, 'French Guiana', 'GF'),
(76, 'French Polynesia', 'PF'),
(77, 'French Southern Territories', 'TF'),
(78, 'Gabon', 'GA'),
(79, 'Gambia', 'GM'),
(80, 'Georgia', 'GE'),
(81, 'Germany', 'DE'),
(82, 'Ghana', 'GH'),
(83, 'Gibraltar', 'GI'),
(84, 'Greece', 'GR'),
(85, 'Greenland', 'GL'),
(86, 'Grenada', 'GD'),
(87, 'Guadeloupe', 'GP'),
(88, 'Guam', 'GU'),
(89, 'Guatemala', 'GT'),
(90, 'Guernsey', 'GG'),
(91, 'Guinea', 'GN'),
(92, 'Guinea-bissau', 'GW'),
(93, 'Guyana', 'GY'),
(94, 'Haiti', 'HT'),
(95, 'Heard Island And Mcdonald Islands', 'HM'),
(96, 'Holy See (vatican City State)', 'VA'),
(97, 'Honduras', 'HN'),
(98, 'Hong Kong', 'HK'),
(99, 'Hungary', 'HU'),
(100, 'Iceland', 'IS'),
(101, 'India', 'IN'),
(102, 'Indonesia', 'ID'),
(103, 'Iran, Islamic Republic Of', 'IR'),
(104, 'Iraq', 'IQ'),
(105, 'Ireland', 'IE'),
(106, 'Isle Of Man', 'IM'),
(107, 'Israel', 'IL'),
(108, 'Italy', 'IT'),
(109, 'Jamaica', 'JM'),
(110, 'Japan', 'JP'),
(111, 'Jersey', 'JE'),
(112, 'Jordan', 'JO'),
(113, 'Kazakhstan', 'KZ'),
(114, 'Kenya', 'KE'),
(115, 'Kiribati', 'KI'),
(116, 'Korea, Democratic People''s Republic Of', 'KP'),
(117, 'Korea, Republic Of', 'KR'),
(118, 'Kuwait', 'KW'),
(119, 'Kyrgyzstan', 'KG'),
(120, 'Lao People''s Democratic Republic', 'LA'),
(121, 'Latvia', 'LV'),
(122, 'Lebanon', 'LB'),
(123, 'Lesotho', 'LS'),
(124, 'Liberia', 'LR'),
(125, 'Libyan Arab Jamahiriya', 'LY'),
(126, 'Liechtenstein', 'LI'),
(127, 'Lithuania', 'LT'),
(128, 'Luxembourg', 'LU'),
(129, 'Macao', 'MO'),
(130, 'Macedonia, The Former Yugoslav Republic Of', 'MK'),
(131, 'Madagascar', 'MG'),
(132, 'Malawi', 'MW'),
(133, 'Malaysia', 'MY'),
(134, 'Maldives', 'MV'),
(135, 'Mali', 'ML'),
(136, 'Malta', 'MT'),
(137, 'Marshall Islands', 'MH'),
(138, 'Martinique', 'MQ'),
(139, 'Mauritania', 'MR'),
(140, 'Mauritius', 'MU'),
(141, 'Mayotte', 'YT'),
(142, 'Mexico', 'MX'),
(143, 'Micronesia, Federated States Of', 'FM'),
(144, 'Moldova, Republic Of', 'MD'),
(145, 'Monaco', 'MC'),
(146, 'Mongolia', 'MN'),
(147, 'Montserrat', 'MS'),
(148, 'Morocco', 'MA'),
(149, 'Mozambique', 'MZ'),
(150, 'Myanmar', 'MM'),
(151, 'Namibia', 'NA'),
(152, 'Nauru', 'NR'),
(153, 'Nepal', 'NP'),
(154, 'Netherlands', 'NL'),
(155, 'Netherlands Antilles', 'AN'),
(156, 'New Caledonia', 'NC'),
(157, 'New Zealand', 'NZ'),
(158, 'Nicaragua', 'NI'),
(159, 'Niger', 'NE'),
(160, 'Nigeria', 'NG'),
(161, 'Niue', 'NU'),
(162, 'Norfolk Island', 'NF'),
(163, 'Northern Mariana Islands', 'MP'),
(164, 'Norway', 'NO'),
(165, 'Oman', 'OM'),
(166, 'Pakistan', 'PK'),
(167, 'Palau', 'PW'),
(168, 'Palestinian Territory, Occupied', 'PS'),
(169, 'Panama', 'PA'),
(170, 'Papua New Guinea', 'PG'),
(171, 'Paraguay', 'PY'),
(172, 'Peru', 'PE'),
(173, 'Philippines', 'PH'),
(174, 'Pitcairn', 'PN'),
(175, 'Poland', 'PL'),
(176, 'Portugal', 'PT'),
(177, 'Puerto Rico', 'PR'),
(178, 'Qatar', 'QA'),
(179, 'Reunion', 'RE'),
(180, 'Romania', 'RO'),
(181, 'Russian Federation', 'RU'),
(182, 'Rwanda', 'RW'),
(183, 'Saint Helena', 'SH'),
(184, 'Saint Kitts And Nevis', 'KN'),
(185, 'Saint Lucia', 'LC'),
(186, 'Saint Pierre And Miquelon', 'PM'),
(187, 'Saint Vincent And The Grenadines', 'VC'),
(188, 'Samoa', 'WS'),
(189, 'San Marino', 'SM'),
(190, 'Sao Tome And Principe', 'ST'),
(191, 'Saudi Arabia', 'SA'),
(192, 'Senegal', 'SN'),
(193, 'Serbia And Montenegro', 'CS'),
(194, 'Seychelles', 'SC'),
(195, 'Sierra Leone', 'SL'),
(196, 'Singapore', 'SG'),
(197, 'Slovakia', 'SK'),
(198, 'Slovenia', 'SI'),
(199, 'Solomon Islands', 'SB'),
(200, 'Somalia', 'SO'),
(201, 'South Africa', 'ZA'),
(202, 'South Georgia And The South Sandwich Islands', 'GS'),
(203, 'Spain', 'ES'),
(204, 'Sri Lanka', 'LK'),
(205, 'Sudan', 'SD'),
(206, 'Suriname', 'SR'),
(207, 'Svalbard And Jan Mayen', 'SJ'),
(208, 'Swaziland', 'SZ'),
(209, 'Sweden', 'SE'),
(210, 'Switzerland', 'CH'),
(211, 'Syrian Arab Republic', 'SY'),
(212, 'Taiwan, Province Of China', 'TW'),
(213, 'Tajikistan', 'TJ'),
(214, 'Tanzania, United Republic Of', 'TZ'),
(215, 'Thailand', 'TH'),
(216, 'Timor-leste', 'TL'),
(217, 'Togo', 'TG'),
(218, 'Tokelau', 'TK'),
(219, 'Tonga', 'TO'),
(220, 'Trinidad And Tobago', 'TT'),
(221, 'Tunisia', 'TN'),
(222, 'Turkey', 'TR'),
(223, 'Turkmenistan', 'TM'),
(224, 'Turks And Caicos Islands', 'TC'),
(225, 'Tuvalu', 'TV'),
(226, 'Uganda', 'UG'),
(227, 'Ukraine', 'UA'),
(228, 'United Arab Emirates', 'AE'),
(229, 'United Kingdom', 'GB'),
(230, 'United States', 'US'),
(231, 'United States Minor Outlying Islands', 'UM'),
(232, 'Uruguay', 'UY'),
(233, 'Uzbekistan', 'UZ'),
(234, 'Vanuatu', 'VU'),
(235, 'Venezuela', 'VE'),
(236, 'Viet Nam', 'VN'),
(237, 'Virgin Islands, British', 'VG'),
(238, 'Virgin Islands, U.S.', 'VI'),
(239, 'Wallis And Futuna', 'WF'),
(240, 'Western Sahara', 'EH'),
(241, 'Yemen', 'YE'),
(242, 'Zambia', 'ZM'),
(243, 'Zimbabwe', 'ZW');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` int(11) NOT NULL,
  `vat_rate` decimal(5,2) NOT NULL,
  `vat` decimal(8,2) NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `pp_status` tinyint(1) NOT NULL DEFAULT '0',
  `txn_id` varchar(100) DEFAULT NULL,
  `payment_status` varchar(100) DEFAULT NULL,
  `ipn` text,
  `response` varchar(100) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `client` (`client`),
  KEY `fk_stage` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client`, `vat_rate`, `vat`, `subtotal`, `total`, `date`, `status`, `pp_status`, `txn_id`, `payment_status`, `ipn`, `response`, `notes`) VALUES
(1, 1, '17.50', '16.58', '94.75', '111.33', '2010-12-14 19:20:52', 3, 1, 'asdf', 'Completed', NULL, NULL, 'Some notes about the order');

-- --------------------------------------------------------

--
-- Table structure for table `orders_items`
--

CREATE TABLE IF NOT EXISTS `orders_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `order` (`order`,`product`),
  KEY `FK_PRODUCT` (`product`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `orders_items`
--

INSERT INTO `orders_items` (`id`, `order`, `product`, `price`, `qty`) VALUES
(1, 1, 19, '18.95', 5);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `date` datetime NOT NULL,
  `category` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `date`, `category`, `image`) VALUES
(1, 'Lou Reed''s New York', 'After his first book of photographs was published, Lou Reed told a journalist for The Independent on Sunday that, "I live on intuition and taking pictures is intuitive." Here, we see Lou Reed''s intuitive take on New York, the city that has been the fulcrum of his creative world for decades and with which he has become indelibly identified. We''ve heard about the streets and characters for so long through his words and music, and now we can see it through his eyes. Over 100 of Reed''s photographs comprise New York, an intimate view of what inspires him. Hardcover, 9 x 13.5 in./192 pgs / 100 color.', '16.25', '2010-07-19 22:58:30', 1, '41jvrdnqpcl.-ss500-.jpg'),
(2, 'Andy Warhol Prints: A Catalogue Raisonné 1962-1987', 'No one can doubt that Andy Warhol has influenced the American art world both as an artist and as a personality. Feldman and Schellmann''s catalog provides the specialist with a multitude of color images that do much to illuminate Warhol as a printmaker. Unfortunately, the reproductions take up less space than the blank areas surrounding them. These small reproductions are preceded by two brief essays that provide a less-than-adequate introduction to the prints. Geldzahler has only praise for Warhol and dutifully acclaims his ``contribution to art history.'''' Roberta Bernstein''s essay is more substantive; she is more analytical and willing to make critical judgments. Though useful as a catalog of Warhol''s 364 prints, this book is not what it could be. Douglas G. Campbell, Ctr. for Fine Arts, Warner Pacific Coll., Portland, Ore.\r\nCopyright 1985 Reed Business Information, Inc.', '17.50', '2010-07-19 23:01:23', 3, '51msk1xtdbl.-ss500-.jpg'),
(3, 'The Autobiography and Sex Life of Andy Warhol', 'Village Voice and Interview cofounder John Wilcock was first drawn into the milieu of Andy Warhol through filmmaker Jonas Mekas, assisting on some of Warhol''s early films, hanging out at his parties and quickly becoming a regular at the Factory. "About six months after I started hanging out at the old, silvery Factory on West 47th Street," he recalls, "[Gerard] Malanga came up to me and asked, ''When are you going to write something about us?''" Already fascinated by Warhol''s persona, Wilcock went to work, interviewing the artist''s closest associates, supporters and superstars. Among these were Malanga, Naomi Levine, Taylor Mead and Ultra Violet, all of whom had been in the earliest films; scriptwriter Ronnie Tavel, and photographer Gretchen Berg; art dealers Sam Green, Ivan Karp, Eleanor Ward and Leo Castelli, and the Metropolitan Museum of Art''s Henry Geldzahler; the poets Charles Henri Ford and Taylor Mead, and the artist Marisol; and the musicians Lou Reed and Nico. Paul Morrissey supplied the title: The Autobiography and Sex Life of Andy Warhol is the first oral biography of the artist. First published in 1971, and pitched against the colorful backdrop of the 1960s, it assembles a prismatic portrait of one of modern art''s least knowable artists during the early years of his fame. The Autobiography and Sex Life is likely the most revealing portrait of Warhol, being composite instead of singular; each of its interviewees offers a piece of the puzzle that was Andy Warhol. This new edition corrects the many errors of the first, and is beautifully designed in a bright, Warholian palette with numerous illustrations.The British-born writer John Wilcock cofounded The Village Voice in 1955, and went on to edit seminal publications such as The East Village Other, Los Angeles Free Press, Other Scenes and (in 1970) Interview, with Andy Warhol. ', '28.56', '2010-07-19 23:03:29', 1, '51yw-ak9hgl.-ss400-.jpg'),
(13, 'Inside The Actors Studio - Johnny Depp', 'In one of only a handful of interviews Johnny Depp has ever granted, he brings both his fascinating eccentricity and his deep, uncompromising devotion to the craft of acting to the master s degree candidates of the Actors Studio Drama School at Pace University and to the viewers of Inside the Actors Studio in 125 countries around the world. ', '18.54', '2010-07-19 23:13:48', 1, '41tvgoec72l.-ss500-.jpg'),
(14, 'Miles, the Autobiography', 'Miles Davis, with all his faults, flaws and laughable quirks, was still one of the most important musicians of the twentieth century. It takes a book like this where he leaves no stone unturned to make clear the debt we all owe him and his contemporaries, as well as the restless spirit that lead him beyond what he helped to establish as modern jazz. In many ways he shows himself to be, ironically, the archetypal and sterotypical artist simultaneously. Yet his telling of the profound friendships he had with Max Roach and Coltrane, his deep awe and respect but dispassionate eye for the genius and addictions of Charlie Parker, the loves of his life- and what he put them through, and his brutal, courageous hoonesty in general, gives us a gift of his haunting humanity.', '9.68', '2010-07-19 23:19:08', 1, '41pw5c70m-l.-ss500-.jpg'),
(16, 'Dali (Taschen Basic Art Series)', 'Surveys the life and work of the Surrealist artist, and describes how his artistic vision transformed great works from earlier periods in art history. ', '18.48', '2010-07-19 23:22:48', 3, '51xqyzh2hcl.-ss500-.jpg'),
(17, 'Wicked Cool PHP: Real-World Scripts That Solve Difficult Problems', 'Wicked Cool PHP capitalizes on the success of the "Wicked Cool" series from No Starch Press. Rather than focus on the basics of the language, Wicked Cool PHP provides (and explains) PHP scripts that can be implemented immediately to simplify webmasters'' lives. These include unique scripts for processing credit cards, checking for valid email addresses, templating, overriding PHP''s default settings, and serving dynamic images and text. Readers will also find extensive sections on working with forms, words, and files; ways to harden PHP by closing common security holes; and instructions for keeping data and transactions secure. By exploring working code, readers learn how to customize their webserver''s behavior, prevent spammers from adding annoying comments, scrape information from other web sites, and much more. This is a book that''s sure to appeal to PHP programmers who have been there and done that and who want a book that delivers meaty content, not only promise.', '18.67', '2010-07-19 23:27:01', 2, '515htcskybl.-ss500-.jpg'),
(18, 'PHP Objects, Patterns and Practice 3rd Edition', 'This book takes you beyond the PHP basics to the enterprise development practices used by professional programmers. Updated for PHP 5.3 with new sections on closures, namespaces, and continuous integration, this edition will teach you about object features such as abstract classes, reflection, interfaces, and error handling. You''ll also discover object tools to help you learn more about your classes, objects, and methods.\r\n\r\nThen you''ll move into design patterns and the principles that make patterns powerful. You''ll learn both classic design patterns and enterprise and database patterns with easy-to-follow examples.\r\n\r\nFinally, you''ll discover how to put it all into practice to help turn great code into successful projects. You''ll learn how to manage multiple developers with Subversion, and how to build and install using Phing and PEAR. You''ll also learn strategies for automated testing and building, including continuous integration.', '28.91', '2010-07-19 23:28:58', 2, '51s9-bneftl.-ss500-.jpg'),
(19, '50 Artists You Should Know: From Giotto to Warhol', 'This vibrant reference guide profiles 50 major artists alongside their representative works. The entries are presented in an eye-catching format that includes brief biographies, time lines, and critical analyses. Additional information helps readers locate the artist''s work online and in museums, a glossary of important terms, and sidebars highlighting relevant movements and techniques. Arranged chronologically, the selection of artists includes every major artistic movement and development since the Gothic period, giving readers a clear understanding of the evolution of the visual arts. Perfect for casual reading or easy reference, this accessible overview is a fun and practical art history lesson that everyone can enjoy. ', '18.95', '2010-07-20 10:45:16', 3, '51c4k9pth4l.-ss500-.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE IF NOT EXISTS `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Dispatched');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`status`) REFERENCES `statuses` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `orders_items`
--
ALTER TABLE `orders_items`
  ADD CONSTRAINT `orders_items_ibfk_1` FOREIGN KEY (`order`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_items_ibfk_2` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `osticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `ost__search`
--

CREATE TABLE IF NOT EXISTS `ost__search` (
  `object_type` varchar(8) NOT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `title` text,
  `content` text,
  PRIMARY KEY (`object_type`,`object_id`),
  FULLTEXT KEY `search` (`title`,`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost__search`
--

INSERT INTO `ost__search` (`object_type`, `object_id`, `title`, `content`) VALUES
('H', 1, 'osTicket Installed!', 'Thank you for choosing osTicket. Please make sure you join the osTicket forums and our mailing list to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the osTicket wiki provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at http://www.supportsystem.com/ -- no installation required and we can import your data! With SupportSystem''s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. Cheers, - osTicket Team http://osticket.com/ PS. Don''t just make customers happy, make happy customers!'),
('O', 1, 'osTicket', '420 Desoto Street\nAlexandria, LA 71301\n(318) 290-3674\nhttp://osticket.com\nNot only do we develop the software, we also use it to manage support for osTicket. Let us help you quickly implement and leverage the full potential of osTicket''s features and functionality. Contact us for professional support or visit our website for documentation and community support.'),
('T', 1, '897202 osTicket Installed!', ''),
('U', 1, 'osTicket Support', 'support@osticket.com');

-- --------------------------------------------------------

--
-- Table structure for table `ost_api_key`
--

CREATE TABLE IF NOT EXISTS `ost_api_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_exec_cron` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notes` text,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apikey` (`apikey`),
  KEY `ipaddr` (`ipaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_attachment`
--

CREATE TABLE IF NOT EXISTS `ost_attachment` (
  `object_id` int(11) unsigned NOT NULL,
  `type` char(1) NOT NULL,
  `file_id` int(11) unsigned NOT NULL,
  `inline` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`file_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_attachment`
--

INSERT INTO `ost_attachment` (`object_id`, `type`, `file_id`, `inline`) VALUES
(1, 'C', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ost_canned_response`
--

CREATE TABLE IF NOT EXISTS `ost_canned_response` (
  `canned_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`canned_id`),
  UNIQUE KEY `title` (`title`),
  KEY `dept_id` (`dept_id`),
  KEY `active` (`isenabled`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ost_canned_response`
--

INSERT INTO `ost_canned_response` (`canned_id`, `dept_id`, `isenabled`, `title`, `response`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'What is osTicket (sample)?', 'osTicket is a widely-used open source support ticket system, an attractive alternative to higher-cost and complex customer support systems - simple, lightweight, reliable, open source, web-based and easy to setup and use.', 'en_US', '', '2016-03-14 18:52:34', '2016-03-14 18:52:34'),
(2, 0, 1, 'Sample (with variables)', 'Hi %{ticket.name.first}, <br /><br /> Your ticket #%{ticket.number} created on %{ticket.create_date} is in %{ticket.dept.name} department.', 'en_US', '', '2016-03-14 18:52:34', '2016-03-14 18:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `ost_config`
--

CREATE TABLE IF NOT EXISTS `ost_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namespace` (`namespace`,`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=107 ;

--
-- Dumping data for table `ost_config`
--

INSERT INTO `ost_config` (`id`, `namespace`, `key`, `value`, `updated`) VALUES
(1, 'core', 'admin_email', 'hello_navneet@careertech.in', '2016-03-15 10:10:49'),
(2, 'core', 'helpdesk_url', 'http://localhost/osTicket-v1.9.12/upload/', '2016-03-14 13:22:35'),
(3, 'core', 'helpdesk_title', 'CareerTech', '2016-03-14 13:22:35'),
(4, 'core', 'schema_signature', 'b26f29a6bb5dbb3510b057632182d138', '2016-03-14 13:22:35'),
(5, 'dept.1', 'assign_members_only', '', '2016-03-14 13:22:33'),
(6, 'dept.2', 'assign_members_only', '', '2016-03-14 13:22:33'),
(7, 'dept.3', 'assign_members_only', '', '2016-03-14 13:22:33'),
(8, 'sla.1', 'transient', '0', '2016-03-14 13:22:33'),
(9, 'list.1', 'configuration', '{"handler":"TicketStatusList"}', '2016-03-14 13:22:33'),
(10, 'core', 'time_format', 'h:i A', '2016-03-14 13:22:34'),
(11, 'core', 'date_format', 'm/d/Y', '2016-03-14 13:22:34'),
(12, 'core', 'datetime_format', 'm/d/Y g:i a', '2016-03-14 13:22:34'),
(13, 'core', 'daydatetime_format', 'D, M j Y g:ia', '2016-03-14 13:22:34'),
(14, 'core', 'default_timezone_id', '22', '2016-03-14 15:03:54'),
(15, 'core', 'default_priority_id', '2', '2016-03-14 13:22:34'),
(16, 'core', 'enable_daylight_saving', '0', '2016-03-14 13:22:34'),
(17, 'core', 'reply_separator', '-- reply above this line --', '2016-03-14 13:22:34'),
(18, 'core', 'isonline', '1', '2016-03-14 13:22:34'),
(19, 'core', 'staff_ip_binding', '0', '2016-03-14 13:22:34'),
(20, 'core', 'staff_max_logins', '4', '2016-03-14 13:22:34'),
(21, 'core', 'staff_login_timeout', '2', '2016-03-14 13:22:34'),
(22, 'core', 'staff_session_timeout', '30', '2016-03-14 13:22:34'),
(23, 'core', 'passwd_reset_period', '6', '2016-03-14 15:16:12'),
(24, 'core', 'client_max_logins', '4', '2016-03-14 13:22:34'),
(25, 'core', 'client_login_timeout', '2', '2016-03-14 13:22:34'),
(26, 'core', 'client_session_timeout', '30', '2016-03-14 13:22:34'),
(27, 'core', 'max_page_size', '25', '2016-03-14 13:22:34'),
(28, 'core', 'max_open_tickets', '0', '2016-03-14 13:22:34'),
(29, 'core', 'autolock_minutes', '3', '2016-03-14 13:22:34'),
(30, 'core', 'default_smtp_id', '0', '2016-03-14 13:22:34'),
(31, 'core', 'use_email_priority', '1', '2016-03-15 10:10:17'),
(32, 'core', 'enable_kb', '0', '2016-03-14 13:22:34'),
(33, 'core', 'enable_premade', '1', '2016-03-14 13:22:34'),
(34, 'core', 'enable_captcha', '0', '2016-03-14 13:22:34'),
(35, 'core', 'enable_auto_cron', '0', '2016-03-14 13:22:34'),
(36, 'core', 'enable_mail_polling', '1', '2016-03-15 10:10:17'),
(37, 'core', 'send_sys_errors', '1', '2016-03-14 13:22:34'),
(38, 'core', 'send_sql_errors', '1', '2016-03-14 13:22:34'),
(39, 'core', 'send_login_errors', '1', '2016-03-14 13:22:34'),
(40, 'core', 'save_email_headers', '1', '2016-03-14 13:22:34'),
(41, 'core', 'strip_quoted_reply', '1', '2016-03-14 13:22:34'),
(42, 'core', 'ticket_autoresponder', '0', '2016-03-14 13:22:34'),
(43, 'core', 'message_autoresponder', '0', '2016-03-14 13:22:34'),
(44, 'core', 'ticket_notice_active', '1', '2016-03-14 13:22:34'),
(45, 'core', 'ticket_alert_active', '1', '2016-03-14 13:22:34'),
(46, 'core', 'ticket_alert_admin', '1', '2016-03-14 13:22:34'),
(47, 'core', 'ticket_alert_dept_manager', '1', '2016-03-14 13:22:34'),
(48, 'core', 'ticket_alert_dept_members', '0', '2016-03-14 13:22:34'),
(49, 'core', 'message_alert_active', '1', '2016-03-14 13:22:34'),
(50, 'core', 'message_alert_laststaff', '1', '2016-03-14 13:22:34'),
(51, 'core', 'message_alert_assigned', '1', '2016-03-14 13:22:34'),
(52, 'core', 'message_alert_dept_manager', '0', '2016-03-14 13:22:34'),
(53, 'core', 'note_alert_active', '0', '2016-03-14 13:22:34'),
(54, 'core', 'note_alert_laststaff', '1', '2016-03-14 13:22:34'),
(55, 'core', 'note_alert_assigned', '1', '2016-03-14 13:22:34'),
(56, 'core', 'note_alert_dept_manager', '0', '2016-03-14 13:22:34'),
(57, 'core', 'transfer_alert_active', '0', '2016-03-14 13:22:34'),
(58, 'core', 'transfer_alert_assigned', '0', '2016-03-14 13:22:34'),
(59, 'core', 'transfer_alert_dept_manager', '1', '2016-03-14 13:22:34'),
(60, 'core', 'transfer_alert_dept_members', '0', '2016-03-14 13:22:34'),
(61, 'core', 'overdue_alert_active', '1', '2016-03-14 13:22:34'),
(62, 'core', 'overdue_alert_assigned', '1', '2016-03-14 13:22:34'),
(63, 'core', 'overdue_alert_dept_manager', '1', '2016-03-14 13:22:34'),
(64, 'core', 'overdue_alert_dept_members', '0', '2016-03-14 13:22:34'),
(65, 'core', 'assigned_alert_active', '1', '2016-03-14 13:22:34'),
(66, 'core', 'assigned_alert_staff', '1', '2016-03-14 13:22:34'),
(67, 'core', 'assigned_alert_team_lead', '0', '2016-03-14 13:22:34'),
(68, 'core', 'assigned_alert_team_members', '0', '2016-03-14 13:22:34'),
(69, 'core', 'auto_claim_tickets', '1', '2016-03-14 13:22:34'),
(70, 'core', 'show_related_tickets', '0', '2016-03-14 15:11:28'),
(71, 'core', 'show_assigned_tickets', '1', '2016-03-14 13:22:34'),
(72, 'core', 'show_answered_tickets', '0', '2016-03-14 13:22:34'),
(73, 'core', 'hide_staff_name', '0', '2016-03-14 13:22:34'),
(74, 'core', 'overlimit_notice_active', '0', '2016-03-14 13:22:34'),
(75, 'core', 'email_attachments', '1', '2016-03-14 13:22:34'),
(76, 'core', 'number_format', '######', '2016-03-14 13:22:34'),
(77, 'core', 'sequence_id', '0', '2016-03-14 13:22:34'),
(78, 'core', 'log_level', '2', '2016-03-14 13:22:34'),
(79, 'core', 'log_graceperiod', '12', '2016-03-14 13:22:34'),
(80, 'core', 'client_registration', 'closed', '2016-03-14 15:16:12'),
(81, 'core', 'max_file_size', '33554432', '2016-03-14 13:22:34'),
(82, 'core', 'landing_page_id', '1', '2016-03-14 13:22:34'),
(83, 'core', 'thank-you_page_id', '2', '2016-03-14 13:22:34'),
(84, 'core', 'offline_page_id', '3', '2016-03-14 13:22:34'),
(85, 'core', 'system_language', 'en_US', '2016-03-14 13:22:34'),
(86, 'mysqlsearch', 'reindex', '0', '2016-03-14 13:28:21'),
(87, 'core', 'default_email_id', '3', '2016-03-15 10:10:17'),
(88, 'core', 'alert_email_id', '2', '2016-03-14 13:22:35'),
(89, 'core', 'default_dept_id', '1', '2016-03-14 13:22:35'),
(90, 'core', 'default_sla_id', '1', '2016-03-14 13:22:35'),
(91, 'core', 'default_template_id', '2', '2016-03-15 10:10:17'),
(92, 'core', 'client_logo_id', '4', '2016-03-15 10:41:37'),
(93, 'core', 'staff_logo_id', '4', '2016-03-15 10:41:37'),
(94, 'core', 'name_format', 'full', '2016-03-14 15:03:54'),
(95, 'core', 'default_help_topic', '11', '2016-03-14 15:11:28'),
(96, 'core', 'default_ticket_status_id', '1', '2016-03-14 15:11:28'),
(97, 'core', 'enable_html_thread', '1', '2016-03-14 15:11:28'),
(98, 'core', 'allow_client_updates', '0', '2016-03-14 15:11:28'),
(99, 'core', 'allow_pw_reset', '1', '2016-03-14 15:16:12'),
(100, 'core', 'pw_reset_window', '30', '2016-03-14 15:16:12'),
(101, 'core', 'clients_only', '1', '2016-03-14 15:16:12'),
(102, 'core', 'client_verify_email', '1', '2016-03-14 15:16:12'),
(103, 'staff.1', 'lang', '', '2016-03-15 10:04:00'),
(104, 'core', 'verify_email_addrs', '1', '2016-03-15 10:10:17'),
(105, 'core', 'accept_unregistered_email', '1', '2016-03-15 10:10:17'),
(106, 'core', 'add_email_collabs', '1', '2016-03-15 10:10:17');

-- --------------------------------------------------------

--
-- Table structure for table `ost_content`
--

CREATE TABLE IF NOT EXISTS `ost_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT 'other',
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ost_content`
--

INSERT INTO `ost_content` (`id`, `content_id`, `isactive`, `type`, `name`, `body`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 1, 1, 'landing', 'Landing', '<h1>Welcome to the Support Center</h1> <p> In order to streamline support requests and better serve you, we utilize a support ticket system. Every support request is assigned a unique ticket number which you can use to track the progress and responses online. For your reference we provide complete archives and history of all your support requests. A valid email address is required to submit a ticket. </p>', 'en_US', 'The Landing Page refers to the content of the Customer Portal''s initial view. The template modifies the content seen above the two links <strong>Open a New Ticket</strong> and <strong>Check Ticket Status</strong>.', '2016-03-14 18:52:34', '2016-03-14 18:52:34'),
(2, 2, 1, 'thank-you', 'Thank You', '<div>%{ticket.name},\n<br>\n<br>\nThank you for contacting us.\n<br>\n<br>\nA support ticket request has been created and a representative will be\ngetting back to you shortly if necessary.</p>\n<br>\n<br>\nSupport Team\n</div>', 'en_US', 'This template defines the content displayed on the Thank-You page after a\nClient submits a new ticket in the Client Portal.', '2016-03-14 18:52:34', '2016-03-14 18:52:34'),
(3, 3, 1, 'offline', 'Offline', '<div><h1>\n<span style="font-size: medium">Support Ticket System Offline</span>\n</h1>\n<p>Thank you for your interest in contacting us.</p>\n<p>Our helpdesk is offline at the moment, please check back at a later\ntime.</p>\n</div>', 'en_US', 'The Offline Page appears in the Customer Portal when the Help Desk is offline.', '2016-03-14 18:52:34', '2016-03-14 18:52:34'),
(4, 4, 1, 'registration-staff', 'Welcome to osTicket', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We''ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href="%{link}">%{link}</a><br /> <br /> <em style="font-size: small">Your friendly Customer Support System<br /> %{company.name}</em> </div>', 'en_US', 'This template defines the initial email (optional) sent to Agents when an account is created on their behalf.', '2016-03-14 18:52:34', '2016-03-14 18:52:34'),
(5, 5, 1, 'pwreset-staff', 'osTicket Staff Password Reset', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href="%{link}">%{link}</a><br /> <br /> <em style="font-size: small">Your friendly Customer Support System</em> <br /> <img src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" alt="Powered by osTicket" width="126" height="19" style="width: 126px" /> </div>', 'en_US', 'This template defines the email sent to Staff who select the <strong>Forgot My Password</strong> link on the Staff Control Panel Log In page.', '2016-03-14 18:52:34', '2016-03-14 18:52:34'),
(6, 6, 1, 'banner-staff', 'Authentication Required', '', 'en_US', 'This is the initial message and banner shown on the Staff Log In page. The first input field refers to the red-formatted text that appears at the top. The latter textarea is for the banner content which should serve as a disclaimer.', '2016-03-14 18:52:34', '2016-03-14 18:52:34'),
(7, 7, 1, 'registration-client', 'Welcome to %{company.name}', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We''ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href="%{link}">%{link}</a><br /> <br /> <em style="font-size: small">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'en_US', 'This template defines the email sent to Clients when their account has been created in the Client Portal or by an Agent on their behalf. This email serves as an email address verification. Please use %{link} somewhere in the body.', '2016-03-14 18:52:34', '2016-03-14 18:52:34'),
(8, 8, 1, 'pwreset-client', '%{company.name} Help Desk Access', '<h3><strong>Hi %{user.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href="%{link}">%{link}</a><br /> <br /> <em style="font-size: small">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'en_US', 'This template defines the email sent to Clients who select the <strong>Forgot My Password</strong> link on the Client Log In page.', '2016-03-14 18:52:34', '2016-03-14 18:52:34'),
(9, 9, 1, 'banner-client', 'Sign in to %{company.name}', 'To better serve you, we encourage our Clients to register for an account.', 'en_US', 'This composes the header on the Client Log In page. It can be useful to inform your Clients about your log in and registration policies.', '2016-03-14 18:52:34', '2016-03-14 18:52:34'),
(10, 10, 1, 'registration-confirm', 'Account registration', '<div><strong>Thanks for registering for an account.</strong><br/> <br /> We''ve just sent you an email to the address you entered. Please follow the link in the email to confirm your account and gain access to your tickets. </div>', 'en_US', 'This templates defines the page shown to Clients after completing the registration form. The template should mention that the system is sending them an email confirmation link and what is the next step in the registration process.', '2016-03-14 18:52:34', '2016-03-14 18:52:34'),
(11, 11, 1, 'registration-thanks', 'Account Confirmed!', '<div> <strong>Thanks for registering for an account.</strong><br /> <br /> You''ve confirmed your email address and successfully activated your account. You may proceed to open a new ticket or manage existing tickets.<br /> <br /> <em>Your friendly support center</em><br /> %{company.name} </div>', 'en_US', 'This template defines the content displayed after Clients successfully register by confirming their account. This page should inform the user that registration is complete and that the Client can now submit a ticket or access existing tickets.', '2016-03-14 18:52:34', '2016-03-14 18:52:34'),
(12, 12, 1, 'access-link', 'Ticket [#%{ticket.number}] Access Link', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> An access link request for ticket #%{ticket.number} has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> Follow the link below to check the status of the ticket #%{ticket.number}.<br /> <br /> <a href="%{recipient.ticket_link}">%{recipient.ticket_link}</a><br /> <br /> If you <strong>did not</strong> make the request, please delete and disregard this email. Your account is still secure and no one has been given access to the ticket. Someone could have mistakenly entered your email address.<br /> <br /> --<br /> %{company.name} </div>', 'en_US', 'This template defines the notification for Clients that an access link was sent to their email. The ticket number and email address trigger the access link.', '2016-03-14 18:52:34', '2016-03-14 18:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `ost_department`
--

CREATE TABLE IF NOT EXISTS `ost_department` (
  `dept_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tpl_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `autoresp_email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `manager_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_name` varchar(128) NOT NULL DEFAULT '',
  `dept_signature` text NOT NULL,
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_membership` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `dept_name` (`dept_name`),
  KEY `manager_id` (`manager_id`),
  KEY `autoresp_email_id` (`autoresp_email_id`),
  KEY `tpl_id` (`tpl_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ost_department`
--

INSERT INTO `ost_department` (`dept_id`, `tpl_id`, `sla_id`, `email_id`, `autoresp_email_id`, `manager_id`, `dept_name`, `dept_signature`, `ispublic`, `group_membership`, `ticket_auto_response`, `message_auto_response`, `updated`, `created`) VALUES
(1, 0, 0, 0, 0, 0, 'Support', 'Support Department', 1, 1, 1, 1, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(2, 0, 1, 0, 0, 0, 'Sales', 'Sales and Customer Retention', 1, 1, 1, 1, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(3, 0, 0, 0, 0, 0, 'Maintenance', 'Maintenance Department', 0, 0, 1, 1, '2016-03-14 18:52:33', '2016-03-14 18:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_draft`
--

CREATE TABLE IF NOT EXISTS `ost_draft` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) unsigned NOT NULL,
  `namespace` varchar(32) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `extra` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_draft`
--

INSERT INTO `ost_draft` (`id`, `staff_id`, `namespace`, `body`, `extra`, `created`, `updated`) VALUES
(1, 1, 'email.diag', '', NULL, '2016-03-14 15:30:09', '2016-03-15 10:56:20');

-- --------------------------------------------------------

--
-- Table structure for table `ost_email`
--

CREATE TABLE IF NOT EXISTS `ost_email` (
  `email_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `noautoresp` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(11) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `userid` varchar(255) NOT NULL,
  `userpass` varchar(255) CHARACTER SET ascii NOT NULL,
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_host` varchar(255) NOT NULL,
  `mail_protocol` enum('POP','IMAP') NOT NULL DEFAULT 'POP',
  `mail_encryption` enum('NONE','SSL') NOT NULL,
  `mail_port` int(6) DEFAULT NULL,
  `mail_fetchfreq` tinyint(3) NOT NULL DEFAULT '5',
  `mail_fetchmax` tinyint(4) NOT NULL DEFAULT '30',
  `mail_archivefolder` varchar(255) DEFAULT NULL,
  `mail_delete` tinyint(1) NOT NULL DEFAULT '0',
  `mail_errors` tinyint(3) NOT NULL DEFAULT '0',
  `mail_lasterror` datetime DEFAULT NULL,
  `mail_lastfetch` datetime DEFAULT NULL,
  `smtp_active` tinyint(1) DEFAULT '0',
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int(6) DEFAULT NULL,
  `smtp_secure` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_spoofing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email` (`email`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ost_email`
--

INSERT INTO `ost_email` (`email_id`, `noautoresp`, `priority_id`, `dept_id`, `topic_id`, `email`, `name`, `userid`, `userpass`, `mail_active`, `mail_host`, `mail_protocol`, `mail_encryption`, `mail_port`, `mail_fetchfreq`, `mail_fetchmax`, `mail_archivefolder`, `mail_delete`, `mail_errors`, `mail_lasterror`, `mail_lastfetch`, `smtp_active`, `smtp_host`, `smtp_port`, `smtp_secure`, `smtp_auth`, `smtp_spoofing`, `notes`, `created`, `updated`) VALUES
(1, 0, 2, 1, 0, 'info@careertech.in', 'Support', '', '', 0, '', 'POP', 'NONE', NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, NULL, '2016-03-14 18:52:35', '2016-03-14 18:52:35'),
(2, 0, 2, 1, 0, 'alerts@careertech.in', 'Ticket Alerts', '', '', 0, '', 'POP', 'NONE', 0, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', 0, 1, 1, 0, '', '2016-03-14 18:52:35', '2016-03-14 20:58:50'),
(3, 0, 2, 1, 0, 'noreply@careertech.in', '', '', '', 0, '', 'POP', 'NONE', NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, NULL, '2016-03-14 18:52:35', '2016-03-14 18:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_account`
--

CREATE TABLE IF NOT EXISTS `ost_email_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `protocol` varchar(64) NOT NULL DEFAULT '',
  `host` varchar(128) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `options` varchar(512) DEFAULT NULL,
  `errors` int(11) unsigned DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `lastconnect` timestamp NULL DEFAULT NULL,
  `lasterror` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_template`
--

CREATE TABLE IF NOT EXISTS `ost_email_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tpl_id` int(11) unsigned NOT NULL,
  `code_name` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_lookup` (`tpl_id`,`code_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `ost_email_template`
--

INSERT INTO `ost_email_template` (`id`, `tpl_id`, `code_name`, `subject`, `body`, `notes`, `created`, `updated`) VALUES
(14, 2, 'ticket.autoresp', 'Support Ticket Opened [#%{ticket.number}]', ' <h3><strong>Dear %{recipient.name.first},</strong></h3> <p> A request for support has been created and assigned #%{ticket.number}. A representative will follow-up with you as soon as possible. You can <a href="%%7Brecipient.ticket_link%7D">view this ticket''s progress online</a>. </p> <br /><div style="color:rgb(127, 127, 127)"> Your %{company.name} Team, <br /> %{signature} </div> <hr /> <div style="color:rgb(127, 127, 127);font-size:small"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href="%%7Brecipient.ticket_link%7D"><span style="color:rgb(84, 141, 212)">login to your account</span></a> for a complete archive of your support requests.</em></div> ', NULL, '2016-03-15 15:39:48', '2016-03-15 15:39:48'),
(15, 2, 'ticket.autoreply', 'Re: %{ticket.subject} [#%{ticket.number}]', ' <h3><strong>Dear %{recipient.name.first},</strong></h3> A request for support has been created and assigned ticket <a href="%%7Brecipient.ticket_link%7D">#%{ticket.number}</a> with the following automatic reply <br /><br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /><br /> %{response} <br /><br /><div style="color:rgb(127, 127, 127)">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style="color:rgb(127, 127, 127);font-size:small"><em>We hope this response has sufficiently answered your questions. If you wish to provide additional comments or informatione, please reply to this email or <a href="%%7Brecipient.ticket_link%7D"><span style="color:rgb(84, 141, 212)">login to your account</span></a> for a complete archive of your support requests.</em></div> ', NULL, '2016-03-15 15:39:48', '2016-03-15 15:39:48'),
(16, 2, 'message.autoresp', 'Message Confirmation', ' <h3><strong>Dear %{recipient.name.first},</strong></h3> Your reply to support request <a href="%%7Brecipient.ticket_link%7D">#%{ticket.number}</a> has been noted <br /><br /><div style="color:rgb(127, 127, 127)"> Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style="color:rgb(127, 127, 127);font-size:small;text-align:center"> <em>You can view the support request progress <a href="%%7Brecipient.ticket_link%7D">online here</a></em> </div> ', NULL, '2016-03-15 15:39:48', '2016-03-15 15:39:48'),
(17, 2, 'ticket.notice', '%{ticket.subject} [#%{ticket.number}]', ' <h3><strong>Dear %{recipient.name.first},</strong></h3> Our customer care team has created a ticket, <a href="%%7Brecipient.ticket_link%7D">#%{ticket.number}</a> on your behalf, with the following details and summary: <br /><br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /><br /> %{message} <br /><br /> If need be, a representative will follow-up with you as soon as possible. You can also <a href="%%7Brecipient.ticket_link%7D">view this ticket''s progress online</a>. <br /><br /><div style="color:rgb(127, 127, 127)"> Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style="color:rgb(127, 127, 127);font-size:small"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href="%%7Brecipient.ticket_link%7D"><span style="color:rgb(84, 141, 212)">login to your account</span></a> for a complete archive of your support requests.</em></div> ', NULL, '2016-03-15 15:39:48', '2016-03-15 15:39:48'),
(18, 2, 'ticket.overlimit', 'Open Tickets Limit Reached', ' <h3><strong>Dear %{ticket.name.first},</strong></h3> You have reached the maximum number of open tickets allowed. To be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply <a href="%%7Burl%7D/tickets.php?e=%%7Bticket.email%7D">login to our helpdesk</a>. <br /><br /> Thank you,<br /> Support Ticket System', NULL, '2016-03-15 15:39:48', '2016-03-15 15:39:48'),
(19, 2, 'ticket.reply', 'Re: %{ticket.subject} [#%{ticket.number}]', ' <h3><strong>Dear %{recipient.name},</strong></h3> %{response} <br /><br /><div style="color:rgb(127, 127, 127)"> Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style="color:rgb(127, 127, 127);font-size:small;text-align:center"><em>We hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or <a href="%%7Brecipient.ticket_link%7D" style="color:rgb(84, 141, 212)">login to your account</a> for a complete archive of all your support requests and responses.</em></div> ', NULL, '2016-03-15 15:39:48', '2016-03-15 15:39:48'),
(20, 2, 'ticket.activity.notice', 'Re: %{ticket.subject} [#%{ticket.number}]', ' <h3><strong>Dear %{recipient.name.first},</strong></h3> <div> <em>%{poster.name}</em> just logged a message to a ticket in which you participate. </div> <br /> %{message} <br /><br /><hr /> <div style="color:rgb(127, 127, 127);font-size:small;text-align:center"> <em>You''re getting this email because you are a collaborator on ticket <a href="%%7Brecipient.ticket_link%7D" style="color:rgb(84, 141, 212)">#%{ticket.number}</a>. To participate, simply reply to this email or <a href="%%7Brecipient.ticket_link%7D" style="color:rgb(84, 141, 212)">click here</a> for a complete archive of the ticket thread.</em> </div> ', NULL, '2016-03-15 15:39:48', '2016-03-15 15:39:48'),
(21, 2, 'ticket.alert', 'New Ticket Alert', ' <h2>Hi %{recipient.name},</h2> New ticket #%{ticket.number} created <br /><br /><table><tbody> <tr> <td> <strong>From</strong>: </td> <td> %{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr> <td> <strong>Department</strong>: </td> <td> %{ticket.dept.name} </td> </tr> </tbody></table> <br /> %{message} <br /><br /><hr /> <div>To view or respond to the ticket, please <a href="%%7Bticket.staff_link%7D">login</a> to the support ticket system</div> <em style="font-size:small">Your friendly Customer Support System</em> <br /><a href="http://osticket.com/"><img width="126" height="19" style="width:126px" alt="Powered By osTicket" src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" /></a> ', NULL, '2016-03-15 15:39:48', '2016-03-15 15:39:48'),
(22, 2, 'message.alert', 'New Message Alert', ' <h3><strong>Hi %{recipient.name},</strong></h3> New message appended to ticket <a href="%%7Bticket.staff_link%7D">#%{ticket.number}</a> <br /><br /><table><tbody> <tr> <td> <strong>From</strong>: </td> <td> %{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr> <td> <strong>Department</strong>: </td> <td> %{ticket.dept.name} </td> </tr> </tbody></table> <br /> %{message} <br /><br /><hr /> <div>To view or respond to the ticket, please <a href="%%7Bticket.staff_link%7D"><span style="color:rgb(84, 141, 212)">login</span></a> to the support ticket system</div> <em style="color:rgb(127,127,127);font-size:small">Your friendly Customer Support System</em><br /><img src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" alt="Powered by osTicket" width="126" height="19" style="width:126px" /> ', NULL, '2016-03-15 15:39:48', '2016-03-15 15:39:48'),
(23, 2, 'note.alert', 'New Internal Activity Alert', ' <h3><strong>Hi %{recipient.name},</strong></h3> An agent has logged activity on ticket <a href="%%7Bticket.staff_link%7D">#%{ticket.number}</a> <br /><br /><table><tbody> <tr> <td> <strong>From</strong>: </td> <td> %{note.poster} </td> </tr> <tr> <td> <strong>Title</strong>: </td> <td> %{note.title} </td> </tr> </tbody></table> <br /> %{note.message} <br /><br /><hr /> To view/respond to the ticket, please <a href="%%7Bticket.staff_link%7D">login</a> to the support ticket system <br /><br /><em style="font-size:small">Your friendly Customer Support System</em> <br /><img src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" alt="Powered by osTicket" width="126" height="19" style="width:126px" /> ', NULL, '2016-03-15 15:39:48', '2016-03-15 15:39:48'),
(24, 2, 'assigned.alert', 'Ticket Assigned to you', ' <h3><strong>Hi %{assignee.name.first},</strong></h3> Ticket <a href="%%7Bticket.staff_link%7D">#%{ticket.number}</a> has been assigned to you by %{assigner.name.short} <br /><br /><table><tbody> <tr> <td> <strong>From</strong>: </td> <td> %{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr> <td> <strong>Subject</strong>: </td> <td> %{ticket.subject} </td> </tr> </tbody></table> <br /> %{comments} <br /><br /><hr /> <div>To view/respond to the ticket, please <a href="%%7Bticket.staff_link%7D"><span style="color:rgb(84, 141, 212)">login</span></a> to the support ticket system</div> <em style="font-size:small">Your friendly Customer Support System</em> <br /><img src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" alt="Powered by osTicket" width="126" height="19" style="width:126px" /> ', NULL, '2016-03-15 15:39:48', '2016-03-15 15:39:48'),
(25, 2, 'transfer.alert', 'Ticket #%{ticket.number} transfer - %{ticket.dept.name}', ' <h3>Hi %{recipient.name},</h3> Ticket <a href="%%7Bticket.staff_link%7D">#%{ticket.number}</a> has been transferred to the %{ticket.dept.name} department by <strong>%{staff.name.short}</strong> <br /><br /><blockquote> %{comments} </blockquote> <hr /> <div>To view or respond to the ticket, please <a href="%%7Bticket.staff_link%7D">login</a> to the support ticket system. </div> <em style="font-size:small">Your friendly Customer Support System</em> <br /><a href="http://osticket.com/"><img width="126" height="19" alt="Powered By osTicket" style="width:126px" src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" /></a> ', NULL, '2016-03-15 15:39:48', '2016-03-15 15:39:48'),
(26, 2, 'ticket.overdue', 'Stale Ticket Alert', ' <h3> <strong>Hi %{recipient.name}</strong>,</h3> A ticket, <a href="%%7Bticket.staff_link%7D">#%{ticket.number}</a> is seriously overdue. <br /><br /> We should all work hard to guarantee that all tickets are being addressed in a timely manner. <br /><br /> Signed,<br /> %{ticket.dept.manager.name} <hr /> <div>To view or respond to the ticket, please <a href="%%7Bticket.staff_link%7D"><span style="color:rgb(84, 141, 212)">login</span></a> to the support ticket system. You''re receiving this notice because the ticket is assigned directly to you or to a team or department of which you''re a member.</div> <em style="font-size:small">Your friendly <span style="font-size:smaller">(although with limited patience)</span> Customer Support System</em><br /><img src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" height="19" alt="Powered by osTicket" width="126" style="width:126px" /> ', NULL, '2016-03-15 15:39:48', '2016-03-15 15:39:48');

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_template_group`
--

CREATE TABLE IF NOT EXISTS `ost_email_template_group` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL,
  PRIMARY KEY (`tpl_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ost_email_template_group`
--

INSERT INTO `ost_email_template_group` (`tpl_id`, `isactive`, `name`, `lang`, `notes`, `created`, `updated`) VALUES
(2, 1, 'CareerTech Default Template', 'en_US', '', '2016-03-15 15:39:48', '2016-03-15 10:09:48');

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq`
--

CREATE TABLE IF NOT EXISTS `ost_faq` (
  `faq_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ispublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`faq_id`),
  UNIQUE KEY `question` (`question`),
  KEY `category_id` (`category_id`),
  KEY `ispublished` (`ispublished`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq_category`
--

CREATE TABLE IF NOT EXISTS `ost_faq_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `ispublic` (`ispublic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq_topic`
--

CREATE TABLE IF NOT EXISTS `ost_faq_topic` (
  `faq_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`faq_id`,`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_file`
--

CREATE TABLE IF NOT EXISTS `ost_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ft` char(1) NOT NULL DEFAULT 'T',
  `bk` char(1) NOT NULL DEFAULT 'D',
  `type` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `key` varchar(86) CHARACTER SET ascii NOT NULL,
  `signature` varchar(86) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `attrs` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ft` (`ft`),
  KEY `key` (`key`),
  KEY `signature` (`signature`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ost_file`
--

INSERT INTO `ost_file` (`id`, `ft`, `bk`, `type`, `size`, `key`, `signature`, `name`, `attrs`, `created`) VALUES
(1, 'T', 'D', 'image/png', 9452, 'b56944cb4722cc5cda9d1e23a3ea7fbc', 'gjMyblHhAxCQvzLfPBW3EjMUY1AmQQmz', 'powered-by-osticket.png', NULL, '2016-03-14 18:52:34'),
(2, 'T', 'D', 'text/plain', 24, 'WmC4lMWtx86n3ccfeGGNagoRoTDtol7o', 'MWtx86n3ccfeGGNafaacpitTxmJ4h3Ls', 'osTicket.txt', NULL, '2016-03-14 18:52:34'),
(4, 'L', 'D', 'image/png', 11482, 'sD_wgc4at-whtdVXAZCtN_xo9Ah4lSBY', 'c4at-whtdVXAZCtNPrQ3Y90pnlXmguQQ', 'clogo.png', NULL, '2016-03-15 16:11:27');

-- --------------------------------------------------------

--
-- Table structure for table `ost_file_chunk`
--

CREATE TABLE IF NOT EXISTS `ost_file_chunk` (
  `file_id` int(11) NOT NULL,
  `chunk_id` int(11) NOT NULL,
  `filedata` longblob NOT NULL,
  PRIMARY KEY (`file_id`,`chunk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_file_chunk`
--

INSERT INTO `ost_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(1, 0, 0x89504e470d0a1a0a0000000d49484452000000da0000002808060000009847e4c900000a43694343504943432070726f66696c65000078da9d53775893f7163edff7650f5642d8f0b1976c81002223ac08c81059a21092006184101240c585880a561415119c4855c482d50a489d88e2a028b867418a885a8b555c38ee1fdca7b57d7aefededfbd7fbbce79ce7fcce79cf0f8011122691e6a26a003952853c3ad81f8f4f48c4c9bd80021548e0042010e6cbc26705c50000f00379787e74b03ffc01af6f00020070d52e2412c7e1ff83ba50265700209100e02212e70b01905200c82e54c81400c81800b053b3640a009400006c797c422200aa0d00ecf4493e0500d8a993dc1700d8a21ca908008d0100992847240240bb00605581522c02c0c200a0ac40222e04c0ae018059b632470280bd0500768e58900f4060008099422ccc0020380200431e13cd03204c03a030d2bfe0a95f7085b8480100c0cb95cd974bd23314b895d01a77f2f0e0e221e2c26cb142611729106609e4229c979b231348e7034cce0c00001af9d1c1fe383f90e7e6e4e1e666e76ceff4c5a2fe6bf06f223e21f1dffebc8c020400104ecfefda5fe5e5d60370c701b075bf6ba95b00da560068dff95d33db09a05a0ad07af98b7938fc401e9ea150c83c1d1c0a0b0bed2562a1bd30e38b3eff33e16fe08b7ef6fc401efedb7af000719a4099adc0a383fd71616e76ae528ee7cb0442316ef7e723fec7857ffd8e29d1e234b15c2c158af15889b850224dc779b952914421c995e212e97f32f11f96fd0993770d00ac864fc04eb607b5cb6cc07eee01028b0e58d27600407ef32d8c1a0b91001067343279f7000093bff98f402b0100cd97a4e30000bce8185ca894174cc608000044a0812ab041070cc114acc00e9cc11dbcc01702610644400c24c03c104206e4801c0aa11896411954c03ad804b5b0031aa0119ae110b4c131380de7e0125c81eb70170660189ec218bc86090441c8081361213a8811628ed822ce0817998e04226148349280a420e988145122c5c872a402a9426a915d4823f22d7214398d5c40fa90dbc820328afc8abc47319481b25103d4027540b9a81f1a8ac6a073d174340f5d8096a26bd11ab41e3d80b6a2a7d14be87574007d8a8e6380d1310e668cd9615c8c87456089581a26c71663e55835568f35631d583776151bc09e61ef0824028b8013ec085e8410c26c82909047584c5843a825ec23b412ba085709838431c2272293a84fb4257a12f9c478623ab1905846ac26ee211e219e255e270e135f9348240ec992e44e0a21259032490b496b48db482da453a43ed210699c4c26eb906dc9dee408b280ac209791b7900f904f92fbc9c3e4b7143ac588e24c09a22452a494124a35653fe504a59f324299a0aa51cda99ed408aa883a9f5a496da076502f5387a91334759a25cd9b1643cba42da3d5d09a696769f7682fe974ba09dd831e4597d097d26be807e9e7e983f4770c0d860d83c7486228196b197b19a718b7192f994ca605d39799c85430d7321b9967980f986f55582af62a7c1591ca12953a9556957e95e7aa545573553fd579aa0b54ab550fab5e567da64655b350e3a909d416abd5a91d55bba936aece5277528f50cf515fa3be5ffd82fa630db2868546a08648a35463b7c6198d2116c63265f15842d6725603eb2c6b984d625bb2f9ec4c7605fb1b762f7b4c534373aa66ac6691669de671cd010ec6b1e0f039d99c4ace21ce0dce7b2d032d3f2db1d66aad66ad7ead37da7adabeda62ed72ed16edebdaef75709d409d2c9df53a6d3af77509ba36ba51ba85badb75cfea3ed363eb79e909f5caf50ee9ddd147f56df4a3f517eaefd6efd11f373034083690196c313863f0cc9063e86b9869b8d1f084e1a811cb68ba91c468a3d149a327b826ee8767e33578173e66ac6f1c62ac34de65dc6b3c61626932dba4c4a4c5e4be29cd946b9a66bad1b4d374ccccc82cdcacd8acc9ec8e39d59c6b9e61bed9bcdbfc8d85a5459cc54a8b368bc796da967ccb05964d96f7ac98563e567956f556d7ac49d65ceb2ceb6dd6576c501b579b0c9b3a9bcbb6a8ad9badc4769b6ddf14e2148f29d229f5536eda31ecfcec0aec9aec06ed39f661f625f66df6cf1dcc1c121dd63b743b7c727475cc766c70bceba4e134c3a9c4a9c3e957671b67a1739df33517a64b90cb1297769717536da78aa76e9f7acb95e51aeebad2b5d3f5a39bbb9bdcadd96dd4ddcc3dc57dabfb4d2e9b1bc95dc33def41f4f0f758e271cce39da79ba7c2f390e72f5e765e595efbbd1e4fb39c269ed6306dc8dbc45be0bdcb7b603a3e3d65facee9033ec63e029f7a9f87bea6be22df3dbe237ed67e997e07fc9efb3bfacbfd8ff8bfe179f216f14e056001c101e501bd811a81b3036b031f049904a50735058d05bb062f0c3e15420c090d591f72936fc017f21bf96333dc672c9ad115ca089d155a1bfa30cc264c1ed6118e86cf08df107e6fa6f94ce9ccb60888e0476c88b81f69199917f97d14292a32aa2eea51b453747174f72cd6ace459fb67bd8ef18fa98cb93bdb6ab6727667ac6a6c526c63ec9bb880b8aab8817887f845f1971274132409ed89e4c4d8c43d89e37302e76c9a339ce49a54967463aee5dca2b917e6e9cecb9e773c593559907c3885981297b23fe5832042502f184fe5a76e4d1d13f2849b854f45bea28da251b1b7b84a3c92e69d5695f638dd3b7d43fa68864f4675c633094f522b79911992b923f34d5644d6deaccfd971d92d39949c949ca3520d6996b42bd730b728b74f662b2b930de479e66dca1b9387caf7e423f973f3db156c854cd1a3b452ae500e164c2fa82b785b185b78b848bd485ad433df66feeaf9230b82167cbd90b050b8b0b3d8b87859f1e022bf45bb16238b5317772e315d52ba647869f0d27dcb68cbb296fd50e2585255f26a79dcf28e5283d2a5a5432b82573495a994c9cb6eaef45ab9631561956455ef6a97d55b567f2a17955fac70aca8aef8b046b8e6e2574e5fd57cf5796ddadade4ab7caedeb48eba4eb6eacf759bfaf4abd6a41d5d086f00dad1bf18de51b5f6d4ade74a17a6af58ecdb4cdcacd03356135ed5bccb6acdbf2a136a3f67a9d7f5dcb56fdadabb7bed926dad6bfdd777bf30e831d153bdeef94ecbcb52b78576bbd457df56ed2ee82dd8f1a621bbabfe67eddb847774fc59e8f7ba57b07f645efeb6a746f6cdcafbfbfb2096d52368d1e483a70e59b806fda9bed9a77b5705a2a0ec241e5c127dfa67c7be350e8a1cec3dcc3cddf997fb7f508eb48792bd23abf75ac2da36da03da1bdefe88ca39d1d5e1d47beb7ff7eef31e36375c7358f579ea09d283df1f9e48293e3a764a79e9d4e3f3dd499dc79f74cfc996b5d515dbd6743cf9e3f1774ee4cb75ff7c9f3dee78f5df0bc70f422f762db25b74bad3dae3d477e70fde148af5b6feb65f7cbed573cae74f44deb3bd1efd37ffa6ac0d573d7f8d72e5d9f79bdefc6ec1bb76e26dd1cb825baf5f876f6ed17770aee4cdc5d7a8f78affcbedafdea07fa0fea7fb4feb165c06de0f860c060cfc3590fef0e09879efe94ffd387e1d247cc47d52346238d8f9d1f1f1b0d1abdf264ce93e1a7b2a713cfca7e56ff79eb73abe7dffde2fb4bcf58fcd8f00bf98bcfbfae79a9f372efaba9af3ac723c71fbcce793df1a6fcadcedb7defb8efbadfc7bd1f9928fc40fe50f3d1fa63c7a7d04ff73ee77cfefc2ff784f3fb803925110000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000032869545874584d4c3a636f6d2e61646f62652e786d7000000000003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e362d633031342037392e3135363739372c20323031342f30382f32302d30393a35333a30322020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f75726365526566232220786d703a43726561746f72546f6f6c3d2241646f62652050686f746f73686f70204343203230313420284d6163696e746f7368292220786d704d4d3a496e7374616e636549443d22786d702e6969643a36453243393544454136373331314534424443444446393146414639344441352220786d704d4d3a446f63756d656e7449443d22786d702e6469643a3645324339354446413637333131453442444344444639314641463934444135223e203c786d704d4d3a4465726976656446726f6d2073745265663a696e7374616e636549443d22786d702e6969643a4346413734453446413637313131453442444344444639314641463934444135222073745265663a646f63756d656e7449443d22786d702e6469643a4346413734453530413637313131453442444344444639314641463934444135222f3e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e203c3f787061636b657420656e643d2272223f3e8bfef6ca0000170b4944415478daec5d099c53d5d53f2f7b32c9646680617118905d3637d0cfad282aa82d0af6f3b3b62ef52bd6d685ba206eb54a15c1adf6538b52b4d53a564454a42c0565d132a86c82a0ac82ec8b0233ccc24c9297f7dd9bfc6f73e64e92c90c5071ccf9fd0e249397f7eebbf7fccff99f73efbb31860f1f4e593936a4da74d2d8eeef53b17f2f51c4fd5d6b7e4ba19385ee177a9bd0ed8d3e832534dfa4d2351ebafaad3cb2d92cb219cd636c6d59f3ceca11920b849e27f4c742af68f4b7a342f34c5ab8de4d3f9b12a4b0005d7301991447d63ebed7e2125a283457a85d680d22d2be26463405995d8dfeb63f4a4b44241bfa463e5902642d7d518a5a59a065e5bb29ad849e2a7480d0d384b617ea05e024bb89080d093d287495d0e94267093d90c1b9edf85f82b4a2d19451006dc65617ed2bb3538f76618a449b57c76781f6fd908e42af14fabf42bb65f89dde42af12ba4ce848a10bd21c9b23741803f3bb42c709fd6d4657921015003b74c8205f8ed9ec4096cdd19abf7884de2e74210cbf5b13ce2123e05ca1f7e37cc9e45788921c3af703d80d47b3a049b3b739e989d21c2aca8d36cb81c802adf94a6ba15385fe41e87147c04e1e018dbc00399da49b4542ef4d13b97e2d343fed999d16d57ee3a0498b7dd426b779e56559ead8fce504a16f0aed7584cf7b2e72bbbd426b01b8d6691c763f8a97fa1f4c471bb71db4d194b51e6a17c8022d2bdf1d9151e695a30032253ee47c99caef285ecd1c9b92df0aea58e88fc672b3e654d2cf52c7e62d922af6ff96ae2de3d152a1cb8556b1bfcb4249cb3a47ca54cc23fec93569fe1a0f4522061946f31d946c443be65c5fe470befd736aca64f19193f5427f227487d00e427f29f432e477dfc4efcf8abbf76094e6adf4d0a4955e9ab6d14d6e41218de63cac59cb3e86bc9e11a592eda79019f60aab6b74f54de64a7725f9bb9c3c2eff0fddc2c342bf04555c47f142493f11e7a6935d00cc6fc6d0f4e55e07fdf4a502ba654690262ef791d76191c76135efb1cd9af7b123d2a36f3e14a4903d4c5eabd1fe5d468e9edadf4a854e04008347b9f9e385be56871afaa22171232119c50e96dbe9c036173d58eaa7399b5c541532c8efb2a87bab08990263d1e68db32cd08e297a61086bb36cb4fa4031f5cfdf127b9da104845ea3fd4d4694a1145f62d5e62837fd39a1a312ad11912b274aabd67b68f1976eea901fa1055b5cf468690eb5f34763343127271eb14debfb31b68eb3cf3e3b6be1c7904c9bbf8cdedcdd8bfab7d824dc7cc67ef02c8a97dd95940178df20b66c10dae22834572ed31a416ad58808c2729de2e37372c914579db5c94d0b05d00c579472dd227ab5689eab3eb211ed3b99a75994e7aa8a17452c8f30de8c5cbe5c31ef62ef1f12ba04afe522e12784be91c178cbfcea75d04c59ccc8a37839df29b412f95e5b009b50f45856e70c820e4e58e1a5cdbb9d542822598fb689758bdf57906581760c8add885255d843353541f2d84399d04759363f91bdff40e8abda316b8456537c82399dc849ee0758cae8a3c42a907244ca2280f64ca18384ce8e013d2a401834e9ab3d4eca775a146a19891539be2570c9f6ca2561edf17e8fd079420f6581969598f8edb5b4a2a20d95ecec4bc33b7f4854eb6fe82b8329be1e51c95f11c5b874a1d4eb1489196349ec559ec8b142229456daaac856673e4cca761457a653e2319b7cf258bbb6ee70d1b0c979b4eda09d5a78a37252ad1dc527b723a0b029fd0bc5579a48aa5b20d48df6ca08bab109dd2823f23d4207328afb43a1dbb240cb4a4c2c11481c24cbddb528f11b149f074e29329aa9b027170fbf9be498ae1ab5d42f2acff027725a9f4b44dcfb561e9d2828dfd567098c1db2c59b107b80c650935d6159c720b96adf8a3d42b39d0a22347e6e80566e7752f7b691588e46f155ff72517315ce904a64e4dc041a7abef437147f22e079a13765a963568e8a14b8aae9fdbddde8e4e00eea259442fe5460cb038553f24fd03b5d4e4e79b15819de7a37e2b61e731cb4d17df302f4e4877e6a2fa8dfac0d6eaa0e1bb4b7d246c37ad7d0c80b2a880ec46696db89e6b48c3529d7dc459ee8a1454b7cf4d66a0f15b73415c808f91c01340d492ef2c2969478b6cddbc42e8c6ac0361b88a8474a8e475ff786d39891055a7a31601c4e78e3508ae33c38a6065efec82418369376d40468555911f50aec8d47b6e4f36a72deac2f5eef448ea58ba461dd539aa3db9a496dc2b74c9c951b1afb5e20669d9d5acb0286413336ba636b0f0f08a0e57b2c1a39a052dcb14057b55125a0b05ae464f3b7d718e3576df6866f9e9627724b8a1dc74af68af65530c33759dea7447e26172aaf07d8f2d1ff9587317effe985263d50483a09efc76581d6b0c8817e01b98f7cd46434c59f3ae6d287e2eb0adbe3987b8ed4c5a30254c7b92b68b22cf38b88d6397777aacd7ae4fc5800afbf04fdd2e5062d874b80cc4e2f52dbf0cdcfcccc0ddd332d488581682b9f61150b70796d762bd2ca67c9a7a537b7f24523f3b63ae9ea92022ab9f28004db12ea5a3b78f906d7ce817715c92a89af4b71a83857e05180cc0580c8b63c04f07b589e269dd2a39478505452cf3b50c49120fc239c979b9ab225c2b727ed19c8482fbc648196a22641f179a90ef83f999517a0b2e54c6ac8870b36e1903d22b2391ca174391a5fa8bb32491e24dbf500e94bed2cda2d22d96801b2179ef9672eddfe76b0b038dfbcc9618b3da8d99e5d4d562a17442d7ab263303a7ff27a3779dfc9a347cfaf282f793dbf7cd2a75e5bb9d3bab66361e41671813ed1ba516a8bd0c729be624497afd96b79839f4a40e3fdd66398e5a44b96b7a1a0a36c657f16680d4b84d1c50329a8e341786e19fd761f8d46380d934ab69d4277772a25476c5ecd96cc8b2af944fb4c56dcfe86aa20972951d378c0e631d74e1054f1376fe69dd12edf7cce65a753a256ec3e5e84d1c8fce807422f911a8ed2bdc707cd715345def6c53e3b2ddeee143431fa74aff6a111a66944c5e7938d3855947d271fd11922f44f42cf107a9d9623f19ccdc5de77a2f8960b76383bb984ec1f49ba463ec83a18d4b91011b312e3b080e24f103444e5e5b3729782d606e18cc653dd6df22ea6f814462125a638e48a9b49ac827922faba9386a78be18465db2a1c48e04e45c366a3027435c5e74b1623c1ae4c929b0c42e2e7c54517c13311e3d936500895a0cbfd248a1156373203f6e33b1edce81e50221931fac393c8b9a0f9e0f2c40ca115dab91e83d4055c7913a8d520e42816aa72ff22aa57b23e139d9583aadd7a16fa53f17d1b8b14ea7c3f419fc8364ea3f88a0c79ce8b700e3948ab9200a2ad8a1ec436c2310c8b361fcaa750d41e075a7d69cd220fa78db2523706c512259206de4fdee8c48dfbedd18b1f6b4355216a2f403631e0b27a09ca27f3895b847ea5e577d7a3fa375600715fae2bf67dea986f5e651834221436b6898ebdc2a80ff47384fe1db6f421c5d75c72e2ca6b9e4a4e02ad54f29724409351f74eaabfae53c9f9a0a5e9e6cc241b795a285f16f53aeb7be9c0e4130757012c94a40db7012f8310b975b9041a73d60e7886e7d1b07168e80fd817e682e7abd02e9fde7d099e8a8b1cec6728be625b1ad673f04c37e3fc5246a1e42baf251fa128c1df47c33822f03412a47281ea29da3556c218168236498fd91946f50d3aef200658523e39b1da513b4729dab412efefa6f813c05e96d34cc8b052c6238bccd32e637f1b05e02fc2a0f5c0352f64d4497a6639b92ce79be6087d4f672b3e7b38be06b2be7871ef2aeaeec06bb9825edf5a6035a2ca72b975c0dc751efabacaa016bee81d22924990cd455b7507548b5cb50ad1718cc8df66e5ba2de90ccfb5e2cdba2f49342538b47b30c63722572b6ba01fab01bc54858c47615fe9641302433ab6f6a80632d9c6e1b8df7600dd59ecf3b5c82dbba3df7bc0b6fa30c79f4eec3656fdf1c2e0fb2131fd9a798817019a020040814c469979e8401f3af63a78e6103aac2f2b459fc3ae752e5e0710663d300809b25718c85622628510a64bd01935ac3347a0ed8468741e0cb823c02bc1f5193e3f0bf7e0c7bd3d82f698308e7d309ece1974a0c9bcd710b4750dfe5688b6ca39ac298c6674d1bc7e3bbc9e579f395874c874c68a23290a364578fd3972a2f3e138b8bc1feb5f4b80cc1fa5671704e80e919715e644fb8a9cec06ac9abf2b09c8b8bc0a1b90ece15aadf4fe759aef2d40df47f0dd4ccaf2a9a2dd4d1ac8c2601fd2f15e4ef10d825e461008a5c8ab09c7ddc8decf60202314b8ce624ce54644da7e9478d68e40379f84d31f053ac9dbfe216cf23119c06c1a979527fe394070298b6203e1010650624ee65550aef371ace2acf701040bf1fe7480e838189d92229627aa0d5c2621c2aa05b2b7e3264f4747d78262de0b6e1d66605d0bca3012e7e8064e3d1c6d3f9112cf6bf5c2ebdb1958ef46243f1714b5b1320614fc62500a15b106c1d89570b6309819eb7bf5124541196f68bf8c7caeea64f9591eebb7452cc7716a51659830d7ed5460d2cb4b7c3462662e15e444c9668bf5878cda6fb3e89e4ed444f87fc381aad2fd3d6c2c75d98131b95ca3a48d957614df558b8bbcee50b09a77c042ae475ffb293117a700bb034e9f6fa9b00481a196a51043d8e712c47fc6e726d281fbd8e79781cd3c0150717eff36aaaeb29d636d5a989ec0e6623ec609945c04a35586f104a302ff82272018f879f83e21dcb646bee447b42c0705cd47e408b2ca4d4f16c966200fca017551e7ec0bc0d5e0fd6e78aaa9888aaa48f019724c173cdc348a3f662fe517a07152a683ea124acabf078dc9a41225650522a389c8328e1d73211cd6a78c21a81caf27f37ecbeb700d234a65110fe5b92b523d759dcbfa6d03a35e4abe821155927ca8b2ca46ef6f709343bcf60bfa28685f6f16493399cc5d0e70754234fb2bae712ea2d6431897028db6495bd9494d9b6754116d288bfc0446f287469c672f22ea5896b7ae41fff05d99af003323b0a82949ce3507e3ad72d801acc063d3a87dcaaae347dafb8540a90340511bbe7c00bac2450128884e919ee57794d8cca5150cfe7544ce4b0096fe68d42ae459aa43a5112e8331dbe0557258343c9e79a2c5cc903bb2c8f95f42bf40874431707e166d78de56cbdeaf03e8bb6708b4355a65f22b78d0e3e048b602cc27c3500d44e9beac9feb806c77ad9ffa04f6500719cdcc64f978ec3e5d68f716fcad428bb09bd50f47bcbed447afadf052b7c2887cc8d260fd9ce98f51ec8113ea0276f011a2dbd3a0c00f42bf86432c45eeb688524ff8672a03b5f72f36f2fb39a070aa382103c4ad8ce613ec94afa07122425a0c3435781d4832c5a2072d473aa09949383325a9bed524f1827c998b1b615919db190015013c1edcb4a45abd19c857b39bd80f301bec26aad1e6cf61546ecde055b9d8c3a2d35a749a9d1213a6657008aa1ad8d4690e2345bf998c46a836ce06fde90c2adb07ed5c0be7f36f17bead26482709903dd06336b96d2210c4b636a85710e9c61cdc4a561451530f712aeab2a862a793a62cf3519ba0a99e64b6b17bce34d2f07b72b2b11c08ca7521c6b21fe8d71046a16ea3a62de8b592cc17963761aeed4cadb89183ea376940e37b509e4ce996ae252490c206281dd0f42771fbb063b6800214c31b77609e946040f90c8835180809b40b1065f6c0b0d4e31a97b2c8f239c01566d5a3a19a975625f508aeafa2939d4d2896c3abfa71ce61f0faea7307bedf17f75180e8a8775ecb0c9377d20a1c525a30c7b28b45cd4fe0746e60c587c5e897b86559063dde6d2e15f9f7922706325faafd434e60c6ae8a2821966bc7fb4dd0c48dfb1d34759d9bba251ebc3429b18f48a65b1cf8d02f11aa3b191b01f5fd107d5c8cfe389b152ae458fc8cd4063d4d77680d1a740ad1135c2722dc0ac684ec5a7e1b4d33b513812d39d938da523889a41f0e67865f4075574e7fc0e634bab2ea939acfb99b356235cbf3545e520c63530f10560268a762e03e62002318e48fd8353aa12cfb77cc6354a7a8506d619dd70ff9a2fabc27a620fe0f45096530c35815d48e42498b46785c791dbe95c055ecf522ad38a1728e1fe3f55bfc8445de723a217f0b051d358864494196c768ed275a345774b0b681b6af67ce3413e986b2f676e43cc751fd5d882df4ff5c140706e2d8412812351560116d0e2caf09e79a8cc2899256a81afa5864afd12aa6e750628ef53ca61742252bfb23632e562aa0e911ed14508e1994982c56d59979283a8c00b04623227c4675378699c1aa6c2b0028bf96b4efc580f462f3149fb282cc6078da975052fd1237d59d150f2a29f92e5e5528e85c8ece9c8af73b0186b6e884ab50d0990083790305971e1ac01b0299eac7f1e8fc001c886acb1bec3899a7fd1ac704d01f1ff393dedd7901d9648551e665a99fae1e0c5af309c6454fc0b7fddb68c206752988d0d0eeb5b468bb33b6210e9b5b5355c427a8e15f8c198871fc1ba2f5c7282efd94524f0eaf42d1621cf2ba579b18d1b668efafd48b470dc84e14abd6c0299eceeee90e7c56a61546fc68ffc126445deef4ea453413206b8f12797f366877e2f517a03ddfe0c43f44a9bd279bb3b99575fc622de1547310fb984795b29479ad7988ac07603897a20cdf1dc73c850a612b56c20d68f73209f31f11789aab31d7d1964d41bc817997296cde6b24b8fcb3ac1c1d4891c3799937fc1cfd740da2956acb48f4012f362dd34ac075263c7d22a251c4956e407bb36af04b1ab52e60112d4eb1420605da86e99ad3ab687fb54d2f5e95829d5cdf80111531765302c32f474a509421bd360f23a2bda339b611193a4362fdb10bf6f080e6181e44c48d52dd5fcc398df886430d8bfe53555d5345343bbcf218d0421faa6faf22a228f907f8f7507829278ce503ccb570cab20f03d409de9dd39c7b01885012ef340509fee5302c17403a15d14c958d7f815c6a13d55ff0f96718f930388230ee63068b2221dceb2c783737aef11a0a149df09d64fb227e8168e083e793e7ba19f9de7e50953949b8fd2c4653e7d43b6b6d4046323f0a25fb357a7c3afab83568d044eddb43d87447c254455493e57d2dfecb717a1ce77b0aa5fb6949eeb31051bf330cfe23e6cc6474fe2dc621d91c4457440cd223772365261cb09a1af1c0514e44fb7781950c80dd946aed71b2a2d47b70a4a318061e076b9b08a7a3162bdc8f7b180f675a0bc7ab72d0a56c0cabc122fc6c8e6d246cdb702449123f8031bb603cc9f8cb3a2493ea07ec4269e6629642939d635d9acedd806b38718db0768d43946492579315e87855de0f27b91f799ebfc0a118aca0f05192e90e2e07883d6f0419858133b581568598202596fe7c46f5d73d8a56ca072bad9e18248b45275e391b4ff5374bed01cf4cf51c83e8bdb25a1b850e19e4c8abb349ce3478f88761b0cfc24195e13ecec4679dd08fb7b3b3be00605f0b631c073a1ac1980d46b42844e49d7e184033d1b73329b1be533ab8df205f3f08f0b580935ca84d29e8b4ee1938d67e782f03c6efc1c64621d5506ee97f702f07d8bde502d8250c685b70dd8b5865732cdabec491a20a6965904cd311981fc9440ef7814a4b4b728fd675944198294ac0772202f664b4b1fef2a5785eb618cce257c8fb0a700fd310c9e624b9c60044f728a22d8b5d069d5d14a2d33a86686bb99de76984fc6433febf15aa8ff12bf0ee3bd8df556efe340a4bc9b650280350c768fdebd70a3b5e061ebbc6b2942c075d7c9e018458becbabb105547709569ec6de760004bc10750baabf8fe0be9e625328c114d5d9965a3f3d0c6718607892dad1a135c04d59391a92835c53816c33a8653a59096ae6426ea976a14a3597730306fb7ad27f9d53d0c62e27d4d2259b6a68cc9c80005a3d5ff01aa2f3a598f66801606f06655b9ae2bacb29f123f132a76907b0ec039d9f4dc937d7998e625618f7f515ab844e4074f253fd5f195d8aebfd08ff7766154875cd994865a6e37f0b6dd0e9ffdb486b06205ab544dbbdf8ee2728989d838ab91f4e541ebb15e77c5f3be722b4eb564a4c8dc99469bef1f2cb2ff742688ca0911bb3b838e222a9c62fe12177c2fb7f9aecc0ebca4635e5fc7654212b51c1ad2f4193464f0fd298d21cea10349b439f1a70306a43950a4acc2736b8a3519a7ed40b377644332fd84235a8aad540db5a2070c9e3cbfe5f800100b3e0af98735d4afd0000000049454e44ae426082),
(2, 0, 0x43616e6e6564204174746163686d656e747320526f636b21),
(4, 0, 0x89504e470d0a1a0a0000000d49484452000000e20000001e08060000003140c2b5000000097048597300000f6100000f6101a83fa76900000a4f6943435050686f746f73686f70204943432070726f66696c65000078da9d53675453e9163df7def4424b8880944b6f5215082052428b801491262a2109104a8821a1d91551c1114545041bc8a088038e8e808c15512c0c8a0ad807e421a28e83a3888acafbe17ba36bd6bcf7e6cdfeb5d73ee7acf39db3cf07c0080c9648335135800ca9421e11e083c7c4c6e1e42e40810a2470001008b3642173fd230100f87e3c3c2b22c007be000178d30b0800c04d9bc0301c87ff0fea42995c01808401c07491384b08801400407a8e42a600404601809d98265300a0040060cb6362e300502d0060277fe6d300809df8997b01005b94211501a09100201365884400683b00accf568a450058300014664bc43900d82d00304957664800b0b700c0ce100bb200080c00305188852900047b0060c8232378008499001446f2573cf12bae10e72a00007899b23cb9243945815b082d710757572e1e28ce49172b14366102619a402ec27999193281340fe0f3cc0000a0911511e083f3fd78ce0eaecece368eb60e5f2deabf06ff226262e3fee5cfab70400000e1747ed1fe2c2fb31a803b06806dfea225ee04685e0ba075f78b66b20f40b500a0e9da57f370f87e3c3c45a190b9d9d9e5e4e4d84ac4425b61ca577dfe67c25fc057fd6cf97e3cfcf7f5e0bee22481325d814704f8e0c2ccf44ca51ccf92098462dce68f47fcb70bfffc1dd322c44962b9582a14e35112718e449a8cf332a52289429229c525d2ff64e2df2cfb033edf3500b06a3e017b912da85d6303f64b27105874c0e2f70000f2bb6fc1d4280803806883e1cf77ffef3ffd47a02500806649927100005e44242e54cab33fc708000044a0812ab0411bf4c1182cc0061cc105dcc10bfc6036844224c4c24210420a64801c726029ac82422886cdb01d2a602fd4401d34c051688693700e2ec255b80e3d700ffa61089ec128bc81090441c808136121da8801628a58238e08179985f821c14804128b2420c9881451224b91354831528a542055481df23d720239875c46ba913bc8003282fc86bc47319481b2513dd40cb543b9a8371a8446a20bd06474319a8f16a09bd072b41a3d8c36a1e7d0ab680fda8f3e43c730c0e8180733c46c302ec6c342b1382c099363cbb122ac0cabc61ab056ac03bb89f563cfb17704128145c0093604774220611e4148584c584ed848a8201c243411da093709038451c2272293a84bb426ba11f9c4186232318758482c23d6128f132f107b8843c437241289433227b9900249b1a454d212d246d26e5223e92ca99b34481a2393c9da646bb20739942c202bc885e49de4c3e433e41be421f25b0a9d624071a4f853e22852ca6a4a19e510e534e5066598324155a39a52dda8a15411358f5a42ada1b652af5187a81334759a39cd8316494ba5ada295d31a681768f769afe874ba11dd951e4e97d057d2cbe947e897e803f4770c0d861583c7886728199b18071867197718af984ca619d38b19c754303731eb98e7990f996f55582ab62a7c1591ca0a954a9526951b2a2f54a9aaa6aadeaa0b55f355cb548fa95e537dae46553353e3a909d496ab55aa9d50eb531b5367a93ba887aa67a86f543fa47e59fd890659c34cc34f43a451a0b15fe3bcc6200b6319b3782c216b0dab86758135c426b1cdd97c762abb98fd1dbb8b3daaa9a13943334a3357b352f394663f07e39871f89c744e09e728a797f37e8ade14ef29e2291ba6344cb931655c6baa96979658ab48ab51ab47ebbd36aeeda79da6bd45bb59fb810e41c74a275c2747678fce059de753d953dda70aa7164d3d3af5ae2eaa6ba51ba1bb4477bf6ea7ee989ebe5e809e4c6fa7de79bde7fa1c7d2ffd54fd6dfaa7f5470c5806b30c2406db0cce183cc535716f3c1d2fc7dbf151435dc34043a561956197e18491b9d13ca3d5468d460f8c69c65ce324e36dc66dc6a326062621264b4dea4dee9a524db9a629a63b4c3b4cc7cdcccda2cdd699359b3d31d732e79be79bd79bdfb7605a785a2cb6a8b6b86549b2e45aa659eeb6bc6e855a3959a558555a5db346ad9dad25d6bbadbba711a7b94e934eab9ed667c3b0f1b6c9b6a9b719b0e5d806dbaeb66db67d6167621767b7c5aec3ee93bd937dba7d8dfd3d070d87d90eab1d5a1d7e73b472143a563ade9ace9cee3f7dc5f496e92f6758cf10cfd833e3b613cb29c4699d539bd347671767b97383f3888b894b82cb2e973e2e9b1bc6ddc8bde44a74f5715de17ad2f59d9bb39bc2eda8dbafee36ee69ee87dc9fcc349f299e593373d0c3c843e051e5d13f0b9f95306bdfac7e4f434f8167b5e7232f632f9157add7b0b7a577aaf761ef173ef63e729fe33ee33c37de32de595fcc37c0b7c8b7cb4fc36f9e5f85df437f23ff64ff7affd100a78025016703898141815b02fbf87a7c21bf8e3f3adb65f6b2d9ed418ca0b94115418f82ad82e5c1ad2168c8ec90ad21f7e798ce91ce690e85507ee8d6d00761e6618bc37e0c2785878557863f8e7088581ad131973577d1dc4373df44fa449644de9b67314f39af2d4a352a3eaa2e6a3cda37ba34ba3fc62e6659ccd5589d58496c4b1c392e2aae366e6cbedffcedf387e29de20be37b17982fc85d7079a1cec2f485a716a92e122c3a96404c884e3894f041102aa8168c25f21377258e0a79c21dc267222fd136d188d8435c2a1e4ef2482a4d7a92ec91bc357924c533a52ce5b98427a990bc4c0d4cdd9b3a9e169a76206d323d3abd31839291907142aa214d93b667ea67e66676cbac6585b2fec56e8bb72f1e9507c96bb390ac05592d0ab642a6e8545a28d72a07b267655766bfcd89ca3996ab9e2bcdedccb3cadb90379cef9fffed12c212e192b6a5864b572d1d58e6bdac6a39b23c7179db0ae315052b865606ac3cb88ab62a6dd54fabed5797ae7ebd267a4d6b815ec1ca82c1b5016beb0b550ae5857debdcd7ed5d4f582f59dfb561fa869d1b3e15898aae14db1797157fd828dc78e51b876fcabf99dc94b4a9abc4b964cf66d266e9e6de2d9e5b0e96aa97e6970e6e0dd9dab40ddf56b4edf5f645db2f97cd28dbbb83b643b9a3bf3cb8bc65a7c9cecd3b3f54a454f454fa5436eed2ddb561d7f86ed1ee1b7bbcf634ecd5db5bbcf7fd3ec9bedb5501554dd566d565fb49fbb3f73fae89aae9f896fb6d5dad4e6d71edc703d203fd07230eb6d7b9d4d51dd23d54528fd62beb470ec71fbefe9def772d0d360d558d9cc6e223704479e4e9f709dff71e0d3ada768c7bace107d31f761d671d2f6a429af29a469b539afb5b625bba4fcc3ed1d6eade7afc47db1f0f9c343c59794af354c969dae982d39367f2cf8c9d959d7d7e2ef9dc60dba2b67be763cedf6a0f6fefba1074e1d245ff8be73bbc3bce5cf2b874f2b2dbe51357b8579aaf3a5f6dea74ea3cfe93d34fc7bb9cbb9aaeb95c6bb9ee7abdb57b66f7e91b9e37ceddf4bd79f116ffd6d59e393dddbdf37a6ff7c5f7f5df16dd7e7227fdcecbbbd97727eeadbc4fbc5ff440ed41d943dd87d53f5bfedcd8efdc7f6ac077a0f3d1dc47f7068583cffe91f58f0f43058f998fcb860d86eb9e383e3939e23f72fde9fca743cf64cf269e17fea2fecbae17162f7ef8d5ebd7ced198d1a197f29793bf6d7ca5fdeac0eb19afdbc6c2c61ebec97833315ef456fbedc177dc771defa3df0f4fe47c207f28ff68f9b1f553d0a7fb93199393ff040398f3fc63332ddb000000206348524d00007a25000080830000f9ff000080e9000075300000ea6000003a980000176f925fc546000022054944415478daec9d79945d5595ff3fe7defb86aa5753aa2a84a43287cc099010204c420641190c3634228a320b68ab28dad0768b1338fe50d4564044681541118100a28840100224242124242464ac4c95d43cbdf19edd7fdc7d53b75eaa4255602d7fbd1667adb752f5ea0ee7ecb3bf7b7ff7706f8c88309061beb0f80e6004507c8203ac056e06da19ec70925cddb1942b3a57f2e6eb6f620b054404014c70c404c1dc5980f13ee47d8c5b00c737c6b1600a18d7075300718c9368b3b6febbebd6cd2abecdc649a30733ab32a002180a540349c00269a0196801baf593eb4326ef8d838fb8cad803fc77701d55117ca04bf7e2ffcc98b861fbfe9fbd419c770630a69fbf1d0e7cbf48407105a92dfa3ed7ebbbbca564ec04c60fad226d12b46fde4c7b4303361e47020ddf64e14bc083c0c4834d50440a20371ca25cea80c9c0b1c05cbdd710a02422a71c90053a80ddc0cbc08f8086f7c038a8713e70891abacc3bb88ea33ab505f80f60f33f791f3c3530a988beb40085819c38d0911fc4df66aa82d6e9648c7e1ce006e09100961e53fc064ecceea6231bc3f53c8c31b8221811ac31e5164e064e1ac086e505be0cdc3548e1d5001f012e028e51ef37903159057ebbaeed3d200e6c8c041601ef7f17af1932957ff61e1c035c034c554c2c03fe1fb0e3dd04624b3f8bf5f46f5244eda601c3fab84e7508c2d1b9267edbf9241543469236a3d4671a80d9c0bf227236c6cc18e0fc6e13f849ca3883a13573807f57c528964503f0865adb66a53fa50adc694039f098fecdbe87af018f21401bf09aea4c3e62c832caae462a1341bd4983329048c402400c68057ead2ce59f3d8e52a39ed4b92e1b28f51e0c102f50ba2945a07334566a897ce7abb0ab8ad92390c54be2e4337c7bd91d24a68c24132f2166fd1185747a81cde52e709325f370dd1406c406ded188600b05ac1588c542b71fd7ebdee7c0374106136f9c0cdc042c28fa7e0df05b6031b04bd75688acd5d3f8b114e8d4cf7b63e0e34d357e31fddd4680e80357009f5530a27bf015e06fba0fa6c898faba07857ff2ba92c0d8c8ba5a80678a70f1ae0071eb208e5d0d7c4881627b05d65e62c771fbd6f2b955bf655cae89ac193dc9dfbae5137b9f7aea63e9c6c6b1bee3e2c46258118ce3e018417279f2e9346e2a958e97572c69dcbce97eb7aa6aa5f1bccb80c9063ee70e2e51743cf0d52210b602bfd0cfc67ecef3d582a7dfc3d3218fdcdb245546019591df1b81e7813dff9faf6b0a301d70d5a8ec00d60f3481e41d22f2bf0c4c8858b31dc04f23c24aabe58b384203b114c7ed59c58f5ffc2125f9cc8ca6d2cacb33afbe7a51bee01f66054c2c16a0550411a1d0d545c15a9223466c98306ffe4313162d7ab07ad2945757ffe6d72cbfeb4e72dd5d9f738c9b00931dc4fc47015703a74526d7047c0db8fb3d90fdd3860bcc50da1f4d76bca660e4ff001027ebcf5dc04bc0be81862d870ac44f02e323dfed01ee8b00b116385de3812059e3c5c14bd823da76380e9cd2154b9e8de3548980e37908068c417c9f7c779a583266879f70fce3633f7cee3dc3e7cd7fd6ad1adaac2143ecd86bae2db8e327caa3d77e86aa989f2db1b9e0fc816df6e9c0bcc8dad3c01dc0fdef2208cb34ce9d0424949ebcaac6c9d360be4a29d5b6a218dbd33869ac7e570f6cd7b91f0b1ca9d75fad9b5d4c8debd432d7a942fbc04e60955ee7edc6613abfd14ac10bbaaf6f1c8429d400e334ae6bd263d1f51fafd7dc11f16cb69f0ce8145dbb13d1ab151c5a667598ca61b48611be027a4d6f27d1ef2851394cd0f5c5344c6900de525976478e1fa7eb44f3067fd3f06c92eed9e12acb4dc0f262ca7a2840cc02bf51a1e5f51a5bf5e6d149fd0064386e0262258c6bdbce25eb7fc5829dafe01b43de0932a46214808502b98e4e4cb22453b770c123dd0b16dd6a66cd7965573cce9eee18b6752f8e819c95fcb36f36f3fd473bc99c7c13d39bd77058ba9182e959caa7fb9f7b9d027164c4e22e071e2a9affa10e0f38473367474536c6ea06dca7f2bb44e9d756e053459b325a63a40b5579fe003c072c04ce25a8e502fc4c95341cc70217aba71f55149f776ad2e921cdf2eee9270b7c094199aa2e32f7f0fcedaa5c3fd66b85604a6882e2065dff4ae097ead92ed07f5d5dc366606f3f4034aab4b545b4742d83ab354e013e017c50e55053945dadd724db5dc0ba3eceaf053eac6b3a42011dcda477a8a1f9b9ee679ea00c33510d17bac66a35f027abd30af3194d2aa33b084a72870cc4b42639fac9451a8da54c37f114233b1bf8d89a073877eb73d4665a698d9592312e46e9a7672c4e771799d28a7da32eb8e0c1518b16ddcbcc59cbbef752d3d99b96ecfcaceb8068d781e7183205df59bc766f9be4ec439494b6bf3afa24302e0cac3121cae321882bffa6dee59da6beab80ebd50e54ed375a86d7803cc22ce0bfd42ac62389a1e21ae458823a669871be2402dc904a6f506fd8ae9b7fb5023a6429ddc0124d744c222827cd8c28d637148ca240ba08f8a2ca261c2faba11803cc52404dd56b5cab9e3cf43cc7aad2877298ad0a1dead73e9defa68324556ad5785544beabd7730632e2cad43ea31e28d4d5a56a444611941726015f500f75937ab7702c043eafff2622466895aea152e7385c8d786820a6ab5c5cfd6e7ce088285326f09a1ab7116a1816aa2ebe23209e06fc6724280d6b843fc5380fbae28371b3ae3185f3363ec9a7d73fccd88e065ae3a5b4c42bf0f514c7fa0ce9ee6257bc82e7a79cbe7dd1bf7de2d2634e3fedef5b3ab3bcb87e67eacfaf6ebbf98ddd1d334cccd96f2e0510df826bf652195f1228a21d280d2fd3c557162568de7817326e2e41d3c1b5aa8802bc00dc8ccfab08ad18a6e3f02de0ac08ed7aba885ac675132744beab544a782bf0acc61f195550573dd1b57a5c1ef88b7aad171490b3806fea7d4b9411fc56adb6a8f7be513da02860bea734b2493df4cdc0c7751b8ed56beed2fb4da677a3458902e06ee009a5c521bded8f75c45491c7458c54a71aaa8124694a802bd5d0851ef579e0872a8f6ef55ab7abb7330acab90a44a31ef4db111037037f5459ad574f9852361553f9db8881af8be842951ab29f690963971ac2ff88ec7fea9d52d3ba0353fe02b1d49f3de3f0a325b7603033c5384316ec59018e47634915562c8260102a735d7478491e1f7d12bf1a7d3acde3a6b79e7fd4d1dbc0a790eef6ac609271b78bb84bdc7310c08ae05b0b419d30830cba35aa44372951447d5a78e7e37d4a49434fb80cb80e58ee37db24798e3265a6d529376f454aff6d4a8b7345c6e2888832f90ad69b1420c5e362e05f1584dd6a613f1f5953b9826664e49c36fdf83aef8b14847905fa55910c79892a6cd4306414a08588078fe60b3628201e66e02d674905744d243edcad20c90dc0081eadeb0ee5f684b293907a96aa1c4645ca1fddeae55043728d022a2c99fcb71abf687c1a3d277affc9917b67813f2bc3d85cc430de8800b1f04e81d8a63770314630c6215923d31bd76ffece8bb70e19dbbef35b9958c9a531b1259db1142e82ab102cf173787e9ea747cce2ce69e7f17acd24f0f398bd4d25b7deff5ae2ceab8ea73de3fbebf674d2952d942050b082551a1b19a5117a59448d9d836d58a2e8bcbc0aee9d7ac3f3d47304f231fc497c964b8718845a0c5760c846acade886aea57757d2e111a50ee3ca1f2ab08b131b8745e2b9b06ed5a889a81a05c8511aa3544662977b142c28886744946c9752d0f72b8d3a52c15a1bd9fbfb23543ea5201d16a1a0bf021e65707d9f099d6b6d0428bb8b68e3c14282f322d4d8eab9138113757ed3540e35116fbb1878513df0a9c071fa73261243be5d92c851233721e2e1d6298837171d3b5ef784c83cdf01108d790ae39c805722e4ba282fa4fd3337fd217fd6b6e74f1cd3b6fda97d25b5c77858cde2883a0043d2cfd290a8dcf793e9e7b53c3cf67d88710db94e809894785bef5bbe339b2b5bc545330f976fdfb9226bc6567d8b985be7db038af48ec6468d7dc5fba5f97e139fbe82ce2fcaacd5be03101a55d81322cabe0ae12963801822691a4ca5f98629351f01ce8978c3d722715a5f2970ab99d6557d242b3c8dc366441209c395a2fe1b3d45e568acf5827accc7550e2315682511ef7921f0d1083d8c66c55f52aaf6283d35dbb11a373a3ac78dea55074bf5ab158825459e752040ac51c36122faf171fd24fa58c7cb9a007b4ce9e618cdec8640daa62c64ef00eeed687c383262e057f76138516a3a3de235d71c1a1063a5600c6eb6335b956ddd3b7fd7ab4c6bdac8cce6cdc9da6ceb8dd6f1aedb9d1a5a9eb0b6572141303848fb88eec69ffe7adcbc3b9e1c39b741c41a0a69a32cc40096dad2ccb23d1df85620e9e5c5f2874177707a09ee78e987043dc5078c0e15727711104f25e880683f042086b14d34eedc0e6cc4804919dcb8c913630f3019d9ef351b1564b6283e9cae8a1dc6282bfa29a9b86a406a547e05bd6fbd1e1f361bef5070acd27fbb8b2c74343112b6f485ad66ad91f3572a288adbc826469840568fdd344820c6d563d5156569d70f100c953a07276274b66a2c9d5539ec520fb55a01de1691e3103d3f169143fd20d8d02c35826146746d3fba342542f13bd4600d1e88e7af7b18dc18b3f7ac664cfb2eaab2ed88e38db18ef7d3ce58ea6c0fc115bb1f7caef894f9195b6a732f55e4b3372e1ebf60c9bd53179131809f8fc8ad27dbba6d6f17dbf674c0e8ca4045079bc7342e65f97ed944462d5598090c37f16215e0dd4a69de4e69e2f4748718bd4694ee76eddf08d1ed153ea6491237629957165d7b882a764cbdcb2e559cbe8028f4ce5215d4c27f53419e1800e5ce15198257d48b1422f27a3b253c22524ee9d0fa5c5bf1be4a3e8fa4d338e5e5fd01a998966e2d2a91f4f00f0ed00bbf8831bc40d09cf1a6b285ecdb6892d3070e64108678462437b04da9a9f4b1c689110fdda5f981c103f1e2758f0042ce89631d87ce786aae27f20b17663891fb5aa0bc9026eb25b87ffcfce56df1f20b7797d6d6ff7ed2d929721dd750c81c03a6ef448b6bc075c35cacaf5cfb9508751a52247447156a1fc6b1713f8773f00cea9bc0032a941191b4f9d780f9aaccabd51b847d8d494da28c24780a6427706f4451da8bacca2855d0b7806a84b3806f453c4768f1bb7423c318714224cef1d528f4d722e5eba637e87593c0291acffdb528131b53ef57a3c787e5808dbace701cad40bcafc8a2c7d5e21fa6730e15ad52bd776d243edcd80b3c8e836d6bc5a9aea1f4f43348fffde9a0cc647a355f942b13282fdaa7039a07241f5cddf47ec0ae458f3f510f3b4993890d45eb8b2b03aa53b611ceb5558d5e3826a92eac2f3a7fb852f16ebd5f46f779540447f5fdd426a744e243d1bddb7448406c8b95ee374a0e2cf490ff89b8e4fd26ab2ad741634915df9d7d394f8f3ac122d6c7e6a17b5f02f800980583f0714f4480f84955e85cd1fcdf0273a6e7c51bbfb4ea371cdb74d0b0226c46c86b2d696ae43af3f513766074abd52f558b17caea1711ca5450fab85637d8d5f2ce2ff4bb89ea09c34c65b9aad01c2d31fc5d8d4d58669810b1986b5599c07190ce4e6cba1be3c570aaaaf2882c077ea70662b89e7fbbc6723b22202c579035d3fb99bd264dac8cd3cf1882477616a9b1c9aaf256eabc8c5e3fec9a19a3f1ac13a1c6ab011b00b00dbfa995e4b1b3a9f9cfaf51f2c10fb26dd2f8be803846a96974aca3b8b7d98074192818ac5bc0498149bae0cb1ee0365dc37005c62d04cd0f6f454058a1eb28d7f2cc864886f4c148adf470cd789ea2c7c45407c26cf6bdfa7d5263cb519152de46fa7ee4e9a8080beb549dd97d48400c233f0799ab93195e7c4c79be9b755563f9d69c2b59573311326d2e58574b8d5214a3bcddc81565145345b1584f9c174b3af376bccc67363e41979b4ca92217995389c68a77294dbd18633ea016cb8d50ae61fdcc691341034017850292cb89292969c5981b75ae67e93c4f1338cdf450be9b7513af8f789185c01a440cc6941415c59b801548c0f56d6323e5975e46f91967935ebf86e6fffa0a6e6d6dd89ab71763ae558f3054cb287d25d9ee523a2400d2d58589c7efc3f35a099a104e5385fb403f6b7f18784a81e4aa31191b31486f22b209b0b6a585aaebbf4472ea4cbca993494e9842b67e33d2dd0dd6c7949406cc2700c5714575c8366023229d41cb630132b99e5c8a0792b6f8698b53094e999bc6b70f016995c302d593f7d3f7338f8b55b6d190653190c198ebf49c6a9543b12c5e009e43240d0cc39893234c67b7266032bdf4cd98981ac2d111fd5b518c850103512f3b5982f4f7885e7b2c42cacff0cad0a9dc72eca7d8533a14326d040a665cde9d918e04e0d1becc2630c4fc3c09bf408767927d01d12492c5cefb352914d64a77f7cf1d9862e008813a31a65a5c27693caf80956ec9e73a8cd0083488316b10bb5eb2394a4fff00436eb8913d179c8fedec780d6bafc131f38cebce761cb7d4e4f3fb7c784d449662cc2edd9837b5885c81612bc25f9df2f26e49a713140abf72e01f02d6c22e8c79d5292b2b84de237ed451a4169e4e62e1e92466cd66dfa7ae04b1dd38ce6f259d7e4672b9391833d3c030634c9c78dc1763daa550d82d99cc2644563aa5a59d269104c730fc4f8fd2fc9d5b6c66c9738f9944e21549a78fd1673f479844a204832ff94207d6ee06b660edebb8ee16275586edea046b5fc1982f23528a48339ef786934a0561437b3bc9134ea4fce4f9148082cde10e1bc688e79ec731311a6ffc2299975ec22412bea4d34fe1383bb51ce6604c03d6ae34c9a4482e47c9fb4ea5ea8bffcece93cf04b10180f339245fc0cf18a4338637aab2002cb65d5d4bf1fd39183313a8c398a489c50a92cb76685cbe05dfae3289c40e934844cb5d3e8627a5ab6b85140ac7e1384721321c633c13e8dd5e81ed58bbc224931b4c3209bedf61bbbaeec1f0948b4920526f612522e07998540a046c57a7c1dafb3066291047642ff012c6d8220c0d2c2efde5b4a909076e77914b3c2d4d7822b8407921433a56bae1ebc77eeaa7cbea66b7926e8bab2568009e52773c443de93983f0881f25e88f0cd3d423223188a8f74a134b6df9d0d667fcfb5efc113b4baa4b266dd87640822393e99dc8724c9ccc9a95347ef6d3b865e581bf775c049cfcce1d5e7ed366718654151233668a8924a1fc9666cacebf80ea2fde80b81e36d3cedecb2fc3dfb913934c50a8afc7747438c9e9336c416c50ff34e6c0163c2be01886fdfe215abe730bd9e79fc34d952108b6e0e3545430f497bfc24d5520368ff1bc40091d07838bcd748280ebc469fef10fe8fcfd03b8d5d53818f0f326bd6cad676dd68fcf986a9d5419b6bd95e429ef63e82d3fc0da1c4e4939924f637c43c7430fd07aeb0f706b6a914281cccb6b92f85d85f891d30a6e750d588b64b378a34631f4ae5fb2efcacb837526922082edee223e6d3a437f7c3b227910c1c462e038bd9236814a1824df1ddcf78ff707f7adadede19fc6e037355275dd1729ff978f20b118b6ad85dd675f00be05cf4572054f7c5fa4bbcb8fcf9ccef0dffc3228cc7ef66a72ebdec0294d8171908e3693dbb881c4ac63f60bdfdfb78f8a2bafa2ead2abf06d6e7f02c835719a6ebe89aebffc05774855a05d8e3101404cf0b064532315575cc5904bae24b36523fbaebe0a934868822078cf92ede82031772e43bf7d2bbee4d87bf9a5f8bb76b11ff8fbf5c030f62fcf0e1e88774d9b7aaa0b8fb9485931104b6daeb52b5ef6c92de5758fde7ccc653425cac1fa7dd58a1e082899196872ea423d271c4395e68d553ae402ab70635f9dd8d990bd7de98f98d6b683c3b7ec3b3038945c9fc57f07afd72c5ca0e3e92768bdede724e71c49cd576feef5f7fdad7692d5a492c198f8fe73db1f7e80dcbaf5d4dc78d3801aef44f23826d673dd5e7fcbf545adf72b76cf8ff1fde71bc04a8ec64f7f8ec29e1d547ff39b944e3fdab5e008f82239bbff7ada706ff030ba27963cfbaefe1cfeee7aaa6ff93aa5d367f7ca8e09798c66fa9dc82ecadbcdb78fb91be305c5ad3e8ab382b82279277083c6774cbccfe469cf7d03a087fd960648bfb586b6db7eccb09fdcd98bd9091691421fd3ea91a313493ef65ea704c6c6b8b8b8fdee71280b63e2074dc11f0a106f74e11617a118881ef27b837c34e9e7ed55a7fd279baa8f807c778fda061ea514b808638e8cf97e21eee7e3ddb144460e7cfd4154df7fad85ef704cd70447f4c9803520738997751db7772dbffec7f799b4e1c0a77db2b65736bf4483e7911893d2aca803942376837192cb1c681388599b3d5e8bb18d048dd40d9aa43845b1b71158823102cc3626de65e00d6bb3298c7314c81e4d3c24351930542975d0562638c698751a33740b528f48a9c690751a7b2c516a355193331b34a1324d934bfb807118330791368cf9876be2bb087c1962b3f3c08cd7f8d6d72e93986a6f582e48233203c71197d84a608d457cb1d9323047624c1c916731c60be21d5369302d20d582056185ae69b4262cca741f33ca86521a2f57a8ec77ab2c2762cc49401922bb806518530f1c8fc844ed7ed9ac5a3d0738d2e03820cb44ec6b6ae0cf0493c0d08cc833c638ad02b38c712b1d9c17adf846f7709fe0ef45e4686d88d8a6f15ab9eecf5b413ac48c359804d02a103398469051824c034905ed95266b8cb34e2089d8751846ea5c3621d2a0c9a394269ef21873bc365058600b222b124ea2e5503a6b9c7e5a4b2cf0aa606cd6f1b865e94fb87bea877861c431183f4fc171499754839febc616eec27171fd0225850cddb1781f183ce8d84bf052aa611a2bc60220981cb94e5e193a9d1b8ffe387f7cfbeb8c24e8b11c89c8f304fd94b33403bb5d6c36e70799d27380b355111c55a2b9040dc24dfab91ea8d3eb5c2292dd2541667128623faf86e31ebde7354ab99fd4a4c034e00e11496a62c068a17fbc66e45ed5ef8f5666309de03513cf1034999fa81bee681f4f1e780b916a5fb20d3d34de8cd26baca0a7d97b912aff336a044e046660ed933ed9db80af07f731c70137ebb53f81c8ee60ee325d822e95799a51bc4ee7f119edde19a3f7d9a446eb1c2d8f5895e9ebfaf319dabff886ca630722f51a864cd77a6b0c3817910501980a3e986605d087827d91d50817003345ec63c05922f6133e7c03e411821eda8d60daf53e592d411d41cfd32e3f017c44ce15a45ae734460203b64f0de3a2a0bc237f16f1272a6bfb0ec2f1babf8b35fbbc5099dbcf804588ccd2fbb52b20eb89f4390f188826e862bf8edecf7785de6bb801c43854e73af8faca7b695ff7307129d01d2be5af23e6b064e85436548dc5c9e7c999389df154740ea3d44bd908e8c367e0a2631f41877cdf33cc77f2d0d87903594e523df40ecd0676a9f57a58db9bd2ca1c926ae59ed152410d417f6737f05d05d51ee05fd4633a4572f122328ee9679d6e56addef301bddfc95ac3aad4ebfc5cbdc15c55e03334a3d8a22d75a7ebb105f5b2255abaf803bddfb31326bab23aa79d7acc44f55a0f69c6f77835387f552395d26b4e5683534ff07ce1f72332b4fab7b95a2e58a1d772f67bdc9eb2516de0b9d8a4eb385965bb86a07f357cbaa125c2045b756f86a90cfe1880dc7429082fd18cf7c57adcd3048f78193538e920936db6291330ba87e50ab2bfe9eff323c5f670eee1dea594f9bca93a51a7f3ffbd963a627a6e413fb3d4d08419d2f96ae41ed13a75193def74e2503ce2724d737f3752134182c55de4222fbac81f3ce350703d2a731d78406dae932fac7b888bdf2aa32d568ae7e7d85051c78dc75d4b2631040ad911048f9acc8e844886e03196338b4a18a56a816b8bbe8f058030cf53c80ca44462f5fcbc0a2f4fcffb686c248d7eaf2ae0955a830adf62b72652f40e1f474ad0fb7d368548bb5856bf2f44ee4fe4fe393d2eae6bdc45cf03b17b5421ab15602f28084e544fbe9ce0298111042f5e5aa0b5c99722dd35a69ff5875d295dfaefa9ea6157123cc83b5aefd1a046f154351c6dba1e4fbf7f516570053d4faee7f4ef715dcf033a9f0faa4cc3b737ac57607c4af7fb762d2fa5e979154b9502a25e814f844e6e8d28f5163daf4ce7f1b2d2cdebf4decb803f69a9e87265097fd273c2d6c0703fc29759a523a58642e413ee5d56e7992278eaa2551980d5b54d5040ae554ffc55d5d75b099c5bff74f320e301eddeb841171546e787a985f89381b30553e31b17df38e41d8f967819aef854e53a48fa394edcfb3ad7affa1f92850c18c755254ba86093fa734d1ff7af558f788f8237fcdca354aa6680eb085f045ba60a54a2b4331951da84ce6bb50a6fa85ac02a55ce69aab467ab97d9ab201aa9f2a8d64d9ca0f467a65e7b7751a380ab9f0adddc26add19eabe09aa39e6f67c4133daed7394969ce708b5d23c83d7127ee259cc499092751937012249c84e6f30e18a9c8fa43a57e4ac13456f7f94c5db7a3a0f4942aa722c5fe38412feba37ade293d7d1f94ea3115c026419e1464a2ebb8f3124e624bc249ec483889131cc72917e46e608720b5aee3261dc7b182b891fecf76f52eb3d59b57ab0199ac321aa934d5d1d8af4401fa3b05d259ba2f659a77b84bd773a1febd42f769b2fedca2fa7d983a9e2afd3e7c839f4bcf1bfd5cddb3ac7ad92dc0b9828c33c62c4d3889a10927f1610c8d187e9670124ec2498c3a548f188eedea157fa8ca385b956c922ee23655cad5ea2dea819dd638fb0a98761f3a9be315dd67d72fcddf3ee5436ca91cd581f0a02a6c3ee2e1d671e013bf96fe1fafc931f0f78b76a925cd46921d1be9fd8ed2b8026ebe52a3bdda8f9a22787ce82bba59255a58dfa00a700ac1cbb5d612bc32e23cb5c8551a2f3ea6d7dea36b0c3de75eb5a64b3436fa88d2c5b852aee7d5820fd173ebb518be1398e819ef1407674243c39e558f3eb27871c39e86462b96f32f389fc95326238858e9259e9daadc1995fb0e55e29d7abf531484772bad8a2b353d5a69dd5b3a8f72351ecb55b98fa1e769f6b290b2bbc6cd19cc4ae02e1777dc138f3fb678cdead57b8e9e3d6bcea90be6cf487ac98a02853462d6363737a693c9927c456945cec78f5b6c93b5f67b4a453faf327b4a3d90ab1d43bb54c67f548f3e4fd7b45dbd6c85eef9348ddfc629201f557da85223e46952e97105e199c0654a49b7ab4e37d1f35f306cd2f377eab95b34c938d5356ea367bca5afad5c99397ce4f0f9c3861e7e0590d9b1a37ef1860d6ffe75fefc85875447c401fac99ae205cf1dc66242a98b0c7161888794c710d7819c2fd2a540ecb04847cccf673655d4f1d1f95fefabd4d1df18ad6d6fd3fbf8db3255fa7ab9f5c05265a677d6d4034a4d0080ae483c9889340c840ddda3d43b6e8fb4b655a9f577141061bd64885ac6527abaf80fd34d4cab2264f4bca482387c7154b9fedba1f39ba0f7698cf4b5869e28fc7f1e2a82428124124e6298c1985796bfb4e58cf77fa0abb5b5cd01e477bffb9d5c78e1851ff7c53f312ff97b0c266c19acd03576e9b5c3cc716bc49389ce2f1b610943740d5601e1e9cf9d3ab7b0b32911b453896f306eccc48c639c36c0bbe14bd7cbddbfb8c34f67d35c7ad9157ce14b37c496bef08fa1a72c3c4d460cab6bdcba6d53beabb3fbe8cacaaac3e389d8eb18760ea9ae0ecb57753aaf9d2a9b983a81a402646b648f24425b436a5f1ae90f0d5f1e1dca637c84e2b6e93587e97dc38782c3b587fb58a506ad447f6fd73597279c0440e759679e69b3b9f4a873cf5934b4b5a5a561ddfa3776d60e3b8cdb6efbef77e4110f36f291becaad6f7770597ed02f4d4bab57a92f6afe76356e1be8050b458dcd190e7cda204c16b4f6717eabd2b1e2d1c2814ffcefe5c0c7792c3dff894d38da8be6f7663f9ebcab8f733a046934185cd7a5acacccb4b77788b556124121f96f6ae5f7f473bfe2dfbbfb6947cc72f0575744df59da1f73292c7de1055ada3a9970c4182a2a2b49a7bbf32b57aed8356bee1c6498108bc54867d26badd875a9542aefb80e0ac47d1cf8847c5ed9475f7b141dcd91bdeeeb951ded7dec694659ceb67ed6e247e6d3cbd23b8ed32e081f39ffc3bcf0fcb3a6ae6ec48ee7963c5bdfd1da4673733363278cef75a1ff1d00828c3d45f9a86d7c0000000049454e44ae426082);

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter`
--

CREATE TABLE IF NOT EXISTS `ost_filter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `execorder` int(10) unsigned NOT NULL DEFAULT '99',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `match_all_rules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `stop_onmatch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `reject_ticket` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `use_replyto_email` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disable_autoresponder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `canned_response_id` int(11) unsigned NOT NULL DEFAULT '0',
  `email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `form_id` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ext_id` varchar(11) DEFAULT NULL,
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `email_id` (`email_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_filter`
--

INSERT INTO `ost_filter` (`id`, `execorder`, `isactive`, `status`, `match_all_rules`, `stop_onmatch`, `reject_ticket`, `use_replyto_email`, `disable_autoresponder`, `canned_response_id`, `email_id`, `status_id`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `form_id`, `topic_id`, `ext_id`, `target`, `name`, `notes`, `created`, `updated`) VALUES
(1, 99, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Email', 'SYSTEM BAN LIST', 'Internal list for email banning. Do not remove', '2016-03-14 18:52:33', '2016-03-14 18:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter_rule`
--

CREATE TABLE IF NOT EXISTS `ost_filter_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `what` varchar(32) NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends','match','not_match') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`),
  KEY `filter_id` (`filter_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_filter_rule`
--

INSERT INTO `ost_filter_rule` (`id`, `filter_id`, `what`, `how`, `val`, `isactive`, `notes`, `created`, `updated`) VALUES
(1, 1, 'email', 'equal', 'test@example.com', 1, '', '2016-03-14 18:52:33', '2016-03-14 18:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form`
--

CREATE TABLE IF NOT EXISTS `ost_form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(8) NOT NULL DEFAULT 'G',
  `deletable` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `instructions` varchar(512) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ost_form`
--

INSERT INTO `ost_form` (`id`, `type`, `deletable`, `title`, `instructions`, `notes`, `created`, `updated`) VALUES
(1, 'U', 1, 'Contact Information', NULL, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(2, 'T', 1, 'Ticket Details', 'Please Describe Your Issue', 'This form will be attached to every ticket, regardless of its source.\nYou can add any fields to this form and they will be available to all\ntickets, and will be searchable with advanced search and filterable.', '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(3, 'C', 1, 'Company Information', 'Details available in email templates', NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(4, 'O', 1, 'Organization Information', 'Details on user organization', NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(5, 'L1', 1, 'Ticket Status Properties', 'Properties that can be set on a ticket status.', NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_entry`
--

CREATE TABLE IF NOT EXISTS `ost_form_entry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) unsigned NOT NULL,
  `object_id` int(11) unsigned DEFAULT NULL,
  `object_type` char(1) NOT NULL DEFAULT 'T',
  `sort` int(11) unsigned NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_lookup` (`object_type`,`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ost_form_entry`
--

INSERT INTO `ost_form_entry` (`id`, `form_id`, `object_id`, `object_type`, `sort`, `created`, `updated`) VALUES
(1, 4, 1, 'O', 1, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(2, 3, NULL, 'C', 1, '2016-03-14 18:52:35', '2016-03-14 18:52:35'),
(3, 1, 1, 'U', 1, '2016-03-14 18:52:36', '2016-03-14 18:52:36'),
(4, 2, 1, 'T', 1, '2016-03-14 18:52:36', '2016-03-14 18:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_entry_values`
--

CREATE TABLE IF NOT EXISTS `ost_form_entry_values` (
  `entry_id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `value` text,
  `value_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`entry_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_form_entry_values`
--

INSERT INTO `ost_form_entry_values` (`entry_id`, `field_id`, `value`, `value_id`) VALUES
(1, 28, '420 Desoto Street\nAlexandria, LA 71301', NULL),
(1, 29, '3182903674', NULL),
(1, 30, 'http://osticket.com', NULL),
(1, 31, 'Not only do we develop the software, we also use it to manage support for osTicket. Let us help you quickly implement and leverage the full potential of osTicket''s features and functionality. Contact us for professional support or visit our website for documentation and community support.', NULL),
(2, 23, 'CareerTech', NULL),
(2, 24, 'http://www.careertech.in/', NULL),
(2, 25, '912065116622', NULL),
(2, 26, '2nd floor,kasturi Heights, CTS no.4522,Plot No.6, Chinchwad,Pune-411019', NULL),
(3, 3, NULL, NULL),
(3, 4, NULL, NULL),
(4, 20, 'osTicket Installed!', NULL),
(4, 22, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_field`
--

CREATE TABLE IF NOT EXISTS `ost_form_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `label` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `edit_mask` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `configuration` text,
  `sort` int(11) unsigned NOT NULL,
  `hint` varchar(512) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `ost_form_field`
--

INSERT INTO `ost_form_field` (`id`, `form_id`, `type`, `label`, `required`, `private`, `edit_mask`, `name`, `configuration`, `sort`, `hint`, `created`, `updated`) VALUES
(1, 1, 'text', 'Email Address', 1, 0, 15, 'email', '{"size":40,"length":64,"validator":"email"}', 1, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(2, 1, 'text', 'Full Name', 1, 0, 15, 'name', '{"size":40,"length":64}', 2, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(3, 1, 'phone', 'Phone Number', 0, 0, 0, 'phone', NULL, 3, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(4, 1, 'memo', 'Internal Notes', 0, 1, 0, 'notes', '{"rows":4,"cols":40}', 4, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(20, 2, 'text', 'Issue Summary', 1, 0, 15, 'subject', '{"size":40,"length":50}', 1, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(21, 2, 'thread', 'Issue Details', 1, 0, 15, 'message', NULL, 2, 'Details on the reason(s) for opening the ticket.', '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(22, 2, 'priority', 'Priority Level', 0, 1, 3, 'priority', NULL, 3, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(23, 3, 'text', 'Company Name', 1, 0, 3, 'name', '{"size":40,"length":64}', 1, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(24, 3, 'text', 'Website', 0, 0, 0, 'website', '{"size":40,"length":64}', 2, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(25, 3, 'phone', 'Phone Number', 0, 0, 0, 'phone', '{"ext":false}', 3, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(26, 3, 'memo', 'Address', 0, 0, 0, 'address', '{"rows":2,"cols":40,"html":false,"length":100}', 4, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(27, 4, 'text', 'Name', 1, 0, 15, 'name', '{"size":40,"length":64}', 1, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(28, 4, 'memo', 'Address', 0, 0, 0, 'address', '{"rows":2,"cols":40,"length":100,"html":false}', 2, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(29, 4, 'phone', 'Phone', 0, 0, 0, 'phone', NULL, 3, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(30, 4, 'text', 'Website', 0, 0, 0, 'website', '{"size":40,"length":0}', 4, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(31, 4, 'memo', 'Internal Notes', 0, 0, 0, 'notes', '{"rows":4,"cols":40}', 5, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(32, 5, 'state', 'State', 1, 0, 63, 'state', '{"prompt":"State of a ticket"}', 1, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(33, 5, 'memo', 'Description', 0, 0, 15, 'description', '{"rows":2,"cols":40,"html":false,"length":100}', 3, NULL, '2016-03-14 18:52:33', '2016-03-14 18:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_group_dept_access`
--

CREATE TABLE IF NOT EXISTS `ost_group_dept_access` (
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `group_dept` (`group_id`,`dept_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_group_dept_access`
--

INSERT INTO `ost_group_dept_access` (`group_id`, `dept_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(2, 2),
(3, 2),
(1, 3),
(2, 3),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ost_groups`
--

CREATE TABLE IF NOT EXISTS `ost_groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL DEFAULT '',
  `can_create_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_edit_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_post_ticket_reply` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_delete_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_close_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_assign_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_transfer_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_ban_emails` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_manage_premade` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_manage_faq` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_view_staff_stats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `group_active` (`group_enabled`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ost_groups`
--

INSERT INTO `ost_groups` (`group_id`, `group_enabled`, `group_name`, `can_create_tickets`, `can_edit_tickets`, `can_post_ticket_reply`, `can_delete_tickets`, `can_close_tickets`, `can_assign_tickets`, `can_transfer_tickets`, `can_ban_emails`, `can_manage_premade`, `can_manage_faq`, `can_view_staff_stats`, `notes`, `created`, `updated`) VALUES
(1, 1, 'Lion Tamers', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 'System overlords. These folks (initially) have full control to all the departments they have access to.', '2016-03-14 18:52:34', '2016-03-14 18:52:34'),
(2, 1, 'Elephant Walkers', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 'Inhabitants of the ivory tower', '2016-03-14 18:52:34', '2016-03-14 18:52:34'),
(3, 1, 'Flea Trainers', 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 'Lowly staff members', '2016-03-14 18:52:34', '2016-03-14 18:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `ost_help_topic`
--

CREATE TABLE IF NOT EXISTS `ost_help_topic` (
  `topic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `noautoresp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned DEFAULT '0',
  `status_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `page_id` int(10) unsigned NOT NULL DEFAULT '0',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sequence_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `topic` varchar(32) NOT NULL DEFAULT '',
  `number_format` varchar(32) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic` (`topic`,`topic_pid`),
  KEY `topic_pid` (`topic_pid`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`,`team_id`),
  KEY `sla_id` (`sla_id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `ost_help_topic`
--

INSERT INTO `ost_help_topic` (`topic_id`, `topic_pid`, `isactive`, `ispublic`, `noautoresp`, `flags`, `status_id`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `page_id`, `form_id`, `sequence_id`, `sort`, `topic`, `number_format`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 1, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 2, 'General Inquiry', '', 'Questions about products or services', '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(2, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 'Feedback', '', 'Tickets that primarily concern the sales and billing departments', '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(10, 0, 1, 1, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 3, 'Report a Problem', '', 'Product, service, or equipment related issues', '2016-03-14 18:52:33', '2016-03-14 18:52:33'),
(11, 10, 1, 1, 0, 0, 0, 3, 1, 0, 0, 1, 0, 0, 0, 4, 'Access Issue', '', 'Report an inability access a physical or virtual asset', '2016-03-14 18:52:33', '2016-03-14 18:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_list`
--

CREATE TABLE IF NOT EXISTS `ost_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_plural` varchar(255) DEFAULT NULL,
  `sort_mode` enum('Alpha','-Alpha','SortCol') NOT NULL DEFAULT 'Alpha',
  `masks` int(11) unsigned NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_list`
--

INSERT INTO `ost_list` (`id`, `name`, `name_plural`, `sort_mode`, `masks`, `type`, `notes`, `created`, `updated`) VALUES
(1, 'Ticket Status', 'Ticket Statuses', 'SortCol', 13, 'ticket-status', 'Ticket statuses', '2016-03-14 18:52:33', '2016-03-14 18:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_list_items`
--

CREATE TABLE IF NOT EXISTS `ost_list_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `list_id` int(11) DEFAULT NULL,
  `status` int(11) unsigned NOT NULL DEFAULT '1',
  `value` varchar(255) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `properties` text,
  PRIMARY KEY (`id`),
  KEY `list_item_lookup` (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_note`
--

CREATE TABLE IF NOT EXISTS `ost_note` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned DEFAULT NULL,
  `staff_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ext_id` varchar(10) DEFAULT NULL,
  `body` text,
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ext_id` (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_organization`
--

CREATE TABLE IF NOT EXISTS `ost_organization` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `manager` varchar(16) NOT NULL DEFAULT '',
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `domain` varchar(256) NOT NULL DEFAULT '',
  `extra` text,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_organization`
--

INSERT INTO `ost_organization` (`id`, `name`, `manager`, `status`, `domain`, `extra`, `created`, `updated`) VALUES
(1, 'osTicket', '', 0, '', NULL, '2016-03-14 13:22:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_plugin`
--

CREATE TABLE IF NOT EXISTS `ost_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `install_path` varchar(60) NOT NULL,
  `isphar` tinyint(1) NOT NULL DEFAULT '0',
  `isactive` tinyint(1) NOT NULL DEFAULT '0',
  `version` varchar(64) DEFAULT NULL,
  `installed` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_sequence`
--

CREATE TABLE IF NOT EXISTS `ost_sequence` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `flags` int(10) unsigned DEFAULT NULL,
  `next` bigint(20) unsigned NOT NULL DEFAULT '1',
  `increment` int(11) DEFAULT '1',
  `padding` char(1) DEFAULT '0',
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_sequence`
--

INSERT INTO `ost_sequence` (`id`, `name`, `flags`, `next`, `increment`, `padding`, `updated`) VALUES
(1, 'General Tickets', 1, 1, 1, '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_session`
--

CREATE TABLE IF NOT EXISTS `ost_session` (
  `session_id` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `session_data` blob,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'osTicket staff/client ID',
  `user_ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `updated` (`session_updated`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ost_session`
--

INSERT INTO `ost_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('2g41o3ho0msb5hl041ja3ab213', 0x6366673a636f72657c613a323a7b733a393a22747a5f6f6666736574223b733a333a22352e35223b733a31323a2264625f747a5f6f6666736574223b733a363a22352e35303030223b7d637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266303834303330666161613862663030363963653737366236343632356534383538626166633431223b733a343a2274696d65223b693a313435383033313730383b7d545a5f4f46465345547c733a343a222d352e30223b545a5f4453547c623a303b6366673a6d7973716c7365617263687c613a303a7b7d6366673a6c6973742e317c613a303a7b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32393a222f6f737469636b65742d76312e392e31322f75706c6f61642f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a323a7b733a323a226964223b733a313a2231223b733a333a226b6579223b733a31333a226c6f63616c3a4e61766e656574223b7d7d6366673a73746166662e317c613a303a7b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2237616465643334663566343236336635623163666333646134313839313166373a313435383033313730373a3833376563353735346635303363666161656530393239666434383937346537223b7d73746166663a6c616e677c733a353a22656e5f5553223b3a3a517c733a343a226f70656e223b7365617263685f31346438656462636439613862643765346438343265373763623965383831377c733a323037313a2253454c454354207469636b65742e7469636b65745f69642c746c6f636b2e6c6f636b5f69642c7469636b65742e606e756d626572602c7469636b65742e646570745f69642c7469636b65742e73746166665f69642c7469636b65742e7465616d5f696420202c757365722e6e616d65202c656d61696c2e6164647265737320617320656d61696c2c20646570742e646570745f6e616d652c207374617475732e737461746520202c7374617475732e6e616d65206173207374617475732c7469636b65742e736f757263652c7469636b65742e69736f7665726475652c7469636b65742e6973616e7377657265642c7469636b65742e6372656174656420202c4946287469636b65742e64756564617465204953204e554c4c2c494628736c612e6964204953204e554c4c2c204e554c4c2c20444154455f414444287469636b65742e637265617465642c20494e54455256414c20736c612e67726163655f706572696f6420484f555229292c207469636b65742e6475656461746529206173206475656461746520202c434153542847524541544553542849464e554c4c287469636b65742e6c6173746d6573736167652c2030292c2049464e554c4c287469636b65742e636c6f7365642c2030292c2049464e554c4c287469636b65742e72656f70656e65642c2030292c207469636b65742e6372656174656429206173206461746574696d6529206173206566666563746976655f6461746520202c7469636b65742e63726561746564206173207469636b65745f637265617465642c20434f4e4341545f5753282220222c2073746166662e66697273746e616d652c2073746166662e6c6173746e616d65292061732073746166662c207465616d2e6e616d65206173207465616d20202c49462873746166662e73746166665f6964204953204e554c4c2c7465616d2e6e616d652c434f4e4341545f5753282220222c2073746166662e6c6173746e616d652c2073746166662e66697273746e616d6529292061732061737369676e656420202c49462870746f7069632e746f7069635f706964204953204e554c4c2c20746f7069632e746f7069632c20434f4e4341545f57532822202f20222c2070746f7069632e746f7069632c20746f7069632e746f70696329292061732068656c70746f70696320202c63646174612e7072696f72697479206173207072696f726974795f69642c2063646174612e7375626a6563742c207072692e7072696f726974795f646573632c207072692e7072696f726974795f636f6c6f72202046524f4d206f73745f7469636b6574207469636b657420204c454654204a4f494e206f73745f7469636b65745f737461747573207374617475730a2020202020202020202020204f4e20287374617475732e6964203d207469636b65742e7374617475735f69642920204c454654204a4f494e206f73745f757365722075736572204f4e20757365722e6964203d207469636b65742e757365725f6964204c454654204a4f494e206f73745f757365725f656d61696c20656d61696c204f4e20757365722e6964203d20656d61696c2e757365725f6964204c454654204a4f494e206f73745f6465706172746d656e742064657074204f4e207469636b65742e646570745f69643d646570742e646570745f696420204c454654204a4f494e206f73745f7469636b65745f6c6f636b20746c6f636b204f4e20287469636b65742e7469636b65745f69643d746c6f636b2e7469636b65745f696420414e4420746c6f636b2e6578706972653e4e4f5728290a202020202020202020202020202020414e4420746c6f636b2e73746166665f6964213d312920204c454654204a4f494e206f73745f7374616666207374616666204f4e20287469636b65742e73746166665f69643d73746166662e73746166665f69642920204c454654204a4f494e206f73745f7465616d207465616d204f4e20287469636b65742e7465616d5f69643d7465616d2e7465616d5f69642920204c454654204a4f494e206f73745f736c6120736c61204f4e20287469636b65742e736c615f69643d736c612e696420414e4420736c612e69736163746976653d312920204c454654204a4f494e206f73745f68656c705f746f70696320746f706963204f4e20287469636b65742e746f7069635f69643d746f7069632e746f7069635f69642920204c454654204a4f494e206f73745f68656c705f746f7069632070746f706963204f4e202870746f7069632e746f7069635f69643d746f7069632e746f7069635f7069642920204c454654204a4f494e206f73745f7469636b65745f5f6364617461206364617461204f4e202863646174612e7469636b65745f6964203d207469636b65742e7469636b65745f69642920204c454654204a4f494e206f73745f7469636b65745f7072696f7269747920707269204f4e20287072692e7072696f726974795f6964203d2063646174612e7072696f726974792920205748455245202820202028207469636b65742e73746166665f69643d3120414e44207374617475732e73746174653d226f70656e222920204f52207469636b65742e646570745f696420494e2028312c322c3329202920414e44207374617475732e737461746520494e20280a20202020202020202020202020202020276f70656e2720292020414e44207469636b65742e6973616e7377657265643d3020204f52444552204259207072692e7072696f726974795f757267656e6379204153432c206566666563746976655f6461746520444553432c207469636b65742e637265617465642044455343204c494d495420302c3235223b6c61737463726f6e63616c6c7c693a313435383033313730383b75736572735f71735f63653734366230623731363664346230663037306530393232356264376632377c733a3530343a2253454c45435420757365722e2a2c20656d61696c2e6164647265737320617320656d61696c2c206f72672e6e616d65206173206f7267616e697a6174696f6e0a202020202020202020202c206163636f756e742e6964206173206163636f756e745f69642c206163636f756e742e737461747573206173206163636f756e745f737461747573202c20636f756e742844495354494e4354207469636b65742e7469636b65745f696429206173207469636b657473202046524f4d206f73745f757365722075736572204c454654204a4f494e206f73745f757365725f656d61696c20656d61696c204f4e2028757365722e6964203d20656d61696c2e757365725f696429204c454654204a4f494e206f73745f6f7267616e697a6174696f6e206f7267204f4e2028757365722e6f72675f6964203d206f72672e696429204c454654204a4f494e206f73745f757365725f6163636f756e74206163636f756e74204f4e20286163636f756e742e757365725f6964203d20757365722e69642920204c454654204a4f494e206f73745f7469636b6574207469636b6574204f4e20287469636b65742e757365725f6964203d20757365722e696429202057484552452031202047524f555020425920757365722e6964204f5244455220425920757365722e6e616d652041534320204c494d495420302c3235223b6366673a646570742e317c613a303a7b7d, '2016-03-16 14:18:28', '2016-03-15 14:18:28', '0', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36'),
('mbhe9g557pkkrikq293rvadl70', 0x6366673a636f72657c613a313a7b733a393a22747a5f6f6666736574223b733a333a22352e35223b7d637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233393434323830643637383533323638663334653635626662333763383762336532636236383739223b733a343a2274696d65223b693a313435393332323233383b7d545a5f4f46465345547c733a333a22352e35223b545a5f4453547c733a313a2230223b6366673a6d7973716c7365617263687c613a303a7b7d6366673a6c6973742e317c613a303a7b7d, '2016-03-31 12:47:20', '2016-03-30 12:47:20', '0', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36'),
('nc3s78bomvqfkoe8uvaq46puu6', 0x6366673a636f72657c613a323a7b733a393a22747a5f6f6666736574223b733a343a222d352e30223b733a31323a2264625f747a5f6f6666736574223b733a363a22352e35303030223b7d637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237643536323535323533383462336135343733373732373336383161663530366662623363373634223b733a343a2274696d65223b693a313435373936333136343b7d545a5f4f46465345547c733a343a222d352e30223b545a5f4453547c623a303b6366673a6d7973716c7365617263687c613a303a7b7d6366673a6c6973742e317c613a303a7b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a34313a222f6f735469636b65742d76312e392e31322f75706c6f61642f7363702f73657474696e67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a323a7b733a353a227374616666223b613a323a7b733a323a226964223b733a313a2231223b733a333a226b6579223b733a31333a226c6f63616c3a4e61766e656574223b7d733a343a2275736572223b613a313a7b733a373a22737472696b6573223b693a313b7d7d6366673a73746166662e317c613a303a7b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2261323331663833353462383266623333633631333364616237656234376563323a313435373936333134353a3833376563353735346635303363666161656530393239666434383937346537223b7d73746166663a6c616e677c733a353a22656e5f5553223b6c61737463726f6e63616c6c7c693a313435373936333132343b3a3a517c733a343a226f70656e223b7365617263685f31346438656462636439613862643765346438343265373763623965383831377c733a323037313a2253454c454354207469636b65742e7469636b65745f69642c746c6f636b2e6c6f636b5f69642c7469636b65742e606e756d626572602c7469636b65742e646570745f69642c7469636b65742e73746166665f69642c7469636b65742e7465616d5f696420202c757365722e6e616d65202c656d61696c2e6164647265737320617320656d61696c2c20646570742e646570745f6e616d652c207374617475732e737461746520202c7374617475732e6e616d65206173207374617475732c7469636b65742e736f757263652c7469636b65742e69736f7665726475652c7469636b65742e6973616e7377657265642c7469636b65742e6372656174656420202c4946287469636b65742e64756564617465204953204e554c4c2c494628736c612e6964204953204e554c4c2c204e554c4c2c20444154455f414444287469636b65742e637265617465642c20494e54455256414c20736c612e67726163655f706572696f6420484f555229292c207469636b65742e6475656461746529206173206475656461746520202c434153542847524541544553542849464e554c4c287469636b65742e6c6173746d6573736167652c2030292c2049464e554c4c287469636b65742e636c6f7365642c2030292c2049464e554c4c287469636b65742e72656f70656e65642c2030292c207469636b65742e6372656174656429206173206461746574696d6529206173206566666563746976655f6461746520202c7469636b65742e63726561746564206173207469636b65745f637265617465642c20434f4e4341545f5753282220222c2073746166662e66697273746e616d652c2073746166662e6c6173746e616d65292061732073746166662c207465616d2e6e616d65206173207465616d20202c49462873746166662e73746166665f6964204953204e554c4c2c7465616d2e6e616d652c434f4e4341545f5753282220222c2073746166662e6c6173746e616d652c2073746166662e66697273746e616d6529292061732061737369676e656420202c49462870746f7069632e746f7069635f706964204953204e554c4c2c20746f7069632e746f7069632c20434f4e4341545f57532822202f20222c2070746f7069632e746f7069632c20746f7069632e746f70696329292061732068656c70746f70696320202c63646174612e7072696f72697479206173207072696f726974795f69642c2063646174612e7375626a6563742c207072692e7072696f726974795f646573632c207072692e7072696f726974795f636f6c6f72202046524f4d206f73745f7469636b6574207469636b657420204c454654204a4f494e206f73745f7469636b65745f737461747573207374617475730a2020202020202020202020204f4e20287374617475732e6964203d207469636b65742e7374617475735f69642920204c454654204a4f494e206f73745f757365722075736572204f4e20757365722e6964203d207469636b65742e757365725f6964204c454654204a4f494e206f73745f757365725f656d61696c20656d61696c204f4e20757365722e6964203d20656d61696c2e757365725f6964204c454654204a4f494e206f73745f6465706172746d656e742064657074204f4e207469636b65742e646570745f69643d646570742e646570745f696420204c454654204a4f494e206f73745f7469636b65745f6c6f636b20746c6f636b204f4e20287469636b65742e7469636b65745f69643d746c6f636b2e7469636b65745f696420414e4420746c6f636b2e6578706972653e4e4f5728290a202020202020202020202020202020414e4420746c6f636b2e73746166665f6964213d312920204c454654204a4f494e206f73745f7374616666207374616666204f4e20287469636b65742e73746166665f69643d73746166662e73746166665f69642920204c454654204a4f494e206f73745f7465616d207465616d204f4e20287469636b65742e7465616d5f69643d7465616d2e7465616d5f69642920204c454654204a4f494e206f73745f736c6120736c61204f4e20287469636b65742e736c615f69643d736c612e696420414e4420736c612e69736163746976653d312920204c454654204a4f494e206f73745f68656c705f746f70696320746f706963204f4e20287469636b65742e746f7069635f69643d746f7069632e746f7069635f69642920204c454654204a4f494e206f73745f68656c705f746f7069632070746f706963204f4e202870746f7069632e746f7069635f69643d746f7069632e746f7069635f7069642920204c454654204a4f494e206f73745f7469636b65745f5f6364617461206364617461204f4e202863646174612e7469636b65745f6964203d207469636b65742e7469636b65745f69642920204c454654204a4f494e206f73745f7469636b65745f7072696f7269747920707269204f4e20287072692e7072696f726974795f6964203d2063646174612e7072696f726974792920205748455245202820202028207469636b65742e73746166665f69643d3120414e44207374617475732e73746174653d226f70656e222920204f52207469636b65742e646570745f696420494e2028312c322c3329202920414e44207374617475732e737461746520494e20280a20202020202020202020202020202020276f70656e2720292020414e44207469636b65742e6973616e7377657265643d3020204f52444552204259207072692e7072696f726974795f757267656e6379204153432c206566666563746976655f6461746520444553432c207469636b65742e637265617465642044455343204c494d495420302c3235223b6f70656e5f7469636b6574737c613a323a7b733a343a22736f7274223b733a333a22707269223b733a353a226f72646572223b733a343a2244455343223b7d7365617263685f66636231333034346533373236306431653663326663633832613033346431657c733a323032393a2253454c454354207469636b65742e7469636b65745f69642c746c6f636b2e6c6f636b5f69642c7469636b65742e606e756d626572602c7469636b65742e646570745f69642c7469636b65742e73746166665f69642c7469636b65742e7465616d5f696420202c757365722e6e616d65202c656d61696c2e6164647265737320617320656d61696c2c20646570742e646570745f6e616d652c207374617475732e737461746520202c7374617475732e6e616d65206173207374617475732c7469636b65742e736f757263652c7469636b65742e69736f7665726475652c7469636b65742e6973616e7377657265642c7469636b65742e6372656174656420202c4946287469636b65742e64756564617465204953204e554c4c2c494628736c612e6964204953204e554c4c2c204e554c4c2c20444154455f414444287469636b65742e637265617465642c20494e54455256414c20736c612e67726163655f706572696f6420484f555229292c207469636b65742e6475656461746529206173206475656461746520202c434153542847524541544553542849464e554c4c287469636b65742e6c6173746d6573736167652c2030292c2049464e554c4c287469636b65742e636c6f7365642c2030292c2049464e554c4c287469636b65742e72656f70656e65642c2030292c207469636b65742e6372656174656429206173206461746574696d6529206173206566666563746976655f6461746520202c7469636b65742e63726561746564206173207469636b65745f637265617465642c20434f4e4341545f5753282220222c2073746166662e66697273746e616d652c2073746166662e6c6173746e616d65292061732073746166662c207465616d2e6e616d65206173207465616d20202c49462873746166662e73746166665f6964204953204e554c4c2c7465616d2e6e616d652c434f4e4341545f5753282220222c2073746166662e6c6173746e616d652c2073746166662e66697273746e616d6529292061732061737369676e656420202c49462870746f7069632e746f7069635f706964204953204e554c4c2c20746f7069632e746f7069632c20434f4e4341545f57532822202f20222c2070746f7069632e746f7069632c20746f7069632e746f70696329292061732068656c70746f70696320202c63646174612e7072696f72697479206173207072696f726974795f69642c2063646174612e7375626a6563742c207072692e7072696f726974795f646573632c207072692e7072696f726974795f636f6c6f72202046524f4d206f73745f7469636b6574207469636b657420204c454654204a4f494e206f73745f7469636b65745f737461747573207374617475730a2020202020202020202020204f4e20287374617475732e6964203d207469636b65742e7374617475735f69642920204c454654204a4f494e206f73745f757365722075736572204f4e20757365722e6964203d207469636b65742e757365725f6964204c454654204a4f494e206f73745f757365725f656d61696c20656d61696c204f4e20757365722e6964203d20656d61696c2e757365725f6964204c454654204a4f494e206f73745f6465706172746d656e742064657074204f4e207469636b65742e646570745f69643d646570742e646570745f696420204c454654204a4f494e206f73745f7469636b65745f6c6f636b20746c6f636b204f4e20287469636b65742e7469636b65745f69643d746c6f636b2e7469636b65745f696420414e4420746c6f636b2e6578706972653e4e4f5728290a202020202020202020202020202020414e4420746c6f636b2e73746166665f6964213d312920204c454654204a4f494e206f73745f7374616666207374616666204f4e20287469636b65742e73746166665f69643d73746166662e73746166665f69642920204c454654204a4f494e206f73745f7465616d207465616d204f4e20287469636b65742e7465616d5f69643d7465616d2e7465616d5f69642920204c454654204a4f494e206f73745f736c6120736c61204f4e20287469636b65742e736c615f69643d736c612e696420414e4420736c612e69736163746976653d312920204c454654204a4f494e206f73745f68656c705f746f70696320746f706963204f4e20287469636b65742e746f7069635f69643d746f7069632e746f7069635f69642920204c454654204a4f494e206f73745f68656c705f746f7069632070746f706963204f4e202870746f7069632e746f7069635f69643d746f7069632e746f7069635f7069642920204c454654204a4f494e206f73745f7469636b65745f5f6364617461206364617461204f4e202863646174612e7469636b65745f6964203d207469636b65742e7469636b65745f69642920204c454654204a4f494e206f73745f7469636b65745f7072696f7269747920707269204f4e20287072692e7072696f726974795f6964203d2063646174612e7072696f726974792920205748455245202820202028207469636b65742e73746166665f69643d3120414e44207374617475732e73746174653d226f70656e222920204f52207469636b65742e646570745f696420494e2028312c322c3329202920414e44207374617475732e737461746520494e20280a20202020202020202020202020202020276f70656e2720292020414e44207469636b65742e6973616e7377657265643d3020204f52444552204259207072692e7072696f726974795f757267656e637920415343204c494d495420302c3235223b7365617263685f39616163353736623939316331363830613161383033366536383137393331347c733a323033303a2253454c454354207469636b65742e7469636b65745f69642c746c6f636b2e6c6f636b5f69642c7469636b65742e606e756d626572602c7469636b65742e646570745f69642c7469636b65742e73746166665f69642c7469636b65742e7465616d5f696420202c757365722e6e616d65202c656d61696c2e6164647265737320617320656d61696c2c20646570742e646570745f6e616d652c207374617475732e737461746520202c7374617475732e6e616d65206173207374617475732c7469636b65742e736f757263652c7469636b65742e69736f7665726475652c7469636b65742e6973616e7377657265642c7469636b65742e6372656174656420202c4946287469636b65742e64756564617465204953204e554c4c2c494628736c612e6964204953204e554c4c2c204e554c4c2c20444154455f414444287469636b65742e637265617465642c20494e54455256414c20736c612e67726163655f706572696f6420484f555229292c207469636b65742e6475656461746529206173206475656461746520202c434153542847524541544553542849464e554c4c287469636b65742e6c6173746d6573736167652c2030292c2049464e554c4c287469636b65742e636c6f7365642c2030292c2049464e554c4c287469636b65742e72656f70656e65642c2030292c207469636b65742e6372656174656429206173206461746574696d6529206173206566666563746976655f6461746520202c7469636b65742e63726561746564206173207469636b65745f637265617465642c20434f4e4341545f5753282220222c2073746166662e66697273746e616d652c2073746166662e6c6173746e616d65292061732073746166662c207465616d2e6e616d65206173207465616d20202c49462873746166662e73746166665f6964204953204e554c4c2c7465616d2e6e616d652c434f4e4341545f5753282220222c2073746166662e6c6173746e616d652c2073746166662e66697273746e616d6529292061732061737369676e656420202c49462870746f7069632e746f7069635f706964204953204e554c4c2c20746f7069632e746f7069632c20434f4e4341545f57532822202f20222c2070746f7069632e746f7069632c20746f7069632e746f70696329292061732068656c70746f70696320202c63646174612e7072696f72697479206173207072696f726974795f69642c2063646174612e7375626a6563742c207072692e7072696f726974795f646573632c207072692e7072696f726974795f636f6c6f72202046524f4d206f73745f7469636b6574207469636b657420204c454654204a4f494e206f73745f7469636b65745f737461747573207374617475730a2020202020202020202020204f4e20287374617475732e6964203d207469636b65742e7374617475735f69642920204c454654204a4f494e206f73745f757365722075736572204f4e20757365722e6964203d207469636b65742e757365725f6964204c454654204a4f494e206f73745f757365725f656d61696c20656d61696c204f4e20757365722e6964203d20656d61696c2e757365725f6964204c454654204a4f494e206f73745f6465706172746d656e742064657074204f4e207469636b65742e646570745f69643d646570742e646570745f696420204c454654204a4f494e206f73745f7469636b65745f6c6f636b20746c6f636b204f4e20287469636b65742e7469636b65745f69643d746c6f636b2e7469636b65745f696420414e4420746c6f636b2e6578706972653e4e4f5728290a202020202020202020202020202020414e4420746c6f636b2e73746166665f6964213d312920204c454654204a4f494e206f73745f7374616666207374616666204f4e20287469636b65742e73746166665f69643d73746166662e73746166665f69642920204c454654204a4f494e206f73745f7465616d207465616d204f4e20287469636b65742e7465616d5f69643d7465616d2e7465616d5f69642920204c454654204a4f494e206f73745f736c6120736c61204f4e20287469636b65742e736c615f69643d736c612e696420414e4420736c612e69736163746976653d312920204c454654204a4f494e206f73745f68656c705f746f70696320746f706963204f4e20287469636b65742e746f7069635f69643d746f7069632e746f7069635f69642920204c454654204a4f494e206f73745f68656c705f746f7069632070746f706963204f4e202870746f7069632e746f7069635f69643d746f7069632e746f7069635f7069642920204c454654204a4f494e206f73745f7469636b65745f5f6364617461206364617461204f4e202863646174612e7469636b65745f6964203d207469636b65742e7469636b65745f69642920204c454654204a4f494e206f73745f7469636b65745f7072696f7269747920707269204f4e20287072692e7072696f726974795f6964203d2063646174612e7072696f726974792920205748455245202820202028207469636b65742e73746166665f69643d3120414e44207374617475732e73746174653d226f70656e222920204f52207469636b65742e646570745f696420494e2028312c322c3329202920414e44207374617475732e737461746520494e20280a20202020202020202020202020202020276f70656e2720292020414e44207469636b65742e6973616e7377657265643d3020204f52444552204259207072692e7072696f726974795f757267656e63792044455343204c494d495420302c3235223b6366673a646570742e317c613a303a7b7d, '2016-03-15 19:16:04', '2016-03-14 19:16:04', '1', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36'),
('qhduur2alqlb8jbjmo2nqfnrk2', 0x6366673a636f72657c613a323a7b733a393a22747a5f6f6666736574223b733a343a222d352e30223b733a31323a2264625f747a5f6f6666736574223b733a363a22352e35303030223b7d637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231613562656162633236353262626535643837646665653564646137356339626463356566636537223b733a343a2274696d65223b693a313435373937303132373b7d545a5f4f46465345547c733a343a222d352e30223b545a5f4453547c733a313a2230223b6366673a6d7973716c7365617263687c613a303a7b7d6366673a6c6973742e317c613a303a7b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32393a222f6f737469636b65742d76312e392e31322f75706c6f61642f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a323a7b733a323a226964223b733a313a2231223b733a333a226b6579223b733a31333a226c6f63616c3a4e61766e656574223b7d7d6366673a73746166662e317c613a303a7b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2265666566663235626233356364666534303035653666373239303439356362613a313435373936393439393a3833376563353735346635303363666161656530393239666434383937346537223b7d73746166663a6c616e677c733a353a22656e5f5553223b3a3a517c733a343a226f70656e223b7365617263685f31346438656462636439613862643765346438343265373763623965383831377c733a323037313a2253454c454354207469636b65742e7469636b65745f69642c746c6f636b2e6c6f636b5f69642c7469636b65742e606e756d626572602c7469636b65742e646570745f69642c7469636b65742e73746166665f69642c7469636b65742e7465616d5f696420202c757365722e6e616d65202c656d61696c2e6164647265737320617320656d61696c2c20646570742e646570745f6e616d652c207374617475732e737461746520202c7374617475732e6e616d65206173207374617475732c7469636b65742e736f757263652c7469636b65742e69736f7665726475652c7469636b65742e6973616e7377657265642c7469636b65742e6372656174656420202c4946287469636b65742e64756564617465204953204e554c4c2c494628736c612e6964204953204e554c4c2c204e554c4c2c20444154455f414444287469636b65742e637265617465642c20494e54455256414c20736c612e67726163655f706572696f6420484f555229292c207469636b65742e6475656461746529206173206475656461746520202c434153542847524541544553542849464e554c4c287469636b65742e6c6173746d6573736167652c2030292c2049464e554c4c287469636b65742e636c6f7365642c2030292c2049464e554c4c287469636b65742e72656f70656e65642c2030292c207469636b65742e6372656174656429206173206461746574696d6529206173206566666563746976655f6461746520202c7469636b65742e63726561746564206173207469636b65745f637265617465642c20434f4e4341545f5753282220222c2073746166662e66697273746e616d652c2073746166662e6c6173746e616d65292061732073746166662c207465616d2e6e616d65206173207465616d20202c49462873746166662e73746166665f6964204953204e554c4c2c7465616d2e6e616d652c434f4e4341545f5753282220222c2073746166662e6c6173746e616d652c2073746166662e66697273746e616d6529292061732061737369676e656420202c49462870746f7069632e746f7069635f706964204953204e554c4c2c20746f7069632e746f7069632c20434f4e4341545f57532822202f20222c2070746f7069632e746f7069632c20746f7069632e746f70696329292061732068656c70746f70696320202c63646174612e7072696f72697479206173207072696f726974795f69642c2063646174612e7375626a6563742c207072692e7072696f726974795f646573632c207072692e7072696f726974795f636f6c6f72202046524f4d206f73745f7469636b6574207469636b657420204c454654204a4f494e206f73745f7469636b65745f737461747573207374617475730a2020202020202020202020204f4e20287374617475732e6964203d207469636b65742e7374617475735f69642920204c454654204a4f494e206f73745f757365722075736572204f4e20757365722e6964203d207469636b65742e757365725f6964204c454654204a4f494e206f73745f757365725f656d61696c20656d61696c204f4e20757365722e6964203d20656d61696c2e757365725f6964204c454654204a4f494e206f73745f6465706172746d656e742064657074204f4e207469636b65742e646570745f69643d646570742e646570745f696420204c454654204a4f494e206f73745f7469636b65745f6c6f636b20746c6f636b204f4e20287469636b65742e7469636b65745f69643d746c6f636b2e7469636b65745f696420414e4420746c6f636b2e6578706972653e4e4f5728290a202020202020202020202020202020414e4420746c6f636b2e73746166665f6964213d312920204c454654204a4f494e206f73745f7374616666207374616666204f4e20287469636b65742e73746166665f69643d73746166662e73746166665f69642920204c454654204a4f494e206f73745f7465616d207465616d204f4e20287469636b65742e7465616d5f69643d7465616d2e7465616d5f69642920204c454654204a4f494e206f73745f736c6120736c61204f4e20287469636b65742e736c615f69643d736c612e696420414e4420736c612e69736163746976653d312920204c454654204a4f494e206f73745f68656c705f746f70696320746f706963204f4e20287469636b65742e746f7069635f69643d746f7069632e746f7069635f69642920204c454654204a4f494e206f73745f68656c705f746f7069632070746f706963204f4e202870746f7069632e746f7069635f69643d746f7069632e746f7069635f7069642920204c454654204a4f494e206f73745f7469636b65745f5f6364617461206364617461204f4e202863646174612e7469636b65745f6964203d207469636b65742e7469636b65745f69642920204c454654204a4f494e206f73745f7469636b65745f7072696f7269747920707269204f4e20287072692e7072696f726974795f6964203d2063646174612e7072696f726974792920205748455245202820202028207469636b65742e73746166665f69643d3120414e44207374617475732e73746174653d226f70656e222920204f52207469636b65742e646570745f696420494e2028312c322c3329202920414e44207374617475732e737461746520494e20280a20202020202020202020202020202020276f70656e2720292020414e44207469636b65742e6973616e7377657265643d3020204f52444552204259207072692e7072696f726974795f757267656e6379204153432c206566666563746976655f6461746520444553432c207469636b65742e637265617465642044455343204c494d495420302c3235223b6c61737463726f6e63616c6c7c693a313435373936393333363b6366673a646570742e317c613a303a7b7d, '2016-03-15 21:12:07', '2016-03-14 21:12:07', '0', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36'),
('s4bj5vqa3vje8eu8s0eafvflo0', 0x6366673a636f72657c613a313a7b733a393a22747a5f6f6666736574223b733a333a22352e35223b7d637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231653839623232353435613831326162656533343761306233356163396232656663653030313238223b733a343a2274696d65223b693a313435383132343036383b7d545a5f4f46465345547c733a333a22352e35223b545a5f4453547c733a313a2230223b6366673a6d7973716c7365617263687c613a303a7b7d6366673a6c6973742e317c613a303a7b7d, '2016-03-17 15:57:48', '2016-03-16 15:57:48', '0', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36'),
('u2pcgnv82hqr4oqemnh56p6h25', 0x6366673a636f72657c613a323a7b733a393a22747a5f6f6666736574223b733a333a22352e35223b733a31323a2264625f747a5f6f6666736574223b733a363a22352e35303030223b7d637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239636131646639646338396164353535653463376535353734356663353735363030623762313239223b733a343a2274696d65223b693a313435383034303334303b7d545a5f4f46465345547c733a333a22352e35223b545a5f4453547c623a303b6366673a6d7973716c7365617263687c613a303a7b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a33373a222f6f737469636b65742d76312e392e31322f75706c6f61642f7363702f6c6f67732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a323a7b733a323a226964223b733a313a2231223b733a333a226b6579223b733a31333a226c6f63616c3a4e61766e656574223b7d7d6366673a73746166662e317c613a303a7b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2265333936656362663631313265313934363861313433666331623230306466613a313435383034303333353a3833376563353735346635303363666161656530393239666434383937346537223b7d73746166663a6c616e677c733a353a22656e5f5553223b6366673a6c6973742e317c613a303a7b7d6c61737463726f6e63616c6c7c693a313435383034303333353b3a3a517c733a343a226f70656e223b7365617263685f31346438656462636439613862643765346438343265373763623965383831377c733a323037313a2253454c454354207469636b65742e7469636b65745f69642c746c6f636b2e6c6f636b5f69642c7469636b65742e606e756d626572602c7469636b65742e646570745f69642c7469636b65742e73746166665f69642c7469636b65742e7465616d5f696420202c757365722e6e616d65202c656d61696c2e6164647265737320617320656d61696c2c20646570742e646570745f6e616d652c207374617475732e737461746520202c7374617475732e6e616d65206173207374617475732c7469636b65742e736f757263652c7469636b65742e69736f7665726475652c7469636b65742e6973616e7377657265642c7469636b65742e6372656174656420202c4946287469636b65742e64756564617465204953204e554c4c2c494628736c612e6964204953204e554c4c2c204e554c4c2c20444154455f414444287469636b65742e637265617465642c20494e54455256414c20736c612e67726163655f706572696f6420484f555229292c207469636b65742e6475656461746529206173206475656461746520202c434153542847524541544553542849464e554c4c287469636b65742e6c6173746d6573736167652c2030292c2049464e554c4c287469636b65742e636c6f7365642c2030292c2049464e554c4c287469636b65742e72656f70656e65642c2030292c207469636b65742e6372656174656429206173206461746574696d6529206173206566666563746976655f6461746520202c7469636b65742e63726561746564206173207469636b65745f637265617465642c20434f4e4341545f5753282220222c2073746166662e66697273746e616d652c2073746166662e6c6173746e616d65292061732073746166662c207465616d2e6e616d65206173207465616d20202c49462873746166662e73746166665f6964204953204e554c4c2c7465616d2e6e616d652c434f4e4341545f5753282220222c2073746166662e6c6173746e616d652c2073746166662e66697273746e616d6529292061732061737369676e656420202c49462870746f7069632e746f7069635f706964204953204e554c4c2c20746f7069632e746f7069632c20434f4e4341545f57532822202f20222c2070746f7069632e746f7069632c20746f7069632e746f70696329292061732068656c70746f70696320202c63646174612e7072696f72697479206173207072696f726974795f69642c2063646174612e7375626a6563742c207072692e7072696f726974795f646573632c207072692e7072696f726974795f636f6c6f72202046524f4d206f73745f7469636b6574207469636b657420204c454654204a4f494e206f73745f7469636b65745f737461747573207374617475730a2020202020202020202020204f4e20287374617475732e6964203d207469636b65742e7374617475735f69642920204c454654204a4f494e206f73745f757365722075736572204f4e20757365722e6964203d207469636b65742e757365725f6964204c454654204a4f494e206f73745f757365725f656d61696c20656d61696c204f4e20757365722e6964203d20656d61696c2e757365725f6964204c454654204a4f494e206f73745f6465706172746d656e742064657074204f4e207469636b65742e646570745f69643d646570742e646570745f696420204c454654204a4f494e206f73745f7469636b65745f6c6f636b20746c6f636b204f4e20287469636b65742e7469636b65745f69643d746c6f636b2e7469636b65745f696420414e4420746c6f636b2e6578706972653e4e4f5728290a202020202020202020202020202020414e4420746c6f636b2e73746166665f6964213d312920204c454654204a4f494e206f73745f7374616666207374616666204f4e20287469636b65742e73746166665f69643d73746166662e73746166665f69642920204c454654204a4f494e206f73745f7465616d207465616d204f4e20287469636b65742e7465616d5f69643d7465616d2e7465616d5f69642920204c454654204a4f494e206f73745f736c6120736c61204f4e20287469636b65742e736c615f69643d736c612e696420414e4420736c612e69736163746976653d312920204c454654204a4f494e206f73745f68656c705f746f70696320746f706963204f4e20287469636b65742e746f7069635f69643d746f7069632e746f7069635f69642920204c454654204a4f494e206f73745f68656c705f746f7069632070746f706963204f4e202870746f7069632e746f7069635f69643d746f7069632e746f7069635f7069642920204c454654204a4f494e206f73745f7469636b65745f5f6364617461206364617461204f4e202863646174612e7469636b65745f6964203d207469636b65742e7469636b65745f69642920204c454654204a4f494e206f73745f7469636b65745f7072696f7269747920707269204f4e20287072692e7072696f726974795f6964203d2063646174612e7072696f726974792920205748455245202820202028207469636b65742e73746166665f69643d3120414e44207374617475732e73746174653d226f70656e222920204f52207469636b65742e646570745f696420494e2028312c322c3329202920414e44207374617475732e737461746520494e20280a20202020202020202020202020202020276f70656e2720292020414e44207469636b65742e6973616e7377657265643d3020204f52444552204259207072692e7072696f726974795f757267656e6379204153432c206566666563746976655f6461746520444553432c207469636b65742e637265617465642044455343204c494d495420302c3235223b75736572735f71735f63653734366230623731363664346230663037306530393232356264376632377c733a3530343a2253454c45435420757365722e2a2c20656d61696c2e6164647265737320617320656d61696c2c206f72672e6e616d65206173206f7267616e697a6174696f6e0a202020202020202020202c206163636f756e742e6964206173206163636f756e745f69642c206163636f756e742e737461747573206173206163636f756e745f737461747573202c20636f756e742844495354494e4354207469636b65742e7469636b65745f696429206173207469636b657473202046524f4d206f73745f757365722075736572204c454654204a4f494e206f73745f757365725f656d61696c20656d61696c204f4e2028757365722e6964203d20656d61696c2e757365725f696429204c454654204a4f494e206f73745f6f7267616e697a6174696f6e206f7267204f4e2028757365722e6f72675f6964203d206f72672e696429204c454654204a4f494e206f73745f757365725f6163636f756e74206163636f756e74204f4e20286163636f756e742e757365725f6964203d20757365722e69642920204c454654204a4f494e206f73745f7469636b6574207469636b6574204f4e20287469636b65742e757365725f6964203d20757365722e696429202057484552452031202047524f555020425920757365722e6964204f5244455220425920757365722e6e616d652041534320204c494d495420302c3235223b6366673a646570742e317c613a303a7b7d6f7267735f71735f31383064306239343864366434366338643966316137353234656630653964357c733a3537383a2253454c454354206f72672e2a0a2020202020202020202020202c434f414c45534345287465616d2e6e616d652c0a202020202020202020202020202020202020202049462873746166662e73746166665f69642c20434f4e4341545f5753282220222c2073746166662e66697273746e616d652c2073746166662e6c6173746e616d65292c204e554c4c290a202020202020202020202020202020202020202029206173206163636f756e745f6d616e61676572202c20636f756e742844495354494e435420757365722e696429206173207573657273202046524f4d206f73745f6f7267616e697a6174696f6e206f7267204c454654204a4f494e206f73745f7374616666207374616666204f4e20280a20202020202020202020204c454654286f72672e6d616e616765722c203129203d2022732220414e442073746166662e73746166665f6964203d20535542535452286f72672e6d616e616765722c20322929204c454654204a4f494e206f73745f7465616d207465616d204f4e20280a20202020202020202020204c454654286f72672e6d616e616765722c203129203d2022742220414e44207465616d2e7465616d5f6964203d20535542535452286f72672e6d616e616765722c2032292920204c454654204a4f494e206f73745f757365722075736572204f4e2028757365722e6f72675f6964203d206f72672e69642920202057484552452031202047524f5550204259206f72672e6964204f52444552204259206f72672e6e616d652041534320204c494d495420302c3235223b, '2016-03-16 16:42:20', '2016-03-15 16:42:20', '1', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `ost_sla`
--

CREATE TABLE IF NOT EXISTS `ost_sla` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_priority_escalation` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disable_overdue_alerts` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `grace_period` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_sla`
--

INSERT INTO `ost_sla` (`id`, `isactive`, `enable_priority_escalation`, `disable_overdue_alerts`, `grace_period`, `name`, `notes`, `created`, `updated`) VALUES
(1, 1, 1, 0, 48, 'Default SLA', '', '2016-03-14 18:52:33', '2016-03-14 18:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_staff`
--

CREATE TABLE IF NOT EXISTS `ost_staff` (
  `staff_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `timezone_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `notes` text,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `onvacation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `assigned_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `show_assigned_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `daylight_saving` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `change_passwd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `max_page_size` int(11) unsigned NOT NULL DEFAULT '0',
  `auto_refresh_rate` int(10) unsigned NOT NULL DEFAULT '0',
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `username` (`username`),
  KEY `dept_id` (`dept_id`),
  KEY `issuperuser` (`isadmin`),
  KEY `group_id` (`group_id`,`staff_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_staff`
--

INSERT INTO `ost_staff` (`staff_id`, `group_id`, `dept_id`, `timezone_id`, `username`, `firstname`, `lastname`, `passwd`, `backend`, `email`, `phone`, `phone_ext`, `mobile`, `signature`, `notes`, `isactive`, `isadmin`, `isvisible`, `onvacation`, `assigned_only`, `show_assigned_tickets`, `daylight_saving`, `change_passwd`, `max_page_size`, `auto_refresh_rate`, `default_signature_type`, `default_paper_size`, `created`, `lastlogin`, `passwdreset`, `updated`) VALUES
(1, 1, 1, 22, 'Navneet', 'Navneet', 'Prakash', '$2a$08$iGknZfqgzpv2zcU2HmRle.R574UwLVWRtP8oZ.Ykbv30mlA/nL4JC', NULL, 'hello_navneet@hotmail.com', '', '', '(952) 793-6489', '', NULL, 1, 1, 1, 0, 0, 0, 0, 0, 25, 5, 'dept', 'Letter', '2016-03-14 18:52:35', '2016-03-15 15:06:01', NULL, '2016-03-15 15:35:01');

-- --------------------------------------------------------

--
-- Table structure for table `ost_syslog`
--

CREATE TABLE IF NOT EXISTS `ost_syslog` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_syslog`
--

INSERT INTO `ost_syslog` (`log_id`, `log_type`, `title`, `log`, `logger`, `ip_address`, `created`, `updated`) VALUES
(1, 'Debug', 'osTicket installed!', 'Congratulations osTicket basic installation completed!\n\nThank you for choosing osTicket!', '', '::1', '2016-03-14 18:52:36', '2016-03-14 18:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `ost_team`
--

CREATE TABLE IF NOT EXISTS `ost_team` (
  `team_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `noalerts` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `name` (`name`),
  KEY `isnabled` (`isenabled`),
  KEY `lead_id` (`lead_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_team`
--

INSERT INTO `ost_team` (`team_id`, `lead_id`, `isenabled`, `noalerts`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 0, 'Level I Support', 'Tier 1 support, responsible for the initial iteraction with customers', '2016-03-14 18:52:33', '2016-03-14 18:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_team_member`
--

CREATE TABLE IF NOT EXISTS `ost_team_member` (
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`team_id`,`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket`
--

CREATE TABLE IF NOT EXISTS `ost_ticket` (
  `ticket_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(20) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_email_id` int(11) unsigned NOT NULL DEFAULT '0',
  `status_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_id` int(11) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `isoverdue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isanswered` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `lastresponse` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `user_id` (`user_id`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`),
  KEY `team_id` (`team_id`),
  KEY `status_id` (`status_id`),
  KEY `created` (`created`),
  KEY `closed` (`closed`),
  KEY `duedate` (`duedate`),
  KEY `topic_id` (`topic_id`),
  KEY `sla_id` (`sla_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_ticket`
--

INSERT INTO `ost_ticket` (`ticket_id`, `number`, `user_id`, `user_email_id`, `status_id`, `dept_id`, `sla_id`, `topic_id`, `staff_id`, `team_id`, `email_id`, `flags`, `ip_address`, `source`, `isoverdue`, `isanswered`, `duedate`, `reopened`, `closed`, `lastmessage`, `lastresponse`, `created`, `updated`) VALUES
(1, '897202', 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, '::1', 'Web', 0, 0, NULL, NULL, NULL, '2016-03-14 18:52:36', NULL, '2016-03-14 18:52:36', '2016-03-14 18:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket__cdata`
--

CREATE TABLE IF NOT EXISTS `ost_ticket__cdata` (
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `subject` mediumtext,
  `priority` mediumtext,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_ticket__cdata`
--

INSERT INTO `ost_ticket__cdata` (`ticket_id`, `subject`, `priority`) VALUES
(1, 'osTicket Installed!', '2');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_attachment`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_attachment` (
  `attach_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0',
  `inline` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`attach_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `ref_id` (`ref_id`),
  KEY `file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_collaborator`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_collaborator` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `role` char(1) NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collab` (`ticket_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_email_info`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_email_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) unsigned NOT NULL,
  `email_mid` varchar(255) NOT NULL,
  `headers` text,
  PRIMARY KEY (`id`),
  KEY `email_mid` (`email_mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_event`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_event` (
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(11) unsigned NOT NULL,
  `team_id` int(11) unsigned NOT NULL,
  `dept_id` int(11) unsigned NOT NULL,
  `topic_id` int(11) unsigned NOT NULL,
  `state` enum('created','closed','reopened','assigned','transferred','overdue') NOT NULL,
  `staff` varchar(255) NOT NULL DEFAULT 'SYSTEM',
  `annulled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL,
  KEY `ticket_state` (`ticket_id`,`state`,`timestamp`),
  KEY `ticket_stats` (`timestamp`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_ticket_event`
--

INSERT INTO `ost_ticket_event` (`ticket_id`, `staff_id`, `team_id`, `dept_id`, `topic_id`, `state`, `staff`, `annulled`, `timestamp`) VALUES
(1, 0, 0, 1, 1, 'created', 'SYSTEM', 0, '2016-03-14 18:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_lock`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_lock` (
  `lock_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`lock_id`),
  UNIQUE KEY `ticket_id` (`ticket_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_priority`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`priority_id`),
  UNIQUE KEY `priority` (`priority`),
  KEY `priority_urgency` (`priority_urgency`),
  KEY `ispublic` (`ispublic`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ost_ticket_priority`
--

INSERT INTO `ost_ticket_priority` (`priority_id`, `priority`, `priority_desc`, `priority_color`, `priority_urgency`, `ispublic`) VALUES
(1, 'low', 'Low', '#DDFFDD', 4, 1),
(2, 'normal', 'Normal', '#FFFFF0', 3, 1),
(3, 'high', 'High', '#FEE7E7', 2, 1),
(4, 'emergency', 'Emergency', '#FEE7E7', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_status`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `state` varchar(16) DEFAULT NULL,
  `mode` int(11) unsigned NOT NULL DEFAULT '0',
  `flags` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `properties` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `state` (`state`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ost_ticket_status`
--

INSERT INTO `ost_ticket_status` (`id`, `name`, `state`, `mode`, `flags`, `sort`, `properties`, `created`, `updated`) VALUES
(1, 'Open', 'open', 3, 0, 1, '{"description":"Open tickets."}', '2016-03-14 18:52:34', '0000-00-00 00:00:00'),
(2, 'Resolved', 'closed', 1, 0, 2, '{"allowreopen":true,"reopenstatus":0,"description":"Resolved tickets"}', '2016-03-14 18:52:34', '0000-00-00 00:00:00'),
(3, 'Closed', 'closed', 3, 0, 3, '{"allowreopen":true,"reopenstatus":0,"description":"Closed tickets. Tickets will still be accessible on client and staff panels."}', '2016-03-14 18:52:34', '0000-00-00 00:00:00'),
(4, 'Archived', 'archived', 3, 0, 4, '{"description":"Tickets only adminstratively available but no longer accessible on ticket queues and client panel."}', '2016-03-14 18:52:34', '0000-00-00 00:00:00'),
(5, 'Deleted', 'deleted', 3, 0, 5, '{"description":"Tickets queued for deletion. Not accessible on ticket queues."}', '2016-03-14 18:52:34', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_thread`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_thread` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `thread_type` enum('M','R','N') NOT NULL,
  `poster` varchar(128) NOT NULL DEFAULT '',
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` mediumtext NOT NULL,
  `format` varchar(16) NOT NULL DEFAULT 'html',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `staff_id` (`staff_id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_ticket_thread`
--

INSERT INTO `ost_ticket_thread` (`id`, `pid`, `ticket_id`, `staff_id`, `user_id`, `thread_type`, `poster`, `source`, `title`, `body`, `format`, `ip_address`, `created`, `updated`) VALUES
(1, 0, 1, 0, 1, 'M', 'osTicket Support', 'Web', 'osTicket Installed!', ' <p> Thank you for choosing osTicket. </p> <p> Please make sure you join the <a href="http://osticket.com/forums">osTicket forums</a> and our <a href="http://osticket.com/updates">mailing list</a> to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the osTicket wiki provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. </p> <p> If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. </p> <p> If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at <a href="http://www.supportsystem.com">http://www.supportsystem.com/</a> -- no installation required and we can import your data! With SupportSystem''s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. </p> <p> Cheers, </p> <p> -<br /> osTicket Team http://osticket.com/ </p> <p> <strong>PS.</strong> Don''t just make customers happy, make happy customers! </p> ', 'html', '::1', '2016-03-14 18:52:36', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_timezone`
--

CREATE TABLE IF NOT EXISTS `ost_timezone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offset` float(3,1) NOT NULL DEFAULT '0.0',
  `timezone` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `ost_timezone`
--

INSERT INTO `ost_timezone` (`id`, `offset`, `timezone`) VALUES
(1, -12.0, 'Eniwetok, Kwajalein'),
(2, -11.0, 'Midway Island, Samoa'),
(3, -10.0, 'Hawaii'),
(4, -9.0, 'Alaska'),
(5, -8.0, 'Pacific Time (US & Canada)'),
(6, -7.0, 'Mountain Time (US & Canada)'),
(7, -6.0, 'Central Time (US & Canada), Mexico City'),
(8, -5.0, 'Eastern Time (US & Canada), Bogota, Lima'),
(9, -4.0, 'Atlantic Time (Canada), Caracas, La Paz'),
(10, -3.5, 'Newfoundland'),
(11, -3.0, 'Brazil, Buenos Aires, Georgetown'),
(12, -2.0, 'Mid-Atlantic'),
(13, -1.0, 'Azores, Cape Verde Islands'),
(14, 0.0, 'Western Europe Time, London, Lisbon, Casablanca'),
(15, 1.0, 'Brussels, Copenhagen, Madrid, Paris'),
(16, 2.0, 'Kaliningrad, South Africa'),
(17, 3.0, 'Baghdad, Riyadh, Moscow, St. Petersburg'),
(18, 3.5, 'Tehran'),
(19, 4.0, 'Abu Dhabi, Muscat, Baku, Tbilisi'),
(20, 4.5, 'Kabul'),
(21, 5.0, 'Ekaterinburg, Islamabad, Karachi, Tashkent'),
(22, 5.5, 'Bombay, Calcutta, Madras, New Delhi'),
(23, 6.0, 'Almaty, Dhaka, Colombo'),
(24, 7.0, 'Bangkok, Hanoi, Jakarta'),
(25, 8.0, 'Beijing, Perth, Singapore, Hong Kong'),
(26, 9.0, 'Tokyo, Seoul, Osaka, Sapporo, Yakutsk'),
(27, 9.5, 'Adelaide, Darwin'),
(28, 10.0, 'Eastern Australia, Guam, Vladivostok'),
(29, 11.0, 'Magadan, Solomon Islands, New Caledonia'),
(30, 12.0, 'Auckland, Wellington, Fiji, Kamchatka');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user`
--

CREATE TABLE IF NOT EXISTS `ost_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `org_id` int(10) unsigned NOT NULL,
  `default_email_id` int(10) NOT NULL,
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_user`
--

INSERT INTO `ost_user` (`id`, `org_id`, `default_email_id`, `status`, `name`, `created`, `updated`) VALUES
(1, 1, 1, 0, 'osTicket Support', '2016-03-14 18:52:35', '2016-03-14 18:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user_account`
--

CREATE TABLE IF NOT EXISTS `ost_user_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `timezone_id` int(11) NOT NULL DEFAULT '0',
  `dst` tinyint(1) NOT NULL DEFAULT '1',
  `lang` varchar(16) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `passwd` varchar(128) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_user_email`
--

CREATE TABLE IF NOT EXISTS `ost_user_email` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `address` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`),
  KEY `user_email_lookup` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_user_email`
--

INSERT INTO `ost_user_email` (`id`, `user_id`, `address`) VALUES
(1, 1, 'support@osticket.com');
--
-- Database: `widget_corp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `hashed_password` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `menu_name` varchar(30) NOT NULL,
  `position` int(3) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `subject_id`, `menu_name`, `position`, `visible`, `content`) VALUES
(1, 1, 'Our Mission', 1, 1, 'Our mission has always been...'),
(2, 1, 'Our History', 2, 1, 'Founded in 1898 by two enterprising engineers...'),
(3, 2, 'Large Widgets', 1, 1, 'Our large widgets have to be seen to be believed...'),
(4, 2, 'Small Widgets', 2, 1, 'They say big things come in small packages...'),
(5, 3, 'Retrofitting', 1, 1, 'We love to replace widgets...'),
(6, 3, 'Certification', 2, 1, 'We can certify any widget, not just our own...');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(30) NOT NULL,
  `position` int(3) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `menu_name`, `position`, `visible`) VALUES
(1, 'About Widget Corp', 1, 1),
(2, 'Products', 2, 1),
(3, 'Services', 3, 1),
(6, 'Today''s Widget Trivia', 4, 1),
(7, 'Sample subject', 5, 1),
(8, 'Sample', 4, 1),
(9, 'Sample2', 1, 1),
(10, 'test subject', 8, 1),
(11, 'test subject 2', 9, 1),
(12, 'test subject 3', 10, 1),
(13, 'new sub', 11, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
