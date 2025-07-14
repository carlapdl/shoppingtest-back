-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: dbmysql:3306
-- Generation Time: Jul 14, 2025 at 04:10 PM
-- Server version: 9.3.0
-- PHP Version: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoppingtest-db`
--
CREATE DATABASE IF NOT EXISTS `shoppingtest-db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `shoppingtest-db`;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `attr_set_id`, `display_value`, `value`, `date_created`) VALUES
('40', 1, '40', '40', '2025-07-14 15:38:00'),
('41', 1, '41', '41', '2025-07-14 15:38:00'),
('42', 1, '42', '42', '2025-07-14 15:38:00'),
('43', 1, '43', '43', '2025-07-14 15:38:00'),
('Extra Large', 1, 'Extra Large', 'XL', '2025-07-14 16:03:34'),
('Large', 1, 'Large', 'L', '2025-07-14 16:03:34'),
('Medium', 1, 'Medium', 'M', '2025-07-14 16:03:34'),
('Small', 1, 'Small', 'S', '2025-07-14 16:03:34');

--
-- Dumping data for table `attribute_sets`
--

INSERT INTO `attribute_sets` (`id`, `set_name`, `type`, `date_created`) VALUES
(1, 'Size', 'text', '2025-07-11 09:40:51'),
(2, 'Color', 'swatch', '2025-07-11 09:41:21'),
(3, 'Capacity', 'text', '2025-07-11 09:41:45'),
(4, 'With USB 3 Ports', 'text', '2025-07-11 09:42:59'),
(5, 'Touch ID in Keyboard', 'text', '2025-07-11 09:43:31');

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `date_created`) VALUES
(1, 'all', '2025-07-11 08:53:32'),
(2, 'clothes', '2025-07-11 08:54:16'),
(3, 'tech', '2025-07-11 08:54:16');

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `label`, `symbol`, `date_created`) VALUES
(1, 'USD', '$', '2025-07-11 09:48:01');

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `product_id`, `gallery_url`, `date_created`) VALUES
(1, 'huarache-x-stussy-le', 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_2_720x.jpg?v=1612816087', '2025-07-11 09:38:21'),
(2, 'huarache-x-stussy-le', 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_1_720x.jpg?v=1612816087', '2025-07-11 09:38:21'),
(3, 'huarache-x-stussy-le', 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_3_720x.jpg?v=1612816087', '2025-07-11 09:39:34'),
(4, 'huarache-x-stussy-le', 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_5_720x.jpg?v=1612816087', '2025-07-11 09:39:34'),
(5, 'huarache-x-stussy-le', 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_4_720x.jpg?v=1612816087', '2025-07-11 09:40:14'),
(6, 'jacket-canada-goosee', 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016105/product-image/2409L_61.jpg', '2025-07-14 15:51:25'),
(7, 'jacket-canada-goosee', 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016107/product-image/2409L_61_a.jpg', '2025-07-14 15:51:25'),
(8, 'jacket-canada-goosee', 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016108/product-image/2409L_61_b.jpg', '2025-07-14 15:51:25'),
(9, 'jacket-canada-goosee', 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016109/product-image/2409L_61_c.jpg', '2025-07-14 15:51:25'),
(10, 'jacket-canada-goosee', 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016110/product-image/2409L_61_d.jpg', '2025-07-14 15:51:25'),
(11, 'jacket-canada-goosee', 'https://images.canadagoose.com/image/upload/w_1333,c_scale,f_auto,q_auto:best/v1634058169/product-image/2409L_61_o.png', '2025-07-14 15:51:25'),
(12, 'jacket-canada-goosee', 'https://images.canadagoose.com/image/upload/w_1333,c_scale,f_auto,q_auto:best/v1634058159/product-image/2409L_61_p.png', '2025-07-14 15:51:25');

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `inStock`, `category_id`, `description`, `brand`, `date_created`) VALUES
('huarache-x-stussy-le', 'Nike Air Huarache Le', 1, 2, '<p>Great sneakers for everyday use!</p>', 'Nike x Stussy', '2025-07-11 09:36:51'),
('jacket-canada-goosee', 'Jacket', 1, 2, '<p>Awesome winter jacket</p>', 'Canada Goose', '2025-07-14 15:45:45');

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `attribute_id`, `date_created`) VALUES
(1, 'huarache-x-stussy-le', '40', '2025-07-14 15:40:11'),
(2, 'huarache-x-stussy-le', '41', '2025-07-14 15:40:11'),
(3, 'huarache-x-stussy-le', '42', '2025-07-14 15:40:11'),
(4, 'huarache-x-stussy-le', '43', '2025-07-14 15:40:11'),
(5, 'jacket-canada-goosee', 'Small', '2025-07-14 16:06:26'),
(6, 'jacket-canada-goosee', 'Medium', '2025-07-14 16:06:26'),
(7, 'jacket-canada-goosee', 'Large', '2025-07-14 16:06:26'),
(8, 'jacket-canada-goosee', 'Extra Large', '2025-07-14 16:06:26');

--
-- Dumping data for table `product_price`
--

INSERT INTO `product_price` (`id`, `product_id`, `amount`, `currency_id`, `date_created`) VALUES
(1, 'huarache-x-stussy-le', 144.69, 1, '2025-07-14 15:42:54'),
(2, 'jacket-canada-goosee', 518.47, 1, '2025-07-14 16:07:44');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
