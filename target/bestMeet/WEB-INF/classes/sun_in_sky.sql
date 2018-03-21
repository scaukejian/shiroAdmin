/*
Navicat MySQL Data Transfer

Source Server         : 44服务器
Source Server Version : 50616
Source Host           : 192.168.1.44:3307
Source Database       : sun_in_sky

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2018-03-01 16:58:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_action`
-- ----------------------------
DROP TABLE IF EXISTS `admin_action`;
CREATE TABLE `admin_action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `NAME` varchar(50) DEFAULT NULL COMMENT '菜单名',
  `url` varchar(200) CHARACTER SET latin1 DEFAULT NULL COMMENT '菜单url',
  `type` varchar(50) DEFAULT NULL COMMENT '菜单类型  1一级 2二级 3三级...',
  `available` tinyint(2) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL COMMENT '菜单描述',
  `parent` bigint(20) DEFAULT NULL COMMENT '父级菜单',
  `seqNum` bigint(4) DEFAULT NULL COMMENT '菜单序号',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT=' 后台菜单';

-- ----------------------------
-- Records of admin_action
-- ----------------------------
INSERT INTO `admin_action` VALUES ('32', '系统管理', '', '1', '0', '权限管理', '0', '9999', null, '2016-09-09 19:01:48');
INSERT INTO `admin_action` VALUES ('33', '菜单管理', '/pages/action/action-list.jsp', '2', '0', '系统管理--菜单管理', '32', '3', null, null);
INSERT INTO `admin_action` VALUES ('34', '员工管理', '/pages/employee/employee-list.jsp', '2', '0', '系统管理--员工管理', '32', '2', null, '2015-05-28 19:18:15');
INSERT INTO `admin_action` VALUES ('35', '角色管理', '/pages/role/role-list.jsp', '2', '0', '系统管理---角色管理', '32', '1', null, '2017-09-20 16:57:42');

-- ----------------------------
-- Table structure for `admin_emp_role_relation`
-- ----------------------------
DROP TABLE IF EXISTS `admin_emp_role_relation`;
CREATE TABLE `admin_emp_role_relation` (
  `emp_id` bigint(20) NOT NULL COMMENT '员工id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`emp_id`,`role_id`),
  KEY `fk_back_emp_role_relation_roleid` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='员工角色关系表';

-- ----------------------------
-- Records of admin_emp_role_relation
-- ----------------------------
INSERT INTO `admin_emp_role_relation` VALUES ('6', '17');
INSERT INTO `admin_emp_role_relation` VALUES ('7', '18');

-- ----------------------------
-- Table structure for `admin_employee`
-- ----------------------------
DROP TABLE IF EXISTS `admin_employee`;
CREATE TABLE `admin_employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `account` varchar(100) NOT NULL COMMENT '账号',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `position` varchar(100) DEFAULT NULL COMMENT '职务',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile_phone` varchar(20) DEFAULT NULL COMMENT '手机',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `status` tinyint(2) DEFAULT NULL COMMENT '员工状态 0 禁用 1 有效 2删除状态',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `org_id` varchar(100) DEFAULT NULL COMMENT '部门',
  `nation` varchar(100) DEFAULT NULL COMMENT '民族',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `user_code` varchar(100) DEFAULT NULL COMMENT '易约号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台员工表';

-- ----------------------------
-- Records of admin_employee
-- ----------------------------
INSERT INTO `admin_employee` VALUES ('6', '系统超级管理员', 'sysadmin', '0668CFCF8CE4E0433684581393D11EB4', null, 'sysadmin@edate.com', '18000000112', '深圳-上海-广州-北京', '1', null, null, null, null, '2017-06-29 14:49:35', null);
INSERT INTO `admin_employee` VALUES ('7', '审核', 'resadmin', '21138EC0905448C52A553EEE8A93CB74', null, 'resadmin@edate.com.cn', '18000000000', '广州', '1', null, null, null, null, '2018-03-01 15:48:39', null);
INSERT INTO `admin_employee` VALUES ('8', '约会', 'orderadmin', '60684EE75F4DA601957B3F6AD99739A9', null, 'orderadmin@edate.com.cn', '15989099022', '深圳-广州-上海-北京', '2', null, null, null, null, '2018-03-01 15:44:49', '50203090');
INSERT INTO `admin_employee` VALUES ('9', '张三', 'zhangsan', '9BAD41710724CF6511ABDE2A52416881', null, 'zhangsan@edate.com.cn', '18000000000', null, '2', null, null, null, null, '2018-03-01 15:44:49', null);
INSERT INTO `admin_employee` VALUES ('10', '测试员', 'ceshi', '90DB7A241EE36462C1D24A2CC45C1C8C', null, 'sjfksjf@lskdf.sd', '18867351255', '', '2', null, null, null, '2015-08-25 17:15:08', '2015-08-25 17:15:08', null);
INSERT INTO `admin_employee` VALUES ('11', '李四', 'lisi', '1B539B60601B934441308049A9526E7D', null, 'jsdhfskdj@ksjfskd.com', '18800000000', '', '2', null, null, null, '2015-09-18 10:30:33', '2018-03-01 15:44:49', null);
INSERT INTO `admin_employee` VALUES ('12', '测试用户111', 'test', '47EC2DD791E31E2EF2076CAF64ED9B3D', null, '18100000000@11.com', '18100000000', null, '2', null, null, null, null, '2018-03-01 15:44:49', '70001030');
INSERT INTO `admin_employee` VALUES ('13', '易悦客服02-测试', 'test123', '0668CFCF8CE4E0433684581393D11EB4', null, '123456@qq.com', '13800138000', null, '2', null, null, null, null, '2018-03-01 15:44:49', null);
INSERT INTO `admin_employee` VALUES ('14', 'liming', 'dfdfdfefe', 'F5A9429D3E06596D8243338A7000DC76', null, '15500000000@qq.com', '15500000000', null, '2', null, null, null, '2016-09-20 14:48:23', '2018-03-01 15:44:49', null);
INSERT INTO `admin_employee` VALUES ('15', '测试验收', 'uat', 'FF26C4E8C0A8429911FC2756ADFCFAE8', null, '19511112222@11.com', '13011112222', null, '2', null, null, null, '2016-11-07 16:29:17', '2018-03-01 15:44:49', null);
INSERT INTO `admin_employee` VALUES ('16', '11', '15989099048', '8924D675F3519851A25A23EFF27406CB', null, '1@qq.com', '13800138000', null, '2', null, null, null, '2017-03-09 17:16:22', '2017-03-09 17:16:32', '11');
INSERT INTO `admin_employee` VALUES ('17', '11', '15989099048', '18C14C94D1BAC0526F7A1F4FF41CE152', null, '15989099048@qq.com', '15989099048', null, '2', null, null, null, '2017-03-09 17:58:39', '2017-03-09 17:58:46', '10001359');
INSERT INTO `admin_employee` VALUES ('18', '1', '13888888888', '8F71889D18FF9381C246D48BC9EA9475', null, '123456@qq.com', '13800138000', null, '2', null, null, null, '2017-03-13 15:13:26', '2017-03-13 15:13:57', 'sysadmin1');
INSERT INTO `admin_employee` VALUES ('19', '易悦客服01', 'YING', '1B2FB123CB0B28B260B2C92A7F16132F', null, '123456@qq.com', '13913913913', '', '2', null, null, null, null, '2018-03-01 15:44:49', '50302824');
INSERT INTO `admin_employee` VALUES ('20', '伟营小号客服', '18181818181', '56B688087EFDA3E3837A475880A38A7F', null, 'wuchaogang88@163.com', '18181818181', null, '2', null, null, null, null, '2018-03-01 15:44:57', '30202942');
INSERT INTO `admin_employee` VALUES ('21', '易悦客服02', '18181818181', '0668CFCF8CE4E0433684581393D11EB4', null, '123456@qq.com', '18181818181', null, '2', null, null, null, null, '2018-03-01 15:44:57', null);
INSERT INTO `admin_employee` VALUES ('22', 'lololo', 'binbinbin', '9961158BA4D7B60C48FC16A3247F0260', null, 'po1993056@163.com', '13602444270', null, '2', null, null, null, null, '2018-03-01 15:44:57', '30000942');
INSERT INTO `admin_employee` VALUES ('23', '易悦客服03', '121', '2DD53A1353886B98C2864CF62DDEB6AC', null, '11111111@qq.com', '18200001239', null, '2', null, null, null, '2017-03-26 18:25:14', '2018-03-01 15:44:57', '10102847');
INSERT INTO `admin_employee` VALUES ('24', '测试用户', 'test0508', 'F69FEDF663E57C99DBCC3F1BDEEB6579', null, '4435162646@qq.com', '18000000000', '北京-上海', '2', null, null, null, null, '2018-03-01 15:44:57', '');
INSERT INTO `admin_employee` VALUES ('25', '柯坚测试', 'kejian', '043FC02C4E8BDCE70B1E4B4AAAE4C8E3', null, '954657344@qq.com', '15989099048', '', '2', null, null, null, '2017-09-19 17:37:17', '2018-03-01 15:44:58', null);

-- ----------------------------
-- Table structure for `admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '角色名',
  `description` varchar(200) DEFAULT NULL COMMENT '角色描述',
  `level` tinyint(2) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台角色表';

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('17', 'sysadmin', '系统超级管理员', '系统超级管理员', '0', null, '2016-08-04 18:01:43');
INSERT INTO `admin_role` VALUES ('18', 'check', '审核资料专员', '审核资料专员', '0', null, '2016-08-04 18:01:57');

-- ----------------------------
-- Table structure for `admin_role_action_relation`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_action_relation`;
CREATE TABLE `admin_role_action_relation` (
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `action_id` bigint(20) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`,`action_id`),
  KEY `fk_back_role_action_relation_actionid` (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='角色菜单关系表';

-- ----------------------------
-- Records of admin_role_action_relation
-- ----------------------------
INSERT INTO `admin_role_action_relation` VALUES ('17', '32');
INSERT INTO `admin_role_action_relation` VALUES ('18', '32');
INSERT INTO `admin_role_action_relation` VALUES ('17', '33');
INSERT INTO `admin_role_action_relation` VALUES ('17', '34');
INSERT INTO `admin_role_action_relation` VALUES ('18', '34');
INSERT INTO `admin_role_action_relation` VALUES ('17', '35');
