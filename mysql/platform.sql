/*
 Navicat Premium Data Transfer

 Source Server         : platform
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : 118.25.17.208:3306
 Source Schema         : platform

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : 65001

 Date: 01/08/2018 15:09:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for column
-- ----------------------------
DROP TABLE IF EXISTS `column`;
CREATE TABLE `column` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `Column` varchar(255) DEFAULT NULL COMMENT '数据库名',
  `ColumnName` varchar(255) DEFAULT NULL COMMENT '注释',
  `Columnid` varchar(255) DEFAULT NULL COMMENT '数据库编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统栏目';

-- ----------------------------
-- Records of column
-- ----------------------------
BEGIN;
INSERT INTO `column` VALUES (1, 'zmyq_menu', '菜单', '9DA6E0E3-302E-98B4-6B6B-68639CD887DD');
INSERT INTO `column` VALUES (2, 'zmyq_facility', '设备', 'CE68E83A-65A7-E588-A63D-5D24CD2A755D');
INSERT INTO `column` VALUES (3, 'zmyq_subscribe', '预约表', '9FDBCD8E-D3ED-CDD7-A881-B4D68611FB48');
INSERT INTO `column` VALUES (4, 'zmyq_error', '报错表', '55E017A8-94FA-4BFE-0623-3D4563E6F18B');
INSERT INTO `column` VALUES (5, 'zmyq_userBehavior', '用户行为表', 'DEB37919-5B49-45AA-06C8-BE57F48830F4');
COMMIT;

-- ----------------------------
-- Table structure for datatype
-- ----------------------------
DROP TABLE IF EXISTS `datatype`;
CREATE TABLE `datatype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号',
  `Type` varchar(48) DEFAULT NULL COMMENT '类型',
  `Size` int(11) DEFAULT NULL COMMENT '大小',
  `html` text COMMENT '字段的html',
  `annotation` varchar(48) DEFAULT NULL COMMENT '注释',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='数据类型';

-- ----------------------------
-- Records of datatype
-- ----------------------------
BEGIN;
INSERT INTO `datatype` VALUES (1, 'varchar', 255, NULL, '字符型0-255字节');
INSERT INTO `datatype` VALUES (2, 'char', 255, NULL, '定长字符型0-255字节');
INSERT INTO `datatype` VALUES (3, 'text', 0, NULL, '小型字符型');
INSERT INTO `datatype` VALUES (4, 'mediumtext', NULL, NULL, '中型字符型');
INSERT INTO `datatype` VALUES (5, 'longtext', NULL, NULL, '大型字符型');
INSERT INTO `datatype` VALUES (6, 'tinyint', NULL, NULL, '小数值型');
INSERT INTO `datatype` VALUES (7, 'smallint', NULL, NULL, '中数值型');
INSERT INTO `datatype` VALUES (8, 'int', 11, NULL, '大数值型');
INSERT INTO `datatype` VALUES (9, 'bigint', NULL, NULL, '超大数值型');
INSERT INTO `datatype` VALUES (10, 'float', NULL, NULL, '数值浮点型');
INSERT INTO `datatype` VALUES (11, 'double', NULL, NULL, '数值双精度型');
INSERT INTO `datatype` VALUES (12, 'date', NULL, NULL, '日期型');
INSERT INTO `datatype` VALUES (13, 'datetime', NULL, NULL, '日期时间型');
COMMIT;

-- ----------------------------
-- Table structure for e_mail
-- ----------------------------
DROP TABLE IF EXISTS `e_mail`;
CREATE TABLE `e_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `host` varchar(48) DEFAULT NULL COMMENT '服务器地址 如:smtp.qq.com',
  `port` int(5) DEFAULT NULL COMMENT '端口',
  `hostname` varchar(48) DEFAULT NULL COMMENT '服务器地址 如: http://localhost/',
  `title` varchar(48) DEFAULT NULL COMMENT '邮件的标题',
  `content` int(5) DEFAULT NULL COMMENT '邮件的内容',
  `timu` varchar(48) DEFAULT NULL COMMENT '邮件的发件人',
  `username` varchar(48) DEFAULT NULL COMMENT '邮箱的账户名',
  `password` varchar(48) DEFAULT NULL COMMENT '邮箱的密码',
  `e_mailid` varchar(48) DEFAULT NULL COMMENT '有限配置编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='邮箱表';

-- ----------------------------
-- Records of e_mail
-- ----------------------------
BEGIN;
INSERT INTO `e_mail` VALUES (1, 'smtp.qq.com', 465, 'http://localhost/', '注册成功', 0, 'ptadmin', '551840669@qq.com', 'qsbhukufgrehbbie', '1CA6E0E3-442E-98B4-6B6B-68639CD887DD');
INSERT INTO `e_mail` VALUES (2, 'smtp.163.com', 465, 'http://localhost/', '注册成功', 0, 'ptadmin', 'shanghai9090@163.com', '57484279y', 'BBA6E0E3-442E-98B4-6B6B-53639CD557BB');
INSERT INTO `e_mail` VALUES (3, 'smtp.163.com', 465, 'http://localhost/', '代码报错', 1, '软件检测系统', 'shanghai9090@163.com', '57484279y', 'BBA6E0E3-442E-6666-6B6B-53639CD557CC');
COMMIT;

-- ----------------------------
-- Table structure for graphics
-- ----------------------------
DROP TABLE IF EXISTS `graphics`;
CREATE TABLE `graphics` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图形表';

-- ----------------------------
-- Table structure for institutions
-- ----------------------------
DROP TABLE IF EXISTS `institutions`;
CREATE TABLE `institutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(40) DEFAULT NULL COMMENT '机构名称',
  `institutionsId` int(11) DEFAULT NULL COMMENT '机构编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Table structure for people
-- ----------------------------
DROP TABLE IF EXISTS `people`;
CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipone` varchar(100) DEFAULT NULL COMMENT '手机号',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(100) DEFAULT NULL COMMENT '用户名',
  `e_mail` varchar(40) DEFAULT NULL COMMENT '邮箱验证',
  `rid` varchar(100) DEFAULT NULL COMMENT '任务角色标识',
  `orgid` int(11) DEFAULT NULL COMMENT '角色id',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `last_login_time` int(11) DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='人员表';

-- ----------------------------
-- Records of people
-- ----------------------------
BEGIN;
INSERT INTO `people` VALUES (2, '15901779064', 'zkrLYW0713', '小明', NULL, '5419-5134-2545-5799', NULL, NULL, NULL);
INSERT INTO `people` VALUES (3, '18701968032', '123456', '小张', NULL, '7994-9516-4647-2096', NULL, NULL, NULL);
INSERT INTO `people` VALUES (14, '17621515830', '123456', '小红', NULL, '6116-5390-3617-1594', NULL, NULL, NULL);
INSERT INTO `people` VALUES (15, '18017431373', '1314jqbk', '小李', NULL, '8975-3207-8409-8469', NULL, NULL, NULL);
INSERT INTO `people` VALUES (16, '18201879741', '123456', '小杨', NULL, '', NULL, NULL, NULL);
INSERT INTO `people` VALUES (19, NULL, '57484279m', '小吴', '954663633@qq.com', NULL, NULL, '0.0.0.0', 1531807070);
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='表管理';

-- ----------------------------
-- Records of program
-- ----------------------------
BEGIN;
INSERT INTO `program` VALUES (1, '菜单', 'zmyq_menu', 'title', 'varchar', '255', '标题', '0');
INSERT INTO `program` VALUES (2, '菜单', 'zmyq_menu', 'ico', 'varchar', '255', '图标', '1');
INSERT INTO `program` VALUES (3, '菜单', 'zmyq_menu', 'url', 'varchar', '255', '地址', '2');
INSERT INTO `program` VALUES (16, '表管理', 'program', 'title', 'varchar', '255', '表名的注释', '0');
INSERT INTO `program` VALUES (17, '表管理', 'program', 'table_form', 'varchar', '255', '表名', '1');
INSERT INTO `program` VALUES (18, '表管理', 'program', 'field', 'varchar', '100', '字段', '2');
INSERT INTO `program` VALUES (19, '表管理', 'program', 'fieldType', 'varchar', '48', '字段类型', '3');
INSERT INTO `program` VALUES (20, '表管理', 'program', 'fieldSize', 'varchar', '48', '字段大小', '4');
INSERT INTO `program` VALUES (21, '表管理', 'program', 'field_annotation', 'varchar', '255', '管理字段名注释', '5');
INSERT INTO `program` VALUES (22, '表管理', 'program', 'sort', 'varchar', '100', '排序', '6');
INSERT INTO `program` VALUES (33, '菜单', 'zmyq_menu', 'iponeurl', 'varchar', '100', '手机端链接', '5');
INSERT INTO `program` VALUES (34, '菜单', 'zmyq_menu', 'equipment', 'varchar', '100', '使用端', '6');
INSERT INTO `program` VALUES (38, '设备', 'zmyq_facility', 'facility', 'varchar', '100', '设备名称', '0');
INSERT INTO `program` VALUES (39, '设备', 'zmyq_facility', 'issue', 'varchar', '100', '零件', '1');
INSERT INTO `program` VALUES (40, '设备', 'zmyq_facility', 'price', 'varchar', '100', '价格', '2');
INSERT INTO `program` VALUES (41, '设备', 'zmyq_facility', 'processing', 'varchar', '100', '处理方案', '4');
INSERT INTO `program` VALUES (42, '设备', 'zmyq_facility', 'Stick', 'varchar', '100', '是否置顶', '5');
INSERT INTO `program` VALUES (44, '预约表', 'zmyq_subscribe', 'ipone', 'varchar', '100', '机型选择', '0');
INSERT INTO `program` VALUES (45, '预约表', 'zmyq_subscribe', 'way', 'varchar', '100', '维修方式', '1');
INSERT INTO `program` VALUES (46, '预约表', 'zmyq_subscribe', 'userName', 'varchar', '100', '预留信息', '2');
INSERT INTO `program` VALUES (47, '预约表', 'zmyq_subscribe', 'phoneNum', 'varchar', '100', '预约手机', '3');
INSERT INTO `program` VALUES (48, '预约表', 'zmyq_subscribe', 'Street', 'varchar', '100', '您的地址', '4');
INSERT INTO `program` VALUES (49, '预约表', 'zmyq_subscribe', 'message', 'varchar', '100', '备注信息', '5');
INSERT INTO `program` VALUES (59, '用户行为表', 'zmyq_userBehavior', 'user', 'varchar', '100', '用户名称', '0');
INSERT INTO `program` VALUES (60, '用户行为表', 'zmyq_userBehavior', 'equipment', 'varchar', '100', '设备信息', '1');
INSERT INTO `program` VALUES (61, '用户行为表', 'zmyq_userBehavior', 'behavior', 'varchar', '100', '行为', '2');
INSERT INTO `program` VALUES (63, '报错表', 'zmyq_error', 'message', 'varchar', '100', '人员', '2');
INSERT INTO `program` VALUES (64, '报错表', 'zmyq_error', 'methodName', 'varchar', '100', '人员', '2');
INSERT INTO `program` VALUES (65, '报错表', 'zmyq_error', 'pageName', 'varchar', '100', '人员', '2');
INSERT INTO `program` VALUES (66, '报错表', 'zmyq_error', 'phone', 'varchar', '100', '人员', '2');
INSERT INTO `program` VALUES (67, '报错表', 'zmyq_error', 'productName', 'varchar', '100', '人员', '2');
INSERT INTO `program` VALUES (68, '报错表', 'zmyq_error', 'requestStatus', 'varchar', '100', '人员', '2');
INSERT INTO `program` VALUES (69, '报错表', 'zmyq_error', 'requestUrl', 'varchar', '100', '人员', '2');
INSERT INTO `program` VALUES (71, '报错表', 'zmyq_error', 'userAgent', 'text', '', '人员', '2');
COMMIT;

-- ----------------------------
-- Table structure for sms
-- ----------------------------
DROP TABLE IF EXISTS `sms`;
CREATE TABLE `sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信表';

-- ----------------------------
-- Table structure for zmyq_error
-- ----------------------------
DROP TABLE IF EXISTS `zmyq_error`;
CREATE TABLE `zmyq_error` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(100) DEFAULT NULL,
  `methodName` varchar(100) DEFAULT NULL,
  `pageName` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `productName` varchar(100) DEFAULT NULL,
  `requestStatus` varchar(100) DEFAULT NULL,
  `requestUrl` varchar(100) DEFAULT NULL,
  `userAgent` text,
  `newTime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='报错表';

-- ----------------------------
-- Records of zmyq_error
-- ----------------------------
BEGIN;
INSERT INTO `zmyq_error` VALUES (25, 'Network Error', 'saveNetWorkError监控用户网络错误情况', 'personal.html', 'undefined', 'huibaotong', '0', ' http://www.shanghai70.com/sever/public/admin/Program/AddInfos', 'undefined', '1533092185');
INSERT INTO `zmyq_error` VALUES (26, 'Network Error', 'saveNetWorkError监控用户网络错误情况', 'personal.html', 'undefined', 'huibaotong', '0', ' http://www.shanghai70.com/sever/public/admin/Program/AddInfos', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1', '1533092374');
INSERT INTO `zmyq_error` VALUES (27, 'Network Error', 'saveNetWorkError监控用户网络错误情况', 'personal.html', 'undefined', 'huibaotong', '0', ' http://www.shanghai70.com/sever/public/admin/Program/AddInfos', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1', '1533105232');
INSERT INTO `zmyq_error` VALUES (28, 'Network Error', 'saveNetWorkError监控用户网络错误情况', 'personal.html', 'undefined', 'huibaotong', '0', ' http://www.shanghai70.com/sever/public/admin/Program/AddInfos', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1', '1533105590');
INSERT INTO `zmyq_error` VALUES (29, 'Network Error', 'saveNetWorkError监控用户网络错误情况', 'personal.html', 'undefined', 'huibaotong', '0', ' http://www.shanghai70.com/sever/public/admin/Program/AddInfos', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1', '1533106189');
INSERT INTO `zmyq_error` VALUES (30, 'Request failed with status code 500', 'saveServerError监控服务器接口错误(500, 502, 504等异常情况)', 'personal.html', 'undefined', 'huibaotong', 'undefined', ' http://www.shanghai70.com/sever/public/admin/Program/AddInfos', 'Mozilla/5.0 (Linux; Android 8.0.0; MIX 2 Build/OPR1.170623.027; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/62.0.3202.84 Mobile Safari/537.36', '1533106728');
COMMIT;

-- ----------------------------
-- Table structure for zmyq_facility
-- ----------------------------
DROP TABLE IF EXISTS `zmyq_facility`;
CREATE TABLE `zmyq_facility` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facility` varchar(100) DEFAULT NULL,
  `issue` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `processing` varchar(100) DEFAULT NULL,
  `Stick` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='设备';

-- ----------------------------
-- Records of zmyq_facility
-- ----------------------------
BEGIN;
INSERT INTO `zmyq_facility` VALUES (1, 'ipad 2', '屏幕', '150', '更换外屏', '1');
INSERT INTO `zmyq_facility` VALUES (2, 'ipad 2', '屏幕', '300', '内屏碎', '0');
INSERT INTO `zmyq_facility` VALUES (3, 'ipad 3/4', '屏幕', '160', '更换外屏', '0');
INSERT INTO `zmyq_facility` VALUES (4, 'ipad 3/4', '屏幕', '300', '内屏碎', '0');
INSERT INTO `zmyq_facility` VALUES (5, 'iPad 5', '屏幕', '180', '更换外屏', '0');
INSERT INTO `zmyq_facility` VALUES (6, 'iPad 5', '屏幕', '450', '内屏碎', '0');
INSERT INTO `zmyq_facility` VALUES (7, 'ipad mini1/2', '屏幕', '180', '更换外屏', '0');
INSERT INTO `zmyq_facility` VALUES (8, 'ipad mini1/2', '屏幕', '260-400', '内屏碎', '0');
INSERT INTO `zmyq_facility` VALUES (9, 'ipad mini3', '屏幕', '180', '更换外屏', '0');
INSERT INTO `zmyq_facility` VALUES (10, 'ipad mini3', '屏幕', '400', '内屏碎', '0');
INSERT INTO `zmyq_facility` VALUES (11, 'iPad mini4', '屏幕', '380', '更换外屏', '1');
INSERT INTO `zmyq_facility` VALUES (12, 'iPad mini4', '屏幕', '850', '内屏碎', '0');
INSERT INTO `zmyq_facility` VALUES (13, 'iPad 6（air2）', '屏幕', '450', '更换外屏', '0');
INSERT INTO `zmyq_facility` VALUES (14, 'iPad 6（air2）', '屏幕', '1500', '内屏碎', '0');
INSERT INTO `zmyq_facility` VALUES (15, 'iPhone5/5S', '屏幕', '80', '更换外屏/厂原', '0');
INSERT INTO `zmyq_facility` VALUES (16, 'iPhone5/5S', '屏幕', '250', '厂原/总成', '0');
INSERT INTO `zmyq_facility` VALUES (17, 'iPhone6', '屏幕', '150', '更换外屏/厂原', '0');
INSERT INTO `zmyq_facility` VALUES (18, 'iPhone6', '屏幕', '320', '厂原/总成', '0');
INSERT INTO `zmyq_facility` VALUES (19, 'iPhone6p', '屏幕', '180', '更换外屏/厂原', '0');
INSERT INTO `zmyq_facility` VALUES (20, 'iPhone6p', '屏幕', '450', '厂原/总成', '0');
INSERT INTO `zmyq_facility` VALUES (21, 'iPhone6s', '屏幕', '160', '更换外屏/厂原', '0');
INSERT INTO `zmyq_facility` VALUES (22, 'iPhone6s', '屏幕', '480', '厂原/总成', '0');
INSERT INTO `zmyq_facility` VALUES (23, 'iPhone6sp', '屏幕', '180', '更换外屏/厂原', '0');
INSERT INTO `zmyq_facility` VALUES (24, 'iPhone6sp', '屏幕', '500', '厂原/总成', '0');
INSERT INTO `zmyq_facility` VALUES (25, 'iPhone7', '屏幕', '200', '更换外屏/厂原', '1');
INSERT INTO `zmyq_facility` VALUES (26, 'iPhone7', '屏幕', '650', '厂原/总成', '0');
INSERT INTO `zmyq_facility` VALUES (27, 'iPhone7p', '屏幕', '300', '更换外屏/厂原', '0');
INSERT INTO `zmyq_facility` VALUES (28, 'iPhone7p', '屏幕', '750', '厂原/总成', '0');
INSERT INTO `zmyq_facility` VALUES (29, 'ipad 2', '电池', '150', '换电池/原装', '0');
INSERT INTO `zmyq_facility` VALUES (30, 'ipad 3/4', '电池', '150', '换电池/原装', '1');
INSERT INTO `zmyq_facility` VALUES (31, 'iPad 5', '电池', '180', '换电池/原装', '0');
INSERT INTO `zmyq_facility` VALUES (32, 'iPad 6（air2）', '电池', '250', '换电池/原装', '0');
INSERT INTO `zmyq_facility` VALUES (33, 'ipad mini1/2', '电池', '150', '换电池/原装', '0');
INSERT INTO `zmyq_facility` VALUES (34, 'ipad mini3', '电池', '180', '换电池/原装', '0');
INSERT INTO `zmyq_facility` VALUES (35, 'iPad mini4', '电池', '200', '换电池/原装', '0');
INSERT INTO `zmyq_facility` VALUES (36, 'iPhone5/5S', '电池', '80', '换电池/原装', '0');
INSERT INTO `zmyq_facility` VALUES (37, 'iPhone6', '电池', '100', '换电池/原装', '0');
INSERT INTO `zmyq_facility` VALUES (38, 'iPhone6p', '电池', '120', '换电池/原装', '0');
INSERT INTO `zmyq_facility` VALUES (39, 'iPhone6s', '电池', '120', '换电池/原装', '0');
INSERT INTO `zmyq_facility` VALUES (40, 'iPhone6sp', '电池', '150', '换电池/原装', '0');
INSERT INTO `zmyq_facility` VALUES (41, 'iPhone7', '电池', '160', '换电池/原装', '0');
INSERT INTO `zmyq_facility` VALUES (42, 'iPhone7p', '电池', '180', '换电池/原装', '0');
INSERT INTO `zmyq_facility` VALUES (43, 'ipad 2', '摄像头', '100', '前摄像头（原装）', '0');
INSERT INTO `zmyq_facility` VALUES (44, 'ipad 3/4', '摄像头', '150', '前摄像头（原装）', '0');
INSERT INTO `zmyq_facility` VALUES (45, 'iPad 5', '摄像头', '160', '前摄像头（原装）', '0');
INSERT INTO `zmyq_facility` VALUES (46, 'iPad 6（air2）', '摄像头', '180', '前摄像头（原装）', '0');
INSERT INTO `zmyq_facility` VALUES (47, 'ipad mini1/2', '摄像头', '100/150', '前摄像头（原装）', '0');
INSERT INTO `zmyq_facility` VALUES (48, 'ipad mini3', '摄像头', '150', '前摄像头（原装）', '1');
INSERT INTO `zmyq_facility` VALUES (49, 'iPad mini4', '摄像头', '180', '前摄像头（原装）', '0');
INSERT INTO `zmyq_facility` VALUES (51, 'ipad 2', '摄像头', '150', '后摄像头（原装', '1');
INSERT INTO `zmyq_facility` VALUES (52, 'ipad 3/4', '摄像头', '150', '后摄像头（原装', '0');
INSERT INTO `zmyq_facility` VALUES (53, 'iPad 5', '摄像头', '180', '后摄像头（原装', '0');
INSERT INTO `zmyq_facility` VALUES (54, 'iPad 6（air2）', '摄像头', '200', '后摄像头（原装', '0');
INSERT INTO `zmyq_facility` VALUES (55, 'ipad mini1/2', '摄像头', '150', '后摄像头（原装', '0');
INSERT INTO `zmyq_facility` VALUES (56, 'ipad mini3', '摄像头', '180', '后摄像头（原装', '1');
INSERT INTO `zmyq_facility` VALUES (57, 'iPad mini4', '摄像头', '200', '后摄像头（原装', '0');
INSERT INTO `zmyq_facility` VALUES (58, 'ipad 2', '声音/耳机接口/听筒', '100', '需检测', '1');
INSERT INTO `zmyq_facility` VALUES (59, 'ipad 3/4', '声音/耳机接口/听筒', '150', '需检测', '0');
INSERT INTO `zmyq_facility` VALUES (60, 'iPad 5', '声音/耳机接口/听筒', '160', '需检测', '0');
INSERT INTO `zmyq_facility` VALUES (61, 'iPad 6（air2）', '声音/耳机接口/听筒', '180', '需检测', '1');
INSERT INTO `zmyq_facility` VALUES (62, 'ipad mini1/2', '声音/耳机接口/听筒', '100/150', '需检测', '0');
INSERT INTO `zmyq_facility` VALUES (63, 'ipad mini3', '声音/耳机接口/听筒', '150', '需检测', '0');
INSERT INTO `zmyq_facility` VALUES (64, 'iPad mini4', '声音/耳机接口/听筒', '180', '需检测', '0');
COMMIT;

-- ----------------------------
-- Table structure for zmyq_menu
-- ----------------------------
DROP TABLE IF EXISTS `zmyq_menu`;
CREATE TABLE `zmyq_menu` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `ico` varchar(200) DEFAULT NULL COMMENT '图标',
  `url` varchar(100) DEFAULT NULL COMMENT '地址',
  `iponeurl` varchar(100) DEFAULT NULL,
  `equipment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of zmyq_menu
-- ----------------------------
BEGIN;
INSERT INTO `zmyq_menu` VALUES (0, '1', '1', '1', '1', '1');
INSERT INTO `zmyq_menu` VALUES (1, '预约下单', 'cc', '#brand-box', NULL, NULL);
INSERT INTO `zmyq_menu` VALUES (2, '热门活动', NULL, '#littleBanner', NULL, NULL);
INSERT INTO `zmyq_menu` VALUES (3, '手机回收', NULL, NULL, NULL, NULL);
INSERT INTO `zmyq_menu` VALUES (4, '优质服务', NULL, NULL, NULL, NULL);
INSERT INTO `zmyq_menu` VALUES (5, '常见问题', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for zmyq_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `zmyq_subscribe`;
CREATE TABLE `zmyq_subscribe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipone` varchar(100) DEFAULT NULL,
  `way` varchar(100) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `phoneNum` varchar(100) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `newTime` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='预约表';

-- ----------------------------
-- Records of zmyq_subscribe
-- ----------------------------
BEGIN;
INSERT INTO `zmyq_subscribe` VALUES (1, '123', '123', '123', '123', '123', '123', NULL);
INSERT INTO `zmyq_subscribe` VALUES (2, '123', '123', '123', '123', '123', '123', NULL);
INSERT INTO `zmyq_subscribe` VALUES (3, '123', '123', '123', '123', '123', '123', NULL);
INSERT INTO `zmyq_subscribe` VALUES (4, 'ipad 2', '上门维修', '123', '333', '333', '333', NULL);
INSERT INTO `zmyq_subscribe` VALUES (5, 'ipad 2', '到店维修', 'wujiawei', '123123', '123312', '1233', NULL);
INSERT INTO `zmyq_subscribe` VALUES (6, '123', '123', '123', '123', '123', '123', NULL);
INSERT INTO `zmyq_subscribe` VALUES (8, '123', '123', '123', '123', '123', '123', NULL);
INSERT INTO `zmyq_subscribe` VALUES (9, '123', '123', '123', '123', '123', '123', NULL);
INSERT INTO `zmyq_subscribe` VALUES (10, '3555', '7373', '783', '7835373843', '783543573', '735847878837', NULL);
INSERT INTO `zmyq_subscribe` VALUES (15, '123123', '123123', '123123', '123123', '123231', '12325', '554343');
INSERT INTO `zmyq_subscribe` VALUES (16, '1123', '123', '123', '123', '123', '123', '1531720155');
INSERT INTO `zmyq_subscribe` VALUES (17, '1123', '123', '123', '123', '123', '123', '1531720169');
INSERT INTO `zmyq_subscribe` VALUES (18, '1123', '123', '123', '123', '123', '123', '1531720189');
INSERT INTO `zmyq_subscribe` VALUES (19, '1123', '123', '123', '123', '123', '123', '1531721091');
INSERT INTO `zmyq_subscribe` VALUES (20, '1123', '123', '123', '123', '123', '123', '1533020266');
INSERT INTO `zmyq_subscribe` VALUES (21, '1123', '123', '123', '123', '123', '123', '1533104627');
INSERT INTO `zmyq_subscribe` VALUES (22, '1123', '123', '123', '123', '123', '123', '1533104675');
INSERT INTO `zmyq_subscribe` VALUES (23, '1123', '123', '123', '123', '123', '123', '1533105091');
INSERT INTO `zmyq_subscribe` VALUES (24, '1123', '123', '123', '123', '123', '123', '1533105291');
INSERT INTO `zmyq_subscribe` VALUES (25, '1123', '123', '123', '123', '123', '123', '1533105306');
INSERT INTO `zmyq_subscribe` VALUES (26, '1123', '123', '123', '123', '123', '123', '1533105341');
INSERT INTO `zmyq_subscribe` VALUES (27, '1123', '123', '123', '123', '123', '123', '1533105365');
INSERT INTO `zmyq_subscribe` VALUES (28, '1123', '123', '123', '123', '123', '123', '1533105375');
INSERT INTO `zmyq_subscribe` VALUES (29, '1123', '123', '123', '123', '123', '123', '1533105413');
INSERT INTO `zmyq_subscribe` VALUES (30, '1123', '123', '123', '123', '123', '123', '1533105476');
INSERT INTO `zmyq_subscribe` VALUES (31, '1123', '123', '123', '123', '123', '123', '1533106064');
INSERT INTO `zmyq_subscribe` VALUES (32, '1123', '123', '123', '123', '123', '123', '1533106110');
COMMIT;

-- ----------------------------
-- Table structure for zmyq_userbehavior
-- ----------------------------
DROP TABLE IF EXISTS `zmyq_userbehavior`;
CREATE TABLE `zmyq_userbehavior` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(100) DEFAULT NULL,
  `equipment` varchar(100) DEFAULT NULL,
  `behavior` varchar(100) DEFAULT NULL,
  `newTime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户行为表';

SET FOREIGN_KEY_CHECKS = 1;
