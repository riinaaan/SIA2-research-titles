-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 29, 2024 at 03:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_alters`
--

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `bill_number` varchar(255) DEFAULT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(10) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `bill_number`, `item_name`, `quantity`, `unit`, `price`, `notes`, `status`, `datetime`) VALUES
(1, '81363', 'test', 11, '1', 1, 'jydsekhjeudwe', 'del', '2024-05-22 00:25:33'),
(2, NULL, 'wer', 232, '12', 2332432, NULL, 'del', '2023-09-21 00:29:05'),
(3, NULL, 'Garam Masala', 50, '10', 500, NULL, 'del', '2023-09-21 10:09:31'),
(4, NULL, 'Buns', 100, '30', 3000, NULL, 'del', '2023-09-21 10:09:42'),
(5, NULL, 'Test', 2, '0', 23, NULL, 'del', '2023-09-26 17:55:42'),
(6, NULL, 'Test', 4, 'kilograms', 3, NULL, 'del', '2023-09-26 17:56:23'),
(7, NULL, 'test2', 2, 'kilograms', 200, NULL, 'del', '2023-09-26 17:57:30'),
(8, '123456', 'Test Item edited', 20, 'grams', 400, 'asdfghjk', 'active', '2023-09-26 18:02:23'),
(9, '742462342', 'lemon', 50, 'kilograms', 100, 'aslom ', 'del', '2024-05-24 10:48:04'),
(10, '56435', 'coffee bean', 20, 'kilograms', 120, 'kldhiauwldikialwuigydfuawidaw', 'del', '2024-05-28 19:21:30');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_image` varchar(255) NOT NULL,
  `item_price` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_name`, `item_image`, `item_price`, `type_id`, `status`, `datetime`) VALUES
(1, 'Espresso', 'static/img/items/ESPRESSO.jpg', 100, 1, 'del', '2024-05-24 06:50:25'),
(2, 'Americano', 'static/img/items/AMERICANO.jpg', 125, 1, 'active', '2024-05-24 06:50:25'),
(3, 'Cappuccino', 'static/img/items/CAPPUCCINO.jpg', 150, 1, 'active', '2024-05-24 06:50:25'),
(4, 'Latte', 'static/img/items/LATTE.jpg', 155, 1, 'active', '2024-05-24 06:50:25'),
(5, 'Macchiato', 'static/img/items/MACCHIATO.jpg', 135, 1, 'active', '2024-05-24 06:50:25'),
(6, 'Mocha', 'static/img/items/MOCHA.jpg', 165, 1, 'active', '2024-05-24 06:50:25'),
(7, 'Flat White', 'static/img/items/FLAT-WHITE.jpg', 155, 1, 'active', '2024-05-24 06:50:25'),
(8, 'Cortado', 'static/img/items/CORTADO.jpg', 135, 1, 'active', '2024-05-24 06:50:25'),
(9, 'Matcha Latte (hot)', 'static/img/items/MATCHA.jpg', 165, 2, 'active', '2024-05-24 06:50:25'),
(10, 'Hot Chocolate', 'static/img/items/HOT-CHOCOLATE.jpg', 145, 2, 'active', '2024-05-24 06:50:25'),
(11, 'Beef Burger', 'static/img/items/beef-burger.png', 50, 4, 'active', '2024-05-24 06:50:25'),
(12, 'Coffee Latte', 'static/img/items/coffee-latte.png', 75, 3, 'active', '2024-05-24 06:50:25'),
(13, 'Ice Chocolate', 'static/img/items/ice-chocolate.png', 75, 3, 'active', '2024-05-24 06:50:25'),
(14, 'Ice Tea', 'static/img/items/ice-tea.png', 75, 6, 'active', '2024-05-24 06:50:25'),
(15, 'Matcha Latte', 'static/img/items/matcha-latte.png', 75, 3, 'active', '2024-05-24 06:50:25'),
(16, 'Chocolate Donut', 'static/img/items/choco-glaze-donut.png', 35, 7, 'active', '2024-05-24 06:50:25'),
(17, 'Chocolate Glaze Donut', 'static/img/items/choco-glaze-donut-peanut.png', 45, 7, 'active', '2024-05-24 06:50:25'),
(18, 'Red Glaze Donut', 'static/img/items/red-glaze-donut.png', 35, 7, 'active', '2024-05-24 06:50:25'),
(19, 'Chicken Sandwich', 'static/img/items/sandwich.png', 45, 8, 'active', '2024-05-24 06:50:25'),
(20, 'Pizza', 'static/img/items/pizza.jpeg', 200, 5, 'active', '2024-05-24 06:50:25'),
(21, 'Frappuccino', 'static/img/items/FRAPPUCCINO.jpg', 90, 3, 'active', '2024-05-24 06:50:25'),
(22, 'Espresso', 'static/img/items/ESPRESSO.jpg', 120, 1, 'active', '2024-05-24 10:44:44'),
(23, 'Krusaaaaan', 'static/img/items/croissant.png', 55, 9, 'active', '2024-05-24 12:55:54'),
(24, 'Choco Muffin', 'static/img/items/Chocolate Muffin.jpg', 15, 7, 'active', '2024-05-24 12:56:26'),
(25, 'Pain Au Chocolat', 'static/img/items/Pain Au Chocolat.jpg', 25, 9, 'active', '2024-05-24 12:59:53');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `net_total` int(11) NOT NULL,
  `sales_tax` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `grand_total` int(11) NOT NULL DEFAULT 0,
  `status` varchar(20) NOT NULL,
  `operator` varchar(20) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `net_total`, `sales_tax`, `discount_percentage`, `discount_amount`, `grand_total`, `status`, `operator`, `datetime`) VALUES
(1716508379, 125, 0, 0, 0, 125, 'del', 'admin', '2024-05-24 07:52:59'),
(1716508401, 135, 0, 0, 0, 135, 'del', 'admin', '2024-05-24 07:53:21'),
(1716518741, 600, 0, 0, 0, 600, 'del', 'admin', '2024-05-24 10:45:41'),
(1716518928, 200, 10, 0, 0, 210, 'del', 'admin', '2024-05-24 10:48:48'),
(1716522137, 750, 38, 2, 15, 772, 'del', 'admin', '2024-05-24 11:42:17'),
(1716524592, 0, 0, 0, 0, 0, 'del', 'admin', '2024-05-24 12:23:12'),
(1716524707, 100, 5, 0, 0, 105, 'del', 'admin', '2024-05-24 12:25:07'),
(1716525263, 0, 0, 0, 0, 0, 'active', 'admin', '2024-05-24 12:34:23'),
(1716525297, 120, 0, 0, 0, 120, 'active', 'admin', '2024-05-24 12:34:57'),
(1716526826, 25, 1, 0, 0, 26, 'active', 'admin', '2024-05-24 13:00:26'),
(1716696018, 80, 4, 5, 4, 80, 'active', 'admin', '2024-05-26 12:00:18'),
(1716696084, 50, 3, 5, 2, 50, 'active', 'admin', '2024-05-26 12:01:24'),
(1716696393, 230, 12, 0, 0, 242, 'active', 'admin', '2024-05-26 12:06:33'),
(1716696414, 95, 0, 0, 0, 95, 'active', 'admin', '2024-05-26 12:06:54'),
(1716696436, 95, 0, 0, 0, 95, 'active', 'admin', '2024-05-26 12:07:16'),
(1716780855, 125, 6, 0, 0, 131, 'active', 'admin', '2024-05-27 11:34:16'),
(1716891224, 735, 0, 0, 0, 735, 'active', 'admin', '2024-05-28 18:13:44'),
(1716895076, 275, 0, 0, 0, 275, 'active', 'admin', '2024-05-28 19:17:56');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `item_id`, `quantity`, `unit_price`, `sub_total`, `status`, `datetime`) VALUES
(1, 1716508379, 15, 1, 75, 75, 'del', '2024-05-24 07:52:59'),
(2, 1716508379, 11, 1, 50, 50, 'del', '2024-05-24 07:52:59'),
(3, 1716508401, 19, 1, 45, 45, 'del', '2024-05-24 07:53:21'),
(4, 1716508401, 21, 1, 90, 90, 'del', '2024-05-24 07:53:21'),
(5, 1716518741, 3, 4, 150, 600, 'active', '2024-05-24 10:45:41'),
(6, 1716518928, 20, 1, 200, 200, 'active', '2024-05-24 10:48:48'),
(7, 1716522137, 3, 5, 150, 750, 'active', '2024-05-24 11:42:17'),
(8, 1716524707, 11, 2, 50, 100, 'active', '2024-05-24 12:25:07'),
(9, 1716525297, 14, 1, 75, 75, 'active', '2024-05-24 12:34:57'),
(10, 1716525297, 19, 1, 45, 45, 'active', '2024-05-24 12:34:57'),
(11, 1716526826, 25, 1, 25, 25, 'active', '2024-05-24 13:00:26'),
(12, 1716696018, 25, 1, 25, 25, 'active', '2024-05-26 12:00:18'),
(13, 1716696018, 23, 1, 55, 55, 'active', '2024-05-26 12:00:18'),
(14, 1716696084, 25, 2, 25, 50, 'active', '2024-05-26 12:01:24'),
(15, 1716696393, 3, 1, 150, 150, 'active', '2024-05-26 12:06:33'),
(16, 1716696393, 25, 1, 25, 25, 'active', '2024-05-26 12:06:33'),
(17, 1716696393, 23, 1, 55, 55, 'active', '2024-05-26 12:06:33'),
(18, 1716696414, 25, 1, 25, 25, 'active', '2024-05-26 12:06:54'),
(19, 1716696414, 23, 1, 55, 55, 'active', '2024-05-26 12:06:54'),
(20, 1716696414, 24, 1, 15, 15, 'active', '2024-05-26 12:06:54'),
(21, 1716696436, 25, 1, 25, 25, 'active', '2024-05-26 12:07:16'),
(22, 1716696436, 24, 1, 15, 15, 'active', '2024-05-26 12:07:16'),
(23, 1716696436, 23, 1, 55, 55, 'active', '2024-05-26 12:07:16'),
(24, 1716780855, 2, 1, 125, 125, 'active', '2024-05-27 11:34:16'),
(25, 1716891224, 3, 4, 150, 600, 'active', '2024-05-28 18:13:44'),
(26, 1716891224, 5, 1, 135, 135, 'active', '2024-05-28 18:13:44'),
(27, 1716895076, 23, 2, 55, 110, 'active', '2024-05-28 19:17:56'),
(28, 1716895076, 9, 1, 165, 165, 'active', '2024-05-28 19:17:56');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`type_id`, `type_name`, `status`, `datetime`) VALUES
(1, 'Coffee', 'active', '2024-05-24 06:22:37'),
(2, 'Hot Coffee', 'active', '2024-05-24 06:22:37'),
(3, 'Cold Coffee', 'active', '2024-05-24 06:22:37'),
(4, 'Burger', 'active', '2024-05-24 06:22:37'),
(5, 'Pizza', 'active', '2024-05-24 06:22:37'),
(6, 'Beverages', 'active', '2024-05-24 06:22:37'),
(7, 'Sweets', 'active', '2024-05-24 06:22:37'),
(8, 'Others', 'del', '2024-05-24 06:22:37'),
(9, 'Bread', 'active', '2024-05-24 12:54:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1716895077;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
