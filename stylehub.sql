-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 02, 2024 lúc 01:24 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `stylehub`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `acc_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`acc_id`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'Bảo', 'Ngọc', 'ngoc123@gmail.com', '$2a$08$BRnlpHL2lhWwMeIjVBS1julPi2IRH3PMwZcR970bjy8jdDgKrwlXq'),
(3, 'Bảo', 'Ngọc', 'ngoc@gmail.com', '123'),
(4, 'Ẩn', 'Danh', 'an@gmail.com', '123'),
(5, 'Cá', '', 'ca@gmail.com', '123'),
(6, 'Bảo', 'Ngọc', 'ngoc1@gmail.com', '123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`admin_id`, `email`, `password`) VALUES
(1, '2254810194@vaa.edu.vn', 'baongoc'),
(2, '2254810195@vaa.edu.vn', 'quynhanh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `brand_id` varchar(10) NOT NULL,
  `brand_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
('brand-1', 'Nike'),
('brand-2', 'Adidas'),
('brand-3', 'Dior'),
('brand-5', 'Vans'),
('brand-6', '13DE MARZO'),
('brand-7', 'ADLV');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`cart_id`, `acc_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(11, 4, '12', 1, '2024-12-02 05:38:05', '2024-12-02 05:38:05'),
(12, 4, '13', 3, '2024-12-02 05:38:15', '2024-12-02 05:38:15'),
(13, 4, '14', 1, '2024-12-02 05:38:20', '2024-12-02 05:38:34'),
(23, 6, '13', 3, '2024-12-02 11:23:30', '2024-12-02 11:23:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `cate_id` varchar(10) NOT NULL,
  `cate_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`cate_id`, `cate_name`) VALUES
('cate-1', 'Áo Thun'),
('cate-2', 'Áo Hoodie'),
('cate-4', 'Áo Khoác'),
('cate-5', 'Giày/Dép'),
('cate-6', 'Nón');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `follow_order`
--

CREATE TABLE `follow_order` (
  `follow_id` int(11) NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `follow_order`
--

INSERT INTO `follow_order` (`follow_id`, `order_status`, `order_id`) VALUES
(1, 'Đã tiếp nhận', 3),
(2, 'Đã tiếp nhận', 10),
(7, 'Đã tiếp nhận', 4),
(8, 'Đã tiếp nhận', 5),
(10, 'Đã tiếp nhận', 7),
(11, 'Đã tiếp nhận', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `pay_status` varchar(50) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`order_id`, `address`, `phone_number`, `total`, `pay_status`, `acc_id`, `full_name`) VALUES
(3, '9a Tô ký, trung mỹ tây quận 12', '0889379983', 5000000.00, 'Đang chờ thanh toán	', 6, 'Bảo Ngọc'),
(4, '9a Tô ký, trung mỹ tây quận 12', '0889379983', 300000.00, 'Đang chờ thanh toán	', 4, 'Bảo Ngọc'),
(5, '9a Tô ký, trung mỹ tây quận 12', '0889379983', 3500000.00, 'Đang chờ thanh toán	', 6, 'Bảo Ngọc'),
(7, '9a Tô ký, trung mỹ tây quận 12', '0889379983', 14890000.00, 'Đang chờ thanh toán	', 6, 'Bảo Ngọc'),
(8, '9a Tô ký, trung mỹ tây quận 12', '0889379983', 1200000.00, 'Đang chờ thanh toán	', 6, 'Bảo Ngọc'),
(10, '9a Tô ký, trung mỹ tây quận 12', '0889379983', 6400000.00, 'Đang chờ thanh toán', 6, 'Bảo Ngọc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_items` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity_items`, `price`) VALUES
(3, 14, 1, 5000000.00),
(4, 12, 1, 300000.00),
(5, 13, 1, 3200000.00),
(5, 12, 1, 300000.00),
(7, 26, 1, 2990000.00),
(7, 15, 1, 3700000.00),
(7, 14, 1, 5000000.00),
(7, 13, 1, 3200000.00),
(8, 12, 4, 1200000.00),
(10, 13, 2, 6400000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `size_id` varchar(10) DEFAULT NULL,
  `cate_id` varchar(10) DEFAULT NULL,
  `brand_id` varchar(10) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `cost`, `description`, `quantity`, `size_id`, `cate_id`, `brand_id`, `imageUrl`) VALUES
(9, 'DIOR SNEAKERS 02', 3800000.00, NULL, 12, NULL, 'cate-5', 'brand-3', '1730808165652.jpg'),
(12, 'Áo thun Nike', 30000000.00, 'Áo thun 100% Cotton 4 chiều', 6, NULL, 'cate-1', 'brand-1', '1732116313660.jpg'),
(13, 'NIKE AIR FORCE 1 07 QS VALENTINE\'S DAY LOVE LETTER', 3200000.00, NULL, 24, NULL, 'cate-5', 'brand-1', '1732169885624.png'),
(14, 'NIKE DUNK LOW UNIVERSITY RED', 5000000.00, NULL, 1, NULL, 'cate-5', 'brand-1', '1732169977195.png'),
(15, '13DE MARZO T-SHIRT 004', 3700000.00, NULL, 29, NULL, 'cate-1', 'brand-6', '1732170242426.png'),
(16, '13DE MARZO T-SHIRT 100', 4000000.00, NULL, 13, NULL, 'cate-1', 'brand-6', '1732170316626.png'),
(17, '13DE MARZO HOODIE 07', 5800000.00, NULL, 19, NULL, 'cate-2', 'brand-6', '1732170478261.png'),
(18, '13DE MARZO JACKET 02', 5700000.00, NULL, 2, NULL, 'cate-4', 'brand-6', '1732170957511.png'),
(19, 'NIKE HAT 01', 200000.00, NULL, 2, NULL, 'cate-6', 'brand-1', '1732171035592.png'),
(20, '13DE MARZO HOODIE 02', 8000000.00, NULL, 832, NULL, 'cate-2', 'brand-6', '1732171631129.png'),
(21, '13DE MARZO HOODIE 03', 5200000.00, NULL, 15, NULL, 'cate-2', 'brand-6', '1732171772050.png'),
(22, '13DE MARZO HOODIE 04', 5200000.00, NULL, 45, NULL, 'cate-2', 'brand-6', '1732171821963.png'),
(23, '13DE MARZO HOODIE 05', 5900000.00, NULL, 45, NULL, 'cate-2', 'brand-6', '1732171885605.png'),
(24, 'NIKE CALM SLIDES 01 (BLACK)', 1400000.00, NULL, 231, NULL, 'cate-5', 'brand-1', '1732171947255.png'),
(25, 'NIKE CALM SLIDES 02 (BEIGE)', 1400000.00, NULL, 21, NULL, 'cate-5', 'brand-1', '1732172011586.png'),
(26, '13DE MARZO T-SHIRT 002', 2990000.00, NULL, 33, NULL, 'cate-1', 'brand-6', '1732172194528.png'),
(27, '13DE MARZO T-SHIRT 004', 1980000.00, NULL, 34, NULL, 'cate-1', 'brand-6', '1732172252555.png'),
(28, 'ADLV T-SHIRT 03', 999999.00, 'Áo thun co dãn tốt', 3, NULL, 'cate-1', 'brand-7', '1733132009113.png'),
(29, 'ADLV T-SHIRT 05', 800000.00, 'Áo thun co dãn ', 23, NULL, 'cate-1', 'brand-7', '1733132137200.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `review_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`review_id`, `acc_id`, `product_id`, `rating`, `comment`, `review_date`) VALUES
(0, 5, 12, 3, '1', '2024-12-01 19:02:53'),
(1, 1, 24, 1, 'Dép dỏm', '2024-11-30 15:29:40'),
(2, 1, 24, 3, 'được', '2024-11-30 15:32:52'),
(3, 1, 17, 2, 'mắc', '2024-11-30 15:53:24'),
(4, 1, 12, 4, 'áo đẹp', '2024-12-01 19:00:09'),
(5, 4, 12, 5, '10 điểm', '2024-12-01 19:00:54'),
(7, 1, 21, 4, 'đẹp quá', '2024-12-02 05:30:00'),
(8, 1, 21, 4, 'đẹp quá', '2024-12-02 05:30:00'),
(9, 4, 17, 4, 'cũn cũn ', '2024-12-02 05:40:57'),
(10, 1, 12, 1, '2', '2024-12-02 07:31:32'),
(11, 6, 14, 5, 'đẹp', '2024-12-02 09:09:23'),
(12, 4, 9, 2, 'xấu', '2024-12-02 09:10:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size`
--

CREATE TABLE `size` (
  `size_id` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`acc_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `acc_id` (`acc_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cate_id`);

--
-- Chỉ mục cho bảng `follow_order`
--
ALTER TABLE `follow_order`
  ADD PRIMARY KEY (`follow_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `acc_id` (`acc_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `fk_order_id` (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `cate_id` (`cate_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `products_ibfk_1` (`size_id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `acc_id` (`acc_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`size_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `acc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `follow_order`
--
ALTER TABLE `follow_order`
  MODIFY `follow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`acc_id`) REFERENCES `account` (`acc_id`);

--
-- Các ràng buộc cho bảng `follow_order`
--
ALTER TABLE `follow_order`
  ADD CONSTRAINT `follow_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`acc_id`) REFERENCES `account` (`acc_id`);

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`size_id`) REFERENCES `size` (`size_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`cate_id`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`);

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`acc_id`) REFERENCES `account` (`acc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
