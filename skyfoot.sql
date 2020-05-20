
CREATE DATABASE databasename;
--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `address` varchar(300) NOT NULL,
  PRIMARY KEY (`address_id`)
) 



--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(45) NOT NULL,
  `item_name` varchar(45) NOT NULL,
  PRIMARY KEY (`cart_id`)
)

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `qty` int(11) NOT NULL,
  `info` varchar(300) NOT NULL,
  `img1` longblob NOT NULL,
  `img2` longblob,
  `img3` longblob,
  `img4` longblob,
  `img5` longblob,
  PRIMARY KEY (`name`)
) 

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_price` double NOT NULL,
  `item_photo` longblob NOT NULL,
  PRIMARY KEY (`order_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `address` varchar(300) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `amount` double NOT NULL,
  `gst` double NOT NULL,
  `shipping_charge` double NOT NULL,
  `payment_mode` varchar(20) NOT NULL,
  `order_date` date NOT NULL,
  `order_time` time NOT NULL,
  `order_status` varchar(20) NOT NULL,
  `delivery_date` date DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) 
--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `slide_id` int(11) NOT NULL AUTO_INCREMENT,
  `img` longblob,
  PRIMARY KEY (`slide_id`)
)
--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `photo` longblob,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`email`)
) 