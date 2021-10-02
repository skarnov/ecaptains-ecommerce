-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 26, 2019 at 07:05 PM
-- Server version: 5.5.61-38.13-log
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecaptain_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `pk_category_id` int(4) NOT NULL,
  `category_serial` int(3) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `category_type` tinyint(1) NOT NULL COMMENT '1 - Category | 2 - Subcategory | 3 - Subcategory Item',
  `category_relation` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`pk_category_id`, `category_serial`, `category_name`, `category_type`, `category_relation`) VALUES
(1, 0, 'Our Brands', 1, 0),
(2, 0, 'Men', 1, 0),
(3, 0, 'Captains Lady', 1, 0),
(4, 0, 'Kids', 1, 0),
(5, 0, 'T - Shirts', 2, 2),
(8, 0, 'Accessories', 1, 0),
(9, 0, 'Food & Beverage', 1, 0),
(10, 0, 'Shirt', 2, 2),
(11, 0, 'Pants', 2, 2),
(13, 0, 'Tops', 2, 3),
(16, 0, 'Polo Shirt', 2, 2),
(18, 0, 'T-Shirt', 2, 3),
(21, 0, 'Boys', 2, 4),
(22, 0, 'Girls', 2, 4),
(26, 0, 'Shorts', 3, 21),
(27, 0, 'Frocks', 3, 22),
(31, 0, 'Bags', 2, 8),
(32, 0, 'Wallet', 2, 8),
(33, 0, 'Betls', 2, 8),
(34, 0, 'Sun Glass', 2, 8),
(36, 0, 'Under Garments', 2, 2),
(38, 0, 'Captais', 2, 1),
(39, 0, 'Tops Item', 3, 13),
(41, 0, 'T- shirt Item', 3, 18),
(42, 0, 'Item', 3, 35),
(43, 0, 'Watches', 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notifications`
--

CREATE TABLE `tbl_notifications` (
  `pk_notification_id` bigint(20) NOT NULL,
  `notification` text NOT NULL,
  `view_status` tinyint(1) NOT NULL COMMENT '0 - Unseen',
  `created_by` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_notifications`
--

INSERT INTO `tbl_notifications` (`pk_notification_id`, `notification`, `view_status`, `created_by`, `created_at`) VALUES
(1, 'Order ID <strong>C20181</strong> is created for Foysal', 0, 2, '2018-03-25 00:00:06'),
(2, 'Order ID <strong>C20182</strong> is created for Arnov', 0, 4, '2018-03-25 00:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ordermeta`
--

CREATE TABLE `tbl_ordermeta` (
  `pk_ordermeta_id` bigint(20) NOT NULL,
  `fk_order_id` bigint(20) NOT NULL,
  `fk_product_id` int(10) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` float(10,2) NOT NULL,
  `product_sales_quantity` tinyint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_ordermeta`
--

INSERT INTO `tbl_ordermeta` (`pk_ordermeta_id`, `fk_order_id`, `fk_product_id`, `product_name`, `product_price`, `product_sales_quantity`) VALUES
(1, 1, 9, 'Pants', 850.00, 1),
(2, 2, 16, 'Girls Tops', 1250.00, 1),
(3, 2, 6, 'Mens Shirt', 950.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `pk_order_id` bigint(20) NOT NULL,
  `fk_shipping_id` bigint(20) NOT NULL,
  `discount` float(10,2) NOT NULL,
  `order_total` float(10,2) NOT NULL,
  `order_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int(10) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`pk_order_id`, `fk_shipping_id`, `discount`, `order_total`, `order_status`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 1, 0.00, 850.00, 0, 2, '2018-03-25 00:00:05', NULL, NULL),
(2, 2, 0.00, 2200.00, 0, 4, '2018-03-25 00:46:57', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productmeta`
--

CREATE TABLE `tbl_productmeta` (
  `pk_productmeta_id` bigint(20) NOT NULL,
  `fk_product_id` int(10) NOT NULL,
  `product_meta_name` text NOT NULL,
  `product_meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_productmeta`
--

INSERT INTO `tbl_productmeta` (`pk_productmeta_id`, `fk_product_id`, `product_meta_name`, `product_meta_value`) VALUES
(1, 1, 'description', 'Mens Camo Pant'),
(2, 1, 'sizes', '28, 30, 32, 34, 36'),
(3, 1, 'colors', 'Grey Camo'),
(4, 1, 'build_material', '100% Cotton twill Stretched Camo'),
(5, 1, 'countryorigin', 'Bangladesh'),
(6, 1, 'product_image_2', '3d32bb994f7eef390700805f73cb8eb6.jpeg'),
(7, 1, 'product_image_3', 'a1b0d39cdeb0bcec975546c363854ac9.jpeg'),
(8, 2, 'description', 'Mens midnight camo jogger'),
(9, 2, 'sizes', '28, 30, 32, 34, 36'),
(10, 2, 'colors', 'Mid night Blue'),
(11, 2, 'build_material', '100% Cotton twill Stretched Camo'),
(12, 2, 'countryorigin', 'Bangladesh'),
(13, 2, 'product_image_2', 'fba42db844a195eb37548c70c0aa77e4.jpg'),
(14, 2, 'product_image_3', '5f16ba7640ac74fd71b3cb33fb204b41.jpg'),
(15, 2, 'product_image_4', '65cbbd9282f1e7814e3064955a69d7ce.jpg'),
(16, 2, 'product_image_5', 'dbbe48ab2f6f59cab4a0e5b81f046370.jpg'),
(17, 3, 'description', 'Mens Casual Shirt'),
(18, 3, 'sizes', 'S, M, L, XL'),
(19, 3, 'colors', 'White combo'),
(20, 3, 'build_material', '100% Cotton '),
(21, 3, 'countryorigin', 'Bangladesh'),
(22, 3, 'product_image_2', 'e837830f2c4c156cca5c10f4b88adf30.jpg'),
(23, 3, 'product_image_3', '5f80d6f8f1d4b468938af4a9cc0a5dbc.jpg'),
(24, 3, 'product_image_4', '433f3552719e953c9d06f525c8d17e91.jpg'),
(25, 3, 'product_image_5', '4d3c2566e50fda437c2df3fd610f680f.jpg'),
(26, 4, 'description', 'Mens Round neck T-shirt'),
(27, 4, 'sizes', 'S, M, L, XL'),
(28, 4, 'colors', 'Black & White with color combo'),
(29, 4, 'build_material', '100% Cotton single jersey'),
(30, 4, 'countryorigin', 'Bangladesh'),
(31, 4, 'product_image_2', '62c38457ef390ccfc59423ef8f8fd6dc.jpg'),
(32, 4, 'product_image_3', '7e8e7b186a7f60bf2c678ec985d9b44c.jpg'),
(33, 4, 'product_image_4', '9a938804d33f8f32d7d7b0d6387ec3f4.jpg'),
(34, 4, 'product_image_5', 'dc419cb02d8392ed37444a185827ddfa.jpg'),
(35, 5, 'description', 'Mens Light weight Denim shirt'),
(36, 5, 'sizes', 'S, M, L, XL'),
(37, 5, 'colors', 'Med wash, Dark wash & Indigo'),
(38, 5, 'build_material', '100% Cotton Light weight Denim'),
(39, 5, 'countryorigin', 'Bangladesh'),
(40, 5, 'product_image_2', '5e26354573aac14d22515e479aab1b19.jpg'),
(41, 5, 'product_image_3', '3493c98421dd35c7411775335d5a6016.jpg'),
(42, 5, 'product_image_4', '1abd503eda2aedef3b0a6258d7291a50.jpg'),
(43, 6, 'description', 'Mens Casual shirt Slim fit'),
(44, 6, 'sizes', 'S, M, L, XL'),
(45, 6, 'colors', 'White combo'),
(46, 6, 'build_material', '100% Cotton '),
(47, 6, 'countryorigin', 'Bangladesh'),
(48, 6, 'product_image_2', 'f89dff11e3ace139fd68eb44aa0e832d.jpg'),
(49, 6, 'product_image_3', '36aa7f2fd3304a2b43b02042dcec634c.jpg'),
(50, 6, 'product_image_4', 'fafc9655396e3c6a2fc8281d40c59902.jpg'),
(51, 6, 'product_image_5', 'c1136addf57163027b477c37b9b32edb.jpg'),
(52, 7, 'description', 'Football Jersey'),
(53, 7, 'sizes', 'S, M, L, XL'),
(54, 7, 'colors', 'Country wise'),
(55, 7, 'build_material', '100% Polyester interlock jersey'),
(56, 7, 'countryorigin', 'Bangladesh'),
(57, 7, 'product_image_2', 'ab1fe0e62a4142789d7f8c84e7e4b837.jpg'),
(58, 7, 'product_image_3', 'b4a203330b8caf073ad8f9d1c041ed75.jpg'),
(59, 7, 'product_image_4', 'f3c5e02389fae4037585dd7d9342e09e.jpg'),
(69, 8, 'description', 'Mens T-Shirt'),
(70, 8, 'sizes', 'S, M, L, XL'),
(71, 8, 'colors', 'As per picture'),
(72, 8, 'build_material', '100% Cotton single jersey'),
(73, 8, 'countryorigin', 'Bangladesh'),
(74, 8, 'product_image_2', 'cf0018907bb798e9945391b81984d5f1.jpg'),
(75, 8, 'product_image_3', 'b508de440d9cce151e24b2b0e70b21a5.jpg'),
(76, 8, 'product_image_4', '33c991482a13c3bbaf982eecba5b1711.jpg'),
(77, 8, 'product_image_5', '04e1179b7fd4a5b48df3f1ca6dc637b9.jpg'),
(83, 9, 'description', 'Ladies Camo pant'),
(84, 9, 'sizes', '28, 30, 32, 34, 36'),
(85, 9, 'colors', 'Green Camo'),
(86, 9, 'build_material', '100% Cotton twill Stretched Camo'),
(87, 9, 'countryorigin', 'Bangladesh'),
(88, 9, 'product_image_2', ''),
(89, 9, 'product_image_3', ''),
(90, 9, 'product_image_4', ''),
(91, 9, 'product_image_5', ''),
(92, 10, 'description', 'Ladies stretched Denim pants'),
(93, 10, 'sizes', '28, 30, 32, 34, 36'),
(94, 10, 'colors', 'Med wash, Dark wash & Indigo'),
(95, 10, 'build_material', '100% Cotton Stretched denim'),
(96, 10, 'countryorigin', 'Bangladesh'),
(97, 10, 'product_image_2', 'dded5ef78fc1b35f43b64c2271705031.gif'),
(98, 10, 'product_image_3', 'a5947e19b4bc09a3d845d2c342f82eb5.jpg'),
(99, 10, 'product_image_4', '9b0d2af518c5be06dee5d179ff266a58.jpg'),
(100, 10, 'product_image_5', '3b0b1d6d565a13374e722bf11eab51d9.jpg'),
(101, 11, 'description', 'Stylish Purple Tops'),
(102, 11, 'sizes', 'S, M, L, XL'),
(103, 11, 'colors', 'Purple'),
(104, 11, 'build_material', '95% Cotton 5% polyester '),
(105, 11, 'countryorigin', 'Bangladesh'),
(106, 11, 'product_image_2', '17bf4fe1988e233009dee88208039767.jpg'),
(107, 11, 'product_image_3', '93cf3c19881debc6bcc2e93efb3e8083.jpg'),
(108, 11, 'product_image_4', '946178facf8f60066c9f5464b8d077e8.jpg'),
(109, 12, 'description', 'Fashionable Ladies Tops '),
(110, 12, 'sizes', 'S, M, L, XL'),
(111, 12, 'colors', 'As per picture'),
(112, 12, 'build_material', '95% Cotton 5% polyester '),
(113, 12, 'countryorigin', 'Bangladesh'),
(114, 12, 'product_image_2', 'a46e9e1f2ffb03c029da20e31c22362d.jpg'),
(115, 12, 'product_image_3', '124c1e0d890d36cafdcba70d74f8b099.jpg'),
(116, 12, 'product_image_4', 'cf9d3f2d6fc08ad4599d807528b88c25.jpg'),
(117, 12, 'product_image_5', 'e6bdf5e26bcac02fcd6a9530b66392ef.jpg'),
(118, 13, 'description', 'Ladies Knitted Top'),
(119, 13, 'sizes', 'S, M, L, XL'),
(120, 13, 'colors', 'As per picture'),
(121, 13, 'build_material', '100% Cotton single jersey'),
(122, 13, 'countryorigin', 'Bangladesh'),
(123, 13, 'product_image_2', '25b2e25a888cf6dc9a1c0f8bdc8e0e24.jpg'),
(124, 13, 'product_image_3', '23c9dc5573a8d536f1605c1963ada0cb.jpg'),
(125, 13, 'product_image_4', '2702d25a404ee18b3e7737d5e5be7efb.jpg'),
(126, 14, 'description', 'Ladies Georgette Tops'),
(127, 14, 'sizes', 'S, M, L, XL'),
(128, 14, 'colors', 'Orange'),
(129, 14, 'build_material', 'Polyester Georgette'),
(130, 14, 'countryorigin', 'Bangladesh'),
(131, 14, 'product_image_2', '851be70807346a569cc092b4901a0e73.jpg'),
(132, 14, 'product_image_3', '1d38945af448cda650363b82151c9316.jpg'),
(133, 14, 'product_image_4', '46136912fd2fa32570c304a08f97594f.jpg'),
(134, 15, 'description', 'Boys Tops & Bottoms wear'),
(135, 15, 'sizes', '4, 6, 8, 10, 12'),
(136, 15, 'colors', 'As per picture'),
(137, 15, 'build_material', '100% Cotton '),
(138, 15, 'countryorigin', 'Bangladesh'),
(139, 15, 'product_image_2', '54d34f213d1042c3d06c5d09f34a92b5.jpg'),
(140, 15, 'product_image_3', 'df2dc830360fefecc056513e320ef47e.jpg'),
(141, 15, 'product_image_4', '6198a29f896c2e35840a2935b9bd1950.jpg'),
(142, 16, 'description', 'Girls Frocks'),
(143, 16, 'sizes', '4, 6, 8, 10, 12'),
(144, 16, 'colors', 'As per picture'),
(145, 16, 'build_material', 'Cotton  Polyester Mixed'),
(146, 16, 'countryorigin', 'Bangladesh'),
(147, 16, 'product_image_2', 'b0c8fe283cdf508accf709f2a54e7e84.jpg'),
(148, 16, 'product_image_3', 'd58149538893cc9e58c72a87b14ab15f.jpg'),
(149, 16, 'product_image_4', '0eb07db9168252f7f3ffd90b01470c2f.jpg'),
(150, 16, 'product_image_5', '4dc6b0f7634939c29ca9d732a8b49b74.jpg'),
(151, 17, 'description', 'Stylish Bags'),
(152, 17, 'sizes', ''),
(153, 17, 'colors', 'As per picture'),
(154, 17, 'build_material', 'Canves Fabric'),
(155, 17, 'countryorigin', 'China'),
(156, 17, 'product_image_2', '890bad6de2e6c4227c8070215e0ea289.jpg'),
(157, 17, 'product_image_3', '4705d3b654f7ad6860eb274d17f21ec8.jpg'),
(158, 17, 'product_image_4', 'b2fe972457cb9d1d3bd6db8c725395fa.jpg'),
(159, 18, 'description', '3 Pcs Stylish Bags'),
(160, 18, 'sizes', ''),
(161, 18, 'colors', 'As per picture'),
(162, 18, 'build_material', 'Inner Canvas with rexine surface'),
(163, 18, 'countryorigin', 'China');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `pk_product_id` int(10) NOT NULL,
  `fk_category_id` int(3) DEFAULT NULL,
  `fk_subcategory_id` int(3) DEFAULT NULL,
  `fk_subcategory_item_id` int(3) DEFAULT NULL,
  `product_attribute` tinyint(1) NOT NULL COMMENT '1 - Best Seller | 2 - New Arrival',
  `product_name` varchar(100) NOT NULL,
  `product_image` text,
  `product_image_thumb` text,
  `product_old_price` float(10,2) DEFAULT NULL,
  `product_price` float(10,2) NOT NULL,
  `product_status` tinyint(1) DEFAULT '1',
  `created_by` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int(10) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`pk_product_id`, `fk_category_id`, `fk_subcategory_id`, `fk_subcategory_item_id`, `product_attribute`, `product_name`, `product_image`, `product_image_thumb`, `product_old_price`, `product_price`, `product_status`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 2, 5, 6, 0, 'Chino Pant', '57d2c025cb46107c5f1d01050448209f.jpeg', '57d2c025cb46107c5f1d01050448209f_thumb.jpeg', NULL, 1050.00, 1, 1, '2018-03-13 18:28:49', NULL, NULL),
(2, 2, 5, 6, 0, 'Mens Jogger', '9586a640579afbf6851f5317b2a3c16f.jpg', '9586a640579afbf6851f5317b2a3c16f_thumb.jpg', NULL, 1050.00, 1, 1, '2018-03-13 18:35:35', NULL, NULL),
(3, 2, 1, NULL, 0, 'Mens Shirt', 'f682c300125cddfa665962dc1da64067.jpg', 'f682c300125cddfa665962dc1da64067_thumb.jpg', NULL, 950.00, 1, 1, '2018-03-13 18:41:39', NULL, NULL),
(4, 2, 5, 6, 0, 'Mens T-shirt', '6c60de162535460ec75edd542f4b6ece.jpg', '6c60de162535460ec75edd542f4b6ece_thumb.jpg', NULL, 350.00, 1, 1, '2018-03-13 18:45:25', NULL, NULL),
(5, 2, 5, 6, 0, 'Denim Shirt', '7c20201e5e15499d51c36da8e879b396.jpg', '7c20201e5e15499d51c36da8e879b396_thumb.jpg', NULL, 1050.00, 1, 1, '2018-03-13 18:50:16', NULL, NULL),
(6, 2, 5, 6, 2, 'Mens Shirt', '10c61176db130dfee6a48a176725d030.jpg', '10c61176db130dfee6a48a176725d030_thumb.jpg', NULL, 950.00, 1, 1, '2018-03-13 18:54:38', NULL, NULL),
(7, 2, 5, 6, 2, 'Jersey', 'bfd63e6b645e86ff76c763e015e55add.jpg', 'bfd63e6b645e86ff76c763e015e55add_thumb.jpg', NULL, 550.00, 1, 1, '2018-03-13 18:58:08', NULL, NULL),
(8, 2, 5, 6, 1, 'T-shirt', '13fc2c0da091b665174fac6a14fd1b66.jpg', '13fc2c0da091b665174fac6a14fd1b66_thumb.jpg', NULL, 350.00, 1, 1, '2018-03-13 19:00:57', 1, '2018-03-13 19:02:53'),
(9, 3, NULL, NULL, 2, 'Pants', '7b269bcaa2a033ee504ac08455b23e89.jpg', '7b269bcaa2a033ee504ac08455b23e89_thumb.jpg', NULL, 850.00, 1, 1, '2018-03-13 19:05:04', 1, '2018-03-13 19:05:47'),
(10, 3, NULL, NULL, 0, 'Pants', '6ba860ba21f177c2080ce515968e790d.jpg', '6ba860ba21f177c2080ce515968e790d_thumb.jpg', NULL, 950.00, 1, 1, '2018-03-13 19:08:11', NULL, NULL),
(11, 3, 1, NULL, 0, 'Tops', '4bca064aeb6059d04dc47567be6d0a64.jpg', '4bca064aeb6059d04dc47567be6d0a64_thumb.jpg', NULL, 850.00, 1, 1, '2018-03-13 19:10:58', NULL, NULL),
(12, 3, NULL, NULL, 2, 'Tops', 'd3b69ffcbe80d3ab212b1e00b3de25f5.jpg', 'd3b69ffcbe80d3ab212b1e00b3de25f5_thumb.jpg', NULL, 950.00, 1, 1, '2018-03-13 19:14:57', NULL, NULL),
(13, 3, NULL, NULL, 0, 'Tops', '4dea89c153762b9a9997dae2506b94c1.jpg', '4dea89c153762b9a9997dae2506b94c1_thumb.jpg', NULL, 450.00, 1, 1, '2018-03-13 19:17:20', NULL, NULL),
(14, 3, NULL, NULL, 1, 'Tops', '50a7df5c0a883ea7873ad0ba8c19b292.jpg', '50a7df5c0a883ea7873ad0ba8c19b292_thumb.jpg', NULL, 850.00, 1, 1, '2018-03-13 19:21:18', NULL, NULL),
(15, 4, NULL, NULL, 2, 'Boys Tops & Bottoms', '55c65674e37e801aa51d8f6309f71a9d.jpg', '55c65674e37e801aa51d8f6309f71a9d_thumb.jpg', NULL, 1050.00, 1, 1, '2018-03-13 19:25:05', NULL, NULL),
(16, 4, NULL, NULL, 2, 'Girls Tops', 'ae0c2b912fad0ba48b1810c3e7e770c5.jpg', 'ae0c2b912fad0ba48b1810c3e7e770c5_thumb.jpg', NULL, 1250.00, 1, 1, '2018-03-13 19:29:36', NULL, NULL),
(17, 8, NULL, NULL, 2, 'Bags', '71ad9ff389b793540700786fc119ece3.jpg', '71ad9ff389b793540700786fc119ece3_thumb.jpg', NULL, 1150.00, 1, 1, '2018-03-13 19:34:29', NULL, NULL),
(18, 8, NULL, NULL, 2, 'Bags', 'e8ea3ff63d6615d4974d67c8b83e924f.jpg', 'e8ea3ff63d6615d4974d67c8b83e924f_thumb.jpg', NULL, 1250.00, 1, 1, '2018-03-13 19:37:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `pk_setting_id` int(5) NOT NULL,
  `setting` text NOT NULL,
  `setting_position` varchar(20) NOT NULL,
  `setting_data` text NOT NULL,
  `setting_style` text NOT NULL,
  `setting_type` tinyint(1) NOT NULL COMMENT '1 - Slider, 2 - Banner'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shippings`
--

CREATE TABLE `tbl_shippings` (
  `pk_shipping_id` bigint(20) NOT NULL,
  `delivery_name` varchar(50) NOT NULL,
  `delivery_email` varchar(50) NOT NULL,
  `delivery_mobile` bigint(11) NOT NULL,
  `delivery_address` text NOT NULL,
  `billing_name` varchar(50) NOT NULL,
  `billing_email` varchar(50) NOT NULL,
  `billing_mobile` bigint(11) NOT NULL,
  `billing_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_shippings`
--

INSERT INTO `tbl_shippings` (`pk_shipping_id`, `delivery_name`, `delivery_email`, `delivery_mobile`, `delivery_address`, `billing_name`, `billing_email`, `billing_mobile`, `billing_address`) VALUES
(1, 'Foysal', 'foysal24hours@yahoo.com', 1674982980, 'h-5, r-13, s-3 uttara', 'Foysal', 'foysal24hours@yahoo.com', 1674982980, 'h-5, r-13, s-3 uttara'),
(2, 'Arnov', 'obi.prog@gmail.com', 1719020771, 'Magura', 'Arnov', 'obi.prog@gmail.com', 1719020771, 'Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `pk_user_id` int(10) NOT NULL,
  `user_image` text,
  `user_fullname` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(64) DEFAULT NULL,
  `user_mobile` bigint(11) DEFAULT NULL,
  `user_address` text,
  `user_type` tinyint(1) NOT NULL COMMENT '1 - Admin | 2 - Customer',
  `user_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int(10) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`pk_user_id`, `user_image`, `user_fullname`, `user_email`, `user_password`, `user_mobile`, `user_address`, `user_type`, `user_status`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, '8ee9ee1e34ca320d0dd1932c68192c44.jpg', 'Captins247', 'admin@evis.com', '111111', 1707725101, NULL, 1, 1, NULL, NULL, 1, '2018-03-13 19:43:43'),
(2, NULL, 'Foysal', 'foysal24hours@yahoo.com', NULL, 1674982980, NULL, 3, 1, NULL, NULL, NULL, NULL),
(3, NULL, 'Sk Arnov', 'arnov@evis.com', '111111', 1719020278, 'Magura', 3, 1, 1, '2018-03-25 00:42:57', NULL, NULL),
(4, NULL, 'Arnov', 'obi.prog@gmail.com', '111111', 1719020771, '', 3, 1, 1, '2018-03-25 00:44:52', NULL, NULL),
(5, '4a2caf46b554c43717526117084c3f7e.jpg', 'NIRANJAN KUMAR BISWAS', 'niranjan.bubt@gmail.com', '1234', 1945454100, 'kamarkhali,Madhukali,Faridpur.', 3, 1, NULL, '2018-05-25 13:44:02', NULL, NULL),
(6, '0235bcf9e8ea4feedd4f223aa5b0ea18.jpg', 'MD IMRAN HOSSAIN', 'mdimranhossain.sat@gmail.com', 'im1211', 1718472515, 'kalaroa,satkhira.', 3, 1, NULL, '2018-05-29 15:30:03', NULL, NULL),
(7, NULL, 'polokbosak', 'polokbosak@61gmil.com', '01854926261', 1854926262, 'Thakurgaon', 3, 1, NULL, '2018-06-07 23:39:45', NULL, NULL),
(8, NULL, 'Atik islam', 'atikislam192@gmail.com', 'atik9967', 1646704654, 'Srimongal', 3, 1, NULL, '2018-07-21 20:02:58', NULL, NULL),
(9, '8dd7a123819e4b2eff69729406842e52.jpg', 'Sofiuddin mohammad obayed', 'anglerabbi@gmail.com', 'mstobayed', 1751004445, 'Khwaja yunus ali medical college, enayetpur,sirajgonj', 3, 1, NULL, '2018-08-10 07:34:15', NULL, NULL),
(10, NULL, 'Nayeem Islam', 'nayeem3271@gmail.com', 'nayeem2016', 1722639833, 'Bhatshala .Bakergong.Barisal', 3, 1, NULL, '2018-10-02 08:28:46', NULL, NULL),
(11, '36ccad6dd6d52925bd5a3987a51ace5a.jpg', 'Abdullah Al Maruf', 'rtnmaruf@gmail.com', 'Maruf12041700', 1755569934, 'House # 4, 2nd Floor, Road # 15, Block # D, Banani, Dhaka - 1213', 3, 1, NULL, '2019-02-03 11:58:53', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_activities`
--

CREATE TABLE `tbl_user_activities` (
  `user_activity_id` int(10) NOT NULL,
  `user_activity_url` text COLLATE utf8_unicode_ci NOT NULL,
  `user_activity_type` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) DEFAULT NULL,
  `created_at` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_user_activities`
--

INSERT INTO `tbl_user_activities` (`user_activity_id`, `user_activity_url`, `user_activity_type`, `created_by`, `created_at`) VALUES
(1, 'Admin Login', 'Failed Login. Wrong Email is \'admin@me.com\' and Password \'111111\'', NULL, 'Friday 09 March 2018 10:50:06 AM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(2, 'Admin Login', 'Login', 1, 'Friday 09 March 2018 10:50:19 AM'),
(3, 'Admin Login', 'Login', 1, 'Friday 09 March 2018 01:45:59 PM'),
(4, 'Admin Login', 'Login', 1, 'Friday 09 March 2018 01:46:55 PM'),
(5, 'Admin Login', 'Login', 1, 'Saturday 10 March 2018 07:30:53 PM'),
(6, 'Admin Login', 'Login', 1, 'Monday 12 March 2018 03:56:55 PM'),
(7, 'Admin Login', 'Login', 1, 'Tuesday 13 March 2018 06:09:53 PM'),
(8, 'Client Login', 'Failed Login. Wrong Email is \'admin@evis.com\' and Password \'111111\'', NULL, 'Wednesday 14 March 2018 02:44:45 AM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(9, 'Client Login', 'Failed Login. Wrong Email is \'admin@evis.com\' and Password \'111111\'', NULL, 'Wednesday 14 March 2018 02:44:52 AM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(10, 'Client Login', 'Failed Login. Wrong Email is \'admin@evis.com\' and Password \'111111\'', NULL, 'Wednesday 14 March 2018 02:44:59 AM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(11, 'Admin Login', 'Login', 1, 'Friday 16 March 2018 11:36:45 AM'),
(12, 'Admin Login', 'Failed Login. Wrong Email is \'admin@me.com\' and Password \'111111\'', NULL, 'Friday 16 March 2018 12:00:42 PM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(13, 'Admin Login', 'Login', 1, 'Friday 16 March 2018 12:00:48 PM'),
(14, 'Admin Login', 'Login', 1, 'Saturday 17 March 2018 05:42:01 PM'),
(15, 'Client Login', 'Failed Login. Wrong Email is \'admin@evis.com\' and Password \'111111\'', NULL, 'Sunday 18 March 2018 08:09:37 AM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(16, 'Client Login', 'Failed Login. Wrong Email is \'admin@evis.com\' and Password \'111111111111\'', NULL, 'Sunday 18 March 2018 08:30:07 AM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(17, 'Admin Login', 'Login', 1, 'Friday 23 March 2018 02:28:13 PM'),
(18, 'Admin Login', 'Login', 1, 'Friday 23 March 2018 08:40:30 PM'),
(19, 'Admin Login', 'Failed Login. Wrong Email is \'admin@me.com\' and Password \'111111\'', NULL, 'Saturday 24 March 2018 02:11:34 AM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(20, 'Admin Login', 'Login', 1, 'Saturday 24 March 2018 02:11:42 AM'),
(21, 'Admin Login', 'Login', 1, 'Saturday 24 March 2018 11:57:20 PM'),
(22, 'Client Login', 'Failed Login. Wrong Email is \'foysal24hours@yahoo.com\' and Password \'absentmind247\'', NULL, 'Saturday 24 March 2018 11:58:40 PM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(23, 'Client Login', 'Failed Login. Wrong Email is \'foysal24hours@yahoo.com\' and Password \'absentmind247\'', NULL, 'Sunday 25 March 2018 12:41:52 AM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(24, 'Client Login', 'Login', 3, 'Sunday 25 March 2018 12:43:12 AM'),
(25, 'Client Login', 'Login', 4, 'Sunday 25 March 2018 12:45:09 AM'),
(26, 'Admin Login', 'Login', 1, 'Sunday 25 March 2018 08:53:56 AM'),
(27, 'Admin Login', 'Login', 1, 'Saturday 07 April 2018 11:39:24 PM'),
(28, 'Admin Login', 'Login', 1, 'Sunday 08 April 2018 04:25:32 PM'),
(29, 'Admin Login', 'Login', 1, 'Tuesday 10 April 2018 12:34:22 PM'),
(30, 'Client Login', 'Login', 5, 'Friday 25 May 2018 01:44:28 PM'),
(31, 'Client Login', 'Login', 5, 'Friday 25 May 2018 02:23:19 PM'),
(32, 'Client Login', 'Login', 6, 'Tuesday 29 May 2018 03:31:50 PM'),
(33, 'Client Login', 'Failed Login. Wrong Email is \'01854926261\' and Password \'01854926361\'', NULL, 'Thursday 07 June 2018 11:32:31 PM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(34, 'Client Login', 'Failed Login. Wrong Email is \'01854926261\' and Password \'01854926361\'', NULL, 'Thursday 07 June 2018 11:32:45 PM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(35, 'Client Login', 'Failed Login. Wrong Email is \'polokbosak@61gmail.com\' and Password \'01854926361\'', NULL, 'Thursday 07 June 2018 11:35:05 PM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(36, 'Client Login', 'Failed Login. Wrong Email is \'polokbosak@61gmail.com\' and Password \'01854926261\'', NULL, 'Thursday 07 June 2018 11:35:36 PM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(37, 'Client Login', 'Failed Login. Wrong Email is \'polokbosak@61gmail.com\' and Password \'01854926261\'', NULL, 'Thursday 07 June 2018 11:36:04 PM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(38, 'Admin Login', 'Login', 1, 'Wednesday 18 July 2018 03:30:34 PM'),
(39, 'Client Login', 'Failed Login. Wrong Email is \'gmyeahyea@gmail.com\' and Password \'12gm12gm\'', NULL, 'Wednesday 08 August 2018 05:22:22 PM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(40, 'Client Login', 'Failed Login. Wrong Email is \'\' and Password \'\'', NULL, 'Thursday 04 October 2018 05:29:39 PM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(41, 'Admin Login', 'Failed Login. Wrong Email is \'admin\' and Password \'111111\'', NULL, 'Monday 24 December 2018 05:08:54 PM From Linux server5.dhakawebhost.com 3.10.0-714.10.2.lve1.5.9.el7.x86_64 #1 SMP Thu Jan 11 14:17:06 EST 2018 x86_64'),
(42, 'Admin Login', 'Login', 1, 'Monday 24 December 2018 10:26:53 PM'),
(43, 'Client Login', 'Login', 11, 'Sunday 03 February 2019 11:59:17 AM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`pk_category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  ADD PRIMARY KEY (`pk_notification_id`);

--
-- Indexes for table `tbl_ordermeta`
--
ALTER TABLE `tbl_ordermeta`
  ADD PRIMARY KEY (`pk_ordermeta_id`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`pk_order_id`);

--
-- Indexes for table `tbl_productmeta`
--
ALTER TABLE `tbl_productmeta`
  ADD PRIMARY KEY (`pk_productmeta_id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`pk_product_id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`pk_setting_id`);

--
-- Indexes for table `tbl_shippings`
--
ALTER TABLE `tbl_shippings`
  ADD PRIMARY KEY (`pk_shipping_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`pk_user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- Indexes for table `tbl_user_activities`
--
ALTER TABLE `tbl_user_activities`
  ADD PRIMARY KEY (`user_activity_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `pk_category_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  MODIFY `pk_notification_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_ordermeta`
--
ALTER TABLE `tbl_ordermeta`
  MODIFY `pk_ordermeta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `pk_order_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_productmeta`
--
ALTER TABLE `tbl_productmeta`
  MODIFY `pk_productmeta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `pk_product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `pk_setting_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_shippings`
--
ALTER TABLE `tbl_shippings`
  MODIFY `pk_shipping_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `pk_user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_user_activities`
--
ALTER TABLE `tbl_user_activities`
  MODIFY `user_activity_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
