-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 23, 2023 lúc 07:25 PM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tmdt`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `code_pay` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_pay` tinyint(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `id_user`, `code_pay`, `is_pay`, `date`) VALUES
(1, 3, '231011_b06cdda7-20b5-457f-90b3-91b69300d193', 1, '2023-10-11 10:18:10'),
(2, 3, '231011_f6457578-a5b4-4545-b54c-2c812deb01b9', 1, '2023-10-10 14:53:44'),
(3, 3, '231015_3c32009c-5e77-44ec-8efc-46292c7b80fb', 1, '2023-10-11 10:24:28'),
(7, 3, '231013_b86e24dc-fa32-466d-8b9a-a2b5ba4816ce', 1, '2023-10-13 15:16:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_type`
--

CREATE TABLE `bill_type` (
  `id` int(11) NOT NULL,
  `id_bill` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `isreview` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bill_type`
--

INSERT INTO `bill_type` (`id`, `id_bill`, `id_type`, `soluong`, `isreview`) VALUES
(1, 1, 48, 1, 1),
(2, 1, 39, 2, 1),
(3, 1, 37, 2, 0),
(4, 2, 39, 2, 0),
(5, 2, 48, 2, 0),
(6, 2, 37, 2, 0),
(7, 3, 48, 1, 0),
(8, 3, 37, 1, 0),
(9, 7, 7, 3, 1),
(10, 7, 48, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `ghichu` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `ghichu`) VALUES
(8, NULL),
(9, NULL),
(10, NULL),
(11, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_type`
--

CREATE TABLE `cart_type` (
  `id` int(11) NOT NULL,
  `id_cart` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_type`
--

INSERT INTO `cart_type` (`id`, `id_cart`, `id_type`, `soluong`, `date_update`) VALUES
(1, 8, 45, 1, '2023-10-14 07:49:07'),
(2, 8, 37, 3, '2023-10-13 17:00:00'),
(3, 8, 41, 4, '2023-10-13 17:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `img_product`
--

CREATE TABLE `img_product` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `img` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_create` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `img_product`
--

INSERT INTO `img_product` (`id`, `id_product`, `img`, `date_create`) VALUES
(68, 21, '1697627294777.jpg', '2023-10-18 18:08:14'),
(74, 25, '1697628161420.jpg', '2023-10-18 18:22:41'),
(75, 23, '1697628353300.jpg', '2023-10-18 18:25:53'),
(76, 23, '1697628353312.jpg', '2023-10-18 18:25:53'),
(77, 20, '1697628392463.jpg', '2023-10-18 18:26:32'),
(78, 29, '1697628461254.jpg', '2023-10-18 18:27:41'),
(79, 29, '1697628461268.jpg', '2023-10-18 18:27:41'),
(80, 26, '1697628479975.jpg', '2023-10-18 18:27:59'),
(81, 26, '1697628479987.jpg', '2023-10-18 18:27:59'),
(82, 28, '1697628539622.jpg', '2023-10-18 18:28:59'),
(83, 28, '1697628539637.jpg', '2023-10-18 18:28:59'),
(84, 27, '1697628638204.jpg', '2023-10-18 18:30:38'),
(85, 27, '1697628638223.jpg', '2023-10-18 18:30:38'),
(86, 30, '1697628760395.jpg', '2023-10-18 18:32:40'),
(87, 30, '1697628760409.jpg', '2023-10-18 18:32:40'),
(88, 31, '1697629124933.jpg', '2023-10-18 18:38:44'),
(89, 31, '1697629124951.jpg', '2023-10-18 18:38:44'),
(90, 31, '1697629124963.jpg', '2023-10-18 18:38:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `img_review`
--

CREATE TABLE `img_review` (
  `id` int(11) NOT NULL,
  `id_review` int(11) NOT NULL,
  `img` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `img_review`
--

INSERT INTO `img_review` (`id`, `id_review`, `img`, `date_create`) VALUES
(3, 1, 'imagereview1.jpg', '2023-10-06 09:52:14'),
(4, 1, 'imagereview2.jpg', '2023-10-06 09:52:20'),
(5, 2, '1697035651126.jpg', '2023-10-11 14:47:31'),
(6, 3, '1697035829400.jpg', '2023-10-11 14:50:29'),
(7, 4, '1697211067162.jpg', '2023-10-13 15:31:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `incoming` int(11) NOT NULL,
  `outcoming` int(11) NOT NULL,
  `content` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_load` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `message`
--

INSERT INTO `message` (`id`, `incoming`, `outcoming`, `content`, `is_load`) VALUES
(1, 3, 4, 'a', 1),
(2, 4, 3, 'b', 1),
(3, 3, 4, 'c', 1),
(6, 4, 3, 'nguyen\n', 1),
(8, 4, 3, 'ok\n', 1),
(9, 4, 3, 'a\n', 1),
(10, 4, 3, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n', 1),
(11, 3, 4, 'a', 1),
(12, 3, 4, 'test', 1),
(13, 4, 3, 'anh oi\n', 1),
(14, 3, 4, 'Sao em\n', 1),
(15, 4, 3, 'ko co gi\n', 1),
(16, 3, 4, 'alo\n', 1),
(17, 3, 4, 'alo\n', 1),
(18, 4, 3, 'sao khoong nhan\n', 1),
(19, 4, 3, 'alo\n', 1),
(20, 4, 3, 'a\n', 1),
(21, 3, 4, 'b\n', 1),
(22, 3, 4, 'b\n', 1),
(23, 4, 3, 'd\n', 1),
(24, 4, 3, 'shop oi\n', 1),
(25, 3, 4, 'sao em\n', 1),
(26, 4, 3, 'a\n', 1),
(27, 3, 4, 'ok\n', 1),
(28, 4, 3, 'sao ko thay\n', 1),
(29, 3, 4, 'o kia\n', 1),
(30, 4, 3, 'ban oi\n', 1),
(31, 4, 3, 'alo\n', 1),
(32, 4, 3, 'sao ko nghe\n', 1),
(33, 3, 4, 'toi nghe day\'\n', 1),
(34, 4, 3, 'ka ka\n', 1),
(35, 4, 3, 'ka ka\n', 1),
(36, 4, 3, 'a\n', 1),
(37, 3, 4, 'b\n', 1),
(38, 3, 4, 'c\n', 1),
(39, 4, 3, 'd\n', 1),
(40, 4, 3, 'alo\n', 1),
(41, 3, 4, 'co gi ko em\n', 1),
(42, 4, 3, 'san pham cua anh co gia bao nhieu\n', 1),
(43, 3, 4, 'khong biet nua\n', 1),
(44, 4, 3, 'hihi\n', 1),
(45, 4, 3, 'Ok\n', 1),
(46, 4, 3, 'qua hay\n', 1),
(47, 3, 4, 'sao ma hay\n', 1),
(48, 4, 3, 'Sản phẩm này của bạn có bền không?\n', 1),
(49, 3, 4, 'Tất nhiên rồi sản phẩm được nhập khẩu chính hãng từ Đức nhé anh!\n', 1),
(50, 4, 3, 'Bạn có thể giảm giá nếu mình mua nhiều không?\n', 1),
(51, 3, 4, 'Thông tin tới bạn, mình không có quyền giảm giá ạ\n', 1),
(52, 4, 3, 'Cảm ơn bạn đã dành thời gian\n', 1),
(53, 3, 4, 'alo\n', 1),
(54, 3, 4, 'sao vậy bạn\n', 1),
(55, 4, 3, 'ha\n', 1),
(56, 3, 4, '123\n', 1),
(57, 4, 3, '321\n', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_store` int(11) NOT NULL,
  `ten` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mota` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ghichu` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soluong` int(11) NOT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  `rating` double NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `id_store`, `ten`, `mota`, `ghichu`, `soluong`, `view`, `rating`, `status`) VALUES
(20, 1, 'Ngói sóng SCG Thái Lan', 'Ngói màu SCG (hay còn gọi là Cpac monier) thuộc tập đoàn hoàng gia SCG Thái Lan. Đây là một thương hiệu hàng đầu về vật liệu xây dựng, ngành xi măng và hóa chất ở Thái Lan có sức ảnh hưởng lớn đến nhiều quốc gia trên thế giới. Các sản phẩm quen thuộc của tâp đoàn như thiết bị vệ sinh COTTO, vật liệu xi măng giả gỗ Smartwood, Smartboard,…', '2-2-2-2', 10, 0, 0, 0),
(21, 1, 'SƠN LÓT NGOẠI THẤT TOA 4 SEASONS SEALER', 'Sơn lót ngoại thất TOA 4 Seasons Sealer được sản xuất từ nhựa Styrene Acrylic. Sơn lót ngoại thất TOA 4 Seasons SealerVới khả năng thấm sâu vào bề mặt, sản phẩm tạo ra một lớp màng sơn độ bám dính cao, kháng kiềm, kháng nước và chống loang muối hiệu quả.', '2-2-2', 20, 6, 0, 0),
(23, 1, 'Thanh SmartWood hàng rào 7,5x400x1,6cm', 'Thanh hàng Rào & Cổng SCG SmartWood là giải pháp cho bạn khi có thể đáp ứng tất cả các yêu cầu của thiết kế như khả năng chịu nước, chống mối mọt, dễ thi công, độ bền cao', '', 200, 1, 4, 0),
(25, 1, 'Tấm ốp tường 3D BY-1602', 'Tấm ốp tường', '', 500, 0, 0, 0),
(26, 2, 'Áo Sơ Mi Nam Tay Dài Flannel', 'Chất vải cotton cào bông 2 mặt, vải có độ mềm mịn và tạo được cảm giác thoáng mát', '', 20, 0, 0, 0),
(27, 2, 'Áo Thun Nam Tay Ngắn Cổ Tròn Carbon', 'Áo rộng thoáng mát cho mùa hè', '', 54, 0, 0, 0),
(28, 2, 'Quần Vải Nam Texture Trơn Form Slim', 'là một item quần vải basic, màu sắc trung tính dễ phối mang phong thanh lịch, hiện đại. Form quần vừa vặn với cơ thể, phần đùi và mông thoải mái và ôm dần xuống dưới nhưng không quá sát. ', '', 28, 0, 0, 0),
(29, 2, 'Dây Nịt Nam Có Khóa Xoay Trơn Basic', 'Dây nịt da thật', '', 100, 1, 0, 0),
(30, 2, 'Dây Nịt Nam Lưng Trơn Freesize ', 'là item không thể thiếu trong tủ quần áo mà còn là một bảo bối giúp hoàn thiện outfit thời trang của cánh mày râu. Được thiết kế đơn giản theo kiểu dáng khóa kim thanh lịch, nhẹ nhàng. Kết hợp với chất liệu da thuộc mềm và dẻo tạo cảm giác dễ chịu khi sử dụng. ', '', 40, 3, 5, 0),
(31, 3, 'Áo sơ mi dài tay Aristino ALS12602', 'Áo sơ mi dài tay phom Regular Fit có độ suông vừa phải nhưng vẫn đảm bảo vừa vặn hình thể người mặc.', '', 15, 5, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_tag`
--

CREATE TABLE `product_tag` (
  `id` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_tag`
--

INSERT INTO `product_tag` (`id`, `id_tag`, `id_product`) VALUES
(9, 12, 20),
(10, 13, 20),
(11, 14, 20),
(12, 15, 21),
(13, 16, 21),
(14, 17, 21),
(35, 21, 23),
(36, 22, 23),
(37, 23, 23),
(39, 26, 25),
(40, 27, 25),
(41, 28, 26),
(42, 29, 26),
(43, 30, 26),
(44, 31, 27),
(45, 32, 28),
(46, 33, 28),
(47, 36, 29),
(48, 35, 29),
(49, 36, 30),
(50, 35, 30),
(51, 30, 27),
(52, 30, 28),
(53, 16, 21),
(54, 15, 21),
(55, 17, 21),
(56, 26, 25),
(57, 27, 25),
(58, 27, 25),
(59, 26, 25),
(60, 26, 25),
(61, 27, 25),
(62, 27, 25),
(63, 26, 25),
(64, 26, 25),
(65, 27, 25),
(66, 26, 25),
(67, 27, 25),
(68, 23, 23),
(69, 22, 23),
(70, 21, 23),
(71, 13, 20),
(72, 14, 20),
(73, 12, 20),
(74, 36, 29),
(75, 35, 29),
(76, 30, 26),
(77, 28, 26),
(78, 29, 26),
(79, 33, 28),
(80, 32, 28),
(81, 30, 28),
(82, 31, 27),
(83, 30, 27),
(84, 35, 30),
(85, 36, 30),
(86, 30, 31),
(87, 37, 31),
(88, 28, 31);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotion`
--

CREATE TABLE `promotion` (
  `id` int(11) NOT NULL,
  `id_store` int(11) NOT NULL,
  `mota` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value_promotion` int(11) NOT NULL,
  `script` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ghichu` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pro_bill`
--

CREATE TABLE `pro_bill` (
  `id` int(11) NOT NULL,
  `id_promotion` int(11) NOT NULL,
  `id_bill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pro_product`
--

CREATE TABLE `pro_product` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_promotion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `comment` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` int(5) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `review`
--

INSERT INTO `review` (`id`, `id_user`, `id_product`, `comment`, `rate`, `date`) VALUES
(1, 3, 23, 'Sản phẩm tốt!', 4, '2023-10-06 09:01:31'),
(2, 3, 23, 'Tốt!', 4, '2023-10-11 14:47:31'),
(3, 3, 30, 'Da tốt, giá rẻ!', 5, '2023-10-11 14:50:29'),
(4, 3, 20, 'Sản phẩm rất vừa ý tôi!', 5, '2023-10-13 15:31:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mota` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ghichu` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `ten`, `mota`, `ghichu`) VALUES
(1, 'Admin', 'Qu?n tr?', ''),
(2, 'User', 'Ng??i dùng', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `store`
--

CREATE TABLE `store` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `ten` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mota` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_create` datetime NOT NULL,
  `ghichu` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `store`
--

INSERT INTO `store` (`id`, `id_user`, `ten`, `mota`, `phone`, `address`, `date_create`, `ghichu`, `status`) VALUES
(1, 3, 'Vật liệu xây dựng', 'Shop chuyên mua bán sĩ lẻ vật liệu xây dựng', '0774926640', '114/105a phường bình hưng hòa quận bình tân', '2023-10-01 08:55:33', '', 1),
(2, 3, 'Cửa hàng bán quần áo', 'Chuyên bán những bộ quần áo thời trang đẹp đẽ', '0774926640', '114/105a phường bình hưng hòa quận bình tân', '2023-10-04 22:43:32', '', 1),
(3, 4, 'LazyLut', 'Chuyên bán những bộ quần áo thời trang đẹp đẽ nhưng giá lại rẻ heee', '0774926640', '114/105a phường bình hưng hòa quận bình tân', '2023-10-18 18:35:00', 'myshop', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ghichu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tag`
--

INSERT INTO `tag` (`id`, `ten`, `ghichu`) VALUES
(12, 'vật liệu xây dựng', 'vatlieuxaydung'),
(13, 'ngói', 'ngoi'),
(14, 'mái', 'mai'),
(15, 'sơn', 'son'),
(16, 'chống thấm', 'chongtham'),
(17, 'seasons', 'seasons'),
(21, 'rào', 'rao'),
(22, 'SmartWood', 'SmartWood'),
(23, 'hàng rào', 'hangrao'),
(26, 'ốp tường', 'optuong'),
(27, '3d', '3d'),
(28, 'áo', 'ao'),
(29, 'sơ-mi', 'so-mi'),
(30, 'thời trang', 'thoitrang'),
(31, 'áo thun', 'aothun'),
(32, 'quần', 'quan'),
(33, 'Form Slim', 'FormSlim'),
(35, 'da', 'da'),
(36, 'dây nit', 'daynit'),
(37, 'sơ mi', 'somi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `ten` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ghichu` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `test`
--

INSERT INTO `test` (`id`, `ten`, `ghichu`) VALUES
(0, 'asd', 'asddddd');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `ten` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mota` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `ghichu` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type`
--

INSERT INTO `type` (`id`, `id_product`, `ten`, `mota`, `price`, `ghichu`) VALUES
(49, 21, '200ml', 'Màu tùy chọn', 130000, ''),
(50, 21, '1000ml', 'Màu tùy chọn', 200000, ''),
(54, 25, 'Loại 1', 'Màu xám', 75000, 'a'),
(55, 25, 'Loại 2', 'Màu trắng gạch', 100000, ''),
(56, 23, '7,5x400x1,6cm', 'Màu gỗ', 200000, ''),
(57, 23, '8x400x2cm', 'Màu gỗ', 250000, ''),
(58, 20, 'Loại 2', 'Màu cam', 120000, ''),
(59, 20, 'Loại 1', 'Màu xanh', 100000, ''),
(60, 29, '100cm', 'Màu đen', 158000, NULL),
(61, 26, 'Caro', 'Màu xám', 179000, NULL),
(62, 28, 'Size XL', 'Màu trắng', 250000, ''),
(63, 28, 'Size S', 'Màu xám', 220000, ''),
(64, 27, 'Size S', 'Màu xám', 100000, ''),
(65, 27, 'Size M', 'Màu trắng', 90000, ''),
(66, 30, '100cm', 'Đen', 400000, ''),
(67, 30, '120cm', 'Xám', 450000, ''),
(68, 31, 'Size 34', 'Màu xám', 100000, ''),
(69, 31, 'Size 35', 'Màu xám', 120000, ''),
(70, 31, 'Size 39', 'Màu trắng', 180000, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ho` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `gioithieu` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_cart` int(11) DEFAULT NULL,
  `ghichu` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `ten`, `ho`, `phone`, `email`, `address`, `image`, `gioithieu`, `date_create`, `date_update`, `id_cart`, `ghichu`, `password`, `status`) VALUES
(3, 'admin', 'admin', 'admin', 'admin@gmail.com', 'admin', '1697629470428.jpg', 'admin', '2023-09-06 16:05:53', '2023-09-06 09:05:53', 8, 'admin', '$2a$10$fmMtJ6v8fDtSklzbbuVtw.oQQOTDXs4inOULiinziX60ogzG1Xrga', 1),
(4, 'nguyên', 'hồ đắc', '0774926640', 'test1@gmail.com', '114/105a phường bình hưng hòa quận bình tân', '1697629431851.jpg', 'nguyên đẹp trai cực', '2023-10-11 14:34:12', '2023-10-11 07:34:12', 9, '123456', '$2a$10$9lf.qEn2/zHJXL/91xOhduIWmwO.jbIsUANX1w5J2z3UyEuRBO7S6', 1),
(5, 'Nam', 'Hồ', '0774926641', 'cumy1999@gmail.com', 'Hồ Chí Minh', '1697203376712.jpg', 'Nam là bạn của tôi.........', '2023-10-13 20:22:56', '2023-10-13 13:22:56', 10, '123456', '$2a$10$Sjly4LldwDzSvmrGKY3TKuqLsMqhTDzIkkVUnH6Akm5CZmju5u2xO', 1),
(6, 'nguyên', 'hồ', '0774926666', 'hodacnguyen1999@gmail.com', 'Hồ Chí Minh', '1698077994539.jpg', 'admin', '2023-10-23 23:19:54', '2023-10-23 16:19:54', 11, '', '$2a$10$9pQNdLbeTlVeMus0eOKCKO6hQhMour4XHqCWcx/R0qrUsVmqRnfoe', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_role`
--

INSERT INTO `user_role` (`id`, `id_user`, `id_role`, `date_update`) VALUES
(13, 3, 2, '2023-09-06 09:07:36'),
(15, 5, 2, '2023-10-13 13:22:56'),
(18, 3, 1, '2023-10-16 16:13:08'),
(20, 4, 2, '2023-10-16 16:13:30'),
(21, 6, 2, '2023-10-23 16:19:54');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bill_type`
--
ALTER TABLE `bill_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart_type`
--
ALTER TABLE `cart_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `img_product`
--
ALTER TABLE `img_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `img_review`
--
ALTER TABLE `img_review`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_store` (`id_store`);

--
-- Chỉ mục cho bảng `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pro_bill`
--
ALTER TABLE `pro_bill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pro_product`
--
ALTER TABLE `pro_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `bill_type`
--
ALTER TABLE `bill_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `cart_type`
--
ALTER TABLE `cart_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `img_product`
--
ALTER TABLE `img_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT cho bảng `img_review`
--
ALTER TABLE `img_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT cho bảng `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pro_bill`
--
ALTER TABLE `pro_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pro_product`
--
ALTER TABLE `pro_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `store`
--
ALTER TABLE `store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_store` FOREIGN KEY (`id_store`) REFERENCES `store` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
