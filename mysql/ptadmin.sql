/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 100110
 Source Host           : localhost:3306
 Source Schema         : ptadmin

 Target Server Type    : MySQL
 Target Server Version : 100110
 File Encoding         : 65001

 Date: 13/07/2018 14:10:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Column
-- ----------------------------
DROP TABLE IF EXISTS `Column`;
CREATE TABLE `Column` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `Column` varchar(255) DEFAULT NULL COMMENT '数据库名',
  `ColumnName` varchar(255) DEFAULT NULL COMMENT '注释',
  `Columnid` varchar(255) DEFAULT NULL COMMENT '数据库编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='系统栏目';

-- ----------------------------
-- Records of Column
-- ----------------------------
BEGIN;
INSERT INTO `Column` VALUES (1, 'program', '表管理', '5E0F372B-6E5B-BDFE-8356-9DFF661D3AAB');
INSERT INTO `Column` VALUES (2, 'menu', '菜单', '9DA6E0E3-302E-98B4-6B6B-68639CD887DD');
INSERT INTO `Column` VALUES (3, 'people', '人员', '921B040A-C4F7-C8AF-C8AB-FBEF394F3C17');
INSERT INTO `Column` VALUES (4, 'banner', '轮播图', 'E43D047E-509F-965D-21BA-6CEA898C3F0E');
INSERT INTO `Column` VALUES (47, 'facility', '设备', 'CE68E83A-65A7-E588-A63D-5D24CD2A755D');
INSERT INTO `Column` VALUES (48, 'subscribe', '预约表', '9FDBCD8E-D3ED-CDD7-A881-B4D68611FB48');
COMMIT;

-- ----------------------------
-- Table structure for DataType
-- ----------------------------
DROP TABLE IF EXISTS `DataType`;
CREATE TABLE `DataType` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号',
  `Type` varchar(48) DEFAULT NULL COMMENT '类型',
  `Size` int(11) DEFAULT NULL COMMENT '大小',
  `html` text COMMENT '字段的html',
  `annotation` varchar(48) DEFAULT NULL COMMENT '注释',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of DataType
-- ----------------------------
BEGIN;
INSERT INTO `DataType` VALUES (1, 'varchar', 255, NULL, '字符型0-255字节');
INSERT INTO `DataType` VALUES (2, 'char', 255, NULL, '定长字符型0-255字节');
INSERT INTO `DataType` VALUES (3, 'text', 0, NULL, '小型字符型');
INSERT INTO `DataType` VALUES (4, 'mediumtext', NULL, NULL, '中型字符型');
INSERT INTO `DataType` VALUES (5, 'longtext', NULL, NULL, '大型字符型');
INSERT INTO `DataType` VALUES (6, 'tinyint', NULL, NULL, '小数值型');
INSERT INTO `DataType` VALUES (7, 'smallint', NULL, NULL, '中数值型');
INSERT INTO `DataType` VALUES (8, 'int', 11, NULL, '大数值型');
INSERT INTO `DataType` VALUES (9, 'bigint', NULL, NULL, '超大数值型');
INSERT INTO `DataType` VALUES (10, 'float', NULL, NULL, '数值浮点型');
INSERT INTO `DataType` VALUES (11, 'double', NULL, NULL, '数值双精度型');
INSERT INTO `DataType` VALUES (12, 'date', NULL, NULL, '日期型');
INSERT INTO `DataType` VALUES (13, 'datetime', NULL, NULL, '日期时间型');
COMMIT;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `Stick` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='轮播图';

-- ----------------------------
-- Records of banner
-- ----------------------------
BEGIN;
INSERT INTO `banner` VALUES (1, '/static/index/image/uploadImg/banner/20180303/5a94e0636ab5eaaa.png', 'https://shop517901511.taobao.com/?spm=a230r.7195193.1997079397.2.L5O1Sd', '1');
INSERT INTO `banner` VALUES (2, '/static/index/image/uploadImg/banner/20180303/5a585645ec7b2.png', NULL, '1');
INSERT INTO `banner` VALUES (3, '/static/index/image/uploadImg/banner/20180303/59cddbdbf36e5ershou.png', NULL, '1');
INSERT INTO `banner` VALUES (4, '/static/index/image/uploadImg/banner/20180303/banner3.png', NULL, '1');
INSERT INTO `banner` VALUES (5, '/static/index/image/uploadImg/banner/20180303/banner4.png', NULL, '1');
COMMIT;

-- ----------------------------
-- Table structure for facility
-- ----------------------------
DROP TABLE IF EXISTS `facility`;
CREATE TABLE `facility` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facility` varchar(100) DEFAULT NULL,
  `issue` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `processing` varchar(100) DEFAULT NULL,
  `Stick` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='设备';

-- ----------------------------
-- Records of facility
-- ----------------------------
BEGIN;
INSERT INTO `facility` VALUES (1, 'ipad 2', '屏幕', '150', '更换外屏', '1');
INSERT INTO `facility` VALUES (2, 'ipad 2', '屏幕', '300', '内屏碎', '0');
INSERT INTO `facility` VALUES (3, 'ipad 3/4', '屏幕', '160', '更换外屏', '0');
INSERT INTO `facility` VALUES (4, 'ipad 3/4', '屏幕', '300', '内屏碎', '0');
INSERT INTO `facility` VALUES (5, 'iPad 5', '屏幕', '180', '更换外屏', '0');
INSERT INTO `facility` VALUES (6, 'iPad 5', '屏幕', '450', '内屏碎', '0');
INSERT INTO `facility` VALUES (7, 'ipad mini1/2', '屏幕', '180', '更换外屏', '0');
INSERT INTO `facility` VALUES (8, 'ipad mini1/2', '屏幕', '260-400', '内屏碎', '0');
INSERT INTO `facility` VALUES (9, 'ipad mini3', '屏幕', '180', '更换外屏', '0');
INSERT INTO `facility` VALUES (10, 'ipad mini3', '屏幕', '400', '内屏碎', '0');
INSERT INTO `facility` VALUES (11, 'iPad mini4', '屏幕', '380', '更换外屏', '1');
INSERT INTO `facility` VALUES (12, 'iPad mini4', '屏幕', '850', '内屏碎', '0');
INSERT INTO `facility` VALUES (13, 'iPad 6（air2）', '屏幕', '450', '更换外屏', '0');
INSERT INTO `facility` VALUES (14, 'iPad 6（air2）', '屏幕', '1500', '内屏碎', '0');
INSERT INTO `facility` VALUES (15, 'iPhone5/5S', '屏幕', '80', '更换外屏/厂原', '0');
INSERT INTO `facility` VALUES (16, 'iPhone5/5S', '屏幕', '250', '厂原/总成', '0');
INSERT INTO `facility` VALUES (17, 'iPhone6', '屏幕', '150', '更换外屏/厂原', '0');
INSERT INTO `facility` VALUES (18, 'iPhone6', '屏幕', '320', '厂原/总成', '0');
INSERT INTO `facility` VALUES (19, 'iPhone6p', '屏幕', '180', '更换外屏/厂原', '0');
INSERT INTO `facility` VALUES (20, 'iPhone6p', '屏幕', '450', '厂原/总成', '0');
INSERT INTO `facility` VALUES (21, 'iPhone6s', '屏幕', '160', '更换外屏/厂原', '0');
INSERT INTO `facility` VALUES (22, 'iPhone6s', '屏幕', '480', '厂原/总成', '0');
INSERT INTO `facility` VALUES (23, 'iPhone6sp', '屏幕', '180', '更换外屏/厂原', '0');
INSERT INTO `facility` VALUES (24, 'iPhone6sp', '屏幕', '500', '厂原/总成', '0');
INSERT INTO `facility` VALUES (25, 'iPhone7', '屏幕', '200', '更换外屏/厂原', '1');
INSERT INTO `facility` VALUES (26, 'iPhone7', '屏幕', '650', '厂原/总成', '0');
INSERT INTO `facility` VALUES (27, 'iPhone7p', '屏幕', '300', '更换外屏/厂原', '0');
INSERT INTO `facility` VALUES (28, 'iPhone7p', '屏幕', '750', '厂原/总成', '0');
INSERT INTO `facility` VALUES (29, 'ipad 2', '电池', '150', '换电池/原装', '0');
INSERT INTO `facility` VALUES (30, 'ipad 3/4', '电池', '150', '换电池/原装', '1');
INSERT INTO `facility` VALUES (31, 'iPad 5', '电池', '180', '换电池/原装', '0');
INSERT INTO `facility` VALUES (32, 'iPad 6（air2）', '电池', '250', '换电池/原装', '0');
INSERT INTO `facility` VALUES (33, 'ipad mini1/2', '电池', '150', '换电池/原装', '0');
INSERT INTO `facility` VALUES (34, 'ipad mini3', '电池', '180', '换电池/原装', '0');
INSERT INTO `facility` VALUES (35, 'iPad mini4', '电池', '200', '换电池/原装', '0');
INSERT INTO `facility` VALUES (36, 'iPhone5/5S', '电池', '80', '换电池/原装', '0');
INSERT INTO `facility` VALUES (37, 'iPhone6', '电池', '100', '换电池/原装', '0');
INSERT INTO `facility` VALUES (38, 'iPhone6p', '电池', '120', '换电池/原装', '0');
INSERT INTO `facility` VALUES (39, 'iPhone6s', '电池', '120', '换电池/原装', '0');
INSERT INTO `facility` VALUES (40, 'iPhone6sp', '电池', '150', '换电池/原装', '0');
INSERT INTO `facility` VALUES (41, 'iPhone7', '电池', '160', '换电池/原装', '0');
INSERT INTO `facility` VALUES (42, 'iPhone7p', '电池', '180', '换电池/原装', '0');
INSERT INTO `facility` VALUES (43, 'ipad 2', '摄像头', '100', '前摄像头（原装）', '0');
INSERT INTO `facility` VALUES (44, 'ipad 3/4', '摄像头', '150', '前摄像头（原装）', '0');
INSERT INTO `facility` VALUES (45, 'iPad 5', '摄像头', '160', '前摄像头（原装）', '0');
INSERT INTO `facility` VALUES (46, 'iPad 6（air2）', '摄像头', '180', '前摄像头（原装）', '0');
INSERT INTO `facility` VALUES (47, 'ipad mini1/2', '摄像头', '100/150', '前摄像头（原装）', '0');
INSERT INTO `facility` VALUES (48, 'ipad mini3', '摄像头', '150', '前摄像头（原装）', '1');
INSERT INTO `facility` VALUES (49, 'iPad mini4', '摄像头', '180', '前摄像头（原装）', '0');
INSERT INTO `facility` VALUES (51, 'ipad 2', '摄像头', '150', '后摄像头（原装', '1');
INSERT INTO `facility` VALUES (52, 'ipad 3/4', '摄像头', '150', '后摄像头（原装', '0');
INSERT INTO `facility` VALUES (53, 'iPad 5', '摄像头', '180', '后摄像头（原装', '0');
INSERT INTO `facility` VALUES (54, 'iPad 6（air2）', '摄像头', '200', '后摄像头（原装', '0');
INSERT INTO `facility` VALUES (55, 'ipad mini1/2', '摄像头', '150', '后摄像头（原装', '0');
INSERT INTO `facility` VALUES (56, 'ipad mini3', '摄像头', '180', '后摄像头（原装', '1');
INSERT INTO `facility` VALUES (57, 'iPad mini4', '摄像头', '200', '后摄像头（原装', '0');
INSERT INTO `facility` VALUES (58, 'ipad 2', '声音/耳机接口/听筒', '100', '需检测', '1');
INSERT INTO `facility` VALUES (59, 'ipad 3/4', '声音/耳机接口/听筒', '150', '需检测', '0');
INSERT INTO `facility` VALUES (60, 'iPad 5', '声音/耳机接口/听筒', '160', '需检测', '0');
INSERT INTO `facility` VALUES (61, 'iPad 6（air2）', '声音/耳机接口/听筒', '180', '需检测', '1');
INSERT INTO `facility` VALUES (62, 'ipad mini1/2', '声音/耳机接口/听筒', '100/150', '需检测', '0');
INSERT INTO `facility` VALUES (63, 'ipad mini3', '声音/耳机接口/听筒', '150', '需检测', '0');
INSERT INTO `facility` VALUES (64, 'iPad mini4', '声音/耳机接口/听筒', '180', '需检测', '0');
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `ico` varchar(200) DEFAULT NULL COMMENT '图标',
  `url` varchar(100) DEFAULT NULL COMMENT '地址',
  `iponeurl` varchar(100) DEFAULT NULL,
  `equipment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES (0, '1', '1', '1', '1', '1');
INSERT INTO `menu` VALUES (1, '预约下单', 'cc', '#brand-box', NULL, NULL);
INSERT INTO `menu` VALUES (2, '热门活动', NULL, '#littleBanner', NULL, NULL);
INSERT INTO `menu` VALUES (3, '手机回收', NULL, NULL, NULL, NULL);
INSERT INTO `menu` VALUES (4, '优质服务', NULL, NULL, NULL, NULL);
INSERT INTO `menu` VALUES (5, '常见问题', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for people
-- ----------------------------
DROP TABLE IF EXISTS `people`;
CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `e_mail` varchar(100) DEFAULT NULL COMMENT '邮箱验证',
  `rid` varchar(100) DEFAULT NULL COMMENT '任务角色标识',
  `yzm` varchar(100) DEFAULT NULL COMMENT '验证码',
  `zuce` varchar(100) DEFAULT NULL COMMENT '判断是否注册成功',
  `orgid` int(11) DEFAULT NULL COMMENT '角色id',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `last_login_time` int(11) DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='人员表';

-- ----------------------------
-- Records of people
-- ----------------------------
BEGIN;
INSERT INTO `people` VALUES (2, '15901779064', 'zkrLYW0713', '小明', NULL, '5419-5134-2545-5799', '77733', '1', NULL, NULL, NULL);
INSERT INTO `people` VALUES (3, '18701968032', '123456', '小张', NULL, '7994-9516-4647-2096', '89891', '1', NULL, NULL, NULL);
INSERT INTO `people` VALUES (14, '17621515830', '123456', '小红', NULL, '6116-5390-3617-1594', '54524', '1', NULL, NULL, NULL);
INSERT INTO `people` VALUES (15, '18017431373', '1314jqbk', '小李', NULL, '8975-3207-8409-8469', '22357', '1', NULL, NULL, NULL);
INSERT INTO `people` VALUES (16, '18201879741', '123456', '小杨', NULL, '', '52254', '1', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for program
-- ----------------------------
DROP TABLE IF EXISTS `program`;
CREATE TABLE `program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '表名的注释',
  `table_form` varchar(255) DEFAULT NULL COMMENT '表名',
  `field` varchar(100) DEFAULT NULL COMMENT '字段',
  `fieldType` varchar(48) DEFAULT NULL COMMENT '字段类型',
  `fieldSize` varchar(48) DEFAULT NULL COMMENT '字段大小',
  `field_annotation` varchar(255) DEFAULT NULL COMMENT '管理字段名注释',
  `sort` varchar(100) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='表管理';

-- ----------------------------
-- Records of program
-- ----------------------------
BEGIN;
INSERT INTO `program` VALUES (1, '菜单', 'menu', 'title', 'varchar', '255', '标题', '0');
INSERT INTO `program` VALUES (2, '菜单', 'menu', 'ico', 'varchar', '255', '图标', '1');
INSERT INTO `program` VALUES (3, '菜单', 'menu', 'url', 'varchar', '255', '地址', '2');
INSERT INTO `program` VALUES (16, '表管理', 'program', 'title', 'varchar', '255', '表名的注释', '0');
INSERT INTO `program` VALUES (17, '表管理', 'program', 'table_form', 'varchar', '255', '表名', '1');
INSERT INTO `program` VALUES (18, '表管理', 'program', 'field', 'varchar', '100', '字段', '2');
INSERT INTO `program` VALUES (19, '表管理', 'program', 'fieldType', 'varchar', '48', '字段类型', '3');
INSERT INTO `program` VALUES (20, '表管理', 'program', 'fieldSize', 'varchar', '48', '字段大小', '4');
INSERT INTO `program` VALUES (21, '表管理', 'program', 'field_annotation', 'varchar', '255', '管理字段名注释', '5');
INSERT INTO `program` VALUES (22, '表管理', 'program', 'sort', 'varchar', '100', '排序', '6');
INSERT INTO `program` VALUES (23, '人员', 'people', 'username', 'varchar', '100', '用户名', '0');
INSERT INTO `program` VALUES (24, '人员', 'people', 'password', 'varchar', '100', '密码', '1');
INSERT INTO `program` VALUES (25, '人员', 'people', 'nickname', 'varchar', '100', '昵称', '2');
INSERT INTO `program` VALUES (26, '人员', 'people', 'e_mail', 'varchar', '100', '邮箱验证', '3');
INSERT INTO `program` VALUES (27, '人员', 'people', 'rid', 'varchar', '100', '任务角色标识', '4');
INSERT INTO `program` VALUES (28, '人员', 'people', 'yzm', 'varchar', '100', '验证码', '5');
INSERT INTO `program` VALUES (29, '人员', 'people', 'zuce', 'varchar', '100', '判断是否注册成功', '6');
INSERT INTO `program` VALUES (30, '人员', 'people', 'orgid', 'int', '11', '角色id', '7');
INSERT INTO `program` VALUES (31, '人员', 'people', 'last_login_ip', 'varchar', '20', 'ip地址', '8');
INSERT INTO `program` VALUES (32, '人员', 'people', 'last_login_time', 'int', '11', '最后登录时间', '9');
INSERT INTO `program` VALUES (33, '菜单', 'menu', 'iponeurl', 'varchar', '100', '手机端链接', '5');
INSERT INTO `program` VALUES (34, '菜单', 'menu', 'equipment', 'varchar', '100', '使用端', '6');
INSERT INTO `program` VALUES (35, '轮播图', 'banner', 'image', 'varchar', '100', '图片路径', '0');
INSERT INTO `program` VALUES (36, '轮播图', 'banner', 'url', 'varchar', '100', '链接地址', '1');
INSERT INTO `program` VALUES (38, '设备', 'facility', 'facility', 'varchar', '100', '设备名称', '0');
INSERT INTO `program` VALUES (39, '设备', 'facility', 'issue', 'varchar', '100', '零件', '1');
INSERT INTO `program` VALUES (40, '设备', 'facility', 'price', 'varchar', '100', '价格', '2');
INSERT INTO `program` VALUES (41, '设备', 'facility', 'processing', 'varchar', '100', '处理方案', '4');
INSERT INTO `program` VALUES (42, '设备', 'facility', 'Stick', 'varchar', '100', '是否置顶', '5');
INSERT INTO `program` VALUES (43, '轮播图', 'banner', 'Stick', 'varchar', '100', '置顶', '4');
INSERT INTO `program` VALUES (44, '预约表', 'subscribe', 'ipone', 'varchar', '100', '机型选择', '0');
INSERT INTO `program` VALUES (45, '预约表', 'subscribe', 'way', 'varchar', '100', '维修方式', '1');
INSERT INTO `program` VALUES (46, '预约表', 'subscribe', 'userName', 'varchar', '100', '预留信息', '2');
INSERT INTO `program` VALUES (47, '预约表', 'subscribe', 'phoneNum', 'varchar', '100', '预约手机', '3');
INSERT INTO `program` VALUES (48, '预约表', 'subscribe', 'Street', 'varchar', '100', '您的地址', '4');
INSERT INTO `program` VALUES (49, '预约表', 'subscribe', 'message', 'varchar', '100', '备注信息', '5');
INSERT INTO `program` VALUES (52, '组', 'table', 'll', 'varchar', '100', '字段', '0');
INSERT INTO `program` VALUES (53, '预约表', 'subscribe', 'cc', 'varchar', '100', '数组', '6');
COMMIT;

-- ----------------------------
-- Table structure for subscribe
-- ----------------------------
DROP TABLE IF EXISTS `subscribe`;
CREATE TABLE `subscribe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipone` varchar(100) DEFAULT NULL,
  `way` varchar(100) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `phoneNum` varchar(100) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `cc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='预约表';

-- ----------------------------
-- Records of subscribe
-- ----------------------------
BEGIN;
INSERT INTO `subscribe` VALUES (1, '123', '123', '123', '123', '123', '123', NULL);
INSERT INTO `subscribe` VALUES (2, '123', '123', '123', '123', '123', '123', NULL);
INSERT INTO `subscribe` VALUES (3, '123', '123', '123', '123', '123', '123', NULL);
INSERT INTO `subscribe` VALUES (4, 'ipad 2', '上门维修', '123', '333', '333', '333', NULL);
INSERT INTO `subscribe` VALUES (5, 'ipad 2', '到店维修', 'wujiawei', '123123', '123312', '1233', NULL);
INSERT INTO `subscribe` VALUES (6, '123', '123', '123', '123', '123', '123', NULL);
INSERT INTO `subscribe` VALUES (8, '123', '123', '123', '123', '123', '123', '1000');
INSERT INTO `subscribe` VALUES (9, '123', '123', '123', '123', '123', '123', '1000');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;