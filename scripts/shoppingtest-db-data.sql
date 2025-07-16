-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: dbmysql:3306
-- Generation Time: Jul 16, 2025 at 07:02 AM
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

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `attr_set_id`, `display_value`, `value`, `date_created`) VALUES
('1T', 3, '1T', '1T', '2025-07-16 06:15:35'),
('256GB', 3, '256GB', '256GB', '2025-07-16 06:15:35'),
('40', 1, '40', '40', '2025-07-14 15:38:00'),
('41', 1, '41', '41', '2025-07-14 15:38:00'),
('42', 1, '42', '42', '2025-07-14 15:38:00'),
('43', 1, '43', '43', '2025-07-14 15:38:00'),
('512G', 3, '512G', '512G', '2025-07-16 06:15:35'),
('512GB', 3, '512GB', '512GB', '2025-07-16 06:15:35'),
('Black', 2, 'Black', '#000000', '2025-07-16 06:15:35'),
('Blue', 2, 'Blue', '#030BFF', '2025-07-16 06:15:35'),
('Cyan', 2, 'Cyan', '#03FFF7', '2025-07-16 06:15:35'),
('Extra Large', 1, 'Extra Large', 'XL', '2025-07-14 16:03:34'),
('Green', 2, 'Green', '#44FF03', '2025-07-16 06:15:35'),
('Large', 1, 'Large', 'L', '2025-07-14 16:03:34'),
('Medium', 1, 'Medium', 'M', '2025-07-14 16:03:34'),
('No Touch ID in Keyboard', 5, 'No', 'No', '2025-07-16 06:44:23'),
('No USB 3 Ports', 4, 'No', 'No', '2025-07-16 06:44:23'),
('Small', 1, 'Small', 'S', '2025-07-14 16:03:34'),
('White', 2, 'White', '#FFFFFF', '2025-07-16 06:15:35'),
('Yes Touch ID in Keyboard', 5, 'Yes', 'Yes', '2025-07-16 06:44:23'),
('Yes USB 3 Ports', 4, 'Yes', 'Yes', '2025-07-16 06:44:23');

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
(12, 'jacket-canada-goosee', 'https://images.canadagoose.com/image/upload/w_1333,c_scale,f_auto,q_auto:best/v1634058159/product-image/2409L_61_p.png', '2025-07-14 15:51:25'),
(13, 'ps-5', 'https://images-na.ssl-images-amazon.com/images/I/510VSJ9mWDL._SL1262_.jpg', '2025-07-16 06:07:58'),
(14, 'ps-5', 'https://images-na.ssl-images-amazon.com/images/I/610%2B69ZsKCL._SL1500_.jpg', '2025-07-16 06:07:58'),
(15, 'ps-5', 'https://images-na.ssl-images-amazon.com/images/I/51iPoFwQT3L._SL1230_.jpg', '2025-07-16 06:07:58'),
(16, 'ps-5', 'https://images-na.ssl-images-amazon.com/images/I/61qbqFcvoNL._SL1500_.jpg', '2025-07-16 06:07:58'),
(17, 'ps-5', 'https://images-na.ssl-images-amazon.com/images/I/51HCjA3rqYL._SL1230_.jpg', '2025-07-16 06:07:58'),
(18, 'xbox-series-s', 'https://images-na.ssl-images-amazon.com/images/I/71vPCX0bS-L._SL1500_.jpg', '2025-07-16 06:28:08'),
(19, 'xbox-series-s', 'https://images-na.ssl-images-amazon.com/images/I/71q7JTbRTpL._SL1500_.jpg', '2025-07-16 06:28:08'),
(20, 'xbox-series-s', 'https://images-na.ssl-images-amazon.com/images/I/71iQ4HGHtsL._SL1500_.jpg', '2025-07-16 06:28:08'),
(21, 'xbox-series-s', 'https://images-na.ssl-images-amazon.com/images/I/61IYrCrBzxL._SL1500_.jpg', '2025-07-16 06:28:08'),
(22, 'xbox-series-s', 'https://images-na.ssl-images-amazon.com/images/I/61RnXmpAmIL._SL1500_.jpg', '2025-07-16 06:28:08'),
(23, 'apple-imac-2021', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/imac-24-blue-selection-hero-202104?wid=904&hei=840&fmt=jpeg&qlt=80&.v=1617492405000', '2025-07-16 06:38:01');

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `inStock`, `category_id`, `description`, `brand`, `date_created`) VALUES
('apple-imac-2021', 'iMac 2021', 1, 3, 'The new iMac!', 'Apple', '2025-07-16 06:37:03'),
('huarache-x-stussy-le', 'Nike Air Huarache Le', 1, 2, '<p>Great sneakers for everyday use!</p>', 'Nike x Stussy', '2025-07-11 09:36:51'),
('jacket-canada-goosee', 'Jacket', 1, 2, '<p>Awesome winter jacket</p>', 'Canada Goose', '2025-07-14 15:45:45'),
('ps-5', 'PlayStation 5', 1, 3, '<p>A good gaming console. Plays games of PS4! Enjoy if you can buy it mwahahahaha</p>', 'Sony', '2025-07-16 06:04:00'),
('xbox-series-s', 'Xbox Series S 512GB', 1, 3, '\\n<div>\\n    <ul>\\n        <li><span>Hardware-beschleunigtes Raytracing macht dein Spiel noch realistischer</span></li>\\n        <li><span>Spiele Games mit bis zu 120 Bilder pro Sekunde</span></li>\\n        <li><span>Minimiere Ladezeiten mit einer speziell entwickelten 512GB NVMe SSD und wechsle mit Quick Resume nahtlos zwischen mehreren Spielen.</span></li>\\n        <li><span>Xbox Smart Delivery stellt sicher, dass du die beste Version deines Spiels spielst, egal, auf welcher Konsole du spielst</span></li>\\n        <li><span>Spiele deine Xbox One-Spiele auf deiner Xbox Series S weiter. Deine Fortschritte, Erfolge und Freundesliste werden automatisch auf das neue System übertragen.</span></li>\\n        <li><span>Erwecke deine Spiele und Filme mit innovativem 3D Raumklang zum Leben</span></li>\\n        <li><span>Der brandneue Xbox Wireless Controller zeichnet sich durch höchste Präzision, eine neue Share-Taste und verbesserte Ergonomie aus</span></li>\\n        <li><span>Ultra-niedrige Latenz verbessert die Reaktionszeit von Controller zum Fernseher</span></li>\\n        <li><span>Verwende dein Xbox One-Gaming-Zubehör -einschließlich Controller, Headsets und mehr</span></li>\\n        <li><span>Erweitere deinen Speicher mit der Seagate 1 TB-Erweiterungskarte für Xbox Series X (separat erhältlich) und streame 4K-Videos von Disney+, Netflix, Amazon, Microsoft Movies &amp; TV und mehr</span></li>\\n    </ul>\\n</div>', 'Microsoft', '2025-07-16 06:25:05');

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
(8, 'jacket-canada-goosee', 'Extra Large', '2025-07-14 16:06:26'),
(9, 'ps-5', 'Green', '2025-07-16 06:18:42'),
(10, 'ps-5', 'Cyan', '2025-07-16 06:18:42'),
(11, 'ps-5', 'Blue', '2025-07-16 06:18:42'),
(12, 'ps-5', 'Black', '2025-07-16 06:18:42'),
(13, 'ps-5', 'White', '2025-07-16 06:18:42'),
(14, 'ps-5', '512G', '2025-07-16 06:18:42'),
(15, 'ps-5', '1T', '2025-07-16 06:18:42'),
(16, 'xbox-series-s', 'Green', '2025-07-16 06:18:42'),
(17, 'xbox-series-s', 'Cyan', '2025-07-16 06:18:42'),
(18, 'xbox-series-s', 'Blue', '2025-07-16 06:18:42'),
(19, 'xbox-series-s', 'Black', '2025-07-16 06:18:42'),
(20, 'xbox-series-s', 'White', '2025-07-16 06:18:42'),
(21, 'xbox-series-s', '512G', '2025-07-16 06:18:42'),
(22, 'xbox-series-s', '1T', '2025-07-16 06:18:42'),
(23, 'apple-imac-2021', '256GB', '2025-07-16 06:58:53'),
(24, 'apple-imac-2021', '512GB', '2025-07-16 06:58:53'),
(25, 'apple-imac-2021', 'Yes USB 3 Ports', '2025-07-16 06:58:53'),
(26, 'apple-imac-2021', 'No USB 3 Ports', '2025-07-16 06:58:53'),
(27, 'apple-imac-2021', 'Yes Touch ID in Keyboard', '2025-07-16 06:58:53'),
(28, 'apple-imac-2021', 'No Touch ID in Keyboard', '2025-07-16 06:58:53');

--
-- Dumping data for table `product_price`
--

INSERT INTO `product_price` (`id`, `product_id`, `amount`, `currency_id`, `date_created`) VALUES
(1, 'huarache-x-stussy-le', 144.69, 1, '2025-07-14 15:42:54'),
(2, 'jacket-canada-goosee', 518.47, 1, '2025-07-14 16:07:44'),
(3, 'ps-5', 844.02, 1, '2025-07-16 06:22:33'),
(4, 'xbox-series-s', 333.99, 1, '2025-07-16 06:32:18'),
(5, 'apple-imac-2021', 1688.03, 1, '2025-07-16 07:00:10');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
