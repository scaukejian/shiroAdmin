/*
Navicat MySQL Data Transfer

Source Server         : 44服务器
Source Server Version : 50616
Source Host           : 192.168.1.44:3307
Source Database       : best_meet

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2018-03-22 11:46:47
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
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT=' 后台菜单';

-- ----------------------------
-- Records of admin_action
-- ----------------------------
INSERT INTO `admin_action` VALUES ('32', '系统管理', '', '1', '0', '权限管理', '0', '9999', null, '2018-03-20 17:09:15');
INSERT INTO `admin_action` VALUES ('33', '菜单管理', '/pages/action/action-list.jsp', '2', '0', '系统管理--菜单管理', '32', '3', null, '2018-03-20 18:22:15');
INSERT INTO `admin_action` VALUES ('34', '员工管理', '/pages/employee/employee-list.jsp', '2', '0', '系统管理--员工管理', '32', '2', null, '2015-05-28 19:18:15');
INSERT INTO `admin_action` VALUES ('35', '角色管理', '/pages/role/role-list.jsp', '2', '0', '系统管理---角色管理', '32', '1', null, '2017-09-20 16:57:42');
INSERT INTO `admin_action` VALUES ('204', '数据配置', '', '1', '0', '', '0', '1', '2018-03-21 15:06:40', '2018-03-21 17:35:04');
INSERT INTO `admin_action` VALUES ('205', '数据类型', '/pages/baseDataType/baseDataType-list.jsp', '2', '0', '', '204', '1', '2018-03-21 15:07:55', '2018-03-21 17:08:50');
INSERT INTO `admin_action` VALUES ('206', '基础数据', 'pages/baseData/baseData-list.jsp', '2', '0', '', '204', '2', '2018-03-21 17:34:59', '2018-03-21 17:34:59');

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
INSERT INTO `admin_employee` VALUES ('6', '系统超级管理员', 'sysadmin', '0668CFCF8CE4E0433684581393D11EB4', null, 'sysadmin@edate.com', '18000000112', '深圳-上海-广州-北京', '1', null, null, null, null, '2018-03-20 17:09:26', null);
INSERT INTO `admin_employee` VALUES ('7', '审核', 'resadmin', '21138EC0905448C52A553EEE8A93CB74', null, 'resadmin@edate.com.cn', '18000000000', '广州', '1', null, null, null, null, '2018-03-20 18:14:37', null);
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
INSERT INTO `admin_role_action_relation` VALUES ('17', '204');
INSERT INTO `admin_role_action_relation` VALUES ('18', '204');
INSERT INTO `admin_role_action_relation` VALUES ('17', '205');
INSERT INTO `admin_role_action_relation` VALUES ('18', '205');
INSERT INTO `admin_role_action_relation` VALUES ('17', '206');
INSERT INTO `admin_role_action_relation` VALUES ('18', '206');

-- ----------------------------
-- Table structure for `api_area`
-- ----------------------------
DROP TABLE IF EXISTS `api_area`;
CREATE TABLE `api_area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` int(12) DEFAULT NULL COMMENT '城市代码',
  `name` varchar(20) DEFAULT NULL COMMENT '城市名称',
  `pinyin_name` varchar(128) DEFAULT NULL COMMENT '城市拼音名称',
  `parent_id` int(12) DEFAULT NULL COMMENT '父id',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8 COMMENT='城市区域表';

-- ----------------------------
-- Records of api_area
-- ----------------------------
INSERT INTO `api_area` VALUES ('5', '130100', '石家庄', 'shijiazhuang', '130000');
INSERT INTO `api_area` VALUES ('6', '130200', '唐山', 'tangshan', '130000');
INSERT INTO `api_area` VALUES ('7', '130300', '秦皇岛', 'qinhuangdao', '130000');
INSERT INTO `api_area` VALUES ('8', '130400', '邯郸', 'handan', '130000');
INSERT INTO `api_area` VALUES ('9', '130500', '邢台', 'xingtai', '130000');
INSERT INTO `api_area` VALUES ('10', '130600', '保定', 'baoding', '130000');
INSERT INTO `api_area` VALUES ('11', '130700', '张家口', 'zhangjiakou', '130000');
INSERT INTO `api_area` VALUES ('12', '130800', '承德', 'chengde', '130000');
INSERT INTO `api_area` VALUES ('13', '130900', '沧州', 'cangzhou', '130000');
INSERT INTO `api_area` VALUES ('14', '131000', '廊坊', 'langfang', '130000');
INSERT INTO `api_area` VALUES ('15', '131100', '衡水', 'hengshui', '130000');
INSERT INTO `api_area` VALUES ('16', '140100', '太原', 'taiyuan', '140000');
INSERT INTO `api_area` VALUES ('17', '140200', '大同', 'datong', '140000');
INSERT INTO `api_area` VALUES ('18', '140300', '阳泉', 'yangquan', '140000');
INSERT INTO `api_area` VALUES ('19', '140400', '长治', 'zhangzhi', '140000');
INSERT INTO `api_area` VALUES ('20', '140500', '晋城', 'jincheng', '140000');
INSERT INTO `api_area` VALUES ('21', '140600', '朔州', 'shuozhou', '140000');
INSERT INTO `api_area` VALUES ('22', '140700', '晋中', 'jinzhong', '140000');
INSERT INTO `api_area` VALUES ('23', '140800', '运城', 'yuncheng', '140000');
INSERT INTO `api_area` VALUES ('24', '140900', '忻州', 'xinzhou', '140000');
INSERT INTO `api_area` VALUES ('25', '141000', '临汾', 'linfen', '140000');
INSERT INTO `api_area` VALUES ('26', '141100', '吕梁', 'lu:liang', '140000');
INSERT INTO `api_area` VALUES ('27', '150100', '呼和浩特', 'huhehaote', '150000');
INSERT INTO `api_area` VALUES ('28', '150200', '包头', 'baotou', '150000');
INSERT INTO `api_area` VALUES ('29', '150300', '乌海', 'wuhai', '150000');
INSERT INTO `api_area` VALUES ('30', '150400', '赤峰', 'chifeng', '150000');
INSERT INTO `api_area` VALUES ('31', '150500', '通辽', 'tongliao', '150000');
INSERT INTO `api_area` VALUES ('32', '150600', '鄂尔多斯', 'eerduosi', '150000');
INSERT INTO `api_area` VALUES ('33', '150700', '呼伦贝尔', 'hulunbeier', '150000');
INSERT INTO `api_area` VALUES ('34', '150800', '巴彦淖尔', 'bayannaoer', '150000');
INSERT INTO `api_area` VALUES ('35', '150900', '乌兰察布', 'wulanchabu', '150000');
INSERT INTO `api_area` VALUES ('36', '152200', '兴安盟', 'xinganmeng', '150000');
INSERT INTO `api_area` VALUES ('37', '152500', '锡林郭勒盟', 'xilinguolemeng', '150000');
INSERT INTO `api_area` VALUES ('38', '152900', '阿拉善盟', 'alashanmeng', '150000');
INSERT INTO `api_area` VALUES ('39', '210100', '沈阳', 'shenyang', '210000');
INSERT INTO `api_area` VALUES ('40', '210200', '大连', 'dalian', '210000');
INSERT INTO `api_area` VALUES ('41', '210300', '鞍山', 'anshan', '210000');
INSERT INTO `api_area` VALUES ('42', '210400', '抚顺', 'fushun', '210000');
INSERT INTO `api_area` VALUES ('43', '210500', '本溪', 'benxi', '210000');
INSERT INTO `api_area` VALUES ('44', '210600', '丹东', 'dandong', '210000');
INSERT INTO `api_area` VALUES ('45', '210700', '锦州', 'jinzhou', '210000');
INSERT INTO `api_area` VALUES ('46', '210800', '营口', 'yingkou', '210000');
INSERT INTO `api_area` VALUES ('47', '210900', '阜新', 'fuxin', '210000');
INSERT INTO `api_area` VALUES ('48', '211000', '辽阳', 'liaoyang', '210000');
INSERT INTO `api_area` VALUES ('49', '211100', '盘锦', 'panjin', '210000');
INSERT INTO `api_area` VALUES ('50', '211200', '铁岭', 'tieling', '210000');
INSERT INTO `api_area` VALUES ('51', '211300', '朝阳', 'chaoyang', '210000');
INSERT INTO `api_area` VALUES ('52', '211400', '葫芦岛', 'huludao', '210000');
INSERT INTO `api_area` VALUES ('53', '220100', '长春', 'zhangchun', '220000');
INSERT INTO `api_area` VALUES ('54', '220200', '吉林', 'jilin', '220000');
INSERT INTO `api_area` VALUES ('55', '220300', '四平', 'siping', '220000');
INSERT INTO `api_area` VALUES ('56', '220400', '辽源', 'liaoyuan', '220000');
INSERT INTO `api_area` VALUES ('57', '220500', '通化', 'tonghua', '220000');
INSERT INTO `api_area` VALUES ('58', '220600', '白山', 'baishan', '220000');
INSERT INTO `api_area` VALUES ('59', '220700', '松原', 'songyuan', '220000');
INSERT INTO `api_area` VALUES ('60', '220800', '白城', 'baicheng', '220000');
INSERT INTO `api_area` VALUES ('61', '222400', '延边', 'yanbian', '220000');
INSERT INTO `api_area` VALUES ('62', '230100', '哈尔滨', 'haerbin', '230000');
INSERT INTO `api_area` VALUES ('63', '230200', '齐齐哈尔', 'qiqihaer', '230000');
INSERT INTO `api_area` VALUES ('64', '230300', '鸡西', 'jixi', '230000');
INSERT INTO `api_area` VALUES ('65', '230400', '鹤岗', 'hegang', '230000');
INSERT INTO `api_area` VALUES ('66', '230500', '双鸭山', 'shuangyashan', '230000');
INSERT INTO `api_area` VALUES ('67', '230600', '大庆', 'daqing', '230000');
INSERT INTO `api_area` VALUES ('68', '230700', '伊春', 'yichun', '230000');
INSERT INTO `api_area` VALUES ('69', '230800', '佳木斯', 'jiamusi', '230000');
INSERT INTO `api_area` VALUES ('70', '230900', '七台河', 'qitaihe', '230000');
INSERT INTO `api_area` VALUES ('71', '231000', '牡丹江', 'mudanjiang', '230000');
INSERT INTO `api_area` VALUES ('72', '231100', '黑河', 'heihe', '230000');
INSERT INTO `api_area` VALUES ('73', '231200', '绥化', 'suihua', '230000');
INSERT INTO `api_area` VALUES ('74', '232700', '大兴安岭', 'daxinganling', '230000');
INSERT INTO `api_area` VALUES ('75', '310000', '上海', 'shanghai', '310000');
INSERT INTO `api_area` VALUES ('77', '320100', '南京', 'nanjing', '320000');
INSERT INTO `api_area` VALUES ('78', '320200', '无锡', 'wuxi', '320000');
INSERT INTO `api_area` VALUES ('79', '320300', '徐州', 'xuzhou', '320000');
INSERT INTO `api_area` VALUES ('80', '320400', '常州', 'changzhou', '320000');
INSERT INTO `api_area` VALUES ('81', '320500', '苏州', 'suzhou', '320000');
INSERT INTO `api_area` VALUES ('82', '320600', '南通', 'nantong', '320000');
INSERT INTO `api_area` VALUES ('83', '320700', '连云港', 'lianyungang', '320000');
INSERT INTO `api_area` VALUES ('84', '320800', '淮安', 'huaian', '320000');
INSERT INTO `api_area` VALUES ('85', '320900', '盐城', 'yancheng', '320000');
INSERT INTO `api_area` VALUES ('86', '321000', '扬州', 'yangzhou', '320000');
INSERT INTO `api_area` VALUES ('87', '321100', '镇江', 'zhenjiang', '320000');
INSERT INTO `api_area` VALUES ('88', '321200', '泰州', 'taizhou', '320000');
INSERT INTO `api_area` VALUES ('89', '321300', '宿迁', 'suqian', '320000');
INSERT INTO `api_area` VALUES ('90', '330100', '杭州', 'hangzhou', '330000');
INSERT INTO `api_area` VALUES ('91', '330200', '宁波', 'ningbo', '330000');
INSERT INTO `api_area` VALUES ('92', '330300', '温州', 'wenzhou', '330000');
INSERT INTO `api_area` VALUES ('93', '330400', '嘉兴', 'jiaxing', '330000');
INSERT INTO `api_area` VALUES ('94', '330500', '湖州', 'huzhou', '330000');
INSERT INTO `api_area` VALUES ('95', '330600', '绍兴', 'shaoxing', '330000');
INSERT INTO `api_area` VALUES ('96', '330700', '金华', 'jinhua', '330000');
INSERT INTO `api_area` VALUES ('97', '330800', '衢州', 'quzhou', '330000');
INSERT INTO `api_area` VALUES ('98', '330900', '舟山', 'zhoushan', '330000');
INSERT INTO `api_area` VALUES ('99', '331000', '台州', 'taizhou', '330000');
INSERT INTO `api_area` VALUES ('100', '331100', '丽水', 'lishui', '330000');
INSERT INTO `api_area` VALUES ('101', '340100', '合肥', 'hefei', '340000');
INSERT INTO `api_area` VALUES ('102', '340200', '芜湖', 'wuhu', '340000');
INSERT INTO `api_area` VALUES ('103', '340300', '蚌埠', 'bangbu', '340000');
INSERT INTO `api_area` VALUES ('104', '340400', '淮南', 'huainan', '340000');
INSERT INTO `api_area` VALUES ('105', '340500', '马鞍山', 'maanshan', '340000');
INSERT INTO `api_area` VALUES ('106', '340600', '淮北', 'huaibei', '340000');
INSERT INTO `api_area` VALUES ('107', '340700', '铜陵', 'tongling', '340000');
INSERT INTO `api_area` VALUES ('108', '340800', '安庆', 'anqing', '340000');
INSERT INTO `api_area` VALUES ('109', '341000', '黄山', 'huangshan', '340000');
INSERT INTO `api_area` VALUES ('110', '341100', '滁州', 'chuzhou', '340000');
INSERT INTO `api_area` VALUES ('111', '341200', '阜阳', 'fuyang', '340000');
INSERT INTO `api_area` VALUES ('112', '341300', '宿州', 'suzhou', '340000');
INSERT INTO `api_area` VALUES ('113', '341400', '巢湖', 'chaohu', '340000');
INSERT INTO `api_area` VALUES ('114', '341500', '六安', 'liuan', '340000');
INSERT INTO `api_area` VALUES ('115', '341600', '亳州', 'bozhou', '340000');
INSERT INTO `api_area` VALUES ('116', '341700', '池州', 'chizhou', '340000');
INSERT INTO `api_area` VALUES ('117', '341800', '宣城', 'xuancheng', '340000');
INSERT INTO `api_area` VALUES ('118', '350100', '福州', 'fuzhou', '350000');
INSERT INTO `api_area` VALUES ('119', '350200', '厦门', 'shamen', '350000');
INSERT INTO `api_area` VALUES ('120', '350300', '莆田', 'putian', '350000');
INSERT INTO `api_area` VALUES ('121', '350400', '三明', 'sanming', '350000');
INSERT INTO `api_area` VALUES ('122', '350500', '泉州', 'quanzhou', '350000');
INSERT INTO `api_area` VALUES ('123', '350600', '漳州', 'zhangzhou', '350000');
INSERT INTO `api_area` VALUES ('124', '350700', '南平', 'nanping', '350000');
INSERT INTO `api_area` VALUES ('125', '350800', '龙岩', 'longyan', '350000');
INSERT INTO `api_area` VALUES ('126', '350900', '宁德', 'ningde', '350000');
INSERT INTO `api_area` VALUES ('127', '360100', '南昌', 'nanchang', '360000');
INSERT INTO `api_area` VALUES ('128', '360200', '景德镇', 'jingdezhen', '360000');
INSERT INTO `api_area` VALUES ('129', '360300', '萍乡', 'pingxiang', '360000');
INSERT INTO `api_area` VALUES ('130', '360400', '九江', 'jiujiang', '360000');
INSERT INTO `api_area` VALUES ('131', '360500', '新余', 'xinyu', '360000');
INSERT INTO `api_area` VALUES ('132', '360600', '鹰潭', 'yingtan', '360000');
INSERT INTO `api_area` VALUES ('133', '360700', '赣州', 'ganzhou', '360000');
INSERT INTO `api_area` VALUES ('134', '360800', '吉安', 'jian', '360000');
INSERT INTO `api_area` VALUES ('135', '360900', '宜春', 'yichun', '360000');
INSERT INTO `api_area` VALUES ('136', '361000', '抚州', 'fuzhou', '360000');
INSERT INTO `api_area` VALUES ('137', '361100', '上饶', 'shangrao', '360000');
INSERT INTO `api_area` VALUES ('138', '370100', '济南', 'jinan', '370000');
INSERT INTO `api_area` VALUES ('139', '370200', '青岛', 'qingdao', '370000');
INSERT INTO `api_area` VALUES ('140', '370300', '淄博', 'zibo', '370000');
INSERT INTO `api_area` VALUES ('141', '370400', '枣庄', 'zaozhuang', '370000');
INSERT INTO `api_area` VALUES ('142', '370500', '东营', 'dongying', '370000');
INSERT INTO `api_area` VALUES ('143', '370600', '烟台', 'yantai', '370000');
INSERT INTO `api_area` VALUES ('144', '370700', '潍坊', 'weifang', '370000');
INSERT INTO `api_area` VALUES ('145', '370800', '济宁', 'jining', '370000');
INSERT INTO `api_area` VALUES ('146', '370900', '泰安', 'taian', '370000');
INSERT INTO `api_area` VALUES ('147', '371000', '威海', 'weihai', '370000');
INSERT INTO `api_area` VALUES ('148', '371100', '日照', 'rizhao', '370000');
INSERT INTO `api_area` VALUES ('149', '371200', '莱芜', 'laiwu', '370000');
INSERT INTO `api_area` VALUES ('150', '371300', '临沂', 'linyi', '370000');
INSERT INTO `api_area` VALUES ('151', '371400', '德州', 'dezhou', '370000');
INSERT INTO `api_area` VALUES ('152', '371500', '聊城', 'liaocheng', '370000');
INSERT INTO `api_area` VALUES ('153', '371600', '滨州', 'binzhou', '370000');
INSERT INTO `api_area` VALUES ('154', '371700', '荷泽', 'heze', '370000');
INSERT INTO `api_area` VALUES ('155', '410100', '郑州', 'zhengzhou', '410000');
INSERT INTO `api_area` VALUES ('156', '410200', '开封', 'kaifeng', '410000');
INSERT INTO `api_area` VALUES ('157', '410300', '洛阳', 'luoyang', '410000');
INSERT INTO `api_area` VALUES ('158', '410400', '平顶山', 'pingdingshan', '410000');
INSERT INTO `api_area` VALUES ('159', '410500', '安阳', 'anyang', '410000');
INSERT INTO `api_area` VALUES ('160', '410600', '鹤壁', 'hebi', '410000');
INSERT INTO `api_area` VALUES ('161', '410700', '新乡', 'xinxiang', '410000');
INSERT INTO `api_area` VALUES ('162', '410800', '焦作', 'jiaozuo', '410000');
INSERT INTO `api_area` VALUES ('163', '410900', '濮阳', 'puyang', '410000');
INSERT INTO `api_area` VALUES ('164', '411000', '许昌', 'xuchang', '410000');
INSERT INTO `api_area` VALUES ('165', '411100', '漯河', 'luohe', '410000');
INSERT INTO `api_area` VALUES ('166', '411200', '三门峡', 'sanmenxia', '410000');
INSERT INTO `api_area` VALUES ('167', '411300', '南阳', 'nanyang', '410000');
INSERT INTO `api_area` VALUES ('168', '411400', '商丘', 'shangqiu', '410000');
INSERT INTO `api_area` VALUES ('169', '411500', '信阳', 'xinyang', '410000');
INSERT INTO `api_area` VALUES ('170', '411600', '周口', 'zhoukou', '410000');
INSERT INTO `api_area` VALUES ('171', '411700', '驻马店', 'zhumadian', '410000');
INSERT INTO `api_area` VALUES ('172', '420100', '武汉', 'wuhan', '420000');
INSERT INTO `api_area` VALUES ('173', '420200', '黄石', 'huangshi', '420000');
INSERT INTO `api_area` VALUES ('174', '420300', '十堰', 'shiyan', '420000');
INSERT INTO `api_area` VALUES ('175', '420500', '宜昌', 'yichang', '420000');
INSERT INTO `api_area` VALUES ('176', '420600', '襄阳', 'xiangfan', '420000');
INSERT INTO `api_area` VALUES ('177', '420700', '鄂州', 'ezhou', '420000');
INSERT INTO `api_area` VALUES ('178', '420800', '荆门', 'jingmen', '420000');
INSERT INTO `api_area` VALUES ('179', '420900', '孝感', 'xiaogan', '420000');
INSERT INTO `api_area` VALUES ('180', '421000', '荆州', 'jingzhou', '420000');
INSERT INTO `api_area` VALUES ('181', '421100', '黄冈', 'huanggang', '420000');
INSERT INTO `api_area` VALUES ('182', '421200', '咸宁', 'xianning', '420000');
INSERT INTO `api_area` VALUES ('183', '421300', '随州', 'suizhou', '420000');
INSERT INTO `api_area` VALUES ('184', '422800', '恩施', 'enshi', '420000');
INSERT INTO `api_area` VALUES ('185', '429000', '省直辖行政单位', 'shengzhixiaxingzhengdanwei', '420000');
INSERT INTO `api_area` VALUES ('186', '430100', '长沙', 'zhangsha', '430000');
INSERT INTO `api_area` VALUES ('187', '430200', '株洲', 'zhuzhou', '430000');
INSERT INTO `api_area` VALUES ('188', '430300', '湘潭', 'xiangtan', '430000');
INSERT INTO `api_area` VALUES ('189', '430400', '衡阳', 'hengyang', '430000');
INSERT INTO `api_area` VALUES ('190', '430500', '邵阳', 'shaoyang', '430000');
INSERT INTO `api_area` VALUES ('191', '430600', '岳阳', 'yueyang', '430000');
INSERT INTO `api_area` VALUES ('192', '430700', '常德', 'changde', '430000');
INSERT INTO `api_area` VALUES ('193', '430800', '张家界', 'zhangjiajie', '430000');
INSERT INTO `api_area` VALUES ('194', '430900', '益阳', 'yiyang', '430000');
INSERT INTO `api_area` VALUES ('195', '431000', '郴州', 'chenzhou', '430000');
INSERT INTO `api_area` VALUES ('196', '431100', '永州', 'yongzhou', '430000');
INSERT INTO `api_area` VALUES ('197', '431200', '怀化', 'huaihua', '430000');
INSERT INTO `api_area` VALUES ('198', '431300', '娄底', 'loudi', '430000');
INSERT INTO `api_area` VALUES ('199', '433100', '湘西', 'xiangxi', '430000');
INSERT INTO `api_area` VALUES ('200', '440100', '广州', 'guangzhou', '440000');
INSERT INTO `api_area` VALUES ('201', '440200', '韶关', 'shaoguan', '440000');
INSERT INTO `api_area` VALUES ('202', '440300', '深圳', 'shenzhen', '440000');
INSERT INTO `api_area` VALUES ('203', '440400', '珠海', 'zhuhai', '440000');
INSERT INTO `api_area` VALUES ('204', '440500', '汕头', 'shantou', '440000');
INSERT INTO `api_area` VALUES ('205', '440600', '佛山', 'foshan', '440000');
INSERT INTO `api_area` VALUES ('206', '440700', '江门', 'jiangmen', '440000');
INSERT INTO `api_area` VALUES ('207', '440800', '湛江', 'zhanjiang', '440000');
INSERT INTO `api_area` VALUES ('208', '440900', '茂名', 'maoming', '440000');
INSERT INTO `api_area` VALUES ('209', '441200', '肇庆', 'zhaoqing', '440000');
INSERT INTO `api_area` VALUES ('210', '441300', '惠州', 'huizhou', '440000');
INSERT INTO `api_area` VALUES ('211', '441400', '梅州', 'meizhou', '440000');
INSERT INTO `api_area` VALUES ('212', '441500', '汕尾', 'shanwei', '440000');
INSERT INTO `api_area` VALUES ('213', '441600', '河源', 'heyuan', '440000');
INSERT INTO `api_area` VALUES ('214', '441700', '阳江', 'yangjiang', '440000');
INSERT INTO `api_area` VALUES ('215', '441800', '清远', 'qingyuan', '440000');
INSERT INTO `api_area` VALUES ('216', '441900', '东莞', 'dongguan', '440000');
INSERT INTO `api_area` VALUES ('217', '442000', '中山', 'zhongshan', '440000');
INSERT INTO `api_area` VALUES ('218', '445100', '潮州', 'chaozhou', '440000');
INSERT INTO `api_area` VALUES ('219', '445200', '揭阳', 'jieyang', '440000');
INSERT INTO `api_area` VALUES ('220', '445300', '云浮', 'yunfu', '440000');
INSERT INTO `api_area` VALUES ('221', '450100', '南宁', 'nanning', '450000');
INSERT INTO `api_area` VALUES ('222', '450200', '柳州', 'liuzhou', '450000');
INSERT INTO `api_area` VALUES ('223', '450300', '桂林', 'guilin', '450000');
INSERT INTO `api_area` VALUES ('224', '450400', '梧州', 'wuzhou', '450000');
INSERT INTO `api_area` VALUES ('225', '450500', '北海', 'beihai', '450000');
INSERT INTO `api_area` VALUES ('226', '450600', '防城港', 'fangchenggang', '450000');
INSERT INTO `api_area` VALUES ('227', '450700', '钦州', 'qinzhou', '450000');
INSERT INTO `api_area` VALUES ('228', '450800', '贵港', 'guigang', '450000');
INSERT INTO `api_area` VALUES ('229', '450900', '玉林', 'yulin', '450000');
INSERT INTO `api_area` VALUES ('230', '451000', '百色', 'baise', '450000');
INSERT INTO `api_area` VALUES ('231', '451100', '贺州', 'hezhou', '450000');
INSERT INTO `api_area` VALUES ('232', '451200', '河池', 'hechi', '450000');
INSERT INTO `api_area` VALUES ('233', '451300', '来宾', 'laibin', '450000');
INSERT INTO `api_area` VALUES ('234', '451400', '崇左', 'chongzuo', '450000');
INSERT INTO `api_area` VALUES ('235', '460100', '海口', 'haikou', '460000');
INSERT INTO `api_area` VALUES ('236', '460200', '三亚', 'sanya', '460000');
INSERT INTO `api_area` VALUES ('237', '469000', '省直辖县级行政单位', 'shengzhixiaxianjixingzhengdanwei', '460000');
INSERT INTO `api_area` VALUES ('241', '510100', '成都', 'chengdou', '510000');
INSERT INTO `api_area` VALUES ('242', '510300', '自贡', 'zigong', '510000');
INSERT INTO `api_area` VALUES ('243', '510400', '攀枝花', 'panzhihua', '510000');
INSERT INTO `api_area` VALUES ('244', '510500', '泸州', 'luzhou', '510000');
INSERT INTO `api_area` VALUES ('245', '510600', '德阳', 'deyang', '510000');
INSERT INTO `api_area` VALUES ('246', '510700', '绵阳', 'mianyang', '510000');
INSERT INTO `api_area` VALUES ('247', '510800', '广元', 'guangyuan', '510000');
INSERT INTO `api_area` VALUES ('248', '510900', '遂宁', 'suining', '510000');
INSERT INTO `api_area` VALUES ('249', '511000', '内江', 'neijiang', '510000');
INSERT INTO `api_area` VALUES ('250', '511100', '乐山', 'leshan', '510000');
INSERT INTO `api_area` VALUES ('251', '511300', '南充', 'nanchong', '510000');
INSERT INTO `api_area` VALUES ('252', '511400', '眉山', 'meishan', '510000');
INSERT INTO `api_area` VALUES ('253', '511500', '宜宾', 'yibin', '510000');
INSERT INTO `api_area` VALUES ('254', '511600', '广安', 'guangan', '510000');
INSERT INTO `api_area` VALUES ('255', '511700', '达州', 'dazhou', '510000');
INSERT INTO `api_area` VALUES ('256', '511800', '雅安', 'yaan', '510000');
INSERT INTO `api_area` VALUES ('257', '511900', '巴中', 'bazhong', '510000');
INSERT INTO `api_area` VALUES ('258', '512000', '资阳', 'ziyang', '510000');
INSERT INTO `api_area` VALUES ('259', '513200', '阿坝', 'aba', '510000');
INSERT INTO `api_area` VALUES ('260', '513300', '甘孜', 'ganzi', '510000');
INSERT INTO `api_area` VALUES ('261', '513400', '凉山', 'liangshan', '510000');
INSERT INTO `api_area` VALUES ('262', '520100', '贵阳', 'guiyang', '520000');
INSERT INTO `api_area` VALUES ('263', '520200', '六盘水', 'liupanshui', '520000');
INSERT INTO `api_area` VALUES ('264', '520300', '遵义', 'zunyi', '520000');
INSERT INTO `api_area` VALUES ('265', '520400', '安顺', 'anshun', '520000');
INSERT INTO `api_area` VALUES ('266', '522200', '铜仁', 'tongren', '520000');
INSERT INTO `api_area` VALUES ('267', '522300', '黔西', 'qianxi', '520000');
INSERT INTO `api_area` VALUES ('268', '522400', '毕节', 'bijie', '520000');
INSERT INTO `api_area` VALUES ('269', '522600', '黔东', 'qiandong', '520000');
INSERT INTO `api_area` VALUES ('270', '522700', '黔南', 'qiannan', '520000');
INSERT INTO `api_area` VALUES ('271', '530100', '昆明', 'kunming', '530000');
INSERT INTO `api_area` VALUES ('272', '530300', '曲靖', 'qujing', '530000');
INSERT INTO `api_area` VALUES ('273', '530400', '玉溪', 'yuxi', '530000');
INSERT INTO `api_area` VALUES ('274', '530500', '保山', 'baoshan', '530000');
INSERT INTO `api_area` VALUES ('275', '530600', '昭通', 'zhaotong', '530000');
INSERT INTO `api_area` VALUES ('276', '530700', '丽江', 'lijiang', '530000');
INSERT INTO `api_area` VALUES ('277', '530800', '思茅', 'simao', '530000');
INSERT INTO `api_area` VALUES ('278', '530900', '临沧', 'lincang', '530000');
INSERT INTO `api_area` VALUES ('279', '532300', '楚雄', 'chuxiong', '530000');
INSERT INTO `api_area` VALUES ('280', '532500', '红河', 'honghe', '530000');
INSERT INTO `api_area` VALUES ('281', '532600', '文山', 'wenshan', '530000');
INSERT INTO `api_area` VALUES ('282', '532800', '西双版纳', 'xishuangbanna', '530000');
INSERT INTO `api_area` VALUES ('283', '532900', '大理', 'dali', '530000');
INSERT INTO `api_area` VALUES ('284', '533100', '德宏', 'dehong', '530000');
INSERT INTO `api_area` VALUES ('285', '533300', '怒江', 'nujiang', '530000');
INSERT INTO `api_area` VALUES ('286', '533400', '迪庆', 'diqing', '530000');
INSERT INTO `api_area` VALUES ('287', '540100', '拉萨', 'lasa', '540000');
INSERT INTO `api_area` VALUES ('288', '542100', '昌都', 'changdou', '540000');
INSERT INTO `api_area` VALUES ('289', '542200', '山南', 'shannan', '540000');
INSERT INTO `api_area` VALUES ('290', '542300', '日喀则', 'rikaze', '540000');
INSERT INTO `api_area` VALUES ('291', '542400', '那曲', 'neiqu', '540000');
INSERT INTO `api_area` VALUES ('292', '542500', '阿里', 'ali', '540000');
INSERT INTO `api_area` VALUES ('293', '542600', '林芝', 'linzhi', '540000');
INSERT INTO `api_area` VALUES ('294', '610100', '西安', 'xian', '610000');
INSERT INTO `api_area` VALUES ('295', '610200', '铜川', 'tongchuan', '610000');
INSERT INTO `api_area` VALUES ('296', '610300', '宝鸡', 'baoji', '610000');
INSERT INTO `api_area` VALUES ('297', '610400', '咸阳', 'xianyang', '610000');
INSERT INTO `api_area` VALUES ('298', '610500', '渭南', 'weinan', '610000');
INSERT INTO `api_area` VALUES ('299', '610600', '延安', 'yanan', '610000');
INSERT INTO `api_area` VALUES ('300', '610700', '汉中', 'hanzhong', '610000');
INSERT INTO `api_area` VALUES ('301', '610800', '榆林', 'yulin', '610000');
INSERT INTO `api_area` VALUES ('302', '610900', '安康', 'ankang', '610000');
INSERT INTO `api_area` VALUES ('303', '611000', '商洛', 'shangluo', '610000');
INSERT INTO `api_area` VALUES ('304', '620100', '兰州', 'lanzhou', '620000');
INSERT INTO `api_area` VALUES ('305', '620200', '嘉峪关', 'jiayuguan', '620000');
INSERT INTO `api_area` VALUES ('306', '620300', '金昌', 'jinchang', '620000');
INSERT INTO `api_area` VALUES ('307', '620400', '白银', 'baiyin', '620000');
INSERT INTO `api_area` VALUES ('308', '620500', '天水', 'tianshui', '620000');
INSERT INTO `api_area` VALUES ('309', '620600', '武威', 'wuwei', '620000');
INSERT INTO `api_area` VALUES ('310', '620700', '张掖', 'zhangye', '620000');
INSERT INTO `api_area` VALUES ('311', '620800', '平凉', 'pingliang', '620000');
INSERT INTO `api_area` VALUES ('312', '620900', '酒泉', 'jiuquan', '620000');
INSERT INTO `api_area` VALUES ('313', '621000', '庆阳', 'qingyang', '620000');
INSERT INTO `api_area` VALUES ('314', '621100', '定西', 'dingxi', '620000');
INSERT INTO `api_area` VALUES ('315', '621200', '陇南', 'longnan', '620000');
INSERT INTO `api_area` VALUES ('316', '622900', '临夏', 'linxia', '620000');
INSERT INTO `api_area` VALUES ('317', '623000', '甘南', 'gannan', '620000');
INSERT INTO `api_area` VALUES ('318', '630100', '西宁', 'xining', '630000');
INSERT INTO `api_area` VALUES ('319', '632100', '海东', 'haidong', '630000');
INSERT INTO `api_area` VALUES ('320', '632200', '海北', 'haibei', '630000');
INSERT INTO `api_area` VALUES ('321', '632300', '黄南', 'huangnan', '630000');
INSERT INTO `api_area` VALUES ('322', '632500', '海南', 'hainan', '630000');
INSERT INTO `api_area` VALUES ('323', '632600', '果洛', 'guoluo', '630000');
INSERT INTO `api_area` VALUES ('324', '632700', '玉树', 'yushu', '630000');
INSERT INTO `api_area` VALUES ('325', '632800', '海西', 'haixi', '630000');
INSERT INTO `api_area` VALUES ('326', '640100', '银川', 'yinchuan', '640000');
INSERT INTO `api_area` VALUES ('327', '640200', '石嘴山', 'shizuishan', '640000');
INSERT INTO `api_area` VALUES ('328', '640300', '吴忠', 'wuzhong', '640000');
INSERT INTO `api_area` VALUES ('329', '640400', '固原', 'guyuan', '640000');
INSERT INTO `api_area` VALUES ('330', '640500', '中卫', 'zhongwei', '640000');
INSERT INTO `api_area` VALUES ('331', '650100', '乌鲁木齐', 'wulumuqi', '650000');
INSERT INTO `api_area` VALUES ('332', '650200', '克拉玛依', 'kelamayi', '650000');
INSERT INTO `api_area` VALUES ('333', '652100', '吐鲁番', 'tulufan', '650000');
INSERT INTO `api_area` VALUES ('334', '652200', '哈密', 'hami', '650000');
INSERT INTO `api_area` VALUES ('335', '652300', '昌吉', 'changji', '650000');
INSERT INTO `api_area` VALUES ('336', '652700', '博尔塔拉', 'boertala', '650000');
INSERT INTO `api_area` VALUES ('337', '652800', '巴音郭楞', 'bayinguoleng', '650000');
INSERT INTO `api_area` VALUES ('338', '652900', '阿克苏', 'akesu', '650000');
INSERT INTO `api_area` VALUES ('339', '653000', '克孜勒苏柯尔克孜', 'kezilesukeerkezi', '650000');
INSERT INTO `api_area` VALUES ('340', '653100', '喀什', 'kashen', '650000');
INSERT INTO `api_area` VALUES ('341', '653200', '和田', 'hetian', '650000');
INSERT INTO `api_area` VALUES ('342', '654000', '伊犁哈萨克', 'yilihasake', '650000');
INSERT INTO `api_area` VALUES ('343', '654200', '塔城', 'tacheng', '650000');
INSERT INTO `api_area` VALUES ('344', '654300', '阿勒泰', 'aletai', '650000');
INSERT INTO `api_area` VALUES ('345', '659000', '省直辖行政单位', 'shengzhixiaxingzhengdanwei', '650000');
INSERT INTO `api_area` VALUES ('346', '120000', '天津', 'tianjin', '120000');
INSERT INTO `api_area` VALUES ('347', '100000', '北京', 'beijing', '100000');
INSERT INTO `api_area` VALUES ('505', '500000', '重庆', 'chongqin', '500000');
INSERT INTO `api_area` VALUES ('506', '990000', '国外', 'guowai', '990000');
INSERT INTO `api_area` VALUES ('507', '710000', '台湾', 'taiwan', '710000');
INSERT INTO `api_area` VALUES ('508', '810000', '香港', 'xiangguang', '810000');
INSERT INTO `api_area` VALUES ('509', '820000', '澳门', 'aomen', '820000');

-- ----------------------------
-- Table structure for `api_base_data`
-- ----------------------------
DROP TABLE IF EXISTS `api_base_data`;
CREATE TABLE `api_base_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL COMMENT '名称类型',
  `code` varchar(255) DEFAULT NULL COMMENT '代码',
  `name` varchar(255) DEFAULT NULL COMMENT '内容',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `STATUS` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=655 DEFAULT CHARSET=utf8 COMMENT='基础数据表';

-- ----------------------------
-- Records of api_base_data
-- ----------------------------
INSERT INTO `api_base_data` VALUES ('1', 'degree', 'A0001', '高中', '2015-06-11 14:05:16', '2017-06-23 11:26:22', '1');
INSERT INTO `api_base_data` VALUES ('2', 'degree', 'A0002', '大专', '2015-06-11 14:05:16', '2017-06-23 11:28:51', '1');
INSERT INTO `api_base_data` VALUES ('3', 'degree', 'A0003', '本科', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('4', 'degree', 'A0004', '硕士', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('5', 'degree', 'A0005', '博士', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('6', 'degree', 'A0006', '博士后', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('7', 'family', 'B0001', '高知', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('8', 'family', 'B0002', '高干', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('9', 'family', 'B0003', '富裕', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('10', 'family', 'B0004', '中产', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('11', 'family', 'B0005', '小康', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('12', 'family', 'B0006', '工薪', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('13', 'job', 'C0001', '职员', '2015-06-11 14:05:16', '2015-07-29 16:23:51', '1');
INSERT INTO `api_base_data` VALUES ('14', 'job', 'C0002', '主管', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('15', 'job', 'C0003', '经理', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('16', 'job', 'C0004', '总监', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('17', 'job', 'C0005', '副总', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('18', 'job', 'C0006', '总裁', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('19', 'job', 'C0007', '董事长', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('20', 'job', 'C0008', '其他', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '0');
INSERT INTO `api_base_data` VALUES ('21', 'car', 'D0001', '帕沙特', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('22', 'car', 'D0002', '凯美瑞', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('23', 'car', 'D0003', '奔驰C级', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('24', 'car', 'D0004', '奔驰E级', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('25', 'car', 'D0005', '宝马5系', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('26', 'car', 'D0006', '特斯拉', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('27', 'asset', 'G0000', '100万以下', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('31', 'industry', 'F0001', '计算机/互联网/通信/电子', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('32', 'industry', 'F0002', '会计/金融/银行/保险', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('33', 'industry', 'F0003', '贸易/消费/制造/营运', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('34', 'industry', 'F0004', '制药/医疗', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('35', 'industry', 'F0005', '广告/媒体', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('36', 'industry', 'F0006', '房地产/建筑', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('37', 'industry', 'F0007', '专业服务/教育/培训', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('38', 'industry', 'F0008', '服务业', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('39', 'industry', 'F0009', '物流/运输', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('40', 'industry', 'F0010', '能源/原材料', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('41', 'industry', 'F0011', '政府/非盈利机构/其他', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('42', 'asset', 'G0001', '100-500万', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('43', 'asset', 'G0002', '500-1000万', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('44', 'asset', 'G0003', '1000-5000万', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('45', 'asset', 'G0004', '5000万-1亿', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('46', 'asset', 'G0005', '1-5亿', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('47', 'asset', 'G0006', '5亿以上', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('49', 'marry', 'K0001', '未婚', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '0');
INSERT INTO `api_base_data` VALUES ('50', 'marry', 'K0002', '离异', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '0');
INSERT INTO `api_base_data` VALUES ('51', 'marry', 'K0003', '丧偶', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '0');
INSERT INTO `api_base_data` VALUES ('53', 'ownness', 'L0001', '征友进行中', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('54', 'ownness', 'L0002', '正在约会中', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('55', 'ownness', 'L0003', '找到意中人', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('56', 'MESSAGE', '2', '希望您能录制一份视频介绍自己', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('57', 'MESSAGE', '1', '您邀请的朋友#已成功注册并通认证，查看我的邀请记录。', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('58', 'MESSAGE', '3', '您的认证资料已经通过审核', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('59', 'MESSAGE', '4', '您收到一张赴约邀请函，立即前往查看。', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('60', 'MESSAGE', '5', '您购买的价值#元《#约会套餐》，已成功完成支付，若有疑问可致电 4000-520-029询问！查看订单详情', '2015-06-11 14:05:16', '2015-10-28 16:52:08', '1');
INSERT INTO `api_base_data` VALUES ('61', 'MESSAGE', '6', '您的余额发生改变，若您没有使用余额进行过支付。请致电4000-520-029。查看账户余额', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('62', 'MESSAGE', '7', '您获得一张价值980元的抵用券，查看详细。', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('63', 'MESSAGE', '8', '您的信誉心被减少，若有疑问请致电：4000-520-029。什么是信誉心?', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('64', 'MESSAGE', '12', '尊敬的#您好,缘分让你们彼此遇见。祝你们有个愉快的约会。#联系电话是#，请彼此保护对方联系方式。谢谢。', '2015-06-16 20:02:07', '2015-06-16 20:02:03', '1');
INSERT INTO `api_base_data` VALUES ('184', 'meal', 'N0001', '约会管家一对一情感沟通', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('185', 'meal', 'N0002', '约会管家专业牵线服务', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('186', 'meal', 'N0003', '约会技巧指导', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('187', 'meal', 'N0004', '约会结果反馈', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('188', 'meal', 'N0005', '五星级餐厅标准约会套餐一份', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('189', 'meal', 'N0006', '五星级餐厅高级约会套餐一份', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('190', 'meal', 'N0007', '赠送双人约会精美礼品', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('191', 'meal', 'N0008', '市区内专车双程接送服务（单人）', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('192', 'meal', 'N0009', '奢华五星级餐厅标准约会套餐一份', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('193', 'meal', 'N0010', '市区内高级专车双程接送服务（单人）', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('194', 'meal', 'N0011', '奢华五星级餐厅豪华约会套餐一份', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('195', 'meal', 'N0012', '高级鲜花一束', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('196', 'meal', 'N0014', '赠送双人约会高档礼品', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('197', 'meal', 'N0015', '市区内豪华专车双程接送服务（单人）', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('198', 'meal', 'N0013', '精美鲜花一束', '2015-06-11 14:05:16', '2015-06-11 14:05:16', '1');
INSERT INTO `api_base_data` VALUES ('200', 'identityMsg', '照片模糊', '您上传的照片过于模糊，请修改后再提交审核。', '2015-06-11 14:14:45', '2015-06-11 20:29:49', '1');
INSERT INTO `api_base_data` VALUES ('201', 'certMsg', '身份证不一致', '您提交的身份证与个人资料不匹配，请修改后再提交审核。', '2015-06-11 14:15:05', '2015-08-13 23:06:52', '1');
INSERT INTO `api_base_data` VALUES ('202', 'identityMsg', '资料不符合', '您的资料不符合我们的审核标准，请修改后再提交审核。', '2015-06-11 14:15:19', '2015-06-11 20:26:10', '1');
INSERT INTO `api_base_data` VALUES ('203', 'certMsg', '资产证明', '您提交的资产证明未达到审核标准，请修改后再提交审核。', '2015-06-11 14:15:38', '2015-07-09 20:28:47', '0');
INSERT INTO `api_base_data` VALUES ('204', 'certMsg', '婚姻证明', '您提交的婚姻证明未达到审核标准，请修改后再提交审核。', '2015-06-11 14:15:51', '2015-07-09 20:28:52', '0');
INSERT INTO `api_base_data` VALUES ('205', 'certMsg', '学历证明', '您提交的学历证明未达到审核标准，请修改后再提交审核。', '2015-06-11 14:16:07', '2015-07-09 20:28:57', '0');
INSERT INTO `api_base_data` VALUES ('206', 'certMsg', '职位证明', '您提交的职位证明未达到审核标准，请修改后再提交审核。', '2015-06-11 14:16:22', '2015-07-09 20:29:03', '1');
INSERT INTO `api_base_data` VALUES ('207', 'identityMsg', '照片非法', '您上传的照片含有法律不容许的内容，请修改后再提交审核。', '2015-06-11 20:20:03', '2015-06-11 20:30:14', '1');
INSERT INTO `api_base_data` VALUES ('208', 'videoMsg', '视频模糊', '您上传的视频过于模糊，请修改后再提交审核。', '2015-06-12 10:39:40', '2015-06-12 10:39:40', '1');
INSERT INTO `api_base_data` VALUES ('209', 'videoMsg', '没有出现本人', '您上传的视频没有出现本人，请修改后再提交审核。', '2015-06-12 10:40:14', '2015-06-23 11:50:39', '1');
INSERT INTO `api_base_data` VALUES ('210', 'apk_source', '1', '华为应用市场', '2015-06-26 11:27:08', '2015-06-26 11:27:11', '1');
INSERT INTO `api_base_data` VALUES ('211', 'apk_source', '2', '360手机助手', '2015-06-26 11:27:08', '2015-06-26 11:27:11', '1');
INSERT INTO `api_base_data` VALUES ('212', 'apk_source', '3', '应用宝', '2015-06-26 11:27:08', '2015-06-26 11:27:11', '1');
INSERT INTO `api_base_data` VALUES ('213', 'apk_source', '4', '豌豆荚', '2015-06-26 11:27:08', '2015-06-26 11:27:11', '1');
INSERT INTO `api_base_data` VALUES ('214', 'apk_source', '5', '小米', '2015-06-26 11:27:08', '2015-06-26 11:27:11', '1');
INSERT INTO `api_base_data` VALUES ('215', 'apk_source', '6', '百度助手', '2015-06-26 11:27:08', '2015-06-26 11:27:11', '1');
INSERT INTO `api_base_data` VALUES ('216', 'apk_source', '7', '91助手', '2015-06-26 11:27:08', '2015-06-26 11:27:11', '1');
INSERT INTO `api_base_data` VALUES ('217', 'apk_source', '8', '安卓市场', '2015-06-26 11:27:08', '2015-06-26 11:27:11', '1');
INSERT INTO `api_base_data` VALUES ('218', 'apk_source', '9', '自有平台', '2015-06-26 11:27:08', '2015-06-26 11:27:11', '1');
INSERT INTO `api_base_data` VALUES ('219', 'photoMsg', '照片模糊', '您上传的照片过于模糊，请修改后再提交审核。', '2015-07-09 17:28:12', '2015-07-09 20:30:04', '1');
INSERT INTO `api_base_data` VALUES ('220', 'inviteDatumMsg', 'JOB', '', '2015-07-09 19:14:14', '2015-07-09 19:14:14', '1');
INSERT INTO `api_base_data` VALUES ('221', 'inviteDatumMsg', 'ASSET', '', '2015-07-09 19:14:14', '2015-07-09 19:14:14', '1');
INSERT INTO `api_base_data` VALUES ('222', 'inviteDatumMsg', 'MARITAL', '', '2015-07-09 19:14:14', '2015-07-09 19:14:14', '1');
INSERT INTO `api_base_data` VALUES ('223', 'inviteDatumMsg', 'DEGREE', '', '2015-07-09 19:14:14', '2015-07-09 19:14:14', '1');
INSERT INTO `api_base_data` VALUES ('224', 'MESSAGE', '13', '邀请您提交职位证明，立即前往上传审核。', '2015-07-09 19:21:08', '2015-07-09 19:21:08', '1');
INSERT INTO `api_base_data` VALUES ('225', 'MESSAGE', '14', '邀请您提交资产证明，立即前往上传审核。', '2015-07-09 19:21:08', '2015-07-09 19:21:08', '1');
INSERT INTO `api_base_data` VALUES ('226', 'MESSAGE', '15', '邀请您提交婚姻证明，立即前往上传审核。', '2015-07-09 19:21:08', '2015-07-09 19:21:08', '1');
INSERT INTO `api_base_data` VALUES ('227', 'MESSAGE', '16', '邀请您提交学历证明，立即前往上传审核。', '2015-07-09 19:21:08', '2015-07-09 19:21:08', '1');
INSERT INTO `api_base_data` VALUES ('228', '', '照片非法', '您上传的照片含有法律不容许的内容，请修改后再提交审核。', '2015-07-09 20:30:28', '2015-07-09 20:30:28', '1');
INSERT INTO `api_base_data` VALUES ('229', 'photoMsg', '照片不标准', '您的照片不符合我们的审核标准，请修改后再提交审核。', '2015-07-09 20:31:03', '2015-07-09 20:31:48', '1');
INSERT INTO `api_base_data` VALUES ('230', 'photoMsg', '照片不标准', '您的照片不符合我们的审核标准，请修改后再提交审核。', '2015-07-09 20:32:16', '2015-07-09 20:32:16', '0');
INSERT INTO `api_base_data` VALUES ('231', 'photoMsg', '照片非法', '您上传的照片含有法律不容许的内容，请修改后再提交审核。', '2015-07-09 20:32:54', '2015-07-09 20:32:54', '1');
INSERT INTO `api_base_data` VALUES ('232', 'MESSAGE', '17', '关注了您,立即查看', '2015-07-14 11:38:35', '2015-07-14 11:38:35', '1');
INSERT INTO `api_base_data` VALUES ('233', 'activity', 'activity0716', '0716优惠券赠送', '2015-07-17 17:31:25', '2015-07-17 17:31:25', '1');
INSERT INTO `api_base_data` VALUES ('234', 'ticket', 'T0001', '现金券', '2015-07-20 17:51:35', '2015-07-20 17:51:35', '1');
INSERT INTO `api_base_data` VALUES ('235', 'ticket', 'T0002', '活动券', '2015-07-21 14:17:45', '2015-08-22 16:41:48', '1');
INSERT INTO `api_base_data` VALUES ('236', 'FEEDBACK', '1', '功能意见', '2015-07-28 15:30:17', '2015-07-29 17:14:08', '1');
INSERT INTO `api_base_data` VALUES ('237', 'job', 'C0008', '合伙人', '2015-07-29 16:24:14', '2015-07-29 16:24:14', '1');
INSERT INTO `api_base_data` VALUES ('238', 'job', 'C0009', '首席执行官', '2015-07-29 16:25:36', '2015-07-29 16:26:11', '1');
INSERT INTO `api_base_data` VALUES ('239', 'FEEDBACK', '2', '牵线服务', '2015-07-29 17:13:39', '2015-07-29 17:15:12', '1');
INSERT INTO `api_base_data` VALUES ('240', 'FEEDBACK', '3', '你的新需求', '2015-07-29 17:14:29', '2015-07-29 17:14:29', '1');
INSERT INTO `api_base_data` VALUES ('241', 'FEEDBACK', '4', '操作意见', '2015-07-29 17:14:48', '2015-07-29 17:14:48', '1');
INSERT INTO `api_base_data` VALUES ('242', 'FEEDBACK', '5', '其他', '2015-07-29 17:14:58', '2015-07-29 17:14:58', '1');
INSERT INTO `api_base_data` VALUES ('243', 'complain', '1', '虚假资料', '2015-07-31 16:38:13', '2015-07-31 17:45:48', '1');
INSERT INTO `api_base_data` VALUES ('244', 'complain', '2', '各种托', '2015-07-31 16:38:36', '2015-07-31 16:38:36', '1');
INSERT INTO `api_base_data` VALUES ('245', 'complain', '1', '虚假资料', '2015-07-31 17:39:59', '2015-07-31 17:39:59', '0');
INSERT INTO `api_base_data` VALUES ('246', 'complain', '3', '婚介', '2015-07-31 17:40:29', '2015-07-31 17:40:29', '1');
INSERT INTO `api_base_data` VALUES ('247', 'complain', '4', '色情交易', '2015-07-31 17:41:24', '2015-07-31 17:41:24', '1');
INSERT INTO `api_base_data` VALUES ('248', 'complain', '5', '发广告', '2015-07-31 17:41:38', '2015-07-31 17:41:38', '1');
INSERT INTO `api_base_data` VALUES ('249', 'complain', '6', '已婚', '2015-07-31 17:41:50', '2015-07-31 17:41:50', '1');
INSERT INTO `api_base_data` VALUES ('250', 'complain', '7', '恶意中伤', '2015-07-31 17:42:04', '2015-07-31 17:42:04', '1');
INSERT INTO `api_base_data` VALUES ('251', 'complain', '8', '借钱', '2015-07-31 17:42:13', '2015-07-31 17:42:13', '1');
INSERT INTO `api_base_data` VALUES ('252', 'complain', '9', '其他', '2015-07-31 17:42:23', '2015-07-31 17:42:23', '1');
INSERT INTO `api_base_data` VALUES ('262', 'contentEdit', 'help', '帮助', '2015-08-07 14:31:49', '2015-08-07 14:31:49', '1');
INSERT INTO `api_base_data` VALUES ('263', 'contentEdit', 'about', '关于我们', '2015-08-07 14:31:49', '2015-08-07 14:31:49', '1');
INSERT INTO `api_base_data` VALUES ('264', 'contentEdit', 'contact', '联系我们', '2015-08-07 14:31:49', '2015-08-07 14:31:49', '1');
INSERT INTO `api_base_data` VALUES ('265', 'certMsg', '身份证证明', '您提交的身份证未达到审核标准，请修改后再提交审核', '2015-08-11 14:33:44', '2015-08-11 14:33:44', '1');
INSERT INTO `api_base_data` VALUES ('266', 'firstConsume', 'validDays', '15', '2015-08-18 17:54:19', '2015-08-18 17:54:19', '1');
INSERT INTO `api_base_data` VALUES ('267', 'firstConsume', 'valid', '0', '2015-08-18 17:55:01', '2016-02-18 16:05:24', '1');
INSERT INTO `api_base_data` VALUES ('268', 'activityStatus', '1', '进行中', '2015-08-22 18:54:30', '2015-08-22 18:54:30', '1');
INSERT INTO `api_base_data` VALUES ('269', 'activityStatus', '2', '未开始', '2015-08-22 18:54:45', '2015-08-22 18:54:45', '0');
INSERT INTO `api_base_data` VALUES ('270', 'activityStatus', '3', '已结束', '2015-08-22 18:55:03', '2015-08-22 18:55:03', '1');
INSERT INTO `api_base_data` VALUES ('271', 'interactionMessage', '200', '您收到了一个约会邀请，立即前往查看。', '2015-08-28 18:18:05', '2015-08-28 18:18:05', '1');
INSERT INTO `api_base_data` VALUES ('272', 'interactionMessage', '201', '您收到了一个约会邀请，打开APP立即查收。', '2015-08-28 18:18:05', '2015-08-28 18:18:05', '1');
INSERT INTO `api_base_data` VALUES ('273', 'mouthSalary', '1', '5000~8000', '2015-09-17 15:06:52', '2015-09-17 15:06:52', '1');
INSERT INTO `api_base_data` VALUES ('274', 'mouthSalary', '2', '8000~15000', '2015-09-17 15:06:53', '2015-09-17 15:06:53', '1');
INSERT INTO `api_base_data` VALUES ('275', 'mouthSalary', '3', '15000~30000', '2015-09-17 15:06:53', '2015-09-17 15:06:53', '1');
INSERT INTO `api_base_data` VALUES ('276', 'mouthSalary', '4', '30000~50000', '2015-09-17 15:06:53', '2015-09-17 15:06:53', '1');
INSERT INTO `api_base_data` VALUES ('277', 'mouthSalary', '5', '50000以上', '2015-09-17 15:06:53', '2015-09-17 15:06:53', '1');
INSERT INTO `api_base_data` VALUES ('278', 'sign', '1', '我知道你喜欢有丰富阅历的人，因为你跟我一样，对生活有很深的感悟，一双火眼金睛能洞悉人间万象。', '2015-09-17 15:20:06', '2015-09-23 12:33:32', '1');
INSERT INTO `api_base_data` VALUES ('279', 'sign', '2', '直到现在这个年龄，我才真正懂得生活的真正含义：平平淡淡最真。很庆幸，在懂得这个道理之前，我没有轻易把自己交给别人。', '2015-09-17 15:20:17', '2015-09-23 12:33:42', '1');
INSERT INTO `api_base_data` VALUES ('280', 'sign', '3', '房子，有！车子，有！资产，有！内涵，有！担当，有！\r\n   老婆，没有没有没有！', '2015-09-21 10:10:36', '2015-09-23 12:34:03', '1');
INSERT INTO `api_base_data` VALUES ('281', 'sign', '4', '自我介绍一下，岁数已经不小，蹉跎中练就一身生存技能，也算一个有公司、有股票、有学位的&ldquo;伪精英&rdquo;。性格OPEN，人品五五开，总体而言属于对人群对社会有益无害的一类。', '2015-09-21 10:12:24', '2015-09-23 12:34:16', '1');
INSERT INTO `api_base_data` VALUES ('282', 'sign', '5', '我是一只生于70年代的猪。最善良率真的牡羊座。热情积极的0型血。以生活润泽事业，以旅行纪录生活。喜好各类新鲜玩意儿，当然，感情除外~', '2015-09-21 10:20:47', '2015-09-23 12:34:28', '1');
INSERT INTO `api_base_data` VALUES ('283', 'sign', '6', '我是个傻逼吗?', '2015-09-22 21:52:41', '2015-09-23 13:51:39', '1');
INSERT INTO `api_base_data` VALUES ('284', 'sign', '7', '我真的不是傻逼吧? 不要骗我', '2015-09-22 21:54:09', '2015-09-23 13:51:43', '1');
INSERT INTO `api_base_data` VALUES ('285', 'sign', '8', '是房价快速的回款粉红色福建客户说地方的身份和空间的十分，反对数据库和房价快速的恢复快递师傅。', '2015-09-23 10:18:47', '2015-09-23 13:51:51', '1');
INSERT INTO `api_base_data` VALUES ('286', 'MESSAGE', '25', '邀请您提交身份证明，立即前往上传审核。', '2015-09-23 16:21:50', '2015-09-23 16:21:50', '1');
INSERT INTO `api_base_data` VALUES ('290', '', '12', '! @ # $%^&amp;*()_+||&lt;&gt; &quot; &#39;', '2015-09-25 11:17:23', '2015-09-25 11:17:23', '1');
INSERT INTO `api_base_data` VALUES ('298', 'promotionFlag', '1', '1', '2015-10-14 17:45:35', '2015-10-15 12:10:26', '1');
INSERT INTO `api_base_data` VALUES ('304', 'smsChannel', '3', '创蓝短信平台', '2015-10-28 10:19:47', '2015-10-28 10:19:47', '0');
INSERT INTO `api_base_data` VALUES ('305', 'MESSAGE', '30', '易约号：# 向您发起了约会，您可登录\"易约APP->我的约会->约我的\"进行查看。', '2015-11-02 18:15:08', '2015-11-02 18:15:08', '1');
INSERT INTO `api_base_data` VALUES ('340', 'smsChannel', '9999', '互亿短信平台', '2015-10-22 14:15:30', '2017-08-04 17:36:07', '1');
INSERT INTO `api_base_data` VALUES ('346', 'smsNotice', '5', '支付成功', '2015-11-03 15:02:03', '2015-11-03 15:02:03', '1');
INSERT INTO `api_base_data` VALUES ('347', 'smsNotice', '12', '发送消费码', '2015-11-03 15:02:17', '2015-11-03 15:02:17', '1');
INSERT INTO `api_base_data` VALUES ('348', 'smsNotice', '12', '认证拒绝', '2015-11-03 15:02:28', '2015-11-03 15:02:28', '1');
INSERT INTO `api_base_data` VALUES ('349', 'smsNotice', '20', '互动消息回应', '2015-11-03 15:03:42', '2015-11-03 15:04:52', '0');
INSERT INTO `api_base_data` VALUES ('350', 'smsNotice', '30', '约会通知', '2015-11-03 15:04:07', '2015-11-03 15:04:07', '1');
INSERT INTO `api_base_data` VALUES ('368', 'pushNotice', '1', '为成功邀请注册', '2015-11-03 15:06:37', '2015-11-03 15:06:37', '0');
INSERT INTO `api_base_data` VALUES ('369', 'pushNotice', '2', '为视频邀请', '2015-11-03 15:06:37', '2015-11-03 15:06:37', '0');
INSERT INTO `api_base_data` VALUES ('370', 'pushNotice', '3', '用户审核通过-userInfo', '2015-11-03 15:06:37', '2017-09-26 11:44:48', '1');
INSERT INTO `api_base_data` VALUES ('371', 'pushNotice', '4', '为赴约邀请', '2015-11-03 15:06:37', '2015-11-03 15:06:37', '0');
INSERT INTO `api_base_data` VALUES ('372', 'pushNotice', '5', '为支付成功', '2015-11-03 15:06:37', '2015-11-03 15:06:37', '0');
INSERT INTO `api_base_data` VALUES ('373', 'pushNotice', '6', '为余额变更', '2015-11-03 15:06:37', '2015-11-03 15:06:37', '0');
INSERT INTO `api_base_data` VALUES ('374', 'pushNotice', '7', '抵用券变更', '2015-11-03 15:06:37', '2015-11-24 14:02:43', '0');
INSERT INTO `api_base_data` VALUES ('375', 'pushNotice', '8', '为信誉星减少', '2015-11-03 15:06:37', '2015-11-03 15:06:37', '0');
INSERT INTO `api_base_data` VALUES ('376', 'pushNotice', '9', '用户审核拒绝', '2015-11-03 15:06:37', '2017-09-26 11:44:57', '1');
INSERT INTO `api_base_data` VALUES ('377', 'pushNotice', '10', '用户资料审核通过-base', '2015-11-03 15:06:37', '2017-09-26 10:54:13', '1');
INSERT INTO `api_base_data` VALUES ('378', 'pushNotice', '11', '用户资料审核退回-base', '2015-11-03 15:06:37', '2017-09-26 10:54:19', '1');
INSERT INTO `api_base_data` VALUES ('379', 'pushNotice', '13', '邀请上传职位', '2015-11-03 15:06:37', '2015-11-03 15:06:37', '0');
INSERT INTO `api_base_data` VALUES ('380', 'pushNotice', '14', '邀请上传资产', '2015-11-03 15:06:37', '2015-11-03 15:06:37', '0');
INSERT INTO `api_base_data` VALUES ('381', 'pushNotice', '15', '邀请上传婚姻', '2015-11-03 15:06:37', '2015-11-03 15:06:37', '0');
INSERT INTO `api_base_data` VALUES ('382', 'pushNotice', '16', '邀请上传学历', '2015-11-03 15:06:37', '2015-11-03 15:06:37', '0');
INSERT INTO `api_base_data` VALUES ('383', 'pushNotice', '17', '被关注', '2015-11-03 15:06:37', '2015-11-03 15:06:37', '1');
INSERT INTO `api_base_data` VALUES ('384', 'pushNotice', '18', '反馈推送', '2015-11-03 15:06:37', '2015-11-03 15:06:37', '0');
INSERT INTO `api_base_data` VALUES ('385', 'pushNotice', '50', '活动支付成功(活动)-mySignUp', '2015-11-03 15:06:37', '2017-09-26 10:54:30', '1');
INSERT INTO `api_base_data` VALUES ('386', 'pushNotice', '20', '为邀请约会回应', '2015-11-03 15:06:37', '2015-11-03 15:06:37', '0');
INSERT INTO `api_base_data` VALUES ('387', 'pushNotice', '25', '邀请上传身份证', '2015-11-03 15:06:37', '2015-11-03 15:06:37', '0');
INSERT INTO `api_base_data` VALUES ('388', 'pushNotice', '30', '被下单人收到通知（订单-约我的）', '2015-11-03 15:06:37', '2016-01-23 17:33:05', '0');
INSERT INTO `api_base_data` VALUES ('389', 'smsNotice', '300', '验证码，忘记密码', '2015-11-03 17:25:30', '2015-11-03 17:28:17', '1');
INSERT INTO `api_base_data` VALUES ('390', 'marry', 'K0004', '单身', '2015-11-09 17:36:58', '2015-11-09 17:36:58', '1');
INSERT INTO `api_base_data` VALUES ('391', 'marry', 'K0004', '保密', '2015-11-09 17:37:14', '2015-11-09 17:37:14', '1');
INSERT INTO `api_base_data` VALUES ('392', 'pushNotice', '111', '用户视频审核退回', '2015-11-09 18:01:01', '2015-11-09 18:01:01', '0');
INSERT INTO `api_base_data` VALUES ('393', 'pushNotice', '110', '用户视频审核通过', '2015-11-09 18:01:26', '2015-11-09 18:01:26', '0');
INSERT INTO `api_base_data` VALUES ('394', 'pushNotice', '121', '用户相册审核退回', '2015-11-09 18:01:46', '2015-11-09 18:01:46', '0');
INSERT INTO `api_base_data` VALUES ('395', 'pushNotice', '120', '用户相册审核通过', '2015-11-09 18:02:00', '2015-11-09 18:02:00', '0');
INSERT INTO `api_base_data` VALUES ('396', 'pushNotice', '131', '用户个人介绍审核退回', '2015-11-12 15:00:51', '2015-11-12 15:01:15', '0');
INSERT INTO `api_base_data` VALUES ('397', 'pushNotice', '130', '用户个人介绍审核通过', '2015-11-12 15:01:06', '2015-11-12 15:01:31', '0');
INSERT INTO `api_base_data` VALUES ('398', 'pushNotice', '31', '邀请函', '2015-11-13 18:06:12', '2015-11-13 18:06:12', '0');
INSERT INTO `api_base_data` VALUES ('399', 'pushNotice', '210', '抵用券变更', '2015-11-13 18:06:43', '2015-11-24 14:02:25', '0');
INSERT INTO `api_base_data` VALUES ('400', 'datingTopic', '1', '吃饭', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('401', 'datingTopic', '2', '唱歌', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('402', 'datingTopic', '3', '电影', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('403', 'datingTopic', '4', '运动', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('404', 'datingTopic', '5', '喝咖啡', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('405', 'datingTopic', '6', '其他', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('406', 'interestTabs', '1', '运动', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('407', 'interestTabs', '2', '唱歌', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('408', 'interestTabs', '3', '电影', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('409', 'interestTabs', '4', '书画', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('410', 'interestTabs', '5', '阅读', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('411', 'interestTabs', '6', '旅游', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('412', 'interestTabs', '7', '购物', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('413', 'interestTabs', '8', '摄影', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('414', 'interestTabs', '9', '泡吧', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('415', 'interestTabs', '10', '烹饪', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('416', 'interestTabs', '11', '跳舞', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('417', 'interestTabs', '12', '聚会', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('418', 'interestTabs', '13', '养宠物', '2015-11-17 17:47:07', '2015-11-17 17:47:07', '1');
INSERT INTO `api_base_data` VALUES ('419', 'interestTabs', '14', '养花草', '2015-11-17 17:47:08', '2015-11-17 17:47:08', '1');
INSERT INTO `api_base_data` VALUES ('420', 'interestTabs', '15', '陶艺', '2015-11-17 17:47:08', '2015-11-17 17:47:08', '1');
INSERT INTO `api_base_data` VALUES ('421', 'interestTabs', '16', '极限运动', '2015-11-17 17:47:08', '2015-11-17 17:47:08', '1');
INSERT INTO `api_base_data` VALUES ('422', 'interestTabs', '17', '名品收藏', '2015-11-17 17:47:08', '2015-11-17 17:47:08', '1');
INSERT INTO `api_base_data` VALUES ('423', 'interestTabs', '18', '茶艺', '2015-11-17 17:47:08', '2015-11-17 17:47:08', '1');
INSERT INTO `api_base_data` VALUES ('424', 'interestTabs', '19', '烘焙', '2015-11-17 17:47:08', '2015-11-17 17:47:08', '1');
INSERT INTO `api_base_data` VALUES ('425', 'interestTabs', '20', '打高尔夫', '2015-11-17 17:47:08', '2015-11-17 17:47:08', '1');
INSERT INTO `api_base_data` VALUES ('426', 'givenType', 'M001', '资料完善，很细心', '2015-11-18 16:39:01', '2015-11-18 16:39:01', '1');
INSERT INTO `api_base_data` VALUES ('427', 'givenType', 'M002', '照片漂亮，颜值高', '2015-11-18 16:39:27', '2015-11-18 16:39:27', '1');
INSERT INTO `api_base_data` VALUES ('428', 'givenType', 'M003', '视频展示，很真实', '2015-11-18 16:39:50', '2015-11-18 16:39:50', '1');
INSERT INTO `api_base_data` VALUES ('429', 'smsNotice', '31', '邀请函', '2015-11-23 16:09:10', '2015-11-23 16:09:10', '1');
INSERT INTO `api_base_data` VALUES ('430', 'smsNotice', '32', '排行榜奖品发送通知', '2015-11-23 16:36:56', '2015-11-23 16:36:56', '0');
INSERT INTO `api_base_data` VALUES ('431', 'smsNotice', '33', '发送约会提醒信息', '2015-11-23 16:37:25', '2015-11-23 16:37:25', '1');
INSERT INTO `api_base_data` VALUES ('432', 'smsNotice', '34', '注册通过赠送抵用用通知', '2015-11-23 16:49:02', '2015-11-23 16:49:02', '1');
INSERT INTO `api_base_data` VALUES ('433', 'pushNotice', '32', '排行榜奖品发送通知', '2015-11-23 16:49:59', '2015-11-23 16:49:59', '0');
INSERT INTO `api_base_data` VALUES ('434', 'pushNotice', '33', '发送约会提醒信息', '2015-11-23 16:50:20', '2015-11-23 16:50:20', '0');
INSERT INTO `api_base_data` VALUES ('435', 'pushNotice', '34', '注册通过赠送抵用用通知', '2015-11-23 16:50:35', '2015-11-23 16:50:35', '0');
INSERT INTO `api_base_data` VALUES ('436', 'pushNotice', '51', '打赏推送', '2015-11-24 13:48:39', '2015-11-24 13:48:39', '0');
INSERT INTO `api_base_data` VALUES ('437', 'pushNotice', '52', '邀请记录(人脉）', '2015-11-24 16:19:35', '2016-01-18 16:51:54', '1');
INSERT INTO `api_base_data` VALUES ('438', 'pushNotice', '53', '总赞数变更（随感点赞）', '2015-12-15 11:19:21', '2016-04-29 19:25:41', '1');
INSERT INTO `api_base_data` VALUES ('439', 'vipType', '1', '金卡会籍 10000元/年', '2015-12-16 14:03:37', '2015-12-16 14:03:37', '1');
INSERT INTO `api_base_data` VALUES ('440', 'vipType', '2', '铂金会籍 28000元/年', '2015-12-16 14:03:37', '2015-12-16 14:03:37', '1');
INSERT INTO `api_base_data` VALUES ('441', 'vipType', '3', '黑金会籍 100000元/年', '2015-12-16 14:03:37', '2015-12-16 14:03:37', '1');
INSERT INTO `api_base_data` VALUES ('442', 'vipType', '4', '私人订制', '2015-12-16 14:03:37', '2015-12-16 14:03:37', '1');
INSERT INTO `api_base_data` VALUES ('443', 'payChannel', 'IAP', 'APP应用内购', '2015-12-29 11:10:40', '2015-12-29 11:10:40', '0');
INSERT INTO `api_base_data` VALUES ('444', 'payChannel', 'OTHER', '微信，银联支付', '2015-12-29 11:11:02', '2015-12-29 11:11:02', '0');
INSERT INTO `api_base_data` VALUES ('445', 'iosVersion', '3.0.2', 'IAP支付版本：3.0.0', '2015-12-29 14:12:01', '2016-03-25 14:25:48', '0');
INSERT INTO `api_base_data` VALUES ('446', 'pushNotice', '1000', '私信', '2016-01-09 11:45:11', '2016-01-09 11:45:11', '0');
INSERT INTO `api_base_data` VALUES ('447', 'sayGood', 'ON', '点赞开关 ON/OFF', '2016-01-14 18:00:22', '2016-01-14 18:00:22', '1');
INSERT INTO `api_base_data` VALUES ('448', 'officialNickname', '易悦官方帐号', '易悦官方帐号', '2016-01-17 18:19:47', '2016-05-05 11:28:25', '1');
INSERT INTO `api_base_data` VALUES ('449', 'customerService', '1913', '易悦官方帐号', '2016-01-18 15:25:12', '2016-05-05 11:33:44', '1');
INSERT INTO `api_base_data` VALUES ('450', 'pushNotice', '1001', '客服群发私信', '2016-01-19 14:17:23', '2016-01-19 14:17:23', '0');
INSERT INTO `api_base_data` VALUES ('451', 'pushNotice', '54', '商品兑换成功', '2016-01-23 16:30:21', '2016-01-23 16:30:21', '0');
INSERT INTO `api_base_data` VALUES ('452', 'historyMomentSayGood', 'ON', 'ON/OFF', '2016-01-25 19:17:26', '2016-01-27 11:28:09', '1');
INSERT INTO `api_base_data` VALUES ('453', 'momentInterval', '2', '随感提醒间隔时间（单位为分钟）', '2016-01-27 20:22:37', '2016-04-05 18:19:42', '1');
INSERT INTO `api_base_data` VALUES ('454', 'iosVersion', '3.0.0', '已上架版本号开关', '2016-02-19 11:37:25', '2016-02-22 11:23:20', '0');
INSERT INTO `api_base_data` VALUES ('455', 'iosForceUpdateVersion', '3.0.2', '全部更新到最新的3.0.2', '2016-03-10 12:11:18', '2016-03-10 14:17:43', '1');
INSERT INTO `api_base_data` VALUES ('456', 'iosVersion', '3.0.2', '呵呵', '2016-03-10 17:12:15', '2016-03-10 17:12:15', '0');
INSERT INTO `api_base_data` VALUES ('457', 'customerServiceCode', '40001913', '易悦官方帐号', '2016-03-28 15:16:43', '2017-09-28 22:25:25', '1');
INSERT INTO `api_base_data` VALUES ('458', 'privateLetterChannel', 'EASEMOD', 'PUSH(推送)/EASEMOD(环信)', '2016-03-28 17:28:49', '2016-03-30 22:06:35', '1');
INSERT INTO `api_base_data` VALUES ('459', 'iosVersion', '3.0.2', 'a', '2016-03-31 15:58:45', '2016-03-31 15:59:25', '0');
INSERT INTO `api_base_data` VALUES ('460', 'iosVersion', '3.0.2', 'a', '2016-03-31 20:28:16', '2016-03-31 20:28:16', '0');
INSERT INTO `api_base_data` VALUES ('461', 'iosVersion', '3.0.2', 'a', '2016-03-31 21:04:44', '2016-03-31 21:04:44', '0');
INSERT INTO `api_base_data` VALUES ('462', 'iosVersion', '3.0.3', '新增环信即时聊天框架', '2016-04-01 15:47:12', '2016-04-01 15:47:12', '0');
INSERT INTO `api_base_data` VALUES ('463', 'momentType', '1', '颜值', '2016-04-11 15:31:08', '2016-04-11 15:31:08', '1');
INSERT INTO `api_base_data` VALUES ('464', 'momentType', '2', '运动', '2016-04-11 15:31:25', '2016-04-11 15:31:25', '1');
INSERT INTO `api_base_data` VALUES ('465', 'momentType', '3', '旅行', '2016-04-11 15:31:45', '2016-04-11 15:31:45', '1');
INSERT INTO `api_base_data` VALUES ('466', 'momentType', '4', '美食', '2016-04-11 15:31:58', '2016-04-11 15:31:58', '1');
INSERT INTO `api_base_data` VALUES ('467', 'activityType', '派对', '派对', '2016-04-13 14:38:21', '2016-04-22 17:52:37', '1');
INSERT INTO `api_base_data` VALUES ('468', 'activityType', '玩乐', '玩乐', '2016-04-13 14:38:39', '2016-04-13 14:38:39', '1');
INSERT INTO `api_base_data` VALUES ('469', 'activityType', '会所', '会所', '2016-04-13 14:38:54', '2016-05-17 15:20:45', '1');
INSERT INTO `api_base_data` VALUES ('470', 'iosVersion', '3.1.0', '测试', '2016-04-22 10:47:21', '2016-04-22 10:47:21', '0');
INSERT INTO `api_base_data` VALUES ('471', 'activityType', '兴趣', '兴趣', '2016-04-22 16:41:27', '2016-04-22 17:53:27', '1');
INSERT INTO `api_base_data` VALUES ('472', 'iosVersion', '3.1.0', '2016.04.29 UI全新改版', '2016-04-29 11:23:44', '2016-04-29 11:23:44', '0');
INSERT INTO `api_base_data` VALUES ('473', 'pushNotice', '55', '随感点赞', '2016-04-29 19:21:35', '2016-04-29 19:21:56', '1');
INSERT INTO `api_base_data` VALUES ('474', 'pushNotice', '56', '专题点赞', '2016-04-29 19:22:21', '2016-04-29 19:22:21', '1');
INSERT INTO `api_base_data` VALUES ('475', 'pushNotice', '57', '礼物提醒-giftMessage', '2016-04-29 19:23:25', '2017-09-20 16:05:29', '1');
INSERT INTO `api_base_data` VALUES ('476', 'pushNotice', '58', '易元记录-diamondRecord', '2016-04-29 19:24:30', '2017-09-26 10:52:51', '1');
INSERT INTO `api_base_data` VALUES ('477', 'pushNotice', '122', '专题随感审核通过通知关注该专题的用户', '2016-04-29 19:37:27', '2016-04-29 19:37:27', '0');
INSERT INTO `api_base_data` VALUES ('478', 'pushNotice', '123', '关注的人发随感通知-userSub', '2016-04-29 19:37:47', '2017-09-26 10:52:31', '1');
INSERT INTO `api_base_data` VALUES ('479', 'welcomeMessage', '1', 'haha~,欢迎来到易悦！我是您的贴身助手-小易。你的生活多姿多彩，发照片一定有很多人给你点赞呢！赞数可以兑换成钻石，钻石就可以免费参加各种高端趴。心动不如行动，点击底部相机来一张呗~有任何问题，都可以向我反馈哦。', '2016-05-05 11:58:06', '2016-05-05 15:17:28', '1');
INSERT INTO `api_base_data` VALUES ('480', 'clubLabel', '商务会议', '商务会议', '2016-06-04 17:18:12', '2016-06-08 18:35:00', '1');
INSERT INTO `api_base_data` VALUES ('481', 'clubLabel', '私人聚会', '私人聚会', '2016-06-04 17:21:23', '2016-06-08 18:35:15', '1');
INSERT INTO `api_base_data` VALUES ('482', 'clubLabel', '休闲度假', '休闲度假', '2016-06-04 17:21:39', '2016-06-08 18:35:34', '1');
INSERT INTO `api_base_data` VALUES ('483', 'clubLabel', '生日派对', '生日派对', '2016-06-07 19:36:03', '2016-06-08 18:35:57', '1');
INSERT INTO `api_base_data` VALUES ('484', 'clubLabel', 'BB', 'BB', '2016-06-07 19:36:17', '2016-06-07 19:36:17', '1');
INSERT INTO `api_base_data` VALUES ('485', 'clubLabel', 'CCC', 'CCC', '2016-06-07 19:36:25', '2016-06-07 19:36:25', '1');
INSERT INTO `api_base_data` VALUES ('486', 'clubLabel', 'DDDD', 'DDDD', '2016-06-07 19:36:33', '2016-06-07 19:36:33', '1');
INSERT INTO `api_base_data` VALUES ('487', 'clubLabel', 'EEEEE', 'EEEEE', '2016-06-07 19:36:42', '2016-06-07 19:36:42', '1');
INSERT INTO `api_base_data` VALUES ('488', 'clubLabel', 'FFFFFF', 'FFFFFF', '2016-06-07 19:36:55', '2016-06-07 19:36:55', '1');
INSERT INTO `api_base_data` VALUES ('489', 'clubLabel', 'GGGGGGG', 'GGGGGGG', '2016-06-07 19:37:07', '2016-06-07 19:37:07', '1');
INSERT INTO `api_base_data` VALUES ('490', 'pushNotice', '59', '我的会所预约', '2016-06-08 15:06:47', '2016-06-08 15:06:47', '0');
INSERT INTO `api_base_data` VALUES ('491', 'pushNotice', '60', '回复我的评论', '2016-06-22 11:47:48', '2016-06-22 11:47:48', '1');
INSERT INTO `api_base_data` VALUES ('492', 'iosVersion', '3.1.1', '3.1.1测试', '2016-06-22 16:17:27', '2016-06-22 16:17:27', '0');
INSERT INTO `api_base_data` VALUES ('493', 'iosVersion', '3.1.2', '垃圾水电费', '2016-06-23 10:47:38', '2016-06-23 10:47:38', '0');
INSERT INTO `api_base_data` VALUES ('494', 'iosVersion', '3.1.3', '3.1.3', '2016-06-24 15:57:49', '2016-06-24 15:57:49', '0');
INSERT INTO `api_base_data` VALUES ('495', 'iosVersion', '3.1.3', 'sffsdf', '2016-06-27 19:39:20', '2016-06-27 19:39:20', '0');
INSERT INTO `api_base_data` VALUES ('496', 'iosVersion', '3.1.5', '3.1.5', '2016-07-22 16:27:47', '2016-07-22 16:27:47', '0');
INSERT INTO `api_base_data` VALUES ('497', 'iosVersion', '3.1.5', '3.1.5', '2016-07-22 16:27:55', '2016-07-22 16:27:55', '0');
INSERT INTO `api_base_data` VALUES ('498', 'iosVersion', '3.1.5', '3.1.5', '2016-07-22 16:28:03', '2016-07-22 16:28:03', '0');
INSERT INTO `api_base_data` VALUES ('499', 'iosVersion', '3.1.5', '3.1.5', '2016-07-22 16:29:02', '2016-07-22 16:29:02', '0');
INSERT INTO `api_base_data` VALUES ('500', 'iosVersion', '3.1.5', '3.1.5', '2016-07-22 16:30:47', '2016-07-22 16:30:47', '0');
INSERT INTO `api_base_data` VALUES ('501', 'iosVersion', '3.1.5', '3.1.5', '2016-07-22 16:32:55', '2016-07-22 16:32:55', '0');
INSERT INTO `api_base_data` VALUES ('502', 'marry', 'K0004', '已婚', '2016-08-18 14:30:16', '2016-08-18 14:30:16', '1');
INSERT INTO `api_base_data` VALUES ('503', 'iosVersion', '3.1.7', 'kjlfjsd', '2016-08-24 19:52:49', '2016-08-24 19:52:49', '0');
INSERT INTO `api_base_data` VALUES ('504', 'iosVersion', '3.1.9', 'aaaa', '2016-09-06 10:53:02', '2016-09-06 10:53:02', '0');
INSERT INTO `api_base_data` VALUES ('505', 'iosVersion', '3.1.9', 'aaa', '2016-09-06 16:12:29', '2016-09-06 16:12:29', '0');
INSERT INTO `api_base_data` VALUES ('506', 'pushNotice', '124', '关注的人喜欢/报名活动-myDynamics', '2016-09-09 15:06:44', '2017-09-26 15:30:19', '1');
INSERT INTO `api_base_data` VALUES ('507', 'isNeedSendVip', '1', '赠送vip', '2016-09-19 16:33:49', '2016-09-19 16:33:49', '0');
INSERT INTO `api_base_data` VALUES ('508', 'weixinName', '1', 'appWeixinhao', '2016-09-29 10:11:13', '2016-09-30 10:53:57', '1');
INSERT INTO `api_base_data` VALUES ('509', 'withdrawCost', '0.15', '15%', '2016-09-30 10:53:25', '2016-09-30 11:20:16', '1');
INSERT INTO `api_base_data` VALUES ('510', 'pushNoticeAlert', '9', '审核拒绝', '2016-10-31 11:59:46', '2016-10-31 11:59:46', '1');
INSERT INTO `api_base_data` VALUES ('511', 'pushNoticeAlert', '61', '访客', '2016-10-31 11:59:46', '2016-10-31 11:59:46', '1');
INSERT INTO `api_base_data` VALUES ('512', 'pushNotice', '61', '访客', '2016-10-31 12:16:37', '2016-10-31 12:16:37', '1');
INSERT INTO `api_base_data` VALUES ('514', 'virtualPrivateLetter', 'ON', 'ON/OFF', '2016-11-02 16:03:11', '2016-11-02 16:03:11', '1');
INSERT INTO `api_base_data` VALUES ('515', 'virtualSubscribe', 'ON', 'ON/OFF', '2016-11-04 11:27:40', '2017-10-26 14:57:10', '1');
INSERT INTO `api_base_data` VALUES ('516', 'virtualPrivateLetterContent', '你好呀', '你好呀', '2016-11-04 16:30:22', '2016-11-04 16:30:22', '0');
INSERT INTO `api_base_data` VALUES ('517', 'virtualPrivateLetterContent', '在吗', '在吗', '2016-11-04 17:10:31', '2016-11-04 17:10:31', '0');
INSERT INTO `api_base_data` VALUES ('518', 'virtualPrivateLetterContent', '很高兴认识你', '很高兴认识你', '2016-11-04 17:10:50', '2016-11-04 17:10:50', '0');
INSERT INTO `api_base_data` VALUES ('519', 'iosVersion', '3.2.3', '3.2.3', '2016-11-04 18:52:09', '2016-11-04 18:52:09', '0');
INSERT INTO `api_base_data` VALUES ('520', 'pushNoticeAlert', '57', '礼物提醒', '2016-11-16 19:05:58', '2016-11-16 19:05:58', '0');
INSERT INTO `api_base_data` VALUES ('521', 'pushNoticeAlert', '60', '评论回复', '2016-11-16 19:06:12', '2016-11-16 19:06:12', '1');
INSERT INTO `api_base_data` VALUES ('522', 'pushNotice', '62', '点赞批量推送', '2016-11-17 18:35:59', '2016-11-17 18:35:59', '1');
INSERT INTO `api_base_data` VALUES ('523', 'pushNoticeAlert', '62', '点赞批量推送', '2016-11-17 18:36:32', '2016-11-17 18:36:32', '1');
INSERT INTO `api_base_data` VALUES ('524', 'virtualPrivateLetterContent', '[(1)]', '笑脸', '2016-11-24 17:49:17', '2016-11-24 17:49:17', '1');
INSERT INTO `api_base_data` VALUES ('525', 'virtualPrivateLetterContent', '[(2)]', '表情2', '2016-11-24 17:50:51', '2016-11-24 17:50:51', '1');
INSERT INTO `api_base_data` VALUES ('526', 'virtualPrivateLetterContent', '[(3)]', '表情3', '2016-11-24 17:51:48', '2016-11-24 17:51:48', '1');
INSERT INTO `api_base_data` VALUES ('527', 'pushNotice', '63', '活动-activity', '2016-12-07 15:20:55', '2016-12-07 15:20:55', '1');
INSERT INTO `api_base_data` VALUES ('528', 'pushNotice', '64', '商品兑换-exchange', '2016-12-07 15:21:10', '2016-12-07 15:21:47', '1');
INSERT INTO `api_base_data` VALUES ('529', 'pushNotice', '65', '评选-choose', '2016-12-07 15:21:35', '2016-12-07 15:21:35', '1');
INSERT INTO `api_base_data` VALUES ('530', 'pushNotice', '125', '收到用户评分', '2016-12-09 11:41:49', '2016-12-09 11:41:49', '0');
INSERT INTO `api_base_data` VALUES ('531', 'invitation', 'eating', '吃饭', '2017-01-06 15:09:26', '2017-01-06 15:09:26', '1');
INSERT INTO `api_base_data` VALUES ('532', 'invitation', 'film', '看电影', '2017-01-06 15:09:55', '2017-01-06 15:09:55', '1');
INSERT INTO `api_base_data` VALUES ('533', 'invitation', 'activity', '活动', '2017-01-06 15:10:20', '2017-01-06 15:10:20', '1');
INSERT INTO `api_base_data` VALUES ('534', 'invitePerson', '5', '邀请人数', '2017-01-19 18:18:46', '2017-01-21 15:07:07', '1');
INSERT INTO `api_base_data` VALUES ('535', 'inviteRewardAmount', '500', '邀请奖励金额', '2017-01-19 18:18:49', '2017-01-21 15:06:31', '1');
INSERT INTO `api_base_data` VALUES ('536', 'pushNotice', '66', '资格券-admissionTicket', '2017-01-19 19:40:48', '2017-01-19 19:42:16', '1');
INSERT INTO `api_base_data` VALUES ('537', 'pushNotice', '67', '代金券-couponTicket', '2017-01-19 19:40:48', '2017-01-19 20:10:36', '1');
INSERT INTO `api_base_data` VALUES ('538', 'shareTicketNum', '10', '分享券数量', '2017-02-26 11:23:47', '2017-02-26 11:23:47', '1');
INSERT INTO `api_base_data` VALUES ('539', 'shareTicketPrice', '100', '分享券金额', '2017-02-26 11:23:47', '2017-02-26 11:23:47', '1');
INSERT INTO `api_base_data` VALUES ('540', 'effectiveDays', '3', '领取券多少天过期', '2017-02-26 15:26:39', '2017-02-26 15:26:39', '1');
INSERT INTO `api_base_data` VALUES ('541', 'shareEffectiveDays', '3', '领取券多少天过期', '2017-02-26 15:36:20', '2017-02-26 15:36:20', '1');
INSERT INTO `api_base_data` VALUES ('542', 'smsNotice', '3', '用户审核通过', '2017-02-27 18:05:14', '2017-02-27 18:05:14', '1');
INSERT INTO `api_base_data` VALUES ('543', 'smsNotice', '68', '收到红包通知', '2017-03-10 17:35:50', '2017-03-10 17:35:50', '1');
INSERT INTO `api_base_data` VALUES ('544', 'customerDefaultCode', '2517', '易约客服默认易约号', '2017-03-14 16:24:51', '2017-03-15 16:23:40', '0');
INSERT INTO `api_base_data` VALUES ('545', 'customerDefaultCode', '50103141', '易悦客服01', '2017-03-16 10:45:57', '2017-09-28 22:19:33', '1');
INSERT INTO `api_base_data` VALUES ('546', 'pushNotice', '69', '更新客服推送-customerUpdate', '2017-03-17 12:24:21', '2017-09-26 10:48:38', '1');
INSERT INTO `api_base_data` VALUES ('547', 'pushNotice', '70', '收藏我通知', '2017-03-26 14:33:36', '2017-03-26 14:33:36', '0');
INSERT INTO `api_base_data` VALUES ('548', 'iosVersion', '4.0.0', '测试', '2017-03-29 18:19:52', '2017-03-29 18:19:52', '0');
INSERT INTO `api_base_data` VALUES ('549', 'iosVersion', '4.0.0', '阿达', '2017-03-30 16:48:02', '2017-03-30 16:48:02', '0');
INSERT INTO `api_base_data` VALUES ('550', 'iosVersion', '4.0.0', '测试', '2017-03-31 10:45:10', '2017-03-31 10:45:10', '0');
INSERT INTO `api_base_data` VALUES ('551', 'clientProVersion', '4.0.0', '易悦精英', '2017-03-31 15:24:41', '2017-03-31 15:24:41', '1');
INSERT INTO `api_base_data` VALUES ('552', 'clientProVersion', '4.0.1', '易悦精英', '2017-04-17 15:09:55', '2017-04-17 15:09:55', '1');
INSERT INTO `api_base_data` VALUES ('553', 'pushNotice', '71', '有人@我', '2017-04-27 11:44:13', '2017-04-27 11:44:13', '0');
INSERT INTO `api_base_data` VALUES ('554', 'pushNoticeAlert', '71', '有人@我', '2017-04-27 11:44:58', '2017-04-27 11:44:58', '0');
INSERT INTO `api_base_data` VALUES ('555', 'pushNotice', '72', '身份证审核通过-idCardPass', '2017-05-07 16:04:12', '2017-09-26 10:50:26', '1');
INSERT INTO `api_base_data` VALUES ('556', 'pushNotice', '73', '身份证审核拒绝-idCardRefuse', '2017-05-07 16:04:12', '2017-09-26 10:50:32', '1');
INSERT INTO `api_base_data` VALUES ('557', 'pushNotice', '74', '工作证明审核通过-jobPass', '2017-05-07 16:04:12', '2017-09-26 10:50:13', '1');
INSERT INTO `api_base_data` VALUES ('558', 'pushNotice', '75', '工作证明审核拒绝-jobRefuse', '2017-05-07 16:04:12', '2017-09-26 10:50:19', '1');
INSERT INTO `api_base_data` VALUES ('559', 'pushNotice', '76', '名片审核通过', '2017-05-07 16:04:13', '2017-05-07 16:04:13', '0');
INSERT INTO `api_base_data` VALUES ('560', 'pushNotice', '77', '名片审核拒绝', '2017-05-07 16:04:13', '2017-05-07 16:04:13', '0');
INSERT INTO `api_base_data` VALUES ('561', 'smsNotice', '72', '身份证审核通过', '2017-05-09 21:59:34', '2017-05-09 21:59:34', '1');
INSERT INTO `api_base_data` VALUES ('562', 'smsNotice', '73', '身份证审核拒绝', '2017-05-09 21:59:52', '2017-05-09 21:59:52', '1');
INSERT INTO `api_base_data` VALUES ('563', 'smsNotice', '74', '工作证明审核通过', '2017-05-09 22:00:22', '2017-05-09 22:00:22', '1');
INSERT INTO `api_base_data` VALUES ('564', 'smsNotice', '75', '工作证明审核拒绝', '2017-05-09 22:00:40', '2017-05-09 22:00:40', '1');
INSERT INTO `api_base_data` VALUES ('565', 'smsNotice', '76', '名片审核通过', '2017-05-09 22:00:59', '2017-05-09 22:00:59', '1');
INSERT INTO `api_base_data` VALUES ('566', 'smsNotice', '77', '名片审核拒绝', '2017-05-09 22:01:12', '2017-05-09 22:01:12', '1');
INSERT INTO `api_base_data` VALUES ('567', 'smsNotice', '78', '通知用户升级版本查看匿名消息', '2017-05-31 14:47:54', '2017-05-31 14:51:02', '1');
INSERT INTO `api_base_data` VALUES ('568', 'pushNoticeAlert', '124', '关注的人喜欢/报名活动', '2017-06-09 17:36:55', '2017-09-26 15:30:23', '1');
INSERT INTO `api_base_data` VALUES ('569', 'pushNoticeAlert', '123', '关注的人发随感通知', '2017-06-09 17:43:13', '2017-06-09 17:43:13', '0');
INSERT INTO `api_base_data` VALUES ('570', 'clientProVersion', '4.0.4', '易悦精英', '2017-06-09 17:54:07', '2017-06-09 17:54:07', '1');
INSERT INTO `api_base_data` VALUES ('571', 'clientProVersion', '4.0.6', '易悦精英', '2017-06-09 17:54:57', '2017-06-09 17:54:57', '1');
INSERT INTO `api_base_data` VALUES ('572', 'iosVersion', '4.0.6', '4.0.6', '2017-06-16 16:23:02', '2017-06-16 16:23:02', '0');
INSERT INTO `api_base_data` VALUES ('573', 'iosVersion', '4.0.6', '4.0.6', '2017-06-19 12:22:02', '2017-06-20 17:51:12', '0');
INSERT INTO `api_base_data` VALUES ('576', 'qualityUser', '50002697', '小康', '2017-06-23 11:29:56', '2017-06-23 11:29:56', '1');
INSERT INTO `api_base_data` VALUES ('577', 'qualityUser', '40002537', '张健', '2017-06-23 11:30:27', '2017-06-23 11:30:27', '1');
INSERT INTO `api_base_data` VALUES ('578', 'qualityUser', '80002516', '吴亦可', '2017-06-23 11:30:53', '2017-06-23 11:30:53', '1');
INSERT INTO `api_base_data` VALUES ('579', 'qualityUser', '20002293', '李白', '2017-06-23 11:31:31', '2017-06-23 11:31:31', '1');
INSERT INTO `api_base_data` VALUES ('580', 'qualityUser', '20002555', '啦啦', '2017-06-23 11:32:08', '2017-06-23 11:32:08', '1');
INSERT INTO `api_base_data` VALUES ('581', 'qualityUser', '70503047', '跳起来', '2017-06-23 11:32:28', '2017-06-23 11:32:28', '1');
INSERT INTO `api_base_data` VALUES ('582', 'qualityUser', '30502751', '南水北调', '2017-06-23 11:32:42', '2017-06-23 11:32:42', '1');
INSERT INTO `api_base_data` VALUES ('584', 'qualityUser', '60001865', 'zhang[guangz]', '2017-06-23 14:39:48', '2017-06-23 14:39:48', '1');
INSERT INTO `api_base_data` VALUES ('585', 'payChannel', 'UNION_PAY', '银联支付', '2017-06-27 10:39:11', '2017-06-27 10:39:11', '1');
INSERT INTO `api_base_data` VALUES ('586', 'payChannel', 'UNION_PAY', '银联支付', '2017-06-27 11:51:11', '2017-06-27 11:51:11', '0');
INSERT INTO `api_base_data` VALUES ('587', 'payChannel', 'WEIXIN_PAY', '微信支付', '2017-06-27 11:51:11', '2017-06-27 11:51:11', '1');
INSERT INTO `api_base_data` VALUES ('588', 'payChannel', 'WEIXIN_WAP_PAY', '微信网页支付', '2017-06-27 11:51:11', '2017-06-27 11:51:11', '1');
INSERT INTO `api_base_data` VALUES ('589', 'payChannel', 'WEIXIN_MINA_PAY', '微信小程序支付', '2017-06-27 11:51:11', '2017-06-27 11:51:11', '1');
INSERT INTO `api_base_data` VALUES ('590', 'payChannel', 'ALI_PAY', '支付宝支付', '2017-06-27 11:51:11', '2017-06-27 12:17:34', '1');
INSERT INTO `api_base_data` VALUES ('591', 'payChannel', 'ALI_WAP_PAY', '支付宝网页支付', '2017-06-27 11:51:11', '2017-06-27 12:17:39', '1');
INSERT INTO `api_base_data` VALUES ('592', 'payChannel', 'SAY_GOOD_PAY', '赞支付(兑换商品, 易元)', '2017-06-27 11:51:11', '2017-06-27 11:51:11', '1');
INSERT INTO `api_base_data` VALUES ('593', 'payChannel', 'DIAMOND_PAY', '易元支付', '2017-06-27 11:51:11', '2017-06-27 11:51:11', '1');
INSERT INTO `api_base_data` VALUES ('594', 'payChannel', 'IAP_PAY', '苹果内购', '2017-06-27 11:51:11', '2017-06-27 11:51:11', '1');
INSERT INTO `api_base_data` VALUES ('595', 'payChannel', 'ADMIN_PAY', '后台支付(仅限易元充值)', '2017-06-27 11:51:11', '2017-06-27 11:51:11', '1');
INSERT INTO `api_base_data` VALUES ('596', 'payChannel', 'RED_PACKET_PAY', '红包支付(仅限红包操作使用)', '2017-06-27 11:51:11', '2017-06-27 11:51:11', '1');
INSERT INTO `api_base_data` VALUES ('600', 'pushNoticeAlert', '36', '关注TA时对方已经关注了自己', '2017-06-29 17:53:25', '2017-06-29 18:34:26', '1');
INSERT INTO `api_base_data` VALUES ('601', 'pushNotice', '36', '关注TA时对方已经关注了自己', '2017-06-29 17:53:25', '2017-06-29 18:34:46', '1');
INSERT INTO `api_base_data` VALUES ('602', 'payChannel', 'OFFLINE_PAY', '线下付费', '2017-06-30 18:41:24', '2017-07-03 12:00:08', '1');
INSERT INTO `api_base_data` VALUES ('603', 'birthdayMoney', '3.18', '3.18', '2017-07-19 15:35:11', '2017-07-19 15:35:11', '1');
INSERT INTO `api_base_data` VALUES ('604', 'birthdayMoney', '6.18', '6.18', '2017-07-19 15:35:22', '2017-07-19 15:35:22', '1');
INSERT INTO `api_base_data` VALUES ('605', 'birthdayTicketAmount', '199', '199', '2017-07-19 16:02:04', '2017-07-19 16:02:04', '1');
INSERT INTO `api_base_data` VALUES ('606', 'smsNotice', '301', '生日大礼包短信', '2017-07-21 11:54:38', '2017-07-21 11:54:38', '1');
INSERT INTO `api_base_data` VALUES ('607', 'qualityUser', '60403122', '好啊好啊', '2017-07-31 12:34:27', '2017-07-31 12:34:27', '1');
INSERT INTO `api_base_data` VALUES ('608', 'qualityUser', '90503120', '不服', '2017-07-31 12:35:19', '2017-07-31 12:35:19', '1');
INSERT INTO `api_base_data` VALUES ('609', 'qualityUser', '70303119', '国有国法', '2017-07-31 12:35:41', '2017-07-31 12:35:41', '1');
INSERT INTO `api_base_data` VALUES ('610', 'qualityUser', '20303118', '安', '2017-07-31 12:36:05', '2017-07-31 12:36:05', '1');
INSERT INTO `api_base_data` VALUES ('611', 'qualityUser', '50303117', '叽叽叽叽', '2017-07-31 12:36:31', '2017-07-31 12:36:31', '1');
INSERT INTO `api_base_data` VALUES ('612', 'qualityUser', '70103116', '你说', '2017-07-31 12:36:51', '2017-07-31 12:36:51', '1');
INSERT INTO `api_base_data` VALUES ('613', 'birthdaySwitch', 'birthdaySwitch', 'birthdaySwitch', '2017-07-31 16:24:10', '2017-07-31 16:24:10', '1');
INSERT INTO `api_base_data` VALUES ('614', 'birthdayUserFresh', 'birthdayUserFresh', 'birthdayUserFresh', '2017-07-31 16:59:50', '2017-07-31 16:59:50', '0');
INSERT INTO `api_base_data` VALUES ('615', 'smsNotice', '302', '未审核随感短信通知', '2017-08-07 18:49:04', '2017-08-07 18:49:04', '1');
INSERT INTO `api_base_data` VALUES ('616', 'pushNotice', '303', '邀请注册成功-inviteRegister', '2017-09-05 15:04:45', '2017-09-26 10:47:43', '1');
INSERT INTO `api_base_data` VALUES ('617', 'pushNotice', '79', '互动消息通知-interaction', '2017-09-14 16:51:57', '2017-09-26 10:47:10', '1');
INSERT INTO `api_base_data` VALUES ('618', 'pushNotice', '80', 'giftAndPacket-礼物和红包通知', '2017-09-14 16:52:24', '2017-09-14 16:52:24', '0');
INSERT INTO `api_base_data` VALUES ('619', 'degree', 'A00013', 'S', '2017-09-19 17:25:01', '2017-09-19 17:27:03', '1');
INSERT INTO `api_base_data` VALUES ('620', 'inviteShareMsg', '易悦，一款精英都在用的社交APP', '易悦，一款精英都在用的社交APP', '2017-09-28 21:53:04', '2017-09-28 21:53:04', '1');
INSERT INTO `api_base_data` VALUES ('621', 'iosVersion', '5.0', '5.0', '2017-09-29 22:32:35', '2017-09-29 22:32:35', '1');
INSERT INTO `api_base_data` VALUES ('622', 'pushVoteReport', 'ON', 'ON/OFF', '2017-10-26 15:03:46', '2017-10-26 15:22:33', '1');
INSERT INTO `api_base_data` VALUES ('623', 'edateWelcomePeople', '1', '易悦2017年度最受欢迎人物', '2017-11-28 12:16:30', '2017-11-28 18:04:45', '1');
INSERT INTO `api_base_data` VALUES ('624', 'edateWelcomePeople', '2', '易悦2017年度最佳风尚人物', '2017-11-28 12:16:38', '2017-11-28 18:04:41', '1');
INSERT INTO `api_base_data` VALUES ('625', 'edateWelcomePeople', '3', '易悦2017年度最佳美誉度品牌', '2017-11-28 18:04:27', '2017-11-28 18:04:27', '1');
INSERT INTO `api_base_data` VALUES ('626', 'edateWelcomePeople', '4', '易悦2017年度战略合作伙伴', '2017-11-28 18:05:20', '2017-11-28 18:05:30', '1');
INSERT INTO `api_base_data` VALUES ('627', 'edateWelcomePeople', '5', '易悦2017年度最佳女企业家', '2017-11-28 18:06:14', '2017-11-28 18:06:14', '1');
INSERT INTO `api_base_data` VALUES ('628', 'edateWelcomePeople', '6', '易悦2017年度最具创新力企业家', '2017-11-28 18:06:37', '2017-11-28 18:06:37', '1');
INSERT INTO `api_base_data` VALUES ('629', 'edateWelcomePeople', '7', '2017年度最具匠心企业家', '2017-11-28 18:06:57', '2017-11-28 18:06:57', '1');
INSERT INTO `api_base_data` VALUES ('630', 'edateWelcomePeople', '8', '易悦2017年度中国十佳投资人', '2017-11-28 18:07:21', '2017-11-28 18:07:21', '1');
INSERT INTO `api_base_data` VALUES ('631', 'edateWelcomePeople', '9', '易悦2017年度最具影响力企业家', '2017-11-28 18:07:39', '2017-11-28 18:07:39', '1');
INSERT INTO `api_base_data` VALUES ('632', 'companySize', '100人以下', '100人以下', '2017-12-16 14:25:26', '2017-12-16 14:25:26', '1');
INSERT INTO `api_base_data` VALUES ('633', 'companySize', '100人-500人', '100人-500人', '2017-12-16 14:25:57', '2017-12-16 14:25:57', '1');
INSERT INTO `api_base_data` VALUES ('634', 'companySize', '500人-1000人', '500人-1000人', '2017-12-16 14:26:15', '2017-12-16 14:26:15', '1');
INSERT INTO `api_base_data` VALUES ('635', 'companySize', '1000人-3000人', '1000人-3000人', '2017-12-16 14:26:32', '2017-12-16 14:26:32', '1');
INSERT INTO `api_base_data` VALUES ('636', 'companySize', '3000人以上', '3000人以上', '2017-12-16 14:26:48', '2017-12-16 14:26:48', '1');
INSERT INTO `api_base_data` VALUES ('637', 'financeStage', '未融资', '未融资', '2017-12-16 14:27:25', '2017-12-16 14:27:25', '1');
INSERT INTO `api_base_data` VALUES ('638', 'financeStage', '无需融资', '无需融资', '2017-12-16 14:27:47', '2017-12-16 14:27:47', '1');
INSERT INTO `api_base_data` VALUES ('639', 'financeStage', '天使轮', '天使轮', '2017-12-16 14:28:02', '2017-12-16 14:28:02', '1');
INSERT INTO `api_base_data` VALUES ('640', 'financeStage', 'A轮', 'A轮', '2017-12-16 14:28:15', '2017-12-16 14:28:15', '1');
INSERT INTO `api_base_data` VALUES ('641', 'financeStage', 'B轮', 'B轮', '2017-12-16 14:28:29', '2017-12-16 14:28:29', '1');
INSERT INTO `api_base_data` VALUES ('642', 'financeStage', 'C轮及以上', 'C轮及以上', '2017-12-16 14:28:50', '2017-12-16 14:28:50', '1');
INSERT INTO `api_base_data` VALUES ('643', 'smsNotice', '4', '久佳信通', '2018-01-03 13:59:13', '2018-01-03 13:59:13', '1');
INSERT INTO `api_base_data` VALUES ('644', 'smsChannel', '4', '久佳信通', '2018-01-03 13:59:39', '2018-01-03 13:59:39', '1');
INSERT INTO `api_base_data` VALUES ('645', 'birthdayUserFresh', 'REFLUSH', '刷新生日列表', '2018-01-22 15:46:39', '2018-01-22 15:46:39', '1');
INSERT INTO `api_base_data` VALUES ('646', 'pushNotice', '304', '饭局支付成功-dinnerPaySuccess', '2018-01-22 16:25:41', '2018-02-10 15:17:09', '1');
INSERT INTO `api_base_data` VALUES ('647', 'dinnerPeopleNum', '100', '饭局助力人数', '2018-01-29 16:37:04', '2018-01-29 16:37:04', '1');
INSERT INTO `api_base_data` VALUES ('648', 'pushNotice', '132', '饭局报名审核-dinnerEnrollAudit', '2018-02-10 15:16:38', '2018-02-10 15:16:38', '1');
INSERT INTO `api_base_data` VALUES ('649', 'dinnerInviteCard', 'http://img.happyeasy.com.cn/mini_program/img/inviteCard20180210.jpeg', '邀请函图片', '2018-02-10 16:07:02', '2018-02-10 16:21:58', '1');
INSERT INTO `api_base_data` VALUES ('650', 'pushNotice', '133', '饭局报名审核通过-dinnerEnrollAuditPass', '2018-02-10 16:43:55', '2018-02-10 18:11:35', '1');
INSERT INTO `api_base_data` VALUES ('651', 'memberCompanyIndustry', 'H0001', '服务业', '2018-03-16 12:12:56', '2018-03-16 12:12:56', '1');
INSERT INTO `api_base_data` VALUES ('652', 'memberCompanyIndustry', 'H0002', '金融业', '2018-03-16 12:13:12', '2018-03-16 12:13:12', '1');
INSERT INTO `api_base_data` VALUES ('653', 'memberCompanyIndustry', 'H0003', '房地产', '2018-03-16 12:13:36', '2018-03-16 12:13:36', '1');
INSERT INTO `api_base_data` VALUES ('654', '12', 'A', '测试数据', '2018-03-22 11:03:55', '2018-03-22 11:04:32', '1');

-- ----------------------------
-- Table structure for `api_base_data_type`
-- ----------------------------
DROP TABLE IF EXISTS `api_base_data_type`;
CREATE TABLE `api_base_data_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '是否有效（1为有效，0为无效）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='基础数据类型表';

-- ----------------------------
-- Records of api_base_data_type
-- ----------------------------
INSERT INTO `api_base_data_type` VALUES ('1', 'degree', '学历', '1');
INSERT INTO `api_base_data_type` VALUES ('2', 'family', '家庭背景', '1');
INSERT INTO `api_base_data_type` VALUES ('3', 'job', '职业', '1');
INSERT INTO `api_base_data_type` VALUES ('4', 'car', '车型', '1');
INSERT INTO `api_base_data_type` VALUES ('5', 'industry', '行业', '1');
INSERT INTO `api_base_data_type` VALUES ('6', 'asset', '资产', '1');
INSERT INTO `api_base_data_type` VALUES ('7', 'marry', '婚姻状况', '1');
INSERT INTO `api_base_data_type` VALUES ('8', 'ownness', '个人状态', '1');
INSERT INTO `api_base_data_type` VALUES ('9', 'MESSAGE', '信息', '1');
INSERT INTO `api_base_data_type` VALUES ('10', 'hotel', '酒店级别', '1');
INSERT INTO `api_base_data_type` VALUES ('11', 'meal', '套餐', '1');
INSERT INTO `api_base_data_type` VALUES ('12', 'identityMsg', '实名认证提示语', '1');
INSERT INTO `api_base_data_type` VALUES ('13', 'certMsg', '证件认证提示语', '1');
INSERT INTO `api_base_data_type` VALUES ('14', 'videoMsg', '视频认证提示语', '1');
INSERT INTO `api_base_data_type` VALUES ('15', 'photoMsg', '照片认证提示语', '1');
INSERT INTO `api_base_data_type` VALUES ('16', 'activity', '活动', '1');
INSERT INTO `api_base_data_type` VALUES ('17', 'ticket', '抵用券', '1');
INSERT INTO `api_base_data_type` VALUES ('18', 'FEEDBACK', '意见反馈', '1');
INSERT INTO `api_base_data_type` VALUES ('19', 'complain', '投诉建议', '1');
INSERT INTO `api_base_data_type` VALUES ('20', 'contentEdit', '内容类型', '1');
INSERT INTO `api_base_data_type` VALUES ('21', 'firstConsume', '首次下单', '1');
INSERT INTO `api_base_data_type` VALUES ('22', 'activityStatus', '活动状态', '1');
INSERT INTO `api_base_data_type` VALUES ('23', 'mouthSalary', '月薪', '1');
INSERT INTO `api_base_data_type` VALUES ('24', 'sign', '个人介绍', '1');
INSERT INTO `api_base_data_type` VALUES ('25', 'promotionFlag', '是否显示推广广告', '1');
INSERT INTO `api_base_data_type` VALUES ('26', 'smsChannel', '短信渠道', '1');
INSERT INTO `api_base_data_type` VALUES ('27', 'smsNotice', '短信通知', '1');
INSERT INTO `api_base_data_type` VALUES ('28', 'pushNotice', '推送通知', '1');
INSERT INTO `api_base_data_type` VALUES ('29', 'givenType', '打赏', '1');
INSERT INTO `api_base_data_type` VALUES ('30', 'datingTopic', '约会主题', '1');
INSERT INTO `api_base_data_type` VALUES ('31', 'interestTabs', '兴趣标签', '1');
INSERT INTO `api_base_data_type` VALUES ('32', 'vipType', '申请会籍类型', '1');
INSERT INTO `api_base_data_type` VALUES ('33', 'payChannel', '支付渠道', '1');
INSERT INTO `api_base_data_type` VALUES ('34', 'iosVersion', 'IOS版本号', '1');
INSERT INTO `api_base_data_type` VALUES ('35', 'sayGood', '点赞开关', '1');
INSERT INTO `api_base_data_type` VALUES ('36', 'officialNickname', '官方昵称', '1');
INSERT INTO `api_base_data_type` VALUES ('37', 'customerService', '在线客服', '1');
INSERT INTO `api_base_data_type` VALUES ('38', 'historyMomentSayGood', '历史随感点赞任务', '1');
INSERT INTO `api_base_data_type` VALUES ('39', 'momentInterval', '随感提醒间隔时间', '1');
INSERT INTO `api_base_data_type` VALUES ('41', 'iosForceUpdateVersion', 'ios强制更新到的版本', '1');
INSERT INTO `api_base_data_type` VALUES ('42', 'customerServiceCode', '客服易约号', '1');
INSERT INTO `api_base_data_type` VALUES ('43', 'privateLetterChannel', '私信渠道', '1');
INSERT INTO `api_base_data_type` VALUES ('44', 'momentType', '随感分类', '1');
INSERT INTO `api_base_data_type` VALUES ('45', 'activityType', '活动分类', '1');
INSERT INTO `api_base_data_type` VALUES ('46', 'welcomeMessage', '注册成功欢迎语', '1');
INSERT INTO `api_base_data_type` VALUES ('47', 'clubLabel', '会所标签', '1');
INSERT INTO `api_base_data_type` VALUES ('48', 'isNeedSendVip', '是否赠送vip', '1');
INSERT INTO `api_base_data_type` VALUES ('49', 'weixinName', '微信提现账号', '1');
INSERT INTO `api_base_data_type` VALUES ('50', 'withdrawCost', '微信提现费率', '1');
INSERT INTO `api_base_data_type` VALUES ('51', 'pushNoticeAlert', '需推送到用户手机通知栏处', '1');
INSERT INTO `api_base_data_type` VALUES ('52', 'virtualPrivateLetter', '虚拟私信', '1');
INSERT INTO `api_base_data_type` VALUES ('53', 'virtualSubscribe', '是否发送虚拟关注', '1');
INSERT INTO `api_base_data_type` VALUES ('54', 'virtualPrivateLetterContent', '虚拟私信内容', '1');
INSERT INTO `api_base_data_type` VALUES ('55', 'invitation', '邀约项目', '1');
INSERT INTO `api_base_data_type` VALUES ('56', 'invitePerson', '邀请人数', '1');
INSERT INTO `api_base_data_type` VALUES ('57', 'inviteRewardAmount', '邀请奖励金额', '1');
INSERT INTO `api_base_data_type` VALUES ('58', 'shareTicketNum', '分享券数量', '1');
INSERT INTO `api_base_data_type` VALUES ('59', 'shareTicketPrice', '分享券金额', '1');
INSERT INTO `api_base_data_type` VALUES ('60', 'customerDefaultCode', '客服小易', '1');
INSERT INTO `api_base_data_type` VALUES ('61', 'clientProVersion', '易悦精英客户端版本号', '1');
INSERT INTO `api_base_data_type` VALUES ('62', 'qualityUser', '优质用户', '1');
INSERT INTO `api_base_data_type` VALUES ('64', 'birthdayMoney', '给生日用户的红包金额', '1');
INSERT INTO `api_base_data_type` VALUES ('65', 'birthdayTicketAmount', '给生日用户的代金券金额', '1');
INSERT INTO `api_base_data_type` VALUES ('66', 'birthdaySwitch', '是否需要发送生日礼包', '1');
INSERT INTO `api_base_data_type` VALUES ('67', 'birthdayUserFresh', '是否刷新生日用户列表', '1');
INSERT INTO `api_base_data_type` VALUES ('68', 'inviteShareMsg', '邀请分享消息', '1');
INSERT INTO `api_base_data_type` VALUES ('69', 'pushVoteReport', '是否推送投票日报', '1');
INSERT INTO `api_base_data_type` VALUES ('70', 'edateWelcomePeople', '易悦2017年度最受欢迎人物票选', '1');
INSERT INTO `api_base_data_type` VALUES ('74', 'dinnerPeopleNum', '饭局助力人数', '1');
INSERT INTO `api_base_data_type` VALUES ('75', 'dinnerInviteCard', '饭局邀请函', '1');
INSERT INTO `api_base_data_type` VALUES ('76', 'memberCompanyIndustry', '会员单位行业', '1');
INSERT INTO `api_base_data_type` VALUES ('78', '12', '测试2', '0');

-- ----------------------------
-- Table structure for `api_province`
-- ----------------------------
DROP TABLE IF EXISTS `api_province`;
CREATE TABLE `api_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(12) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `pinyin_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='省份表';

-- ----------------------------
-- Records of api_province
-- ----------------------------
INSERT INTO `api_province` VALUES ('1', '100000', '北京', 'beijing');
INSERT INTO `api_province` VALUES ('2', '120000', '天津', 'tianjin');
INSERT INTO `api_province` VALUES ('3', '130000', '河北', 'hebei');
INSERT INTO `api_province` VALUES ('4', '140000', '山西', 'shanxi');
INSERT INTO `api_province` VALUES ('5', '150000', '内蒙古', 'neimenggu');
INSERT INTO `api_province` VALUES ('6', '210000', '辽宁', 'liaoning');
INSERT INTO `api_province` VALUES ('7', '220000', '吉林', 'jilin');
INSERT INTO `api_province` VALUES ('8', '230000', '黑龙江', 'heilongjiang');
INSERT INTO `api_province` VALUES ('9', '310000', '上海', 'shanghai');
INSERT INTO `api_province` VALUES ('10', '320000', '江苏', 'jiangsu');
INSERT INTO `api_province` VALUES ('11', '330000', '浙江', 'zhejiang');
INSERT INTO `api_province` VALUES ('12', '340000', '安徽', 'anhui');
INSERT INTO `api_province` VALUES ('13', '350000', '福建', 'fujian');
INSERT INTO `api_province` VALUES ('14', '360000', '江西', 'jiangxi');
INSERT INTO `api_province` VALUES ('15', '370000', '山东', 'shandong');
INSERT INTO `api_province` VALUES ('16', '410000', '河南', 'henan');
INSERT INTO `api_province` VALUES ('17', '420000', '湖北', 'hubei');
INSERT INTO `api_province` VALUES ('18', '430000', '湖南', 'hunan');
INSERT INTO `api_province` VALUES ('19', '440000', '广东', 'guangdong');
INSERT INTO `api_province` VALUES ('20', '450000', '广西', 'guangxi');
INSERT INTO `api_province` VALUES ('21', '460000', '海南', 'hainan');
INSERT INTO `api_province` VALUES ('22', '500000', '重庆', 'chongqi');
INSERT INTO `api_province` VALUES ('23', '510000', '四川', 'sichuan');
INSERT INTO `api_province` VALUES ('24', '520000', '贵州', 'guizhou');
INSERT INTO `api_province` VALUES ('25', '530000', '云南', 'yunnan');
INSERT INTO `api_province` VALUES ('26', '540000', '西藏', 'xizang');
INSERT INTO `api_province` VALUES ('27', '610000', '陕西', 'shanxi');
INSERT INTO `api_province` VALUES ('28', '620000', '甘肃', 'gansu');
INSERT INTO `api_province` VALUES ('29', '630000', '青海', 'qinghai');
INSERT INTO `api_province` VALUES ('30', '640000', '宁夏', 'ningxia');
INSERT INTO `api_province` VALUES ('31', '650000', '新疆', 'xinjiang');
INSERT INTO `api_province` VALUES ('32', '710000', '台湾', 'taiwan');
INSERT INTO `api_province` VALUES ('33', '810000', '香港', 'xiangguang');
INSERT INTO `api_province` VALUES ('34', '820000', '澳门', 'aomen');
INSERT INTO `api_province` VALUES ('35', '990000', '国外', 'guowai');
