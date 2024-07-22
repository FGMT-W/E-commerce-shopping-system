/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.57 : Database - xm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `xm`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `state` int(1) DEFAULT NULL,
  `order_number` int(5) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`cid`,`name`,`state`,`order_number`,`description`,`create_time`) values (2,'航天系列',1,1,'卫星、航母火箭等','2018-12-25 09:53:55'),(3,'手机 平板',1,0,'各种小米系手机','2018-12-25 14:20:12'),(4,'家电',1,2,' 电视、冰箱、洗衣机等','2018-12-25 14:20:42'),(5,'儿童玩具',1,3,'各种玩具','2018-12-25 16:38:14'),(6,'智能产品',1,2,'','2018-12-26 14:46:27'),(7,'图书 内容',1,55,'','2018-12-25 09:53:55'),(8,'移动电源 电池 插线板',1,33,'1','2018-12-26 14:48:16'),(9,'耳机 音响',1,34,'','2018-12-26 14:48:31'),(10,'保护套 贴膜',1,35,'','2018-12-26 14:48:47'),(11,'线材 支架 存储卡',1,36,'','2018-12-26 14:49:04'),(12,'箱包 服饰 鞋 眼镜',1,37,'','2018-12-26 14:49:19'),(13,'米兔 生活周边',1,38,'','2018-12-26 14:49:33');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `gid` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) DEFAULT NULL,
  `gname` varchar(50) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `price` double NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `full_description` varchar(1000) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  `state` int(5) DEFAULT '0',
  `version` varchar(50) DEFAULT NULL,
  `product_date` datetime DEFAULT NULL,
  PRIMARY KEY (`gid`),
  KEY `cid` (`cid`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`gid`,`cid`,`gname`,`color`,`size`,`price`,`description`,`full_description`,`pic`,`state`,`version`,`product_date`) values (3,2,'小浣熊干脆面1','棕色1','包1',1,'好吃不贵','童年的最爱','638707ea-5ed9-4e10-afe1-d428570eb4eatimg.jpg',1,'1.1','2018-12-26 11:25:45'),(4,2,'神舟五号','白色','1993*365',1000000,'中国骄傲','国家一级机密SSS','7ff58893-5fb1-4430-81b3-755c650ee8aatimg (1).jpg',4,'神州5号','2018-12-25 00:00:00'),(9,3,'小米笔记本Air 13.3','银灰色','13.3',5399,'高性能轻薄笔记本\r\n设计制图、运行大型 3D 游戏，复杂任务也可以轻松驾驭。','i7处理器／8GB／独显\r\n第八代英特尔®酷睿™ i7处理器\r\n','e328db7b-41a4-40ac-b7f5-ecf8ec1d8c01220x220.jpg',4,'air','2018-12-26 15:22:42'),(10,6,'九号平衡车','白色','54.8*123',1999,'最高车速：	约16km/h\r\n最大扭矩：	整机35Nm*2','\r\n电动机额定功率：	350W x 2\r\n电机控制方式：	正弦波矢量控制，电流+速度闭环控制算法','42796f9f-687a-4a86-9802-780da5f9aa12T1PX200x200.jpg',4,'1','2018-12-26 15:26:09'),(11,6,'小米路由器4Q','蓝色','11',199,'MiNET 一键快连智能设备','高增益全向3天线，覆盖广 ／ 红包 WiFi 赚取零用钱','2d370544-b521-4ac7-8607-fdfa16361959pms_15291.jpg',4,'1.1','2018-12-26 15:28:15'),(12,3,'小米6X','蓝色','5.8',4999,'64GB+64GB，赤焰红、樱花粉限时秒杀，到手价1419元','「6GB+64GB 移动4G+版，加赠米家车载空气净化器」轻薄美观的拍照手机 / 前置2000万“治愈系”自拍 / 后置2000万 AI双摄 / 标配骁龙660 AIE处理器','2f2f75e8-e044-4dd5-9b38-b3ee115ff4738619.jpg',4,'1.1','2018-12-26 15:30:48'),(13,4,'小米电视4A 43英寸 青春版','白色','43',4999,'人工智能语音系统\r\n全高清屏\r\n64位四核处理器\r\n','人工智能语音系统\r\n全高清屏\r\n64位四核处理器\r\n海量影视内容\r\n杜比音效\r\n1GB+8GB 大内存','2aff3811-78fb-418e-acdc-90401cf166460.jpg',0,'1.1','2018-12-27 09:27:32'),(14,4,'小米电视4A 43英寸 老年版','棕色','43',998,'人工智能语音系统','人工智能语音系统','0c955dfb-2d0f-454b-b87a-9a91a810a4410.jpg',0,'1','2018-12-27 09:29:40'),(15,4,'小米电视4A 43英寸 少年版','棕色','43',15000,'人工智能语音系统','人工智能语音系统','876738db-7514-4fd1-972a-cb39a8dc55c80.jpg',3,'1','2018-12-27 09:30:22'),(16,4,'小米电视4A 43英寸 幼儿版','蓝色','43',998,'海量影视内容','海量影视内容','985c95ec-b9b8-427c-bef9-a5d3e1fb15250.jpg',2,'air','2018-12-27 09:31:05'),(17,4,'小米电视4A 43英寸 旗舰版','棕色','43',5399,'杜比音效','杜比音效','eaebf9ec-cdad-4d46-915f-67de08d655bd0.jpg',3,'1.1','2018-12-26 15:22:42'),(18,4,'米家互联网空调','白色','2882*123',998,' 米家互联网空调（一级能效）',' 米家互联网空调（一级能效）','f3436d9a-cb89-423b-9b36-b1e5b77237cd20.jpg',3,'1','2018-12-27 09:33:45'),(19,4,'米家互联网空调（升级版）','白色','1993*365',15000,' 米家互联网空调（一级能效）',' 米家互联网空调（一级能效）','af686cbe-a16b-41e8-a903-39346436a17520.jpg',0,'123','2018-12-27 09:34:33'),(20,4,' 米家互联网空调(土豪版)','蓝色','1993*365',15000,' 米家互联网空调（一级能效',' 米家互联网空调（一级能效','54350161-4357-45f6-a71a-7387937caebe20.jpg',1,'1','2018-12-27 09:35:27'),(21,6,'小米手环1','黑色','1*132',199,'心率、睡眠、记步，健康管理','微信、QQ来电等消息内容直接显示 / 50米游泳防水 / 运动数据抬腕可见 / 心率、睡眠、记步，健康管理 / 长达20天续航能力','8304a926-7272-4ee3-97cd-bbdb43ffe92f1338.jpg',3,'1.1','2018-12-27 10:23:07'),(22,6,'小米手环2','棕色1','包1',199,'心率、睡眠、记步，健康管理 / 长达20天续航能力','微信、QQ来电等消息内容直接显示 / 50米游泳防水 / 运动数据抬腕可见 / 心率、睡眠、记步，健康管理 / 长达20天续航能力','dcd05b4c-a59f-49dd-bc4d-097a8746f3351338.jpg',0,'123','2018-12-27 10:23:56'),(23,6,'小米手环3','棕色','包1',998,'长达20天续航能力','微信、QQ来电等消息内容直接显示 / 50米游泳防水 / 运动数据抬腕可见 / 心率、睡眠、记步，健康管理 / 长达20天续航能力','4f0ff94a-e9c7-4096-a14e-44de82251b251338.jpg',4,'123','2018-12-27 10:24:23'),(24,6,'小米手环4','棕色','包1',998,'微信、QQ来电等消息内容直接显示','微信、QQ来电等消息内容直接显示 / 50米游泳防水 / 运动数据抬腕可见 / 心率、睡眠、记步，健康管理 / 长达20天续航能力','facdfa7b-6c4a-4340-8f60-0226f5452d1a1338.jpg',2,'1','2018-12-27 10:24:49'),(25,6,'小米手环5','蓝色','包1',998,'50米游泳防水','微信、QQ来电等消息内容直接显示 / 50米游泳防水 / 运动数据抬腕可见 / 心率、睡眠、记步，健康管理 / 长达20天续航能力','895d28e2-bfab-46c6-8722-a60662315e4c1338.jpg',1,'1.1','2018-12-27 10:25:24'),(26,6,'小米米家行车记录仪1S','棕色','1993*365',998,'索尼 IMX307图像传感器 ','索尼 IMX307图像传感器 / 3D降噪 / IPS大屏 / 本地语音控制','505294f3-0812-488d-a879-7361e133a6f0582.jpg',1,'123','2018-12-27 10:27:01'),(27,6,'小米米家行车记录仪2S','棕色','包1',998,' 3D降噪 / IPS大屏 / 本地语音控制','索尼 IMX307图像传感器 / 3D降噪 / IPS大屏 / 本地语音控制','d71d279e-909b-4e37-a2b7-a9f02a82c052582.jpg',2,'1.1','2018-12-27 10:27:34'),(28,6,'小米米家行车记录仪3S','棕色','1993*365',998,'小米米家行车记录仪1S','小米米家行车记录仪1S','58449bdb-7e58-4a2e-a579-9354bb0f8240582.jpg',2,'1','2018-12-27 10:28:00'),(29,6,'小米米家行车记录仪4S','棕色','43',15000,'小米米家行车记录仪1S','小米米家行车记录仪1S','cbc7a57a-b16e-4c1b-b512-0f53412da0e1582.jpg',0,'air','2018-12-27 10:28:26'),(30,6,'小米米家行车记录仪5S','白色','包',998,'小米米家行车记录仪1S','小米米家行车记录仪1S','d673a98c-4721-47f7-b61b-ddaa3398da05582.jpg',2,'123','2018-12-27 10:29:01');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `orders_number` varchar(100) NOT NULL,
  `uid` int(50) NOT NULL,
  `sum_price` double NOT NULL,
  `state` int(2) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `count_number` int(10) DEFAULT NULL,
  PRIMARY KEY (`orders_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`orders_number`,`uid`,`sum_price`,`state`,`create_time`,`count_number`) values ('15dbf7a0-e5ed-424f-8e48-801e253d56a2',14,5399,0,'2018-12-29 16:05:25',1),('2c097d3a-34bc-482e-bb67-4da9372d9a4d',14,15000,0,'2018-12-29 16:28:15',1),('2eba76f2-1174-4274-97c3-9298b247da75',14,199,0,'2018-12-29 16:03:12',1),('3da19777-6d9b-49aa-ac34-5e2bbb49b875',14,1999,1,'2018-12-29 16:30:28',1),('76821aba-8dc3-43ff-bc09-8576ff7a31f3',14,199,0,'2018-12-29 16:12:25',1),('ad5f0cd3-16be-40eb-8175-7efc32dcb6a0',15,1000398,0,'2018-12-28 17:02:26',3),('bfe27ebd-eb47-40ef-bc98-05f39f015ff1',14,8392,0,'2018-12-28 16:59:46',10),('ccc624d5-621b-423a-a2df-53e3050adba5',14,998,0,'2018-12-29 16:10:28',1),('f16bd560-a697-401f-a751-220c14624e59',14,199,0,'2018-12-29 16:01:08',1);

/*Table structure for table `trolley` */

DROP TABLE IF EXISTS `trolley`;

CREATE TABLE `trolley` (
  `tid` int(50) NOT NULL AUTO_INCREMENT,
  `uid` int(50) NOT NULL,
  `gid` int(50) NOT NULL,
  `number` int(50) NOT NULL DEFAULT '1',
  `orders_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `trolley` */

insert  into `trolley`(`tid`,`uid`,`gid`,`number`,`orders_number`) values (6,14,11,5,'bfe27ebd-eb47-40ef-bc98-05f39f015ff1'),(7,15,4,1,'ad5f0cd3-16be-40eb-8175-7efc32dcb6a0'),(8,15,11,2,'ad5f0cd3-16be-40eb-8175-7efc32dcb6a0'),(9,14,9,1,'bfe27ebd-eb47-40ef-bc98-05f39f015ff1'),(10,14,23,2,'bfe27ebd-eb47-40ef-bc98-05f39f015ff1'),(11,14,3,2,'bfe27ebd-eb47-40ef-bc98-05f39f015ff1'),(12,15,9,2,NULL),(13,14,11,1,'f16bd560-a697-401f-a751-220c14624e59'),(14,14,9,1,'15dbf7a0-e5ed-424f-8e48-801e253d56a2'),(15,14,14,1,'ccc624d5-621b-423a-a2df-53e3050adba5'),(16,14,11,1,'76821aba-8dc3-43ff-bc09-8576ff7a31f3'),(17,14,29,1,'2c097d3a-34bc-482e-bb67-4da9372d9a4d'),(18,14,10,1,'3da19777-6d9b-49aa-ac34-5e2bbb49b875');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sex` int(1) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `manager` int(1) DEFAULT '1',
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `phone_number` (`phone_number`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`name`,`sex`,`phone_number`,`area`,`manager`,`username`,`password`,`photo`,`create_time`) values (14,'常儒家',1,'13227021989','中国·西安',1,'changrujia','123456','df16be65-38a0-4bdf-9a5d-dad6580f6315Koala.jpg','2018-12-24 14:50:38'),(15,'雷豪',1,'15877641041','中国·西安',1,'leihao','123456','4f77005e-8ca3-41f0-bc71-9ec8cb304ed9Chrysanthemum.jpg','2018-12-24 14:51:22'),(16,'班长',1,'13369164010','中国·西安',0,'admin','123','f969e01e-83e1-4188-9740-6fb958b05f41Penguins.jpg','2018-12-24 14:52:25'),(17,'刘毅',1,'18092974058','中国·西安',1,'liuyi','888888','d340a75d-7d37-4a1b-a36d-788d934609aeLighthouse.jpg','2018-12-24 15:22:53'),(18,'侯双乐',1,'15249045475','中国·西安',1,'houshuangle','111','9fdc4f2c-fefa-4008-86a6-7120a699f559Jellyfish.jpg','2018-12-24 15:23:26'),(19,'张柯雷',1,'18829897524','中国·西安',1,'zhangkelei','111','9973b0e5-4fe6-46f9-bd32-43829e21c373Tulips.jpg','2018-12-24 15:24:01');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
