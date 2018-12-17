/*
 Navicat Premium Data Transfer

 Source Server         : platform
 Source Server Type    : MySQL
 Source Server Version : 50554
 Source Host           : 123.206.177.252:3306
 Source Schema         : platform

 Target Server Type    : MySQL
 Target Server Version : 50554
 File Encoding         : 65001

 Date: 26/11/2018 13:11:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for column
-- ----------------------------
DROP TABLE IF EXISTS `column`;
CREATE TABLE `column` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `column` varchar(100) DEFAULT NULL COMMENT '数据库名',
  `columnName` varchar(100) DEFAULT NULL COMMENT '注释,标题',
  `columnid` varchar(100) DEFAULT NULL COMMENT '数据库编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='系统栏目';

-- ----------------------------
-- Records of column
-- ----------------------------
BEGIN;
INSERT INTO `column` VALUES (1, 'people', '用户表', 'DEB37919-5B49-45AA-06C8-BE57F4884555');
INSERT INTO `column` VALUES (2, 'column', '栏目表', 'DEBXX919-5569-45AA-06C8-BE57F4884555');
INSERT INTO `column` VALUES (3, 'role', '角色', 'AADA4670-E3B2-A08C-D287-0DD4EA48A05D');
INSERT INTO `column` VALUES (4, 'e_mail', '邮箱配置', 'CCDBCD8E-D3ED-CDD7-A881-B4D68611FB48');
INSERT INTO `column` VALUES (5, 'program', '表管理', '55E01CCA8-94FA-4BFE-0623-3D4563E6F18B');
INSERT INTO `column` VALUES (6, 'sms', '短信管理', '55E017A8-7777-4BFE-0623-3D456AA6F18B');
INSERT INTO `column` VALUES (7, 'role_dictionary', '角色词典', 'CE68E83A-65A7-E7788-A63D-5D24C666755D');
INSERT INTO `column` VALUES (10, 'zmyq_userBehavior', '用户行为表', 'DEB37919-5B49-45AA-06C8-BE57F48830F4');
INSERT INTO `column` VALUES (11, 'zmyq_menu', '菜单', '9DA6E0E3-302E-98B4-6B6B-68639CD887DD');
INSERT INTO `column` VALUES (12, 'zmyq_facility', '设备', 'CE68E83A-65A7-E588-A63D-5D24CD2A755D');
INSERT INTO `column` VALUES (13, 'zmyq_subscribe', '预约表', '9FDBCD8E-D3ED-CDD7-A881-B4D68611FB48');
INSERT INTO `column` VALUES (14, 'zmyq_error', '报错表', '55E017A8-94FA-4BFE-0623-3D4563E6F18B');
COMMIT;

-- ----------------------------
-- Table structure for datatype
-- ----------------------------
DROP TABLE IF EXISTS `datatype`;
CREATE TABLE `datatype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号',
  `type` varchar(48) DEFAULT NULL COMMENT '类型',
  `size` int(11) DEFAULT NULL COMMENT '大小',
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
INSERT INTO `e_mail` VALUES (3, 'smtp.163.com', 465, 'http://localhost/', '警告！你的系统报错了', 1, '软件检测系统', 'shanghai9090@163.com', '57484279y', 'BBA6E0E3-442E-6666-6B6B-53639CD557CC');
COMMIT;

-- ----------------------------
-- Table structure for file_manage
-- ----------------------------
DROP TABLE IF EXISTS `file_manage`;
CREATE TABLE `file_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL COMMENT '路径',
  `identifies` varchar(255) DEFAULT NULL COMMENT '唯一表示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文件管理';

-- ----------------------------
-- Records of file_manage
-- ----------------------------
BEGIN;
INSERT INTO `file_manage` VALUES (1, 'image/20180927/1538061733.jpg', 'B7C54095-5C8F-4100-8D80-295FF4554115');
INSERT INTO `file_manage` VALUES (2, 'image/20180928/1538096695.pdf', '3C300E87-7A4F-E921-9E1D-02C7309A0A1B');
COMMIT;

-- ----------------------------
-- Table structure for people
-- ----------------------------
DROP TABLE IF EXISTS `people`;
CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipone` varchar(100) DEFAULT NULL COMMENT '手机号',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `e_mail` varchar(40) DEFAULT NULL COMMENT '邮箱验证',
  `rid` varchar(100) DEFAULT NULL COMMENT '任务角色标识',
  `orgid` varchar(100) DEFAULT NULL COMMENT '角色id',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `last_login_time` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `freeze` int(1) DEFAULT NULL COMMENT '0:活跃 1:冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='人员表';

-- ----------------------------
-- Records of people
-- ----------------------------
BEGIN;
INSERT INTO `people` VALUES (1, '15901779064', 'zkrLYW0713', '小明', NULL, NULL, '5419-5134-2545-5799', NULL, NULL, NULL, 0);
INSERT INTO `people` VALUES (2, '18701968032', '123456', '小张', NULL, NULL, '7994-9516-4647-2096', NULL, NULL, NULL, 0);
INSERT INTO `people` VALUES (3, '17621515830', '123456', '小红', NULL, NULL, '6116-5390-3617-1594', NULL, NULL, NULL, 0);
INSERT INTO `people` VALUES (4, '18017431373', '1314jqbk', '小李', NULL, NULL, '8975-3207-8409-8469', NULL, NULL, NULL, 0);
INSERT INTO `people` VALUES (5, '18201879741', '123456', '小杨', NULL, NULL, '', NULL, NULL, NULL, 0);
INSERT INTO `people` VALUES (6, NULL, '123456', '小吴', NULL, '954663633@qq.com', '8975-3207-8409-8455', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '127.0.0.1', 1543051814, 0);
INSERT INTO `people` VALUES (7, '17621515831', '123456', '小红', NULL, NULL, '6116-5390-3617-1594', NULL, NULL, NULL, 0);
INSERT INTO `people` VALUES (8, '17621515820', '123456', '小红', NULL, NULL, '6116-5390-3617-1594', NULL, NULL, NULL, 0);
INSERT INTO `people` VALUES (9, '17621515833', '123456', '小红', NULL, NULL, '6116-5390-3617-1594', NULL, NULL, NULL, 0);
INSERT INTO `people` VALUES (10, '17621515555', '123456', '小红', NULL, NULL, '6116-5390-3617-1594', NULL, NULL, NULL, 0);
INSERT INTO `people` VALUES (11, '17621515834', '123456', '小红', NULL, NULL, '6116-5390-3617-1594', NULL, NULL, NULL, 0);
INSERT INTO `people` VALUES (27, '17621515000', '123456', '小红', NULL, NULL, '6116-5390-3617-1594', NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for people_ext
-- ----------------------------
DROP TABLE IF EXISTS `people_ext`;
CREATE TABLE `people_ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `rid` varchar(255) DEFAULT NULL COMMENT '任务id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员信息扩展表';

-- ----------------------------
-- Table structure for program
-- ----------------------------
DROP TABLE IF EXISTS `program`;
CREATE TABLE `program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_form` varchar(255) DEFAULT NULL COMMENT '表名',
  `field` varchar(100) DEFAULT NULL COMMENT '字段',
  `fieldType` varchar(48) DEFAULT NULL COMMENT '字段类型',
  `fieldSize` varchar(48) DEFAULT NULL COMMENT '字段大小',
  `field_annotation` varchar(255) DEFAULT NULL COMMENT '管理字段名注释',
  `sort` varchar(100) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='表管理';

-- ----------------------------
-- Records of program
-- ----------------------------
BEGIN;
INSERT INTO `program` VALUES (1, 'zmyq_menu', 'title', 'varchar', '255', '标题', '0');
INSERT INTO `program` VALUES (2, 'zmyq_menu', 'ico', 'varchar', '255', '图标', '1');
INSERT INTO `program` VALUES (3, 'zmyq_menu', 'url', 'varchar', '255', '地址', '2');
INSERT INTO `program` VALUES (16, 'program', 'title', 'varchar', '255', '表名的注释', '0');
INSERT INTO `program` VALUES (17, 'program', 'table_form', 'varchar', '255', '表名', '1');
INSERT INTO `program` VALUES (18, 'program', 'field', 'varchar', '100', '字段', '2');
INSERT INTO `program` VALUES (19, 'program', 'fieldType', 'varchar', '48', '字段类型', '3');
INSERT INTO `program` VALUES (20, 'program', 'fieldSize', 'varchar', '48', '字段大小', '4');
INSERT INTO `program` VALUES (21, 'program', 'field_annotation', 'varchar', '255', '管理字段名注释', '5');
INSERT INTO `program` VALUES (22, 'program', 'sort', 'varchar', '100', '排序', '6');
INSERT INTO `program` VALUES (33, 'zmyq_menu', 'iponeurl', 'varchar', '100', '手机端链接', '5');
INSERT INTO `program` VALUES (34, 'zmyq_menu', 'equipment', 'varchar', '100', '使用端', '6');
INSERT INTO `program` VALUES (38, 'zmyq_facility', 'facility', 'varchar', '100', '设备名称', '0');
INSERT INTO `program` VALUES (39, 'zmyq_facility', 'issue', 'varchar', '100', '零件', '1');
INSERT INTO `program` VALUES (40, 'zmyq_facility', 'price', 'varchar', '100', '价格', '2');
INSERT INTO `program` VALUES (41, 'zmyq_facility', 'processing', 'varchar', '100', '处理方案', '4');
INSERT INTO `program` VALUES (42, 'zmyq_facility', 'Stick', 'varchar', '100', '是否置顶', '5');
INSERT INTO `program` VALUES (44, 'zmyq_subscribe', 'ipone', 'varchar', '100', '机型选择', '0');
INSERT INTO `program` VALUES (45, 'zmyq_subscribe', 'way', 'varchar', '100', '维修方式', '1');
INSERT INTO `program` VALUES (46, 'zmyq_subscribe', 'userName', 'varchar', '100', '预留信息', '2');
INSERT INTO `program` VALUES (47, 'zmyq_subscribe', 'phoneNum', 'varchar', '100', '预约手机', '3');
INSERT INTO `program` VALUES (48, 'zmyq_subscribe', 'Street', 'varchar', '100', '您的地址', '4');
INSERT INTO `program` VALUES (49, 'zmyq_subscribe', 'message', 'varchar', '100', '备注信息', '5');
INSERT INTO `program` VALUES (57, 'zmyq_error', 'appTitle', 'varchar', '1000', 'app名字', '0');
INSERT INTO `program` VALUES (58, 'zmyq_error', 'error', 'varchar', '255', '错误信息', '0');
INSERT INTO `program` VALUES (59, 'zmyq_userBehavior', 'user', 'varchar', '100', '用户名称', '0');
INSERT INTO `program` VALUES (60, 'zmyq_userBehavior', 'equipment', 'varchar', '100', '设备信息', '1');
INSERT INTO `program` VALUES (61, 'zmyq_userBehavior', 'behavior', 'varchar', '100', '行为', '2');
INSERT INTO `program` VALUES (62, 'zmyq_new_ce', 'behavior', 'varchar', '100', '行为', '2');
INSERT INTO `program` VALUES (65, 'column', 'column', 'varchar', '100', '数据库名', '0');
INSERT INTO `program` VALUES (66, 'column', 'columnName', 'varchar', '100', '注释,标题', '1');
INSERT INTO `program` VALUES (67, 'column', 'columnid', 'varchar', '100', '数据库编号', '2');
INSERT INTO `program` VALUES (68, 'datatype', 'type', 'varchar', '48', '类型', '0');
INSERT INTO `program` VALUES (69, 'datatype', 'size', 'int', '11', '大小', '1');
INSERT INTO `program` VALUES (70, 'datatype', 'html', 'text', '0', '字段的html', '2');
INSERT INTO `program` VALUES (71, 'datatype', 'annotation', 'varchar', '48', '注释', '3');
INSERT INTO `program` VALUES (72, 'e_mail', 'host', 'varchar', '48', '服务器地址 如:smtp.qq.com', '0');
INSERT INTO `program` VALUES (73, 'e_mail', 'port', 'int', '5', '端口', '1');
INSERT INTO `program` VALUES (74, 'e_mail', 'hostname', 'varchar', '48', '服务器地址 如: http://localhost/', '2');
INSERT INTO `program` VALUES (75, 'e_mail', 'title', 'varchar', '48', '邮件的标题', '3');
INSERT INTO `program` VALUES (76, 'e_mail', 'content', 'int', '5', '邮件的内容', '4');
INSERT INTO `program` VALUES (77, 'e_mail', 'timu', 'varchar', '48', '邮件的发件人', '5');
INSERT INTO `program` VALUES (78, 'e_mail', 'username', 'varchar', '48', '邮箱的账户名', '6');
INSERT INTO `program` VALUES (79, 'e_mail', 'password', 'varchar', '48', '邮箱的密码', '7');
INSERT INTO `program` VALUES (80, 'e_mail', 'e_mailid', 'varchar', '48', '有限配置编号', '8');
INSERT INTO `program` VALUES (81, 'file_manage', 'url', 'varchar', '100', '路径', '0');
INSERT INTO `program` VALUES (82, 'file_manage', 'identifies', 'varchar', '100', '唯一表示', '1');
INSERT INTO `program` VALUES (83, 'people', 'ipone', 'varchar', '100', '手机号', '0');
INSERT INTO `program` VALUES (84, 'people', 'password', 'varchar', '100', '密码', '1');
INSERT INTO `program` VALUES (85, 'people', 'nickname', 'varchar', '100', '昵称', '2');
INSERT INTO `program` VALUES (86, 'people', 'username', 'varchar', '100', '用户名', '3');
INSERT INTO `program` VALUES (87, 'people', 'e_mail', 'varchar', '44', '邮箱验证', '4');
INSERT INTO `program` VALUES (88, 'people', 'rid', 'varchar', '100', '任务角色标识', '5');
INSERT INTO `program` VALUES (89, 'people', 'orgid', 'varchar', '100', '角色id', '6');
INSERT INTO `program` VALUES (90, 'people', 'last_login_ip', 'varchar', '20', 'ip地址', '7');
INSERT INTO `program` VALUES (91, 'people', 'last_login_time', 'int', '11', '最后登录时间', '8');
INSERT INTO `program` VALUES (92, 'people', 'freeze', 'int', '1', '0:活跃 1:冻结', '9');
INSERT INTO `program` VALUES (93, 'program', 'table_form', 'varchar', '255', '表名', '0');
INSERT INTO `program` VALUES (94, 'program', 'field', 'varchar', '100', '字段', '1');
INSERT INTO `program` VALUES (95, 'program', 'fieldType', 'varchar', '48', '字段类型', '2');
INSERT INTO `program` VALUES (96, 'program', 'fieldSize', 'varchar', '48', '字段大小', '3');
INSERT INTO `program` VALUES (97, 'program', 'field_annotation', 'varchar', '255', '管理字段名注释', '4');
INSERT INTO `program` VALUES (98, 'program', 'sort', 'varchar', '100', '排序', '5');
INSERT INTO `program` VALUES (99, 'role', 'table', 'varchar', '100', '表', '0');
INSERT INTO `program` VALUES (100, 'role', 'classid', 'varchar', '255', '表id', '1');
INSERT INTO `program` VALUES (101, 'role', 'field', 'varchar', '255', '可以控制的字段', '2');
INSERT INTO `program` VALUES (102, 'role', 'roleid', 'varchar', '255', '用户id', '3');
INSERT INTO `program` VALUES (103, 'role', 'control', 'varchar', '10', '控制编号', '4');
INSERT INTO `program` VALUES (104, 'role_dictionary', 'roleName', 'varchar', '100', '角色名称', '0');
INSERT INTO `program` VALUES (105, 'role_dictionary', 'roleid', 'varchar', '100', '角色id', '1');
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色',
  `table` varchar(100) DEFAULT NULL COMMENT '表',
  `classid` varchar(255) DEFAULT NULL COMMENT '表id',
  `field` varchar(255) DEFAULT NULL COMMENT '可以控制的字段',
  `roleid` varchar(255) DEFAULT NULL COMMENT '用户id',
  `control` varchar(10) DEFAULT NULL COMMENT '控制编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'zmyq_facility', 'CE68E83A-65A7-E588-A63D-5D24CD2A755D', 'facility||&&||issue||&&||price||&&||processing||&&||Stick', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '0');
INSERT INTO `role` VALUES (3, 'column', 'DEBXX919-5569-45AA-06C8-BE57F4884555', 'column||&&||columnName', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '0');
INSERT INTO `role` VALUES (4, 'column', 'DEBXX919-5569-45AA-06C8-BE57F4884555', 'column', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '1');
INSERT INTO `role` VALUES (5, 'column', 'DEBXX919-5569-45AA-06C8-BE57F4884555', 'column||&&||columnName', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '2');
INSERT INTO `role` VALUES (6, 'column', 'DEBXX919-5569-45AA-06C8-BE57F4884555', 'column||&&||columnName||&&||columnid', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '3');
INSERT INTO `role` VALUES (7, 'people', 'DEB37919-5B49-45AA-06C8-BE57F4884555', 'ipone||&&||password||&&||nickname||&&||e_mail||&&||rid||&&||orgid||&&||last_login_ip||&&||last_login_time||&&||freeze', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '3');
INSERT INTO `role` VALUES (8, 'role_dictionary', 'CE68E83A-65A7-E7788-A63D-5D24C666755D', 'roleName||&&||roleid', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '3');
INSERT INTO `role` VALUES (9, 'program', '55E01CCA8-94FA-4BFE-0623-3D4563E6F18B', 'table_form||&&||field_annotation', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '3');
INSERT INTO `role` VALUES (10, 'role', 'AADA4670-E3B2-A08C-D287-0DD4EA48A05D', 'table||&&||classid||&&||field||&&||roleid||&&||control', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '0');
INSERT INTO `role` VALUES (11, 'role_dictionary', 'CE68E83A-65A7-E7788-A63D-5D24C666755D', 'roleName||&&||roleid', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '0');
INSERT INTO `role` VALUES (12, 'role_dictionary', 'CE68E83A-65A7-E7788-A63D-5D24C666755D', 'roleName||&&||roleid', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '1');
INSERT INTO `role` VALUES (13, 'role_dictionary', 'CE68E83A-65A7-E7788-A63D-5D24C666755D', 'roleName||&&||roleid', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '2');
INSERT INTO `role` VALUES (14, 'role', 'AADA4670-E3B2-A08C-D287-0DD4EA48A05D', 'table||&&||classid||&&||field||&&||roleid||&&||control', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '1');
INSERT INTO `role` VALUES (15, 'role', 'AADA4670-E3B2-A08C-D287-0DD4EA48A05D', 'table||&&||classid||&&||field||&&||roleid||&&||control', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '2');
INSERT INTO `role` VALUES (16, 'role', 'AADA4670-E3B2-A08C-D287-0DD4EA48A05D', 'table||&&||classid||&&||field||&&||roleid||&&||control', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '3');
INSERT INTO `role` VALUES (19, 'people', 'DEB37919-5B49-45AA-06C8-BE57F4884555', 'ipone||&&||password||&&||nickname||&&||e_mail||&&||rid||&&||orgid||&&||last_login_ip||&&||last_login_time||&&||freeze', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '1');
INSERT INTO `role` VALUES (20, 'people', 'DEB37919-5B49-45AA-06C8-BE57F4884555', 'ipone||&&||password||&&||nickname||&&||e_mail||&&||rid||&&||orgid||&&||last_login_ip||&&||last_login_time||&&||freeze', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '2');
INSERT INTO `role` VALUES (21, 'e_mail', 'CCDBCD8E-D3ED-CDD7-A881-B4D68611FB48', 'host||&&||port', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '0');
INSERT INTO `role` VALUES (22, 'people', 'DEB37919-5B49-45AA-06C8-BE57F4884555', 'ipone||&&||password', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6', '0');
COMMIT;

-- ----------------------------
-- Table structure for role_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `role_dictionary`;
CREATE TABLE `role_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `roleid` varchar(100) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色字典';

-- ----------------------------
-- Records of role_dictionary
-- ----------------------------
BEGIN;
INSERT INTO `role_dictionary` VALUES (1, '超级管理员', 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6');
INSERT INTO `role_dictionary` VALUES (2, '普通用户', 'B834D761-7BFB-A5F5-33F6-77777C3FC2D6');
COMMIT;

-- ----------------------------
-- Table structure for sms
-- ----------------------------
DROP TABLE IF EXISTS `sms`;
CREATE TABLE `sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `appid` varchar(100) DEFAULT NULL,
  `templateId` varchar(100) DEFAULT NULL,
  `smsSign` varchar(100) DEFAULT NULL,
  `smsid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信表';

-- ----------------------------
-- Table structure for zmyq_error
-- ----------------------------
DROP TABLE IF EXISTS `zmyq_error`;
CREATE TABLE `zmyq_error` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appTitle` varchar(100) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `newTime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报错表';

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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='预约表';

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
INSERT INTO `zmyq_subscribe` VALUES (20, '1123', '123', '123', '123', '123', '123', '1533020233');
INSERT INTO `zmyq_subscribe` VALUES (21, '1123', '123', '123', '123', '123', '123', '1533095131');
INSERT INTO `zmyq_subscribe` VALUES (22, '1123', '123', '123', '123', '123', '123', '1533095298');
INSERT INTO `zmyq_subscribe` VALUES (23, '1123', '123', '123', '123', '123', '123', '1533095334');
INSERT INTO `zmyq_subscribe` VALUES (24, '1123', '123', '123', '123', '123', '123', '1533095358');
INSERT INTO `zmyq_subscribe` VALUES (25, '1123', '123', '123', '123', '123', '123', '1533095407');
INSERT INTO `zmyq_subscribe` VALUES (26, '1123', '123', '123', '123', '123', '123', '1533095742');
INSERT INTO `zmyq_subscribe` VALUES (27, '1123', '123', '123', '123', '123', '123', '1533095794');
INSERT INTO `zmyq_subscribe` VALUES (28, '1123', '123', '123', '123', '123', '123', '1533095988');
INSERT INTO `zmyq_subscribe` VALUES (29, '1123', '123', '123', '123', '123', '123', '1533095998');
INSERT INTO `zmyq_subscribe` VALUES (30, '1123', '123', '123', '123', '123', '123', '1533096010');
INSERT INTO `zmyq_subscribe` VALUES (31, '1123', '123', '123', '123', '123', '123', '1533096051');
INSERT INTO `zmyq_subscribe` VALUES (32, '1123', '123', '123', '123', '123', '123', '1533096443');
INSERT INTO `zmyq_subscribe` VALUES (33, '1123', '123', '123', '123', '123', '123', '1533096851');
INSERT INTO `zmyq_subscribe` VALUES (34, '1123', '123', '123', '123', '123', '123', '1533096932');
INSERT INTO `zmyq_subscribe` VALUES (35, '1123', '123', '123', '123', '123', '123', '1533100774');
INSERT INTO `zmyq_subscribe` VALUES (36, '1123', '123', '123', '123', '123', '123', '1533100910');
INSERT INTO `zmyq_subscribe` VALUES (37, '1123', '123', '123', '123', '123', '123', '1533101101');
INSERT INTO `zmyq_subscribe` VALUES (38, '1123', '123', '123', '123', '123', '123', '1533101153');
INSERT INTO `zmyq_subscribe` VALUES (39, '1123', '123', '123', '123', '123', '123', '1533101236');
INSERT INTO `zmyq_subscribe` VALUES (40, '1123', '123', '123', '123', '123', '123', '1533101264');
INSERT INTO `zmyq_subscribe` VALUES (41, '1123', '123', '123', '123', '123', '123', '1533101299');
INSERT INTO `zmyq_subscribe` VALUES (42, '1123', '123', '123', '123', '123', '123', '1533101352');
INSERT INTO `zmyq_subscribe` VALUES (43, '1123', '123', '123', '123', '123', '123', '1533101377');
INSERT INTO `zmyq_subscribe` VALUES (44, '1123', '123', '123', '123', '123', '123', '1533101424');
INSERT INTO `zmyq_subscribe` VALUES (45, '1123', '123', '123', '123', '123', '123', '1533101514');
INSERT INTO `zmyq_subscribe` VALUES (46, '1123', '123', '123', '123', '123', '123', '1533101539');
INSERT INTO `zmyq_subscribe` VALUES (47, '1123', '123', '123', '123', '123', '123', '1533102029');
INSERT INTO `zmyq_subscribe` VALUES (48, '1123', '123', '123', '123', '123', '123', '1533102338');
INSERT INTO `zmyq_subscribe` VALUES (49, '1123', '123', '123', '123', '123', '123', '1533102374');
INSERT INTO `zmyq_subscribe` VALUES (50, '1123', '123', '123', '123', '123', '123', '1533102390');
INSERT INTO `zmyq_subscribe` VALUES (51, '1123', '123', '123', '123', '123', '123', '1533102484');
INSERT INTO `zmyq_subscribe` VALUES (52, '1123', '123', '123', '123', '123', '123', '1533102662');
INSERT INTO `zmyq_subscribe` VALUES (53, '1123', '123', '123', '123', '123', '123', '1533102738');
INSERT INTO `zmyq_subscribe` VALUES (54, '1123', '123', '123', '123', '123', '123', '1533102852');
INSERT INTO `zmyq_subscribe` VALUES (55, '1123', '123', '123', '123', '123', '123', '1533102923');
INSERT INTO `zmyq_subscribe` VALUES (56, '1123', '123', '123', '123', '123', '123', '1533102948');
INSERT INTO `zmyq_subscribe` VALUES (57, '1123', '123', '123', '123', '123', '123', '1533102894');
INSERT INTO `zmyq_subscribe` VALUES (58, '1123', '123', '123', '123', '123', '123', '1533103197');
INSERT INTO `zmyq_subscribe` VALUES (59, '1123', '123', '123', '123', '123', '123', '1533103240');
INSERT INTO `zmyq_subscribe` VALUES (60, '1123', '123', '123', '123', '123', '123', '1533103274');
INSERT INTO `zmyq_subscribe` VALUES (61, '1123', '123', '123', '123', '123', '123', '1533103338');
INSERT INTO `zmyq_subscribe` VALUES (62, '1123', '123', '123', '123', '123', '123', '1533103511');
INSERT INTO `zmyq_subscribe` VALUES (63, '1123', '123', '123', '123', '123', '123', '1533103531');
INSERT INTO `zmyq_subscribe` VALUES (64, '1123', '123', '123', '123', '123', '123', '1533103543');
INSERT INTO `zmyq_subscribe` VALUES (65, '1123', '123', '123', '123', '123', '123', '1533103573');
INSERT INTO `zmyq_subscribe` VALUES (66, '1123', '123', '123', '123', '123', '123', '1533103597');
INSERT INTO `zmyq_subscribe` VALUES (67, '1123', '123', '123', '123', '123', '123', '1533103758');
INSERT INTO `zmyq_subscribe` VALUES (68, '1123', '123', '123', '123', '123', '123', '1533104118');
INSERT INTO `zmyq_subscribe` VALUES (69, '1123', '123', '123', '123', '123', '123', '1533104132');
INSERT INTO `zmyq_subscribe` VALUES (70, '1123', '123', '123', '123', '123', '123', '1533104239');
INSERT INTO `zmyq_subscribe` VALUES (71, '1123', '123', '123', '123', '123', '123', '1533104337');
INSERT INTO `zmyq_subscribe` VALUES (72, '1123', '123', '123', '123', '123', '123', '1533104359');
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
