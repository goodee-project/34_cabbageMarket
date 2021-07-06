-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.9-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- cabbage_market 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `cabbage_market` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cabbage_market`;

-- 테이블 cabbage_market.apply_product_sales_delivery 구조 내보내기
CREATE TABLE IF NOT EXISTS `apply_product_sales_delivery` (
  `apply_product_sales_delivery_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `category_sub_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `return_address` text DEFAULT NULL,
  `waybill_number` varchar(50) DEFAULT NULL,
  `delivery_requests` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`apply_product_sales_delivery_id`),
  KEY `FK_apply_product_sales_delivery_users` (`user_id`),
  KEY `FK_apply_product_sales_delivery_sub_category` (`category_sub_id`) USING BTREE,
  CONSTRAINT `FK_apply_product_sales_delivery_category_sub` FOREIGN KEY (`category_sub_id`) REFERENCES `category_sub` (`category_sub_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_apply_product_sales_delivery_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상품 판매 배송 신청';

-- 테이블 데이터 cabbage_market.apply_product_sales_delivery:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `apply_product_sales_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `apply_product_sales_delivery` ENABLE KEYS */;

-- 테이블 cabbage_market.apply_product_sales_delivery_img 구조 내보내기
CREATE TABLE IF NOT EXISTS `apply_product_sales_delivery_img` (
  `apply_product_sales_delivery_id` int(11) DEFAULT NULL,
  `img_path` text DEFAULT NULL,
  KEY `FK_apply_product_sales_delivery_img_apply_product_sales_delivery` (`apply_product_sales_delivery_id`),
  CONSTRAINT `FK_apply_product_sales_delivery_img_apply_product_sales_delivery` FOREIGN KEY (`apply_product_sales_delivery_id`) REFERENCES `apply_product_sales_delivery` (`apply_product_sales_delivery_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상품 판매 배송 이미지';

-- 테이블 데이터 cabbage_market.apply_product_sales_delivery_img:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `apply_product_sales_delivery_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `apply_product_sales_delivery_img` ENABLE KEYS */;

-- 테이블 cabbage_market.auction_product_registration 구조 내보내기
CREATE TABLE IF NOT EXISTS `auction_product_registration` (
  `apply_product_sales_delivery_id` int(11) NOT NULL,
  `product_desc` text DEFAULT NULL,
  `min_bid_price` int(11) DEFAULT NULL,
  `quote` int(11) DEFAULT NULL,
  `registration_deadline` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`apply_product_sales_delivery_id`),
  CONSTRAINT `FK_auction_prod_regi_prod_conf_regi` FOREIGN KEY (`apply_product_sales_delivery_id`) REFERENCES `product_confirmation_registration` (`apply_product_sales_delivery_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='경매상품등록\r\nmin_bid_price 최소 입찰 가격\r\nquote 호가\r\nregistration_deadline 경매 마감 기간';

-- 테이블 데이터 cabbage_market.auction_product_registration:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `auction_product_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `auction_product_registration` ENABLE KEYS */;

-- 테이블 cabbage_market.bidding_auction_product 구조 내보내기
CREATE TABLE IF NOT EXISTS `bidding_auction_product` (
  `bidding_auction_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_product_sales_delivery_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bid_price` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`bidding_auction_product_id`),
  KEY `FK_bidding_auction_product_users` (`user_id`),
  KEY `FK_bidding_auction_product_auction_product_registration` (`apply_product_sales_delivery_id`),
  CONSTRAINT `FK_bidding_auction_product_auction_product_registration` FOREIGN KEY (`apply_product_sales_delivery_id`) REFERENCES `auction_product_registration` (`apply_product_sales_delivery_id`),
  CONSTRAINT `FK_bidding_auction_product_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='경매 상품 입찰';

-- 테이블 데이터 cabbage_market.bidding_auction_product:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bidding_auction_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `bidding_auction_product` ENABLE KEYS */;

-- 테이블 cabbage_market.bidding_commissions_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `bidding_commissions_history` (
  `apply_product_sales_delivery_id` int(11) NOT NULL,
  `commission_info_id` int(11) DEFAULT NULL,
  `commission_point` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`apply_product_sales_delivery_id`),
  KEY `FK_bidding_commissions_history_commission_info` (`commission_info_id`),
  CONSTRAINT `FK_bidding_commissions_history_bidding_auction_product` FOREIGN KEY (`apply_product_sales_delivery_id`) REFERENCES `bidding_auction_product` (`apply_product_sales_delivery_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_bidding_commissions_history_commission_info` FOREIGN KEY (`commission_info_id`) REFERENCES `commission_info` (`commission_info_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='입찰 수수료 발생 내역';

-- 테이블 데이터 cabbage_market.bidding_commissions_history:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bidding_commissions_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `bidding_commissions_history` ENABLE KEYS */;

-- 테이블 cabbage_market.bidding_points_using_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `bidding_points_using_history` (
  `bidding_auction_product_id` int(11) NOT NULL,
  `income_expenditure` enum('수입','지출') NOT NULL,
  `point` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`bidding_auction_product_id`),
  CONSTRAINT `FK_bidding_points_using_history_bidding_auction_product` FOREIGN KEY (`bidding_auction_product_id`) REFERENCES `bidding_auction_product` (`bidding_auction_product_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='입찰 포인트 이용 내역';

-- 테이블 데이터 cabbage_market.bidding_points_using_history:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bidding_points_using_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `bidding_points_using_history` ENABLE KEYS */;

-- 테이블 cabbage_market.bidding_product_delivery 구조 내보내기
CREATE TABLE IF NOT EXISTS `bidding_product_delivery` (
  `apply_product_sales_delivery_id` int(11) NOT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `delivery_state` int(11) DEFAULT NULL,
  `waybill_number` text DEFAULT NULL,
  `delivery_requests` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`apply_product_sales_delivery_id`),
  KEY `FK_bidding_product_delivery_shipping_address` (`shipping_address_id`),
  CONSTRAINT `FK_bidding_product_delivery_bidding_auction_product` FOREIGN KEY (`apply_product_sales_delivery_id`) REFERENCES `bidding_auction_product` (`apply_product_sales_delivery_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_bidding_product_delivery_shipping_address` FOREIGN KEY (`shipping_address_id`) REFERENCES `shipping_address` (`shipping_address_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='입찰 상품 배송';

-- 테이블 데이터 cabbage_market.bidding_product_delivery:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bidding_product_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `bidding_product_delivery` ENABLE KEYS */;

-- 테이블 cabbage_market.buying_commissions_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `buying_commissions_history` (
  `apply_product_sales_delivery_id` int(11) NOT NULL,
  `commission_info_id` int(11) NOT NULL DEFAULT 0,
  `commission_point` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`apply_product_sales_delivery_id`) USING BTREE,
  KEY `FK_buying_commissions_history_commission_info` (`commission_info_id`),
  CONSTRAINT `FK_buying_commissions_history_buy_used_product` FOREIGN KEY (`apply_product_sales_delivery_id`) REFERENCES `buying_used_product` (`apply_product_sales_delivery_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_buying_commissions_history_commission_info` FOREIGN KEY (`commission_info_id`) REFERENCES `commission_info` (`commission_info_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='구매 수수료 발생 내역';

-- 테이블 데이터 cabbage_market.buying_commissions_history:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `buying_commissions_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `buying_commissions_history` ENABLE KEYS */;

-- 테이블 cabbage_market.buying_points_using_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `buying_points_using_history` (
  `apply_product_sales_delivery_id` int(11) NOT NULL,
  `income_expenditure` enum('수입','지출') NOT NULL,
  `point` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`apply_product_sales_delivery_id`,`income_expenditure`),
  CONSTRAINT `FK_buying_points_using_history_buy_used_product` FOREIGN KEY (`apply_product_sales_delivery_id`) REFERENCES `buying_used_product` (`apply_product_sales_delivery_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='구매 포인트 이용 내역\r\n\r\nincome expenditure 수입 지출';

-- 테이블 데이터 cabbage_market.buying_points_using_history:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `buying_points_using_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `buying_points_using_history` ENABLE KEYS */;

-- 테이블 cabbage_market.buying_product_delivery 구조 내보내기
CREATE TABLE IF NOT EXISTS `buying_product_delivery` (
  `apply_product_sales_delivery_id` int(11) NOT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `delivery_state` int(11) DEFAULT NULL,
  `waybill_number` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`apply_product_sales_delivery_id`),
  KEY `FK_buying_product_delivery_shipping_address` (`shipping_address_id`),
  CONSTRAINT `FK_buying_product_delivery_buy_used_product` FOREIGN KEY (`apply_product_sales_delivery_id`) REFERENCES `buying_used_product` (`apply_product_sales_delivery_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_buying_product_delivery_shipping_address` FOREIGN KEY (`shipping_address_id`) REFERENCES `shipping_address` (`shipping_address_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='구매 상품 배송';

-- 테이블 데이터 cabbage_market.buying_product_delivery:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `buying_product_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `buying_product_delivery` ENABLE KEYS */;

-- 테이블 cabbage_market.buying_used_product 구조 내보내기
CREATE TABLE IF NOT EXISTS `buying_used_product` (
  `apply_product_sales_delivery_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`apply_product_sales_delivery_id`),
  KEY `FK_buy_used_product_users` (`user_id`),
  CONSTRAINT `FK_buy_used_product_used_product_registration` FOREIGN KEY (`apply_product_sales_delivery_id`) REFERENCES `used_product_registration` (`apply_product_sales_delivery_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_buy_used_product_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='중고 상품 구매\r\n';

-- 테이블 데이터 cabbage_market.buying_used_product:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `buying_used_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `buying_used_product` ENABLE KEYS */;

-- 테이블 cabbage_market.category_main 구조 내보내기
CREATE TABLE IF NOT EXISTS `category_main` (
  `category_main_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_main_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`category_main_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 cabbage_market.category_main:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `category_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_main` ENABLE KEYS */;

-- 테이블 cabbage_market.category_middle 구조 내보내기
CREATE TABLE IF NOT EXISTS `category_middle` (
  `catagory_middle_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_main_id` int(11) DEFAULT NULL,
  `catagory_middle_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`catagory_middle_id`),
  KEY `FK_category_middle_category_main` (`category_main_id`),
  CONSTRAINT `FK_category_middle_category_main` FOREIGN KEY (`category_main_id`) REFERENCES `category_main` (`category_main_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 cabbage_market.category_middle:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `category_middle` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_middle` ENABLE KEYS */;

-- 테이블 cabbage_market.category_sub 구조 내보내기
CREATE TABLE IF NOT EXISTS `category_sub` (
  `category_sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `catagory_middle_id` int(11) DEFAULT NULL,
  `category_sub_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`category_sub_id`) USING BTREE,
  KEY `FK_category_sub_category_middle` (`catagory_middle_id`),
  CONSTRAINT `FK_category_sub_category_middle` FOREIGN KEY (`catagory_middle_id`) REFERENCES `category_middle` (`catagory_middle_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='소분류 카테고리';

-- 테이블 데이터 cabbage_market.category_sub:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `category_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_sub` ENABLE KEYS */;

-- 테이블 cabbage_market.chatting_content 구조 내보내기
CREATE TABLE IF NOT EXISTS `chatting_content` (
  `chatting_content_id` int(11) NOT NULL AUTO_INCREMENT,
  `chatting_room_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`chatting_content_id`),
  KEY `FK_chatting_content_chatting_room` (`chatting_room_id`),
  KEY `FK_chatting_content_users` (`user_id`),
  CONSTRAINT `FK_chatting_content_chatting_room` FOREIGN KEY (`chatting_room_id`) REFERENCES `chatting_room` (`chatting_room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_chatting_content_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='채팅내용';

-- 테이블 데이터 cabbage_market.chatting_content:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `chatting_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatting_content` ENABLE KEYS */;

-- 테이블 cabbage_market.chatting_room 구조 내보내기
CREATE TABLE IF NOT EXISTS `chatting_room` (
  `chatting_room_id` int(11) NOT NULL AUTO_INCREMENT,
  `direct_trade_product_registration_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `chatting_room_state` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`chatting_room_id`),
  KEY `FK_chatting_room_direct_trade_product_registration` (`direct_trade_product_registration_id`),
  KEY `FK_chatting_room_users` (`user_id`),
  CONSTRAINT `FK_chatting_room_direct_trade_product_registration` FOREIGN KEY (`direct_trade_product_registration_id`) REFERENCES `direct_trade_product_registration` (`direct_trade_product_registration_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_chatting_room_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='채팅방';

-- 테이블 데이터 cabbage_market.chatting_room:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `chatting_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatting_room` ENABLE KEYS */;

-- 테이블 cabbage_market.commission_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `commission_info` (
  `commission_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `commission_kind` varchar(50) DEFAULT NULL,
  `commission_rate` int(11) DEFAULT NULL,
  PRIMARY KEY (`commission_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 cabbage_market.commission_info:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `commission_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `commission_info` ENABLE KEYS */;

-- 테이블 cabbage_market.direct_trade_product_img 구조 내보내기
CREATE TABLE IF NOT EXISTS `direct_trade_product_img` (
  `direct_trade_product_registration_id` int(11) DEFAULT NULL,
  `img_path` text DEFAULT NULL,
  KEY `FK_direct_trade_product_img_direct_trade_product_registration` (`direct_trade_product_registration_id`),
  CONSTRAINT `FK_direct_trade_product_img_direct_trade_product_registration` FOREIGN KEY (`direct_trade_product_registration_id`) REFERENCES `direct_trade_product_registration` (`direct_trade_product_registration_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='직거래 상품 이미지';

-- 테이블 데이터 cabbage_market.direct_trade_product_img:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `direct_trade_product_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `direct_trade_product_img` ENABLE KEYS */;

-- 테이블 cabbage_market.direct_trade_product_registration 구조 내보내기
CREATE TABLE IF NOT EXISTS `direct_trade_product_registration` (
  `direct_trade_product_registration_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_sub_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `location` text DEFAULT NULL,
  `registration_state` int(11) NOT NULL DEFAULT 0,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`direct_trade_product_registration_id`),
  KEY `FK_direct_trade_product_registration_users` (`user_id`),
  KEY `FK_direct_trade_product_registration_sub_category` (`category_sub_id`) USING BTREE,
  CONSTRAINT `FK_direct_trade_product_registration_category_sub` FOREIGN KEY (`category_sub_id`) REFERENCES `category_sub` (`category_sub_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_direct_trade_product_registration_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='직거래 상품 등록';

-- 테이블 데이터 cabbage_market.direct_trade_product_registration:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `direct_trade_product_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `direct_trade_product_registration` ENABLE KEYS */;

-- 테이블 cabbage_market.manager 구조 내보내기
CREATE TABLE IF NOT EXISTS `manager` (
  `manager_id` varchar(50) NOT NULL,
  `manager_password` varchar(50) DEFAULT NULL,
  `manager_name` varchar(50) DEFAULT NULL,
  `manager_nickname` varchar(50) DEFAULT NULL,
  `manager_address` text DEFAULT NULL,
  `manager_phone_number` varchar(50) DEFAULT NULL,
  `manager_level` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='관리자';

-- 테이블 데이터 cabbage_market.manager:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;

-- 테이블 cabbage_market.points_recharge_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `points_recharge_history` (
  `points_recharge_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `used_point_date` datetime DEFAULT NULL,
  PRIMARY KEY (`points_recharge_history_id`),
  KEY `FK_points_recharge_history_users` (`user_id`),
  CONSTRAINT `FK_points_recharge_history_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='포인트 충전 내역';

-- 테이블 데이터 cabbage_market.points_recharge_history:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `points_recharge_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `points_recharge_history` ENABLE KEYS */;

-- 테이블 cabbage_market.product_confirmation_registration 구조 내보내기
CREATE TABLE IF NOT EXISTS `product_confirmation_registration` (
  `apply_product_sales_delivery_id` int(11) NOT NULL,
  `manager_id` varchar(50) DEFAULT NULL,
  `registration_state` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`apply_product_sales_delivery_id`),
  KEY `FK_product_confirmation_registration_manager` (`manager_id`),
  CONSTRAINT `FK_prod_conf_regi_apply_prod_sales_delivery` FOREIGN KEY (`apply_product_sales_delivery_id`) REFERENCES `apply_product_sales_delivery` (`apply_product_sales_delivery_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_product_confirmation_registration_manager` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상품 확인 등록';

-- 테이블 데이터 cabbage_market.product_confirmation_registration:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `product_confirmation_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_confirmation_registration` ENABLE KEYS */;

-- 테이블 cabbage_market.shipping_address 구조 내보내기
CREATE TABLE IF NOT EXISTS `shipping_address` (
  `shipping_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `recipient_name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `recipient_phone_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`shipping_address_id`),
  KEY `FK_shipping_address_users` (`user_id`),
  CONSTRAINT `FK_shipping_address_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='배송지\r\n\r\nrecipient name 받는 사람 이름';

-- 테이블 데이터 cabbage_market.shipping_address:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shipping_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_address` ENABLE KEYS */;

-- 테이블 cabbage_market.sns_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `sns_info` (
  `user_id` int(11) NOT NULL,
  `sns_id` varchar(255) NOT NULL,
  `sns_type` varchar(10) DEFAULT NULL,
  `sns_name` varchar(255) DEFAULT NULL,
  `sns_profile` varchar(255) DEFAULT NULL,
  `sns_connect_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idx01_id` (`user_id`),
  KEY `idx02_sns_id` (`sns_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원 정보';

-- 테이블 데이터 cabbage_market.sns_info:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sns_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `sns_info` ENABLE KEYS */;

-- 테이블 cabbage_market.used_product_registration 구조 내보내기
CREATE TABLE IF NOT EXISTS `used_product_registration` (
  `apply_product_sales_delivery_id` int(11) NOT NULL,
  `product_desc` text DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL,
  `registration_state` int(11) DEFAULT NULL,
  `registration_deadline` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`apply_product_sales_delivery_id`),
  CONSTRAINT `FK_used_prod_regi_prod_conf_regi` FOREIGN KEY (`apply_product_sales_delivery_id`) REFERENCES `product_confirmation_registration` (`apply_product_sales_delivery_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='중고상품등록\r\nregistration_deadline 상품 등록 마감 기간';

-- 테이블 데이터 cabbage_market.used_product_registration:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `used_product_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `used_product_registration` ENABLE KEYS */;

-- 테이블 cabbage_market.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `user_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `idx1_username` (`username`),
  KEY `idx2_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원 테이블';

-- 테이블 데이터 cabbage_market.users:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
