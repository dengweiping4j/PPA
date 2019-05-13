/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50096
 Source Host           : localhost:3306
 Source Schema         : ppa

 Target Server Type    : MySQL
 Target Server Version : 50096
 File Encoding         : 65001

 Date: 13/05/2019 11:47:17
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`  (
  `pkid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '贫困对象姓名',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `age` int(10) DEFAULT NULL COMMENT '年龄',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '家庭住址',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '贫困程度',
  `reason` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '致贫原因',
  `capacity` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '生产能力',
  `policy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '已采取的政策',
  PRIMARY KEY USING BTREE (`pkid`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 10240 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('3907ecd7-fe12-4277-97cc-991639192ea2', '刘能', '1', 60, '辽宁省铁岭市', '13333333333', '4', '颠三倒四', '基本无生产能力', '0a249e4f-2389-4850-8a34-f1d677f99a06');
INSERT INTO `person` VALUES ('81e70ca6-20c8-486b-b5e0-6df4b2d8c6dd', '王宝强', '1', 38, '北京市东城区', '18812335644', '1', '失业', '具有较强的生产能力', '4d799efb-1495-47a2-ac38-58d405b6006b');
INSERT INTO `person` VALUES ('ee969a5d-1796-4b69-a64f-121cab02c82d', '赵三顺', '1', 56, '', '', '3', '长的比较丑', '具有一定的生成能力', NULL);
INSERT INTO `person` VALUES ('test', '李铁柱', '0', 49, '恩施市巴东县', '15512345678', '2', '身体残疾', '无生产能力', NULL);

-- ----------------------------
-- Table structure for policy
-- ----------------------------
DROP TABLE IF EXISTS `policy`;
CREATE TABLE `policy`  (
  `pkid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '政策标题',
  `text` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '具体内容',
  PRIMARY KEY USING BTREE (`pkid`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 10240 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of policy
-- ----------------------------
INSERT INTO `policy` VALUES ('0a249e4f-2389-4850-8a34-f1d677f99a06', '富民产业', '通过镇政府、村委会等机构，给村里引入果树种植、大棚蔬菜等富民产业，帮助村民脱贫');
INSERT INTO `policy` VALUES ('23e87ad8-ef18-474e-8dff-ccf60e81fe3e', '惠农政策', '通过减免农业附加税，给予化肥购买补助等惠农政策，减少农民生活成本');
INSERT INTO `policy` VALUES ('4596affe-a85f-440a-8656-016fe8bc47b0', '小额贷款', '通过社会救助基金、银行等机构对其进行小额贷款，支持扶贫对象创业等');
INSERT INTO `policy` VALUES ('4d799efb-1495-47a2-ac38-58d405b6006b', '劳动力培训', '通过对扶贫对象进行汽修、餐饮、销售等技能培训，使其能够找到工作，通过努力工作致富');
INSERT INTO `policy` VALUES ('70ba14da-59fd-4cfe-b477-c7bb88ac7058', '社会救助', '通过扶贫办、社会救助基金等多渠道对扶贫对象进行救助，解决基本生活问题');
INSERT INTO `policy` VALUES ('d84cc2fe-2ed2-4edc-a536-bb264efd7954', '教育扶贫', '通过给贫困人口进行基本阅读培训、书写能力培训、农业生产科学技术培训、其它技能培训等，让贫困对象能够有一技之长，解决生活困难');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `pkid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户密码',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '照片',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY USING BTREE (`pkid`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 10240 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('f95f3ad2-42a7-4c64-8e81-76fd2f957c9f', 'admin', '超级管理员', '21232f297a57a5a743894a0e4a801fc3', NULL, '15502791235');

-- ----------------------------
-- View structure for v_countperson
-- ----------------------------
DROP VIEW IF EXISTS `v_countperson`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_countperson` AS SELECT
	sum( case when t.level='1' then 1 else 0 end )  as ybsr,
	sum( case when t.level='2' then 1 else 0 end )  as dsr,
	sum( case when t.level='3' then 1 else 0 end )  as xdpk,
	sum( case when t.level='4' then 1 else 0 end )  as jdpk,
	sum( case when t.policy is not null then 1 else 0 end )  as ycqcs,
	count(t.pkid) as zrk
FROM
	person t ;

-- ----------------------------
-- View structure for v_person
-- ----------------------------
DROP VIEW IF EXISTS `v_person`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_person` AS select `t`.`pkid` AS `pkid`,`t`.`name` AS `name`,`t`.`sex` AS `sex`,`t`.`age` AS `age`,`t`.`address` AS `address`,`t`.`phone` AS `phone`,`t`.`level` AS `level`,`t`.`reason` AS `reason`,`t`.`capacity` AS `capacity`,`t`.`policy` AS `policy`,(case when (`t`.`sex` = '1') then '男' else '女' end) AS `sexmc`,(case when (`t`.`level` = '1') then '一般收入人口' when (`t`.`level` = '2') then '低收入人口' when (`t`.`level` = '3') then '相对贫困人口' when (`t`.`level` = '4') then '绝对贫困人口' else '' end) AS `levelmc` from `person` `t` ;

-- ----------------------------
-- View structure for v_policy_select
-- ----------------------------
DROP VIEW IF EXISTS `v_policy_select`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_policy_select` AS SELECT
	t.pkid AS personpkid,
	t.name,
	t.level,
	(
CASE
	
	WHEN ( t.LEVEL = '1' ) THEN
	'一般收入人口' 
	WHEN ( t.LEVEL = '2' ) THEN
	'低收入人口' 
	WHEN ( t.LEVEL = '3' ) THEN
	'相对贫困人口' 
	WHEN ( t.LEVEL = '4' ) THEN
	'绝对贫困人口' ELSE '' 
END 
	) AS `levelmc`,
	t.reason,
	t1.pkid AS policypkid,
	t1.title,
	t1.text 
FROM
	person t
LEFT JOIN policy t1 ON t.policy=t1.pkid ;

-- ----------------------------
-- View structure for v_result
-- ----------------------------
DROP VIEW IF EXISTS `v_result`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_result` AS SELECT
	`t`.`pkid` AS `pkid`,
	`t`.`name` AS `name`,
	`t`.`level` AS `level`,
	`t`.`reason` AS `reason`,
	`t`.`capacity` AS `capacity`,
	`t`.`policy` AS `policy`,
	(
CASE
	
	WHEN ( `t`.`level` = '1' ) THEN
	'一般收入人口' 
	WHEN ( `t`.`level` = '2' ) THEN
	'低收入人口' 
	WHEN ( `t`.`level` = '3' ) THEN
	'相对贫困人口' 
	WHEN ( `t`.`level` = '4' ) THEN
	'绝对贫困人口' ELSE '' 
END 
	) AS `levelmc` ,
	IFNULL(t1.title,'未匹配扶贫政策') as policymc
FROM
`person` `t`
left join policy t1
on t.policy=t1.pkid ;

SET FOREIGN_KEY_CHECKS = 1;
