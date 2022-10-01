-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2022 at 07:47 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flutter_9_am_first_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `banarimages`
--

CREATE TABLE `banarimages` (
  `Id` int(11) NOT NULL,
  `Image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banarimages`
--

INSERT INTO `banarimages` (`Id`, `Image`) VALUES
(1, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
(2, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
(3, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
(4, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
(5, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `Id` int(11) NOT NULL,
  `Id_users` int(11) NOT NULL,
  `Id_items` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `Id` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Image` text NOT NULL,
  `Id_statetype` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`Id`, `Name`, `Image`, `Id_statetype`) VALUES
(1, 'dd', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpC1KHkw7t9kyOTewpsdRkrYnb574HjshQ-g&usqp=CAU', 1),
(2, 'cat 2', 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 2),
(3, 'cat 3', 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 1),
(7, 'adfsf', 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 1),
(8, 'testqweqw', 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 1),
(9, 'afnan new', 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 1),
(10, 'new category', 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `Id` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Price` double NOT NULL,
  `HomeImage` text NOT NULL,
  `Des` text NOT NULL,
  `Id_statetype` int(11) NOT NULL,
  `Id_categories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`Id`, `Name`, `Price`, `HomeImage`, `Des`, `Id_statetype`, `Id_categories`) VALUES
(7, 'afnan item', 20, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 'kdsjkhksjhjkfhjkdhfjkhjkhdjkf', 1, 1),
(8, 'item 2', 50, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 'hjkdshjkdhjksdhjkshdjksd', 1, 2),
(9, 'item 333333', 44, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpC1KHkw7t9kyOTewpsdRkrYnb574HjshQ-g&usqp=CAU', 'good', 1, 1),
(10, 'item 4', 30, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 'KJKSKDJKjdskljkljkljlkjk', 1, 3),
(11, 'item 5', 80, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 'hggjhhhhsnns', 2, 2),
(12, 'item 6', 70.6, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 'jjkjkjkjk', 1, 1),
(13, '', 24, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 'goo', 1, 2),
(14, 'rito', 22, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 'dd', 1, 1),
(16, 'erwe', 1, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 'sdfsf', 1, 1),
(17, 'afnan item', 55, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 'gfdgd', 1, 2),
(18, 'mango', 66, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 'good', 1, 1),
(19, 'cat', 44, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1200px-Cat03.jpg', 'fds', 1, 1),
(20, 'dog', 34, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1200px-Cat03.jpg', 'fgf', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `itemsimages`
--

CREATE TABLE `itemsimages` (
  `Id` int(11) NOT NULL,
  `Image` text NOT NULL,
  `Id_items` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `itemsimages`
--

INSERT INTO `itemsimages` (`Id`, `Image`, `Id_items`) VALUES
(1, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 7),
(2, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Id` int(11) NOT NULL,
  `Id_users` int(11) NOT NULL,
  `TotalPrice` double NOT NULL,
  `longitude` double NOT NULL,
  `Latu` double NOT NULL,
  `Note` text NOT NULL,
  `status` varchar(12) NOT NULL DEFAULT 'processing'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Id`, `Id_users`, `TotalPrice`, `longitude`, `Latu`, `Note`, `status`) VALUES
(1, 55, 300, 0, 0, '', 'Cancelled'),
(2, 55, 300, 0, 0, '', 'processing'),
(3, 55, 300, 0, 0, '', 'Cancelled'),
(6, 55, 150, 0, 0, '', 'Done');

-- --------------------------------------------------------

--
-- Table structure for table `ordersdet`
--

CREATE TABLE `ordersdet` (
  `Id` int(11) NOT NULL,
  `Id_orders` int(11) NOT NULL,
  `Id_items` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `statetype`
--

CREATE TABLE `statetype` (
  `Id` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `statetype`
--

INSERT INTO `statetype` (`Id`, `Name`) VALUES
(1, 'active'),
(2, 'disactive');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Id_statetype` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `Name`, `Email`, `Phone`, `Password`, `Id_statetype`) VALUES
(1, 'anas', 'anasshalabi776@gmail.com', '0797922986', 'QWEr123$', 1),
(55, 'afnan', 'mahmoodfathy66@gmail.com', '243242', '1234567', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banarimages`
--
ALTER TABLE `banarimages`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `cart_fk1` (`Id_items`),
  ADD KEY `cart_fk2` (`Id_users`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `categories_fk1` (`Id_statetype`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `items_fk1` (`Id_categories`),
  ADD KEY `items_fk2` (`Id_statetype`);

--
-- Indexes for table `itemsimages`
--
ALTER TABLE `itemsimages`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `itemsImages_fk1` (`Id_items`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `orders_fk1` (`Id_users`);

--
-- Indexes for table `ordersdet`
--
ALTER TABLE `ordersdet`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ordersdet_fk1` (`Id_items`),
  ADD KEY `ordersdet_fk2` (`Id_orders`);

--
-- Indexes for table `statetype`
--
ALTER TABLE `statetype`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `users_fk1` (`Id_statetype`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banarimages`
--
ALTER TABLE `banarimages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `itemsimages`
--
ALTER TABLE `itemsimages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ordersdet`
--
ALTER TABLE `ordersdet`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statetype`
--
ALTER TABLE `statetype`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_fk1` FOREIGN KEY (`Id_items`) REFERENCES `items` (`Id`),
  ADD CONSTRAINT `cart_fk2` FOREIGN KEY (`Id_users`) REFERENCES `users` (`Id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_fk1` FOREIGN KEY (`Id_statetype`) REFERENCES `statetype` (`Id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_fk1` FOREIGN KEY (`Id_categories`) REFERENCES `categories` (`Id`),
  ADD CONSTRAINT `items_fk2` FOREIGN KEY (`Id_statetype`) REFERENCES `statetype` (`Id`);

--
-- Constraints for table `itemsimages`
--
ALTER TABLE `itemsimages`
  ADD CONSTRAINT `itemsImages_fk1` FOREIGN KEY (`Id_items`) REFERENCES `items` (`Id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_fk1` FOREIGN KEY (`Id_users`) REFERENCES `users` (`Id`);

--
-- Constraints for table `ordersdet`
--
ALTER TABLE `ordersdet`
  ADD CONSTRAINT `ordersdet_fk1` FOREIGN KEY (`Id_items`) REFERENCES `items` (`Id`),
  ADD CONSTRAINT `ordersdet_fk2` FOREIGN KEY (`Id_orders`) REFERENCES `orders` (`Id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_fk1` FOREIGN KEY (`Id_statetype`) REFERENCES `statetype` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
