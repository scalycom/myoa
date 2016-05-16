-- -----------------------------
-- Think MySQL Data Transfer 
-- 
-- Host     : 101.201.211.227
-- Port     : 3306
-- Database : budaohuaxia
-- 
-- Part : #1
-- Date : 2016-05-13 12:17:39
-- -----------------------------

SET FOREIGN_KEY_CHECKS = 0;


-- -----------------------------
-- Table structure for `cjent_inorder`
-- -----------------------------
DROP TABLE IF EXISTS `cjent_inorder`;
CREATE TABLE `cjent_inorder` (
  `ino_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(64) NOT NULL DEFAULT '',
  `ino_number` int(11) NOT NULL DEFAULT '1',
  `order_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `uid` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(128) NOT NULL DEFAULT '',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `pay_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `in_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ino_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `cjnet_account_log`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_account_log`;
CREATE TABLE `cjnet_account_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `user_jifen` int(11) NOT NULL DEFAULT '0',
  `change_time` int(11) NOT NULL DEFAULT '0',
  `change_desc` varchar(255) NOT NULL DEFAULT '',
  `change_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1:用户余额2:用户积分',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_account_log`
-- -----------------------------
INSERT INTO `cjnet_account_log` VALUES ('1', '7', '0.00', '0', '1462871941', '0保险返现', '1');
INSERT INTO `cjnet_account_log` VALUES ('2', '7', '0.01', '0', '1462872241', '0保险返现', '1');
INSERT INTO `cjnet_account_log` VALUES ('3', '7', '10.00', '0', '1463042491', '用户余额调整!', '1');
INSERT INTO `cjnet_account_log` VALUES ('4', '7', '10.00', '0', '1463042513', '用户余额调整!', '1');
INSERT INTO `cjnet_account_log` VALUES ('5', '7', '-10.00', '0', '1463042554', '用户余额调整!', '1');
INSERT INTO `cjnet_account_log` VALUES ('6', '2', '0.00', '20', '1463042962', '用户积分调整!', '2');
INSERT INTO `cjnet_account_log` VALUES ('7', '2', '0.00', '-20', '1463042977', '用户积分调整!', '2');

-- -----------------------------
-- Table structure for `cjnet_action`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_action`;
CREATE TABLE `cjnet_action` (
  `id` int(11) unsigned NOT NULL COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';


-- -----------------------------
-- Table structure for `cjnet_action_log`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_action_log`;
CREATE TABLE `cjnet_action_log` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';


-- -----------------------------
-- Table structure for `cjnet_address`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_address`;
CREATE TABLE `cjnet_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `postcode` varchar(10) NOT NULL DEFAULT '',
  `province` int(11) NOT NULL DEFAULT '0',
  `city` int(11) NOT NULL DEFAULT '0',
  `district` int(11) NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `phone` char(11) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_address`
-- -----------------------------
INSERT INTO `cjnet_address` VALUES ('1', '宋超', '266510', '19', '261', '2185', '内蒙古', '7', '18560469993', '', '1');
INSERT INTO `cjnet_address` VALUES ('2', '龙溟', '266510', '2', '52', '503', '汇商国际', '10', '15764255708', '', '1');
INSERT INTO `cjnet_address` VALUES ('3', '张明', '266510', '4', '55', '540', '武夷山市场', '7', '18560469993', '', '0');
INSERT INTO `cjnet_address` VALUES ('4', '小李', '266510', '2', '52', '500', '北京市东城区', '7', '18565659993', '', '0');
INSERT INTO `cjnet_address` VALUES ('5', '一刀', '266510', '4', '53', '519', '台江', '7', '18560469993', '', '0');
INSERT INTO `cjnet_address` VALUES ('6', '崔宏伟', '266510', '22', '284', '2347', '长江中路467号', '9', '15318758262', '', '1');

-- -----------------------------
-- Table structure for `cjnet_aduser`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_aduser`;
CREATE TABLE `cjnet_aduser` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(255) NOT NULL DEFAULT '',
  `ad_pass` char(32) NOT NULL DEFAULT '',
  `openid` varchar(128) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `login_ip` char(15) NOT NULL DEFAULT '',
  `login_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `login` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ad_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_aduser`
-- -----------------------------
INSERT INTO `cjnet_aduser` VALUES ('1', 'CJadmin', 'a8b0b2c84c393e13fdbb96afb2a4a3a8', '', '1460369085', '2130706433', '1463111935', '1', '83');
INSERT INTO `cjnet_aduser` VALUES ('2', 'song123456', 'fe4f0e7e75e7250c3a4ada9f40f924cb', '', '1463024086', '0', '1463025019', '1', '2');

-- -----------------------------
-- Table structure for `cjnet_agent_set`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_agent_set`;
CREATE TABLE `cjnet_agent_set` (
  `id` int(11) NOT NULL,
  `first_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `second_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `third_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_agent_set`
-- -----------------------------
INSERT INTO `cjnet_agent_set` VALUES ('1', '3.00', '2.00', '1.00');

-- -----------------------------
-- Table structure for `cjnet_agentcard`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_agentcard`;
CREATE TABLE `cjnet_agentcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head_img_x` int(11) NOT NULL DEFAULT '0',
  `head_img_y` int(11) NOT NULL DEFAULT '0',
  `name_x` int(11) NOT NULL DEFAULT '0',
  `name_y` int(11) NOT NULL DEFAULT '0',
  `name_text` varchar(128) NOT NULL DEFAULT '',
  `name_text_size` int(11) NOT NULL DEFAULT '12',
  `name_text_color` varchar(64) NOT NULL DEFAULT '',
  `name_size` int(11) NOT NULL DEFAULT '12',
  `name_color` varchar(64) NOT NULL DEFAULT '',
  `biaoyu_text` varchar(128) NOT NULL DEFAULT '',
  `biaoyu_color` varchar(64) NOT NULL DEFAULT '',
  `biaoyu_size` int(11) NOT NULL DEFAULT '12',
  `erweima_x` int(11) NOT NULL DEFAULT '0',
  `erweima_y` int(11) NOT NULL DEFAULT '0',
  `cover_img` varchar(255) NOT NULL DEFAULT '',
  `shop_color` varchar(64) NOT NULL DEFAULT '',
  `shop_size` int(11) NOT NULL DEFAULT '12',
  `head_img_size` int(11) NOT NULL DEFAULT '100' COMMENT '头像大小',
  `erweima_size` int(11) NOT NULL DEFAULT '250',
  `card_name` varchar(64) NOT NULL DEFAULT '名片名称',
  `shop_x` int(11) NOT NULL DEFAULT '0',
  `shop_y` int(11) NOT NULL DEFAULT '0',
  `name_text_x` int(11) NOT NULL DEFAULT '0',
  `name_text_y` int(11) NOT NULL DEFAULT '0',
  `biaoyu_x` int(11) DEFAULT '0',
  `biaoyu_y` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_agentcard`
-- -----------------------------
INSERT INTO `cjnet_agentcard` VALUES ('1', '270', '50', '300', '168', '我是{$nickname}', '20', '#000', '24', '#D30A12', '我为{$shop}代言', '#000', '20', '200', '420', '/Uploads/Goods/2016-04-23/571b28786dd22.png', '#D30A12', '24', '100', '250', '默认名片', '284', '220', '240', '170', '220', '220');

-- -----------------------------
-- Table structure for `cjnet_agentrank`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_agentrank`;
CREATE TABLE `cjnet_agentrank` (
  `rank_id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(128) NOT NULL DEFAULT '',
  `agent_level` int(11) NOT NULL DEFAULT '0',
  `first_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `second_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `third_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reward_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '升级奖励',
  `invite_num` int(11) NOT NULL DEFAULT '0',
  `invite_ag_rank` int(11) NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rank_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_agentrank`
-- -----------------------------
INSERT INTO `cjnet_agentrank` VALUES ('1', '铜牌分销商', '10', '3.00', '0.00', '0.00', '0.00', '10', '0', '1461321926');

-- -----------------------------
-- Table structure for `cjnet_app`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_app`;
CREATE TABLE `cjnet_app` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `app_name` varchar(128) NOT NULL DEFAULT '',
  `controller` varchar(128) NOT NULL DEFAULT '',
  `action` varchar(128) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '0',
  `info` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '1',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:关键字 1:链接',
  PRIMARY KEY (`app_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_app`
-- -----------------------------
INSERT INTO `cjnet_app` VALUES ('1', '0', '商城', 'Shop', '', '0', '', '1', '0');
INSERT INTO `cjnet_app` VALUES ('2', '0', '用户', 'Wxuser', '', '0', '', '1', '0');
INSERT INTO `cjnet_app` VALUES ('3', '2', '推广名片', 'Wxuser', 'reply_erweima', '0', '', '1', '0');
INSERT INTO `cjnet_app` VALUES ('4', '0', '洗车', 'Wash', '', '0', '', '1', '0');

-- -----------------------------
-- Table structure for `cjnet_arccat`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_arccat`;
CREATE TABLE `cjnet_arccat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(128) NOT NULL DEFAULT '',
  `cat_img` varchar(255) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_arccat`
-- -----------------------------
INSERT INTO `cjnet_arccat` VALUES ('1', '图文消息', '', '0', '0', '0', '1461576019', '1');

-- -----------------------------
-- Table structure for `cjnet_article`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_article`;
CREATE TABLE `cjnet_article` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL DEFAULT '',
  `cover_img` varchar(128) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cid` int(11) NOT NULL DEFAULT '0',
  `brief` varchar(255) NOT NULL DEFAULT '' COMMENT '文章描述',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_article`
-- -----------------------------
INSERT INTO `cjnet_article` VALUES ('1', '欢迎来到布道华夏', '/Uploads/Goods/2016-04-25/571de2bbb44c7.png', '&lt;p&gt;布道华夏欢迎您！&lt;/p&gt;', '0', '1461576382', '0', '1', '1', '布道华夏欢迎您！');

-- -----------------------------
-- Table structure for `cjnet_auth_extend`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_auth_extend`;
CREATE TABLE `cjnet_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';


-- -----------------------------
-- Table structure for `cjnet_auth_group`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_auth_group`;
CREATE TABLE `cjnet_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_auth_group`
-- -----------------------------
INSERT INTO `cjnet_auth_group` VALUES ('1', 'bdadmin', '1', '测试用户组', '测试', '1', '2,6,7,8,15,19,20,21,42,54,55');

-- -----------------------------
-- Table structure for `cjnet_auth_group_access`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_auth_group_access`;
CREATE TABLE `cjnet_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_auth_group_access`
-- -----------------------------
INSERT INTO `cjnet_auth_group_access` VALUES ('2', '1');

-- -----------------------------
-- Table structure for `cjnet_auth_rule`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_auth_rule`;
CREATE TABLE `cjnet_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_auth_rule`
-- -----------------------------
INSERT INTO `cjnet_auth_rule` VALUES ('1', 'bdadmin', '1', 'Bdadmin/Config/group', '系统配置', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('2', 'bdadmin', '2', 'Bdadmin/Index/index', '首页', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('3', 'bdadmin', '1', 'Bdadmin/Menu/menulist', '菜单列表', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('4', 'bdadmin', '1', 'Bdadmin/Config/conflist', '配置列表', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('5', 'bdadmin', '1', 'Bdadmin/Config/index', '系统管理', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('6', 'bdadmin', '2', 'Bdadmin/Wxuser/index', '会员', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('7', 'bdadmin', '1', 'Bdadmin/Wxuser/index', '会员', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('8', 'bdadmin', '1', 'Bdadmin/Wxuser/userlist', '会员列表', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('9', 'bdadmin', '1', 'Bdadmin/Wxlog/index', '接口日志', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('10', 'bdadmin', '2', 'Bdadmin/Goods/index', '商品', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('11', 'bdadmin', '1', 'Bdadmin/Goods/goodslist', '商品列表', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('12', 'bdadmin', '1', 'Bdadmin/Goods/index', '商品管理', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('13', 'bdadmin', '1', 'Bdadmin/Menu/index', '菜单', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('14', 'bdadmin', '1', 'Bdadmin/Category/catlist', '分类列表', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('15', 'bdadmin', '1', 'Bdadmin/Wxuser/ranklist', '会员等级', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('16', 'bdadmin', '1', 'Bdadmin/Shop/config', '商城配置', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('17', 'bdadmin', '1', 'Bdadmin/App/index', '模块列表', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('18', 'bdadmin', '1', 'Bdadmin/Wxconfig/kwreply', '关键字设置', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('19', 'bdadmin', '1', 'Bdadmin/Wxuser/agentcard', '分销商名片', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('20', 'bdadmin', '1', 'Bdadmin/Wxuser/agent_rank_list', '分销商等级', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('21', 'bdadmin', '1', 'Bdadmin/Wxuser/agentlist', '分销商列表', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('22', 'bdadmin', '2', 'Bdadmin/Article/index', '内容', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('23', 'bdadmin', '1', 'Bdadmin/Article/articlelist', '文章列表', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('24', 'bdadmin', '1', 'Bdadmin/Article/index', '文章管理', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('25', 'bdadmin', '1', 'Bdadmin/Arccat/catlist', '文章分类', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('26', 'bdadmin', '1', 'Bdadmin/Wxconfig/kwlist', '关键字回复', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('27', 'bdadmin', '1', 'Bdadmin/PubMarketing/first', '首次关注', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('28', 'bdadmin', '1', 'Bdadmin/Wxconfig/diymenu', '自定义菜单', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('29', 'bdadmin', '2', 'Bdadmin/Order/index', '订单', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('30', 'bdadmin', '1', 'Bdadmin/Order/index', '订单列表', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('31', 'bdadmin', '1', 'Bdadmin/Order/orderlist', '订单列表', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('32', 'bdadmin', '2', 'Bdadmin/Wash/index', '洗车', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('33', 'bdadmin', '1', 'Bdadmin/Wash/index', '洗车模块', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('34', 'bdadmin', '1', 'Bdadmin/Wash/config', '洗车设置', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('35', 'bdadmin', '2', 'Bdadmin/Insurance/index', '保险', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('36', 'bdadmin', '1', 'Bdadmin/Insurance/index', '保险管理', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('37', 'bdadmin', '1', 'Bdadmin/Insurance/edit', '保险配置', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('38', 'bdadmin', '1', 'Bdadmin/Insurance/config', '回复设置', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('39', 'bdadmin', '1', 'Bdadmin/Wash/branch', '加盟商管理', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('40', 'bdadmin', '1', 'Bdadmin/Insurance/order', '保险订单', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('41', 'bdadmin', '1', 'Bdadmin/Insurance/user', '购买用户', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('42', 'bdadmin', '1', 'Bdadmin/Wxuser/agent_set', '分销商分佣', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('43', 'bdadmin', '1', 'Bdadmin/Wxuser/bonus_rank_list', '分红等级', '-1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('44', 'bdadmin', '2', 'Bdadmin/AuthManager/index', '管理员', '-1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('45', 'bdadmin', '1', 'Bdadmin/Wash/washlist', '洗车列表', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('46', 'bdadmin', '2', 'Bdadmin/Config/index', '系统', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('47', 'bdadmin', '2', 'Bdadmin/Menu/index', '菜单', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('48', 'bdadmin', '1', 'Bdadmin/Wash/user', '洗车用户', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('49', 'bdadmin', '1', 'Bdadmin/Wash/order', '洗车订单', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('50', 'bdadmin', '2', 'Bdadmin/AuthManager/frame', '管理员', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('51', 'bdadmin', '1', 'Bdadmin/AuthManager/frame', '用户组列表', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('52', 'bdadmin', '1', 'Bdadmin/AuthManager/index', '用户组列表', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('53', 'bdadmin', '1', 'Bdadmin/Aduser/index', '管理员列表', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('54', 'bdadmin', '1', 'Bdadmin/Index/welcome', '桌面', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('55', 'bdadmin', '1', 'Bdadmin/Index/logout', '登出', '1', '');
INSERT INTO `cjnet_auth_rule` VALUES ('56', 'bdadmin', '1', 'Bdadmin/Wash/bonus_rank_list', '分红等级', '1', '');

-- -----------------------------
-- Table structure for `cjnet_bonus_count`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_bonus_count`;
CREATE TABLE `cjnet_bonus_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `bonus_rank` int(11) NOT NULL DEFAULT '0',
  `bonus_count` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonus_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `fenhong_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_bonus_count`
-- -----------------------------
INSERT INTO `cjnet_bonus_count` VALUES ('1', '20', '1', '0.00', '3650.00', '1462863828', '0');
INSERT INTO `cjnet_bonus_count` VALUES ('2', '7', '1', '0.00', '3650.00', '1462863896', '0');
INSERT INTO `cjnet_bonus_count` VALUES ('3', '21', '1', '0.00', '3650.00', '1462863983', '0');
INSERT INTO `cjnet_bonus_count` VALUES ('4', '10', '1', '0.00', '3650.00', '1462864215', '0');
INSERT INTO `cjnet_bonus_count` VALUES ('5', '9', '1', '0.00', '3650.00', '1462873541', '0');
INSERT INTO `cjnet_bonus_count` VALUES ('6', '27', '1', '0.00', '3650.00', '1463098993', '0');

-- -----------------------------
-- Table structure for `cjnet_bonus_log`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_bonus_log`;
CREATE TABLE `cjnet_bonus_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `bc_id` int(11) NOT NULL DEFAULT '0',
  `count_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `cjnet_bonusrank`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_bonusrank`;
CREATE TABLE `cjnet_bonusrank` (
  `rank_id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(128) NOT NULL DEFAULT '',
  `first_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `second_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `third_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reward_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '升级奖励',
  `invite_num` int(11) NOT NULL DEFAULT '0',
  `invite_bon_rank` int(11) NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `bonus_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `out_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rank_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_bonusrank`
-- -----------------------------
INSERT INTO `cjnet_bonusrank` VALUES ('1', '分红会员', '10.00', '5.00', '3.00', '0.00', '0', '0', '1462787408', '15.00', '3650.00', '1');

-- -----------------------------
-- Table structure for `cjnet_cart`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_cart`;
CREATE TABLE `cjnet_cart` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) NOT NULL DEFAULT '',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_attr` text NOT NULL,
  `is_real` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rec_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_gift` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_handsel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `goods_attr_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rec_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_cart`
-- -----------------------------
INSERT INTO `cjnet_cart` VALUES ('1', '7', '8565d26740a20fd4d5df58dfc8902b38', '1', 'BD000001', '0', '轮胎', '300.00', '200.00', '1', '', '0', '', '0', '0', '0', '0', '0', '');
INSERT INTO `cjnet_cart` VALUES ('2', '7', '8565d26740a20fd4d5df58dfc8902b38', '2', 'BD000002', '0', '后视镜', '240.00', '120.00', '1', '', '0', '', '0', '0', '0', '0', '0', '');
INSERT INTO `cjnet_cart` VALUES ('3', '7', '8565d26740a20fd4d5df58dfc8902b38', '3', 'BD000003', '0', '行车记录仪', '2200.00', '1600.00', '1', '', '0', '', '0', '0', '0', '0', '0', '');
INSERT INTO `cjnet_cart` VALUES ('4', '7', 'tghvb2bskbvn2imu6dqbomngcb3l114j', '3', 'BD000003', '0', '行车记录仪', '2200.00', '1600.00', '1', '', '0', '', '0', '0', '0', '0', '0', '');
INSERT INTO `cjnet_cart` VALUES ('5', '7', 'enk9ac5lhskenma269cgp4g8mvrc7pef', '3', 'BD000003', '0', '行车记录仪', '2200.00', '1600.00', '1', '', '0', '', '0', '0', '0', '0', '0', '');
INSERT INTO `cjnet_cart` VALUES ('6', '27', 'f7c5ef12e53063eb18365608acabcef5', '3', 'BD000003', '0', '行车记录仪', '2200.00', '1600.00', '4', '', '0', '', '0', '0', '0', '0', '0', '');

-- -----------------------------
-- Table structure for `cjnet_category`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_category`;
CREATE TABLE `cjnet_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(128) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0',
  `template` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `level` int(11) DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_category`
-- -----------------------------
INSERT INTO `cjnet_category` VALUES ('1', '汽车配件', '0', '', '1', '0', '0', '1460788410', '1460788410');
INSERT INTO `cjnet_category` VALUES ('2', '汽车轮胎', '1', '', '1', '1', '0', '1460788410', '1460788410');
INSERT INTO `cjnet_category` VALUES ('3', '汽车备胎', '2', '', '1', '2', '11', '1460788410', '1460893502');
INSERT INTO `cjnet_category` VALUES ('4', '洗车服务', '0', '', '1', '0', '0', '1460788410', '1460788410');
INSERT INTO `cjnet_category` VALUES ('5', '汽车内胎', '2', '', '1', '2', '12', '1460788410', '1461494489');
INSERT INTO `cjnet_category` VALUES ('6', '汽车洗刷', '0', '', '1', '0', '0', '1460892227', '1460892227');

-- -----------------------------
-- Table structure for `cjnet_config`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_config`;
CREATE TABLE `cjnet_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_config`
-- -----------------------------
INSERT INTO `cjnet_config` VALUES ('1', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1460708923', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:微信\r\n6:商城', '4');
INSERT INTO `cjnet_config` VALUES ('2', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `cjnet_config` VALUES ('7', 'WX_APPID', '1', '微信AppID', '5', '', '微信公众平台AppID(应用ID)', '1460528608', '1460528735', '1', 'wx93d2941a86ed8965', '0');
INSERT INTO `cjnet_config` VALUES ('8', 'WX_APPSECRET', '1', '微信AppSecret', '5', '', '微信AppSecret(应用密钥)', '1460528701', '1460528745', '1', '364dadbb79c81e3fb3d034cb0c2fd162', '0');
INSERT INTO `cjnet_config` VALUES ('9', 'WX_TOKEN', '1', '微信token', '5', '', '', '1460540883', '1460540883', '1', '2df26238df900fae964db3d17e9aeab5', '0');
INSERT INTO `cjnet_config` VALUES ('10', 'WX_EN_KEY', '1', '消息加解密密钥', '5', 'EncodingAESKey(消息加解密密钥)', '', '1460540947', '1460540947', '1', 'NSCmamZLKSgPUiVLegyAJfZIIzsPpFNdxqqxCpjniqd', '0');
INSERT INTO `cjnet_config` VALUES ('11', 'WEB_DOMIN', '1', '网站域名', '1', '', '', '1460543596', '1460543596', '1', 'weixin.budaohuaxia.com', '0');
INSERT INTO `cjnet_config` VALUES ('12', 'SYS_VERSION', '0', '布道华夏版本', '1', '', '布道华夏版本', '1460544219', '1460544219', '1', 'V1.0', '0');
INSERT INTO `cjnet_config` VALUES ('13', 'WX_LOG_START', '4', '微信调试日志', '5', '0:关闭\r\n1:开启\r\n', '微信调试日志(系统开发时调试信息)', '1460619870', '1460619870', '1', '1', '0');
INSERT INTO `cjnet_config` VALUES ('14', 'SHOP_SN', '1', '商品货号前缀', '6', '', '商品货号前缀', '1460708960', '1460708960', '1', 'BD', '0');
INSERT INTO `cjnet_config` VALUES ('15', 'SHOP_NAME', '1', '商店名称', '6', '', '布道华夏商店名称', '1461052996', '1461053017', '1', '布道华夏商城', '0');
INSERT INTO `cjnet_config` VALUES ('16', 'SHOP_TITLE', '1', '商店标题', '6', '', '商店标题', '1461053059', '1461053059', '1', '布道华夏商城', '0');
INSERT INTO `cjnet_config` VALUES ('17', 'SHOP_KEYWORDS', '2', '商城关键字', '6', '', '商城关键字', '1461054058', '1461054058', '1', '布道华夏商城,洗车,布道华夏', '0');
INSERT INTO `cjnet_config` VALUES ('18', 'SHOP_DESCRIPTION', '2', '商城描述', '6', '', '', '1461054141', '1461054141', '1', '布道华夏商城描述', '0');
INSERT INTO `cjnet_config` VALUES ('19', 'SHOP_GONGGAO', '1', '商城公告', '6', '', '', '1461055542', '1461055542', '1', ' 公告：欢迎来到布道华夏商城', '0');
INSERT INTO `cjnet_config` VALUES ('20', 'SHOP_PRICE', '1', '货币格式', '6', '', '', '1461115038', '1461115038', '1', '%s', '0');
INSERT INTO `cjnet_config` VALUES ('21', 'SHOP_PRICE_FORMAT', '4', '商品价格显示', '6', '0:正常\r\n1:保留不为 0 的尾数\r\n2:不四舍五入，保留一位小数\r\n3:不四舍五入，不保留小数\r\n4:先四舍五入，保留一位小数\r\n5:先四舍五入，不保留小数 ', '商品价格显示方式', '1461115468', '1461115468', '1', '0', '0');
INSERT INTO `cjnet_config` VALUES ('22', 'WX_ERWEIMA_TYPE', '4', '推广二维码类型', '5', '0:临时二维码(有效期30天但不限次数)\r\n1:永久二维码(永久有效但微信限制10万次)', '', '1461208012', '1461208078', '1', '0', '0');
INSERT INTO `cjnet_config` VALUES ('23', 'SYS_WEB_NAME', '1', '网站名称', '1', '', '网站名称', '1461379256', '1461379256', '1', '布道华夏', '0');
INSERT INTO `cjnet_config` VALUES ('24', 'WX_SUB_NUMBER', '0', '会员基数', '5', '', '会员基数', '1461627084', '1461627084', '1', '1', '0');
INSERT INTO `cjnet_config` VALUES ('25', 'WX_DIYMEN_EVENT', '3', '微信自定义菜单接口', '5', '', '', '1461654089', '1461654089', '1', 'scancode_wating:扫码带提示\r\nscancode_push:扫码推事件\r\npic_sysphoto:系统拍照发图\r\npic_photo_or_album:拍照或者相册发图\r\npic_weixin:微信相册发图\r\nlocation_select:发送位置', '0');
INSERT INTO `cjnet_config` VALUES ('26', 'SHOP_IMG_SIZE', '3', '商品图片大小', '6', '', '商品图片大小H为高度，W为宽度', '1461896201', '1461896351', '1', 'H:400\r\nW:400', '0');
INSERT INTO `cjnet_config` VALUES ('27', 'SHOP_THUMB_SIZE', '3', '商品缩略图大小', '6', '', '商品缩略图大小', '1461896251', '1461896437', '1', 'H:200\r\nW:200', '0');
INSERT INTO `cjnet_config` VALUES ('28', 'DEVELOP_MODE', '4', '开发模式', '4', '0:关闭\r\n1:开启', '', '1463111866', '1463111866', '1', '1', '0');
INSERT INTO `cjnet_config` VALUES ('29', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '', '1463112378', '1463112378', '1', '9', '0');
INSERT INTO `cjnet_config` VALUES ('30', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1463112425', '1463112425', '1', '', '0');
INSERT INTO `cjnet_config` VALUES ('31', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '', '1463112541', '1463112541', '1', './App/Data/', '0');
INSERT INTO `cjnet_config` VALUES ('32', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '', '1463112575', '1463112575', '1', '20971520', '7');
INSERT INTO `cjnet_config` VALUES ('33', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '', '1463112615', '1463112615', '1', '10', '10');

-- -----------------------------
-- Table structure for `cjnet_cover`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_cover`;
CREATE TABLE `cjnet_cover` (
  `cover_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL DEFAULT '',
  `cover_img` varchar(255) NOT NULL DEFAULT '',
  `cover_info` varchar(255) NOT NULL DEFAULT '',
  `app_id` int(11) NOT NULL DEFAULT '0',
  `cover_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`cover_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `cjnet_diymenu`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_diymenu`;
CREATE TABLE `cjnet_diymenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '',
  `keyword` varchar(64) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '0',
  `wxsys` char(40) NOT NULL DEFAULT '',
  `emoji_code` varchar(16) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_diymenu`
-- -----------------------------
INSERT INTO `cjnet_diymenu` VALUES ('1', '0', '商城首页', '', 'Shop/index', '1', '0', '', '', 'view');
INSERT INTO `cjnet_diymenu` VALUES ('2', '0', '分销名片', '我的二维码', '', '1', '0', '', '', 'click');
INSERT INTO `cjnet_diymenu` VALUES ('3', '0', '优惠活动', '', '', '1', '0', '', '', 'parent');
INSERT INTO `cjnet_diymenu` VALUES ('4', '3', '保险全返', '保险', 'Baoxian/index', '1', '0', '', '', 'click');
INSERT INTO `cjnet_diymenu` VALUES ('5', '3', '洗车优惠', '洗车', '', '1', '0', '', '', 'click');

-- -----------------------------
-- Table structure for `cjnet_eventreply`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_eventreply`;
CREATE TABLE `cjnet_eventreply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) NOT NULL DEFAULT '',
  `reply_text` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:文本;1:图文',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `event` varchar(128) NOT NULL DEFAULT '',
  `aid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_eventreply`
-- -----------------------------
INSERT INTO `cjnet_eventreply` VALUES ('1', '', '欢迎关注布道华夏', '0', '1', 'subscribe_first', '1');

-- -----------------------------
-- Table structure for `cjnet_goods`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_goods`;
CREATE TABLE `cjnet_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(128) NOT NULL DEFAULT '',
  `shop_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `promote_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `promote_start_time` int(11) NOT NULL DEFAULT '0',
  `promote_end_time` int(11) NOT NULL DEFAULT '0',
  `goods_brief` varchar(255) NOT NULL DEFAULT '',
  `goods_desc` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `goods_img` varchar(255) NOT NULL DEFAULT '',
  `goods_thumb` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `goods_sn` varchar(32) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '0',
  `is_tuijian` tinyint(1) NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) NOT NULL DEFAULT '1',
  `stock` int(11) NOT NULL DEFAULT '100' COMMENT '库存',
  `orign_img` varchar(255) NOT NULL DEFAULT '',
  `is_new` tinyint(4) NOT NULL DEFAULT '0' COMMENT '新品',
  `is_fanyong` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_goods`
-- -----------------------------
INSERT INTO `cjnet_goods` VALUES ('1', '轮胎', '200.00', '300.00', '1', '0.00', '0', '0', '中国好轮胎', '&lt;p&gt;&lt;img class=&quot;&quot; src=&quot;http://img20.360buyimg.com/vc/jfs/t1084/143/276070391/67414/6ada24bb/55112f5eN8dc7ca19.jpg&quot; style=&quot;&quot; alt=&quot;&quot; data-lazyload=&quot;done&quot;/&gt; &lt;img class=&quot;&quot; src=&quot;http://img20.360buyimg.com/vc/jfs/t2323/324/1692984078/84874/f679fc12/5672444cN5e3c3fd5.jpg&quot; style=&quot;&quot; alt=&quot;&quot; data-lazyload=&quot;done&quot;/&gt; &lt;img class=&quot;&quot; src=&quot;http://img20.360buyimg.com/vc/jfs/t1240/89/266938805/60790/8b1a15f6/55112ce5N033ab79d.jpg&quot; style=&quot;&quot; alt=&quot;&quot; data-lazyload=&quot;done&quot;/&gt;&lt;/p&gt;', '1', '/Uploads/Goods/goodsimg/20160511/1462933526.png', '/Uploads/Goods/thumbs/20160511/1462933526.png', '1460897056', 'BD000001', '0', '1', '1', '100', '/Uploads/Goods/orign/2016-04-29/5722d2f581e63.jpg', '1', '1');
INSERT INTO `cjnet_goods` VALUES ('2', '后视镜', '120.00', '240.00', '1', '0.00', '0', '0', '汽车后视镜', '&lt;table style=&quot;width: 517px;&quot; id=&quot;__01&quot; align=&quot;center&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;750&quot;&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td&gt;&lt;img class=&quot;&quot; src=&quot;http://img11.360buyimg.com/cms/jfs/t2197/78/2131879520/214532/7f6a8e8d/56f354deN47466b40.jpg&quot; style=&quot;&quot; data-lazyload=&quot;done&quot; alt=&quot;&quot; width=&quot;750&quot;/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;img class=&quot;&quot; src=&quot;http://img10.360buyimg.com/cms/jfs/t2392/120/1395103666/166701/6f74b652/569ddf47N2b5e1570.jpg&quot; style=&quot;&quot; data-lazyload=&quot;done&quot; alt=&quot;&quot; width=&quot;750&quot;/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;img class=&quot;&quot; src=&quot;http://img12.360buyimg.com/cms/jfs/t2338/136/1395971799/172374/58db0b4f/569ddf47Nb7d5924f.jpg&quot; style=&quot;&quot; data-lazyload=&quot;done&quot; alt=&quot;&quot; width=&quot;750&quot;/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;img class=&quot;&quot; src=&quot;http://img13.360buyimg.com/cms/jfs/t2446/205/1404699679/125103/dbcb78e8/569ddf48N37803fc1.jpg&quot; style=&quot;&quot; data-lazyload=&quot;done&quot; alt=&quot;&quot; width=&quot;750&quot;/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;img class=&quot;&quot; src=&quot;http://img13.360buyimg.com/cms/jfs/t1927/197/2100687202/94499/9f33dddc/569ddf48N473f81a2.jpg&quot; style=&quot;&quot; data-lazyload=&quot;done&quot; alt=&quot;&quot; width=&quot;750&quot;/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;img class=&quot;&quot; src=&quot;http://img11.360buyimg.com/cms/jfs/t2575/190/1049608291/56592/e3cd9ec4/569ee89eN2a43248a.jpg&quot; style=&quot;&quot; data-lazyload=&quot;done&quot; alt=&quot;&quot; width=&quot;750&quot;/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;img class=&quot;&quot; src=&quot;http://img12.360buyimg.com/cms/jfs/t2095/240/1397725073/50578/98ecf5a1/569ee89eN69218423.jpg&quot; style=&quot;&quot; data-lazyload=&quot;done&quot; alt=&quot;&quot; width=&quot;750&quot;/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;img class=&quot;&quot; src=&quot;http://img11.360buyimg.com/cms/jfs/t2275/329/2063795417/300060/d21295c3/569ddf4bNe86b7d38.gif&quot; style=&quot;&quot; data-lazyload=&quot;done&quot; alt=&quot;&quot; width=&quot;750&quot;/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;img class=&quot;&quot; src=&quot;http://img12.360buyimg.com/cms/jfs/t2452/284/2113904231/186437/6efa022a/569ddf49Nf05f0bbf.jpg&quot; style=&quot;&quot; data-lazyload=&quot;done&quot; alt=&quot;&quot; width=&quot;750&quot;/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;img class=&quot;&quot; src=&quot;http://img13.360buyimg.com/cms/jfs/t2032/25/2035703649/115160/ae35f00c/569ddf4aNc6fdedd6.jpg&quot; style=&quot;&quot; data-lazyload=&quot;done&quot; alt=&quot;&quot; width=&quot;750&quot;/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;img class=&quot;&quot; src=&quot;http://img14.360buyimg.com/cms/jfs/t1864/170/1366283065/123927/50a6e535/569ddf4aNb4c36c38.jpg&quot; style=&quot;&quot; data-lazyload=&quot;done&quot; alt=&quot;&quot; width=&quot;750&quot;/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;img class=&quot;&quot; src=&quot;http://img14.360buyimg.com/cms/jfs/t1876/286/2183171451/105179/87c1ab08/569ddf4bN26290da4.jpg&quot; style=&quot;&quot; data-lazyload=&quot;done&quot; alt=&quot;&quot; width=&quot;750&quot;/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1', '/Uploads/Goods/goodsimg/20160511/1462933589.png', '/Uploads/Goods/thumbs/20160511/1462933589.png', '1461892195', 'BD000002', '0', '1', '1', '100', '/Uploads/Goods/orign/2016-04-29/5722d2d51cee1.jpg', '1', '1');
INSERT INTO `cjnet_goods` VALUES ('3', '行车记录仪', '1600.00', '2200.00', '1', '0.00', '0', '0', '行车记录仪', '&lt;p&gt;&lt;img class=&quot;&quot; src=&quot;http://img20.360buyimg.com/vc/jfs/t2695/199/908763316/1302955/cbf2b02e/572affd9Nda2f8280.jpg&quot; style=&quot;&quot; data-lazyload=&quot;done&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1', '/Uploads/Goods/goodsimg/20160511/1462933602.png', '/Uploads/Goods/thumbs/20160511/1462933602.png', '1461898703', 'BD000003', '0', '1', '1', '100', '/Uploads/Goods/orign/2016-04-29/5722d244c0c67.jpg', '1', '1');

-- -----------------------------
-- Table structure for `cjnet_inorder`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_inorder`;
CREATE TABLE `cjnet_inorder` (
  `ino_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(64) NOT NULL DEFAULT '',
  `ino_number` int(11) NOT NULL DEFAULT '1',
  `order_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `uid` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(128) NOT NULL DEFAULT '',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `pay_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `in_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ino_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `cjnet_insurance`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_insurance`;
CREATE TABLE `cjnet_insurance` (
  `in_name` varchar(128) NOT NULL DEFAULT '',
  `in_img` varchar(255) NOT NULL DEFAULT '',
  `brief` varchar(128) NOT NULL DEFAULT '',
  `in_desc` text NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '1.00',
  `first_fan` decimal(10,2) NOT NULL DEFAULT '0.00',
  `second_fan` decimal(10,2) NOT NULL DEFAULT '0.00',
  `third_fan` decimal(10,2) NOT NULL DEFAULT '0.00',
  `day_bili` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '每日返现比例',
  `fan_bili` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '返现比例',
  `time` int(11) NOT NULL DEFAULT '31536000',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `in_id` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`in_id`),
  UNIQUE KEY `in_id` (`in_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_insurance`
-- -----------------------------
INSERT INTO `cjnet_insurance` VALUES ('保险积分(测试)', '/Uploads/Goods/orign/2016-05-03/57287526b5644.png', '保险积分，换保险', '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div id=&quot;cover_id&quot;&gt;\r\n					&lt;div class=&quot;upload-pre-item&quot;&gt;\r\n					&lt;img style=&quot;width: 404px; height: 200px;&quot; src=&quot;http://weixin.budaohuaxia.com/Uploads/Goods/orign/2016-05-03/57287526b5644.png&quot; height=&quot;200&quot; width=&quot;404&quot;/&gt;&lt;p&gt;\r\n					&lt;/p&gt;&lt;p&gt;\r\n					&lt;img style=&quot;width: 404px; height: 200px;&quot; src=&quot;http://weixin.budaohuaxia.com/Uploads/Goods/orign/2016-05-03/57287526b5644.png&quot; height=&quot;200&quot; width=&quot;404&quot;/&gt;\r\n					&lt;/p&gt;&lt;p&gt;					\r\n					&lt;/p&gt;&lt;p&gt;\r\n					&lt;/p&gt;&lt;p&gt;\r\n					&lt;img style=&quot;width: 404px; height: 200px;&quot; src=&quot;http://weixin.budaohuaxia.com/Uploads/Goods/orign/2016-05-03/57287526b5644.png&quot; height=&quot;200&quot; width=&quot;404&quot;/&gt;\r\n					&lt;/p&gt;&lt;p&gt;					\r\n					&lt;/p&gt;\r\n					&lt;/div&gt;					\r\n					&lt;/div&gt;', '0.01', '0.00', '0.00', '0.00', '0.05', '100.00', '31536000', '1462933054', '1', '1');

-- -----------------------------
-- Table structure for `cjnet_insurance_log`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_insurance_log`;
CREATE TABLE `cjnet_insurance_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `in_uid` int(11) NOT NULL DEFAULT '0',
  `bc_id` int(11) NOT NULL DEFAULT '0',
  `count_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `time` int(11) NOT NULL DEFAULT '0',
  `thisjifen` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前权益积分',
  `thisfan` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前累积返现',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `cjnet_insuranceset`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_insuranceset`;
CREATE TABLE `cjnet_insuranceset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(128) NOT NULL DEFAULT '',
  `cover_img` varchar(255) NOT NULL DEFAULT '',
  `brief` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_insuranceset`
-- -----------------------------
INSERT INTO `cjnet_insuranceset` VALUES ('1', '保险', '欢迎参加保险全返活动', '/Uploads/Goods/orign/2016-05-03/572875c08faa8.png', '购买保险积分兑换保险', 'Insurance/item');

-- -----------------------------
-- Table structure for `cjnet_insure_user`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_insure_user`;
CREATE TABLE `cjnet_insure_user` (
  `in_uid` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `fan_start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `quanyi_jifen` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fan_count` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否确认',
  `fan_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否办理',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户',
  `total_jifen` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总积分',
  `queren_time` int(11) NOT NULL DEFAULT '0',
  `info` varchar(255) NOT NULL DEFAULT '',
  `fan_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`in_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `cjnet_kwreply`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_kwreply`;
CREATE TABLE `cjnet_kwreply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(128) NOT NULL DEFAULT '',
  `img_url` varchar(255) NOT NULL DEFAULT '',
  `reply_text` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:文本1:图文',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_same` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:包含1:完全匹配',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '回复链接',
  `sort` int(11) NOT NULL DEFAULT '0',
  `aid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_kwreply`
-- -----------------------------
INSERT INTO `cjnet_kwreply` VALUES ('1', '你好', '', '您好，欢迎来到布道华夏', '0', '1', '1', '', '0', '1');

-- -----------------------------
-- Table structure for `cjnet_menu`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_menu`;
CREATE TABLE `cjnet_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_menu`
-- -----------------------------
INSERT INTO `cjnet_menu` VALUES ('2', '系统', '0', '10', 'Config/index', '0', '系统设置', '', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('3', '菜单', '0', '11', 'Menu/index', '0', '菜单管理', '', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('4', '系统配置', '2', '0', 'Config/group', '0', '系统配置', '系统配置', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('5', '首页', '0', '0', 'Index/index', '0', '首页', '', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('12', '菜单列表', '3', '0', 'Menu/menulist', '0', '菜单列表', '后台菜单管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('10', '配置列表', '2', '0', 'Config/conflist', '0', '系统配置列表', '系统配置', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('9', '系统管理', '2', '0', 'Config/index', '1', '系统管理', '', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('13', '会员', '0', '4', 'Wxuser/index', '0', '用户管理', '', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('14', '会员', '13', '0', 'Wxuser/index', '1', '会员管理', '会员管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('15', '会员列表', '13', '0', 'Wxuser/userlist', '0', '会员管理', '会员管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('16', '接口日志', '2', '0', 'Wxlog/index', '0', '微信接口调用日志', '系统配置', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('17', '商品', '0', '5', 'Goods/index', '0', '商城管理', '', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('18', '商品列表', '17', '0', 'Goods/goodslist', '0', '商品管理', '商品管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('19', '商品管理', '17', '0', 'Goods/index', '1', '', '', '1', '1');
INSERT INTO `cjnet_menu` VALUES ('20', '菜单', '3', '0', 'Menu/index', '1', '菜单管理', '菜单管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('21', '分类列表', '17', '0', 'Category/catlist', '0', '商品分类管理', '分类管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('22', '会员等级', '13', '0', 'Wxuser/ranklist', '0', '会员等级', '会员管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('23', '商城配置', '2', '0', 'Shop/config', '0', '商城配置', '商城设置', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('24', '模块列表', '2', '0', 'App/index', '0', '前台模块调用', '模块应用', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('25', '关键字设置', '2', '0', 'Wxconfig/kwreply', '0', '关键词列表', '微信设置', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('29', '分销商名片', '13', '0', 'Wxuser/agentcard', '0', '分销商名片列表', '分销商管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('27', '分销商等级', '13', '0', 'Wxuser/agent_rank_list', '0', '分销商等级列表', '分销商管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('28', '分销商列表', '13', '0', 'Wxuser/agentlist', '0', '分销商列表', '分销商管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('30', '内容', '0', '6', 'Article/index', '0', '', '', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('31', '文章列表', '30', '0', 'Article/articlelist', '0', '文章列表', '文章管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('32', '文章管理', '30', '0', 'Article/index', '1', '', '文章管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('33', '文章分类', '30', '0', 'Arccat/catlist', '0', '文章分类管理', '文章管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('34', '关键字回复', '2', '0', 'Wxconfig/kwlist', '0', '', '微信设置', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('35', '首次关注', '2', '0', 'PubMarketing/first', '0', '首次关注', '微信设置', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('36', '自定义菜单', '2', '0', 'Wxconfig/diymenu', '0', '', '微信设置', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('37', '订单', '0', '7', 'Order/index', '0', '', '', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('38', '订单列表', '37', '0', 'Order/index', '1', '', '订单管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('39', '订单列表', '37', '0', 'Order/orderlist', '0', '订单管理', '订单管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('40', '洗车', '0', '8', 'Wash/index', '0', '', '', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('41', '洗车模块', '40', '0', 'Wash/index', '1', '', '洗车管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('42', '洗车列表', '40', '1', 'Wash/washlist', '0', '洗车列表', '洗车管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('43', '洗车设置', '40', '0', 'Wash/config', '0', '', '洗车管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('44', '保险', '0', '9', 'Insurance/index', '0', '', '', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('45', '保险管理', '44', '0', 'Insurance/index', '1', '', '保险管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('46', '保险配置', '44', '0', 'Insurance/edit', '0', '', '保险管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('47', '回复设置', '44', '0', 'Insurance/config', '0', '', '保险管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('48', '加盟商管理', '40', '0', 'Wash/branch', '0', '', '加盟商', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('49', '洗车用户', '40', '3', 'Wash/user', '0', '', '洗车管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('50', '洗车订单', '40', '4', 'Wash/order', '0', '4', '洗车管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('51', '保险订单', '44', '0', 'Insurance/order', '0', '', '保险管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('52', '购买用户', '44', '0', 'Insurance/user', '0', '', '保险管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('53', '分销商分佣', '13', '0', 'Wxuser/agent_set', '0', '', '分销商管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('54', '分红等级', '40', '0', 'Wash/bonus_rank_list', '0', '', '分红管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('55', '管理员', '0', '10', 'AuthManager/frame', '0', '', '', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('56', '用户组列表', '55', '0', 'AuthManager/frame', '1', '', '管理员管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('58', '用户组列表', '55', '0', 'AuthManager/index', '0', '', '管理员管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('59', '管理员列表', '55', '0', 'Aduser/index', '0', '', '管理员管理', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('60', '桌面', '5', '0', 'Index/welcome', '1', '', '', '1', '1');
INSERT INTO `cjnet_menu` VALUES ('61', '登出', '5', '0', 'Index/logout', '1', '', '', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('62', '数据库备份', '2', '9', 'Database/index?type=export', '0', '', '数据备份', '0', '1');
INSERT INTO `cjnet_menu` VALUES ('63', '数据库还原', '2', '0', 'Database/index?type=import', '0', '', '数据备份', '0', '1');

-- -----------------------------
-- Table structure for `cjnet_order`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_order`;
CREATE TABLE `cjnet_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人',
  `postcode` varchar(10) NOT NULL DEFAULT '',
  `province` int(11) NOT NULL DEFAULT '0',
  `city` int(11) NOT NULL DEFAULT '0',
  `district` int(11) NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL DEFAULT '',
  `phone` char(11) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `shipping_id` int(11) NOT NULL DEFAULT '0',
  `shipping_name` varchar(120) NOT NULL DEFAULT '',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `order_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_id` int(11) NOT NULL DEFAULT '0',
  `pay_time` int(11) NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `shipping_time` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(128) NOT NULL DEFAULT '',
  `transaction_id` varchar(64) NOT NULL DEFAULT '',
  `message` varchar(225) NOT NULL DEFAULT '',
  `ship_status` tinyint(1) NOT NULL DEFAULT '0',
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_order`
-- -----------------------------
INSERT INTO `cjnet_order` VALUES ('1', '201604281437262648', '7', '0', '1', '宋超', '266510', '19', '261', '0', '内蒙古', '18560469993', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1461825446', '0', '', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('2', '201604281439285939', '7', '0', '1', '宋超', '266510', '19', '261', '0', '内蒙古', '18560469993', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1461825568', '0', '', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('3', '201604281447348249', '7', '0', '1', '宋超', '266510', '19', '261', '0', '内蒙古', '18560469993', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1461826054', '0', '', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('4', '201604281505083319', '7', '0', '1', '宋超', '266510', '19', '261', '0', '内蒙古', '18560469993', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1461827108', '0', '', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('5', '201604281549433683', '7', '0', '1', '宋超', '266510', '19', '261', '0', '内蒙古', '18560469993', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1461829783', '0', '', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('6', '201604281620238013', '7', '0', '1', '宋超', '266510', '19', '261', '0', '内蒙古', '18560469993', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1461831623', '0', '', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('7', '201604281621117673', '7', '0', '1', '宋超', '266510', '19', '261', '0', '内蒙古', '18560469993', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1461831671', '0', '', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('8', '201604281709408991', '7', '1', '1', '宋超', '266510', '19', '261', '0', '内蒙古', '18560469993', '', '0', '', '0.00', '200.00', '200.00', '1', '2147483647', '1461834580', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '4009432001201604285309402807', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('9', '201604281718147809', '7', '0', '1', '宋超', '266510', '19', '261', '0', '内蒙古', '18560469993', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1461835094', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('10', '201604281718542748', '7', '0', '1', '宋超', '266510', '19', '261', '0', '内蒙古', '18560469993', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1461835134', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('11', '201604281721271979', '7', '4', '1', '宋超', '266510', '19', '261', '0', '内蒙古', '18560469993', '', '0', '', '0.00', '200.00', '200.00', '1', '2147483647', '1461835287', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '4009432001201604285310985952', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('12', '201604290937282459', '7', '0', '1', '宋超', '266510', '19', '261', '2185', '内蒙古', '18560469993', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1461893848', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('13', '201604291832534220', '7', '0', '1', '宋超', '266510', '19', '261', '2185', '内蒙古', '18560469993', '', '0', '', '0.00', '680.00', '680.00', '1', '0', '1461925973', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('14', '201604291834401632', '7', '0', '1', '宋超', '266510', '19', '261', '2185', '内蒙古', '18560469993', '', '0', '', '0.00', '680.00', '680.00', '1', '0', '1461926080', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('15', '201604291837367506', '7', '0', '1', '宋超', '266510', '19', '261', '2185', '内蒙古', '18560469993', '', '0', '', '0.00', '680.00', '680.00', '1', '0', '1461926256', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('16', '201604291839088774', '7', '0', '1', '宋超', '266510', '19', '261', '2185', '内蒙古', '18560469993', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1461926348', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('17', '201604291847367338', '7', '0', '1', '宋超', '266510', '19', '261', '2185', '内蒙古', '18560469993', '', '0', '', '0.00', '1920.00', '1920.00', '1', '0', '1461926856', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('18', '201604291850325996', '7', '0', '1', '宋超', '266510', '19', '261', '2185', '内蒙古', '18560469993', '', '0', '', '0.00', '1920.00', '1920.00', '1', '0', '1461927032', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('19', '201604291850331409', '7', '0', '1', '宋超', '266510', '19', '261', '2185', '内蒙古', '18560469993', '', '0', '', '0.00', '1920.00', '1920.00', '1', '0', '1461927033', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('20', '201604291851052845', '7', '0', '1', '宋超', '266510', '19', '261', '2185', '内蒙古', '18560469993', '', '0', '', '0.00', '1920.00', '1920.00', '1', '0', '1461927065', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('21', '201605031122353903', '7', '0', '1', '宋超', '266510', '19', '261', '2185', '内蒙古', '18560469993', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1462245755', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('22', '201605031126018579', '7', '0', '1', '宋超', '266510', '19', '261', '2185', '内蒙古', '18560469993', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1462245961', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('23', '201605031134545074', '7', '0', '1', '宋超', '266510', '19', '261', '2185', '内蒙古', '18560469993', '', '0', '', '0.00', '1600.00', '1600.00', '1', '0', '1462246494', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('24', '201605101052152887', '7', '0', '1', '宋超', '266510', '19', '261', '2185', '内蒙古', '18560469993', '', '0', '', '0.00', '1600.00', '1600.00', '1', '0', '1462848735', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('25', '201605101110437212', '10', '0', '2', '龙溟', '266510', '2', '52', '503', '汇商国际', '15764255708', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1462849843', '0', 'o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('26', '201605101113557393', '10', '0', '2', '龙溟', '266510', '2', '52', '503', '汇商国际', '15764255708', '', '0', '', '0.00', '1600.00', '1600.00', '1', '0', '1462850035', '0', 'o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('27', '201605101150207480', '7', '0', '4', '小李', '266510', '2', '52', '500', '北京市东城区', '18565659993', '', '0', '', '0.00', '1600.00', '1600.00', '1', '0', '1462852220', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('28', '201605101343582865', '9', '0', '6', '崔宏伟', '266510', '22', '284', '2347', '长江中路467号', '15318758262', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1462859038', '0', 'o8TgrvxdaJzRcw1ZzkM7wBytnVRw', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('29', '201605101423551776', '10', '0', '2', '龙溟', '266510', '2', '52', '503', '汇商国际', '15764255708', '', '0', '', '0.00', '120.00', '120.00', '1', '0', '1462861435', '0', 'o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('30', '201605101624415658', '9', '0', '6', '崔宏伟', '266510', '22', '284', '2347', '长江中路467号', '15318758262', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1462868681', '0', 'o8TgrvxdaJzRcw1ZzkM7wBytnVRw', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('31', '201605101743266010', '7', '0', '1', '宋超', '266510', '19', '261', '2185', '内蒙古', '18560469993', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1462873406', '0', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('32', '201605111455456043', '9', '0', '6', '崔宏伟', '266510', '22', '284', '2347', '长江中路467号', '15318758262', '', '0', '', '0.00', '120.00', '120.00', '1', '0', '1462949745', '0', 'o8TgrvxdaJzRcw1ZzkM7wBytnVRw', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('33', '201605131112388550', '9', '0', '6', '崔宏伟', '266510', '22', '284', '2347', '长江中路467号', '15318758262', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1463109158', '0', 'o8TgrvxdaJzRcw1ZzkM7wBytnVRw', '', '', '0', '1');
INSERT INTO `cjnet_order` VALUES ('34', '201605131112414049', '9', '0', '6', '崔宏伟', '266510', '22', '284', '2347', '长江中路467号', '15318758262', '', '0', '', '0.00', '200.00', '200.00', '1', '0', '1463109161', '0', 'o8TgrvxdaJzRcw1ZzkM7wBytnVRw', '', '', '0', '1');

-- -----------------------------
-- Table structure for `cjnet_order_goods`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_order_goods`;
CREATE TABLE `cjnet_order_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '1',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_attr` text NOT NULL,
  `send_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_real` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_gift` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_attr_id` varchar(255) NOT NULL DEFAULT '',
  `is_fanyong` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_order_goods`
-- -----------------------------
INSERT INTO `cjnet_order_goods` VALUES ('1', '11', '1', '轮胎', 'BD000001', '0', '1', '300.00', '200.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('2', '17', '2', '后视镜', 'BD000002', '0', '1', '240.00', '120.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('3', '17', '3', '行车记录仪', 'BD000003', '0', '1', '2200.00', '1600.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('4', '18', '1', '轮胎', 'BD000001', '0', '1', '300.00', '200.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('5', '18', '2', '后视镜', 'BD000002', '0', '1', '240.00', '120.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('6', '18', '3', '行车记录仪', 'BD000003', '0', '1', '2200.00', '1600.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('7', '19', '1', '轮胎', 'BD000001', '0', '1', '300.00', '200.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('8', '19', '2', '后视镜', 'BD000002', '0', '1', '240.00', '120.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('9', '19', '3', '行车记录仪', 'BD000003', '0', '1', '2200.00', '1600.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('10', '20', '1', '轮胎', 'BD000001', '0', '1', '300.00', '200.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('11', '20', '2', '后视镜', 'BD000002', '0', '1', '240.00', '120.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('12', '20', '3', '行车记录仪', 'BD000003', '0', '1', '2200.00', '1600.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('13', '21', '1', '轮胎', 'BD000001', '0', '1', '300.00', '200.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('14', '22', '1', '轮胎', 'BD000001', '0', '1', '300.00', '200.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('15', '23', '3', '行车记录仪', 'BD000003', '0', '1', '2200.00', '1600.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('16', '24', '3', '行车记录仪', 'BD000003', '0', '1', '2200.00', '1600.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('17', '25', '1', '轮胎', 'BD000001', '0', '1', '300.00', '200.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('18', '26', '3', '行车记录仪', 'BD000003', '0', '1', '2200.00', '1600.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('19', '27', '3', '行车记录仪', 'BD000003', '0', '1', '2200.00', '1600.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('20', '28', '1', '轮胎', 'BD000001', '0', '1', '300.00', '200.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('21', '29', '2', '后视镜', 'BD000002', '0', '1', '240.00', '120.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('22', '30', '1', '轮胎', 'BD000001', '0', '1', '300.00', '200.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('23', '31', '1', '轮胎', 'BD000001', '0', '1', '300.00', '200.00', '', '0', '0', '', '0', '0', '', '0');
INSERT INTO `cjnet_order_goods` VALUES ('24', '32', '2', '后视镜', 'BD000002', '0', '1', '240.00', '120.00', '', '0', '0', '', '0', '0', '', '1');
INSERT INTO `cjnet_order_goods` VALUES ('25', '33', '1', '轮胎', 'BD000001', '0', '1', '300.00', '200.00', '', '0', '0', '', '0', '0', '', '1');
INSERT INTO `cjnet_order_goods` VALUES ('26', '34', '1', '轮胎', 'BD000001', '0', '1', '300.00', '200.00', '', '0', '0', '', '0', '0', '', '1');

-- -----------------------------
-- Table structure for `cjnet_pay`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_pay`;
CREATE TABLE `cjnet_pay` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_name` varchar(64) NOT NULL DEFAULT '',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `data` varchar(255) NOT NULL DEFAULT '',
  `info` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`pay_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `cjnet_paylog`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_paylog`;
CREATE TABLE `cjnet_paylog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attach` varchar(128) NOT NULL DEFAULT '',
  `bank_type` varchar(64) NOT NULL DEFAULT '',
  `pay_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `openid` varchar(128) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `trade_type` varchar(64) NOT NULL DEFAULT '',
  `transaction_id` varchar(64) NOT NULL DEFAULT '',
  `pay_info` varchar(255) NOT NULL DEFAULT '',
  `pay_type` varchar(128) NOT NULL DEFAULT '',
  `out_trade_no` varchar(128) NOT NULL DEFAULT '',
  `pay_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_paylog`
-- -----------------------------
INSERT INTO `cjnet_paylog` VALUES ('1', '保险积分购买-o8Tgrv8Eye6Iv1AAwlW54POqP_58', 'ABC_DEBIT', '0.01', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '0', 'JSAPI', '4009432001201605095658892714', '保险积分购买', '1', '2016050910081466947', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('2', '保险积分购买-o8Tgrv8Eye6Iv1AAwlW54POqP_58', 'ABC_DEBIT', '0.01', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '0', 'JSAPI', '4009432001201605095658892714', '保险积分购买', '1', '2016050910081466947', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('3', '保险积分购买-o8Tgrv8Eye6Iv1AAwlW54POqP_58', 'ABC_DEBIT', '0.01', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '0', 'JSAPI', '4009432001201605095658892714', '保险积分购买', '1', '2016050910081466947', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('4', '保险积分购买-o8Tgrv8Eye6Iv1AAwlW54POqP_58', 'ABC_DEBIT', '0.01', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '0', 'JSAPI', '4009432001201605095658892714', '保险积分购买', '1', '2016050910081466947', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('5', '保险积分购买-o8Tgrv8Eye6Iv1AAwlW54POqP_58', 'ABC_DEBIT', '0.01', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '0', 'JSAPI', '4009432001201605095658892714', '保险积分购买', '1', '2016050910081466947', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('6', '年费洗车套餐(测试)购买-o8Tgrv2RftLSg4KwxVzXy2V_00DA', 'CFT', '0.01', 'o8Tgrv2RftLSg4KwxVzXy2V_00DA', '20', 'JSAPI', '4010232001201605105701571268', '洗车套餐购买', '1', '2016051015033422644', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('7', '年费洗车套餐(测试)购买-o8Tgrv2RftLSg4KwxVzXy2V_00DA', 'CFT', '0.01', 'o8Tgrv2RftLSg4KwxVzXy2V_00DA', '0', 'JSAPI', '4010232001201605105701571268', '洗车套餐购买', '1', '2016051015033422644', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('8', '年费洗车套餐(测试)购买-o8Tgrv2RftLSg4KwxVzXy2V_00DA', 'CFT', '0.01', 'o8Tgrv2RftLSg4KwxVzXy2V_00DA', '0', 'JSAPI', '4010232001201605105701571268', '洗车套餐购买', '1', '2016051015033422644', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('9', '年费洗车套餐(测试)购买-o8Tgrv2RftLSg4KwxVzXy2V_00DA', 'CFT', '0.01', 'o8Tgrv2RftLSg4KwxVzXy2V_00DA', '0', 'JSAPI', '4010232001201605105701571268', '洗车套餐购买', '1', '2016051015033422644', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('10', '年费洗车套餐(测试)购买-o8Tgrv8Eye6Iv1AAwlW54POqP_58', 'ABC_DEBIT', '0.01', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '7', 'JSAPI', '4009432001201605105701586733', '洗车套餐购买', '1', '2016051015044715976', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('11', '年费洗车套餐(测试)购买-o8Tgrv8Eye6Iv1AAwlW54POqP_58', 'ABC_DEBIT', '0.01', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '0', 'JSAPI', '4009432001201605105701586733', '洗车套餐购买', '1', '2016051015044715976', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('12', '年费洗车套餐(测试)购买-o8Tgrv8Eye6Iv1AAwlW54POqP_58', 'ABC_DEBIT', '0.01', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '0', 'JSAPI', '4009432001201605105701586733', '洗车套餐购买', '1', '2016051015044715976', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('13', '年费洗车套餐(测试)购买-o8Tgrv8Eye6Iv1AAwlW54POqP_58', 'ABC_DEBIT', '0.01', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '0', 'JSAPI', '4009432001201605105701586733', '洗车套餐购买', '1', '2016051015044715976', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('14', '年费洗车套餐(测试)购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CFT', '0.01', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '21', 'JSAPI', '4001382001201605105701605677', '洗车套餐购买', '1', '2016051015055240569', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('15', '年费洗车套餐(测试)购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CFT', '0.01', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701605677', '洗车套餐购买', '1', '2016051015055240569', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('16', '年费洗车套餐(测试)购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CFT', '0.01', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701605677', '洗车套餐购买', '1', '2016051015055240569', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('17', '年费洗车套餐(测试)购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CFT', '0.01', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701605677', '洗车套餐购买', '1', '2016051015055240569', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('18', '年费洗车套餐(测试)购买-o8Tgrv2RftLSg4KwxVzXy2V_00DA', 'CFT', '0.01', 'o8Tgrv2RftLSg4KwxVzXy2V_00DA', '0', 'JSAPI', '4010232001201605105701571268', '洗车套餐购买', '1', '2016051015033422644', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('19', '年费洗车套餐(测试)购买-o8Tgrv8Eye6Iv1AAwlW54POqP_58', 'ABC_DEBIT', '0.01', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '0', 'JSAPI', '4009432001201605105701586733', '洗车套餐购买', '1', '2016051015044715976', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('20', '保险积分购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CMB_DEBIT', '1.00', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '21', 'JSAPI', '4001382001201605105701659175', '保险积分购买', '1', '2016051015093389641', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('21', '保险积分购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CMB_DEBIT', '1.00', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701659175', '保险积分购买', '1', '2016051015093389641', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('22', '年费洗车套餐(测试)购买-o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', 'CFT', '0.01', 'o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', '10', 'JSAPI', '4003552001201605105701666988', '洗车套餐购买', '1', '2016051015100816500', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('23', '保险积分购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CMB_DEBIT', '1.00', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701659175', '保险积分购买', '1', '2016051015093389641', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('24', '年费洗车套餐(测试)购买-o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', 'CFT', '0.01', 'o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', '0', 'JSAPI', '4003552001201605105701666988', '洗车套餐购买', '1', '2016051015100816500', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('25', '年费洗车套餐(测试)购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CFT', '0.01', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701605677', '洗车套餐购买', '1', '2016051015055240569', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('26', '年费洗车套餐(测试)购买-o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', 'CFT', '0.01', 'o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', '0', 'JSAPI', '4003552001201605105701666988', '洗车套餐购买', '1', '2016051015100816500', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('27', '保险积分购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CMB_DEBIT', '1.00', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701659175', '保险积分购买', '1', '2016051015093389641', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('28', '年费洗车套餐(测试)购买-o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', 'CFT', '0.01', 'o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', '0', 'JSAPI', '4003552001201605105701666988', '洗车套餐购买', '1', '2016051015100816500', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('29', '保险积分购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CMB_DEBIT', '1.00', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701659175', '保险积分购买', '1', '2016051015093389641', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('30', '年费洗车套餐(测试)购买-o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', 'CFT', '0.01', 'o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', '0', 'JSAPI', '4003552001201605105701666988', '洗车套餐购买', '1', '2016051015100816500', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('31', '年费洗车套餐(测试)购买-o8Tgrv2RftLSg4KwxVzXy2V_00DA', 'CFT', '0.01', 'o8Tgrv2RftLSg4KwxVzXy2V_00DA', '0', 'JSAPI', '4010232001201605105701571268', '洗车套餐购买', '1', '2016051015033422644', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('32', '年费洗车套餐(测试)购买-o8Tgrv8Eye6Iv1AAwlW54POqP_58', 'ABC_DEBIT', '0.01', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '0', 'JSAPI', '4009432001201605105701586733', '洗车套餐购买', '1', '2016051015044715976', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('33', '年费洗车套餐(测试)购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CFT', '0.01', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701605677', '洗车套餐购买', '1', '2016051015055240569', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('34', '保险积分购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CMB_DEBIT', '1.00', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701659175', '保险积分购买', '1', '2016051015093389641', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('35', '年费洗车套餐(测试)购买-o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', 'CFT', '0.01', 'o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', '0', 'JSAPI', '4003552001201605105701666988', '洗车套餐购买', '1', '2016051015100816500', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('36', '年费洗车套餐(测试)购买-o8Tgrv2RftLSg4KwxVzXy2V_00DA', 'CFT', '0.01', 'o8Tgrv2RftLSg4KwxVzXy2V_00DA', '0', 'JSAPI', '4010232001201605105701571268', '洗车套餐购买', '1', '2016051015033422644', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('37', '年费洗车套餐(测试)购买-o8Tgrv8Eye6Iv1AAwlW54POqP_58', 'ABC_DEBIT', '0.01', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '0', 'JSAPI', '4009432001201605105701586733', '洗车套餐购买', '1', '2016051015044715976', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('38', '年费洗车套餐(测试)购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CFT', '0.01', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701605677', '洗车套餐购买', '1', '2016051015055240569', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('39', '保险积分购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CMB_DEBIT', '1.00', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701659175', '保险积分购买', '1', '2016051015093389641', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('40', '年费洗车套餐(测试)购买-o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', 'CFT', '0.01', 'o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', '0', 'JSAPI', '4003552001201605105701666988', '洗车套餐购买', '1', '2016051015100816500', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('41', '年费洗车套餐(测试)购买-o8Tgrv2RftLSg4KwxVzXy2V_00DA', 'CFT', '0.01', 'o8Tgrv2RftLSg4KwxVzXy2V_00DA', '0', 'JSAPI', '4010232001201605105701571268', '洗车套餐购买', '1', '2016051015033422644', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('42', '年费洗车套餐(测试)购买-o8Tgrv8Eye6Iv1AAwlW54POqP_58', 'ABC_DEBIT', '0.01', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '0', 'JSAPI', '4009432001201605105701586733', '洗车套餐购买', '1', '2016051015044715976', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('43', '年费洗车套餐(测试)购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CFT', '0.01', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701605677', '洗车套餐购买', '1', '2016051015055240569', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('44', '保险积分购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CMB_DEBIT', '1.00', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701659175', '保险积分购买', '1', '2016051015093389641', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('45', '年费洗车套餐(测试)购买-o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', 'CFT', '0.01', 'o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', '0', 'JSAPI', '4003552001201605105701666988', '洗车套餐购买', '1', '2016051015100816500', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('46', '年费洗车套餐(测试)购买-o8Tgrv2RftLSg4KwxVzXy2V_00DA', 'CFT', '0.01', 'o8Tgrv2RftLSg4KwxVzXy2V_00DA', '0', 'JSAPI', '4010232001201605105701571268', '洗车套餐购买', '1', '2016051015033422644', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('47', '年费洗车套餐(测试)购买-o8Tgrv8Eye6Iv1AAwlW54POqP_58', 'ABC_DEBIT', '0.01', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '0', 'JSAPI', '4009432001201605105701586733', '洗车套餐购买', '1', '2016051015044715976', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('48', '年费洗车套餐(测试)购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CFT', '0.01', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701605677', '洗车套餐购买', '1', '2016051015055240569', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('49', '保险积分购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CMB_DEBIT', '1.00', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701659175', '保险积分购买', '1', '2016051015093389641', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('50', '年费洗车套餐(测试)购买-o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', 'CFT', '0.01', 'o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', '0', 'JSAPI', '4003552001201605105701666988', '洗车套餐购买', '1', '2016051015100816500', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('51', '年费洗车套餐(测试)购买-o8TgrvxdaJzRcw1ZzkM7wBytnVRw', 'CFT', '0.01', 'o8TgrvxdaJzRcw1ZzkM7wBytnVRw', '9', 'JSAPI', '4008372001201605105707276938', '洗车套餐购买', '1', '2016051017453482996', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('52', '年费洗车套餐(测试)购买-o8TgrvxdaJzRcw1ZzkM7wBytnVRw', 'CFT', '0.01', 'o8TgrvxdaJzRcw1ZzkM7wBytnVRw', '0', 'JSAPI', '4008372001201605105707276938', '洗车套餐购买', '1', '2016051017453482996', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('53', '年费洗车套餐(测试)购买-o8TgrvxdaJzRcw1ZzkM7wBytnVRw', 'CFT', '0.01', 'o8TgrvxdaJzRcw1ZzkM7wBytnVRw', '0', 'JSAPI', '4008372001201605105707276938', '洗车套餐购买', '1', '2016051017453482996', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('54', '年费洗车套餐(测试)购买-o8TgrvxdaJzRcw1ZzkM7wBytnVRw', 'CFT', '0.01', 'o8TgrvxdaJzRcw1ZzkM7wBytnVRw', '0', 'JSAPI', '4008372001201605105707276938', '洗车套餐购买', '1', '2016051017453482996', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('55', '年费洗车套餐(测试)购买-o8TgrvxdaJzRcw1ZzkM7wBytnVRw', 'CFT', '0.01', 'o8TgrvxdaJzRcw1ZzkM7wBytnVRw', '0', 'JSAPI', '4008372001201605105707276938', '洗车套餐购买', '1', '2016051017453482996', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('56', '年费洗车套餐(测试)购买-o8Tgrv2RftLSg4KwxVzXy2V_00DA', 'CFT', '0.01', 'o8Tgrv2RftLSg4KwxVzXy2V_00DA', '0', 'JSAPI', '4010232001201605105701571268', '洗车套餐购买', '1', '2016051015033422644', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('57', '年费洗车套餐(测试)购买-o8Tgrv8Eye6Iv1AAwlW54POqP_58', 'ABC_DEBIT', '0.01', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '0', 'JSAPI', '4009432001201605105701586733', '洗车套餐购买', '1', '2016051015044715976', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('58', '年费洗车套餐(测试)购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CFT', '0.01', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701605677', '洗车套餐购买', '1', '2016051015055240569', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('59', '保险积分购买-o8TgrvzHZ3hyazdp8imBF-b5yDQY', 'CMB_DEBIT', '1.00', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', 'JSAPI', '4001382001201605105701659175', '保险积分购买', '1', '2016051015093389641', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('60', '年费洗车套餐(测试)购买-o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', 'CFT', '0.01', 'o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', '0', 'JSAPI', '4003552001201605105701666988', '洗车套餐购买', '1', '2016051015100816500', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('61', '年费洗车套餐(测试)购买-o8TgrvxdaJzRcw1ZzkM7wBytnVRw', 'CFT', '0.01', 'o8TgrvxdaJzRcw1ZzkM7wBytnVRw', '0', 'JSAPI', '4008372001201605105707276938', '洗车套餐购买', '1', '2016051017453482996', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('62', '年费洗车套餐(测试)购买-o8TgrvxdaJzRcw1ZzkM7wBytnVRw', 'CFT', '0.01', 'o8TgrvxdaJzRcw1ZzkM7wBytnVRw', '0', 'JSAPI', '4008372001201605105707276938', '洗车套餐购买', '1', '2016051017453482996', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('63', '年费洗车套餐(测试)购买-o8TgrvxdaJzRcw1ZzkM7wBytnVRw', 'CFT', '0.01', 'o8TgrvxdaJzRcw1ZzkM7wBytnVRw', '0', 'JSAPI', '4008372001201605105707276938', '洗车套餐购买', '1', '2016051017453482996', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('64', '年费洗车套餐(测试)购买-o8TgrvxdaJzRcw1ZzkM7wBytnVRw', 'CFT', '0.01', 'o8TgrvxdaJzRcw1ZzkM7wBytnVRw', '0', 'JSAPI', '4008372001201605105707276938', '洗车套餐购买', '1', '2016051017453482996', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('65', '年费洗车套餐(测试)购买-o8TgrvxdaJzRcw1ZzkM7wBytnVRw', 'CFT', '0.01', 'o8TgrvxdaJzRcw1ZzkM7wBytnVRw', '0', 'JSAPI', '4008372001201605105707276938', '洗车套餐购买', '1', '2016051017453482996', '2147483647');
INSERT INTO `cjnet_paylog` VALUES ('66', '洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo', 'CFT', '0.01', 'o8Tgrv4mSdes3jgqLOvlJAt-yUQo', '27', 'JSAPI', '4001472001201605135791666221', '洗车套餐购买', '1', '2016051308225543141', '2147483647');

-- -----------------------------
-- Table structure for `cjnet_region`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_region`;
CREATE TABLE `cjnet_region` (
  `region_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_name` varchar(120) NOT NULL DEFAULT '',
  `region_type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`region_id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`region_type`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_region`
-- -----------------------------
INSERT INTO `cjnet_region` VALUES ('1', '0', '中国', '0', '0');
INSERT INTO `cjnet_region` VALUES ('2', '1', '北京', '1', '0');
INSERT INTO `cjnet_region` VALUES ('3', '1', '安徽', '1', '0');
INSERT INTO `cjnet_region` VALUES ('4', '1', '福建', '1', '0');
INSERT INTO `cjnet_region` VALUES ('5', '1', '甘肃', '1', '0');
INSERT INTO `cjnet_region` VALUES ('6', '1', '广东', '1', '0');
INSERT INTO `cjnet_region` VALUES ('7', '1', '广西', '1', '0');
INSERT INTO `cjnet_region` VALUES ('8', '1', '贵州', '1', '0');
INSERT INTO `cjnet_region` VALUES ('9', '1', '海南', '1', '0');
INSERT INTO `cjnet_region` VALUES ('10', '1', '河北', '1', '0');
INSERT INTO `cjnet_region` VALUES ('11', '1', '河南', '1', '0');
INSERT INTO `cjnet_region` VALUES ('12', '1', '黑龙江', '1', '0');
INSERT INTO `cjnet_region` VALUES ('13', '1', '湖北', '1', '0');
INSERT INTO `cjnet_region` VALUES ('14', '1', '湖南', '1', '0');
INSERT INTO `cjnet_region` VALUES ('15', '1', '吉林', '1', '0');
INSERT INTO `cjnet_region` VALUES ('16', '1', '江苏', '1', '0');
INSERT INTO `cjnet_region` VALUES ('17', '1', '江西', '1', '0');
INSERT INTO `cjnet_region` VALUES ('18', '1', '辽宁', '1', '0');
INSERT INTO `cjnet_region` VALUES ('19', '1', '内蒙古', '1', '0');
INSERT INTO `cjnet_region` VALUES ('20', '1', '宁夏', '1', '0');
INSERT INTO `cjnet_region` VALUES ('21', '1', '青海', '1', '0');
INSERT INTO `cjnet_region` VALUES ('22', '1', '山东', '1', '0');
INSERT INTO `cjnet_region` VALUES ('23', '1', '山西', '1', '0');
INSERT INTO `cjnet_region` VALUES ('24', '1', '陕西', '1', '0');
INSERT INTO `cjnet_region` VALUES ('25', '1', '上海', '1', '0');
INSERT INTO `cjnet_region` VALUES ('26', '1', '四川', '1', '0');
INSERT INTO `cjnet_region` VALUES ('27', '1', '天津', '1', '0');
INSERT INTO `cjnet_region` VALUES ('28', '1', '西藏', '1', '0');
INSERT INTO `cjnet_region` VALUES ('29', '1', '新疆', '1', '0');
INSERT INTO `cjnet_region` VALUES ('30', '1', '云南', '1', '0');
INSERT INTO `cjnet_region` VALUES ('31', '1', '浙江', '1', '0');
INSERT INTO `cjnet_region` VALUES ('32', '1', '重庆', '1', '0');
INSERT INTO `cjnet_region` VALUES ('33', '1', '香港', '1', '0');
INSERT INTO `cjnet_region` VALUES ('34', '1', '澳门', '1', '0');
INSERT INTO `cjnet_region` VALUES ('35', '1', '台湾', '1', '0');
INSERT INTO `cjnet_region` VALUES ('36', '3', '安庆', '2', '0');
INSERT INTO `cjnet_region` VALUES ('37', '3', '蚌埠', '2', '0');
INSERT INTO `cjnet_region` VALUES ('38', '3', '巢湖', '2', '0');
INSERT INTO `cjnet_region` VALUES ('39', '3', '池州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('40', '3', '滁州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('41', '3', '阜阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('42', '3', '淮北', '2', '0');
INSERT INTO `cjnet_region` VALUES ('43', '3', '淮南', '2', '0');
INSERT INTO `cjnet_region` VALUES ('44', '3', '黄山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('45', '3', '六安', '2', '0');
INSERT INTO `cjnet_region` VALUES ('46', '3', '马鞍山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('47', '3', '宿州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('48', '3', '铜陵', '2', '0');
INSERT INTO `cjnet_region` VALUES ('49', '3', '芜湖', '2', '0');
INSERT INTO `cjnet_region` VALUES ('50', '3', '宣城', '2', '0');
INSERT INTO `cjnet_region` VALUES ('51', '3', '亳州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('52', '2', '北京', '2', '0');
INSERT INTO `cjnet_region` VALUES ('53', '4', '福州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('54', '4', '龙岩', '2', '0');
INSERT INTO `cjnet_region` VALUES ('55', '4', '南平', '2', '0');
INSERT INTO `cjnet_region` VALUES ('56', '4', '宁德', '2', '0');
INSERT INTO `cjnet_region` VALUES ('57', '4', '莆田', '2', '0');
INSERT INTO `cjnet_region` VALUES ('58', '4', '泉州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('59', '4', '三明', '2', '0');
INSERT INTO `cjnet_region` VALUES ('60', '4', '厦门', '2', '0');
INSERT INTO `cjnet_region` VALUES ('61', '4', '漳州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('62', '5', '兰州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('63', '5', '白银', '2', '0');
INSERT INTO `cjnet_region` VALUES ('64', '5', '定西', '2', '0');
INSERT INTO `cjnet_region` VALUES ('65', '5', '甘南', '2', '0');
INSERT INTO `cjnet_region` VALUES ('66', '5', '嘉峪关', '2', '0');
INSERT INTO `cjnet_region` VALUES ('67', '5', '金昌', '2', '0');
INSERT INTO `cjnet_region` VALUES ('68', '5', '酒泉', '2', '0');
INSERT INTO `cjnet_region` VALUES ('69', '5', '临夏', '2', '0');
INSERT INTO `cjnet_region` VALUES ('70', '5', '陇南', '2', '0');
INSERT INTO `cjnet_region` VALUES ('71', '5', '平凉', '2', '0');
INSERT INTO `cjnet_region` VALUES ('72', '5', '庆阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('73', '5', '天水', '2', '0');
INSERT INTO `cjnet_region` VALUES ('74', '5', '武威', '2', '0');
INSERT INTO `cjnet_region` VALUES ('75', '5', '张掖', '2', '0');
INSERT INTO `cjnet_region` VALUES ('76', '6', '广州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('77', '6', '深圳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('78', '6', '潮州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('79', '6', '东莞', '2', '0');
INSERT INTO `cjnet_region` VALUES ('80', '6', '佛山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('81', '6', '河源', '2', '0');
INSERT INTO `cjnet_region` VALUES ('82', '6', '惠州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('83', '6', '江门', '2', '0');
INSERT INTO `cjnet_region` VALUES ('84', '6', '揭阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('85', '6', '茂名', '2', '0');
INSERT INTO `cjnet_region` VALUES ('86', '6', '梅州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('87', '6', '清远', '2', '0');
INSERT INTO `cjnet_region` VALUES ('88', '6', '汕头', '2', '0');
INSERT INTO `cjnet_region` VALUES ('89', '6', '汕尾', '2', '0');
INSERT INTO `cjnet_region` VALUES ('90', '6', '韶关', '2', '0');
INSERT INTO `cjnet_region` VALUES ('91', '6', '阳江', '2', '0');
INSERT INTO `cjnet_region` VALUES ('92', '6', '云浮', '2', '0');
INSERT INTO `cjnet_region` VALUES ('93', '6', '湛江', '2', '0');
INSERT INTO `cjnet_region` VALUES ('94', '6', '肇庆', '2', '0');
INSERT INTO `cjnet_region` VALUES ('95', '6', '中山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('96', '6', '珠海', '2', '0');
INSERT INTO `cjnet_region` VALUES ('97', '7', '南宁', '2', '0');
INSERT INTO `cjnet_region` VALUES ('98', '7', '桂林', '2', '0');
INSERT INTO `cjnet_region` VALUES ('99', '7', '百色', '2', '0');
INSERT INTO `cjnet_region` VALUES ('100', '7', '北海', '2', '0');
INSERT INTO `cjnet_region` VALUES ('101', '7', '崇左', '2', '0');
INSERT INTO `cjnet_region` VALUES ('102', '7', '防城港', '2', '0');
INSERT INTO `cjnet_region` VALUES ('103', '7', '贵港', '2', '0');
INSERT INTO `cjnet_region` VALUES ('104', '7', '河池', '2', '0');
INSERT INTO `cjnet_region` VALUES ('105', '7', '贺州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('106', '7', '来宾', '2', '0');
INSERT INTO `cjnet_region` VALUES ('107', '7', '柳州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('108', '7', '钦州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('109', '7', '梧州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('110', '7', '玉林', '2', '0');
INSERT INTO `cjnet_region` VALUES ('111', '8', '贵阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('112', '8', '安顺', '2', '0');
INSERT INTO `cjnet_region` VALUES ('113', '8', '毕节', '2', '0');
INSERT INTO `cjnet_region` VALUES ('114', '8', '六盘水', '2', '0');
INSERT INTO `cjnet_region` VALUES ('115', '8', '黔东南', '2', '0');
INSERT INTO `cjnet_region` VALUES ('116', '8', '黔南', '2', '0');
INSERT INTO `cjnet_region` VALUES ('117', '8', '黔西南', '2', '0');
INSERT INTO `cjnet_region` VALUES ('118', '8', '铜仁', '2', '0');
INSERT INTO `cjnet_region` VALUES ('119', '8', '遵义', '2', '0');
INSERT INTO `cjnet_region` VALUES ('120', '9', '海口', '2', '0');
INSERT INTO `cjnet_region` VALUES ('121', '9', '三亚', '2', '0');
INSERT INTO `cjnet_region` VALUES ('122', '9', '白沙', '2', '0');
INSERT INTO `cjnet_region` VALUES ('123', '9', '保亭', '2', '0');
INSERT INTO `cjnet_region` VALUES ('124', '9', '昌江', '2', '0');
INSERT INTO `cjnet_region` VALUES ('125', '9', '澄迈县', '2', '0');
INSERT INTO `cjnet_region` VALUES ('126', '9', '定安县', '2', '0');
INSERT INTO `cjnet_region` VALUES ('127', '9', '东方', '2', '0');
INSERT INTO `cjnet_region` VALUES ('128', '9', '乐东', '2', '0');
INSERT INTO `cjnet_region` VALUES ('129', '9', '临高县', '2', '0');
INSERT INTO `cjnet_region` VALUES ('130', '9', '陵水', '2', '0');
INSERT INTO `cjnet_region` VALUES ('131', '9', '琼海', '2', '0');
INSERT INTO `cjnet_region` VALUES ('132', '9', '琼中', '2', '0');
INSERT INTO `cjnet_region` VALUES ('133', '9', '屯昌县', '2', '0');
INSERT INTO `cjnet_region` VALUES ('134', '9', '万宁', '2', '0');
INSERT INTO `cjnet_region` VALUES ('135', '9', '文昌', '2', '0');
INSERT INTO `cjnet_region` VALUES ('136', '9', '五指山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('137', '9', '儋州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('138', '10', '石家庄', '2', '0');
INSERT INTO `cjnet_region` VALUES ('139', '10', '保定', '2', '0');
INSERT INTO `cjnet_region` VALUES ('140', '10', '沧州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('141', '10', '承德', '2', '0');
INSERT INTO `cjnet_region` VALUES ('142', '10', '邯郸', '2', '0');
INSERT INTO `cjnet_region` VALUES ('143', '10', '衡水', '2', '0');
INSERT INTO `cjnet_region` VALUES ('144', '10', '廊坊', '2', '0');
INSERT INTO `cjnet_region` VALUES ('145', '10', '秦皇岛', '2', '0');
INSERT INTO `cjnet_region` VALUES ('146', '10', '唐山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('147', '10', '邢台', '2', '0');
INSERT INTO `cjnet_region` VALUES ('148', '10', '张家口', '2', '0');
INSERT INTO `cjnet_region` VALUES ('149', '11', '郑州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('150', '11', '洛阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('151', '11', '开封', '2', '0');
INSERT INTO `cjnet_region` VALUES ('152', '11', '安阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('153', '11', '鹤壁', '2', '0');
INSERT INTO `cjnet_region` VALUES ('154', '11', '济源', '2', '0');
INSERT INTO `cjnet_region` VALUES ('155', '11', '焦作', '2', '0');
INSERT INTO `cjnet_region` VALUES ('156', '11', '南阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('157', '11', '平顶山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('158', '11', '三门峡', '2', '0');
INSERT INTO `cjnet_region` VALUES ('159', '11', '商丘', '2', '0');
INSERT INTO `cjnet_region` VALUES ('160', '11', '新乡', '2', '0');
INSERT INTO `cjnet_region` VALUES ('161', '11', '信阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('162', '11', '许昌', '2', '0');
INSERT INTO `cjnet_region` VALUES ('163', '11', '周口', '2', '0');
INSERT INTO `cjnet_region` VALUES ('164', '11', '驻马店', '2', '0');
INSERT INTO `cjnet_region` VALUES ('165', '11', '漯河', '2', '0');
INSERT INTO `cjnet_region` VALUES ('166', '11', '濮阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('167', '12', '哈尔滨', '2', '0');
INSERT INTO `cjnet_region` VALUES ('168', '12', '大庆', '2', '0');
INSERT INTO `cjnet_region` VALUES ('169', '12', '大兴安岭', '2', '0');
INSERT INTO `cjnet_region` VALUES ('170', '12', '鹤岗', '2', '0');
INSERT INTO `cjnet_region` VALUES ('171', '12', '黑河', '2', '0');
INSERT INTO `cjnet_region` VALUES ('172', '12', '鸡西', '2', '0');
INSERT INTO `cjnet_region` VALUES ('173', '12', '佳木斯', '2', '0');
INSERT INTO `cjnet_region` VALUES ('174', '12', '牡丹江', '2', '0');
INSERT INTO `cjnet_region` VALUES ('175', '12', '七台河', '2', '0');
INSERT INTO `cjnet_region` VALUES ('176', '12', '齐齐哈尔', '2', '0');
INSERT INTO `cjnet_region` VALUES ('177', '12', '双鸭山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('178', '12', '绥化', '2', '0');
INSERT INTO `cjnet_region` VALUES ('179', '12', '伊春', '2', '0');
INSERT INTO `cjnet_region` VALUES ('180', '13', '武汉', '2', '0');
INSERT INTO `cjnet_region` VALUES ('181', '13', '仙桃', '2', '0');
INSERT INTO `cjnet_region` VALUES ('182', '13', '鄂州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('183', '13', '黄冈', '2', '0');
INSERT INTO `cjnet_region` VALUES ('184', '13', '黄石', '2', '0');
INSERT INTO `cjnet_region` VALUES ('185', '13', '荆门', '2', '0');
INSERT INTO `cjnet_region` VALUES ('186', '13', '荆州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('187', '13', '潜江', '2', '0');
INSERT INTO `cjnet_region` VALUES ('188', '13', '神农架林区', '2', '0');
INSERT INTO `cjnet_region` VALUES ('189', '13', '十堰', '2', '0');
INSERT INTO `cjnet_region` VALUES ('190', '13', '随州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('191', '13', '天门', '2', '0');
INSERT INTO `cjnet_region` VALUES ('192', '13', '咸宁', '2', '0');
INSERT INTO `cjnet_region` VALUES ('193', '13', '襄樊', '2', '0');
INSERT INTO `cjnet_region` VALUES ('194', '13', '孝感', '2', '0');
INSERT INTO `cjnet_region` VALUES ('195', '13', '宜昌', '2', '0');
INSERT INTO `cjnet_region` VALUES ('196', '13', '恩施', '2', '0');
INSERT INTO `cjnet_region` VALUES ('197', '14', '长沙', '2', '0');
INSERT INTO `cjnet_region` VALUES ('198', '14', '张家界', '2', '0');
INSERT INTO `cjnet_region` VALUES ('199', '14', '常德', '2', '0');
INSERT INTO `cjnet_region` VALUES ('200', '14', '郴州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('201', '14', '衡阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('202', '14', '怀化', '2', '0');
INSERT INTO `cjnet_region` VALUES ('203', '14', '娄底', '2', '0');
INSERT INTO `cjnet_region` VALUES ('204', '14', '邵阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('205', '14', '湘潭', '2', '0');
INSERT INTO `cjnet_region` VALUES ('206', '14', '湘西', '2', '0');
INSERT INTO `cjnet_region` VALUES ('207', '14', '益阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('208', '14', '永州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('209', '14', '岳阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('210', '14', '株洲', '2', '0');
INSERT INTO `cjnet_region` VALUES ('211', '15', '长春', '2', '0');
INSERT INTO `cjnet_region` VALUES ('212', '15', '吉林', '2', '0');
INSERT INTO `cjnet_region` VALUES ('213', '15', '白城', '2', '0');
INSERT INTO `cjnet_region` VALUES ('214', '15', '白山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('215', '15', '辽源', '2', '0');
INSERT INTO `cjnet_region` VALUES ('216', '15', '四平', '2', '0');
INSERT INTO `cjnet_region` VALUES ('217', '15', '松原', '2', '0');
INSERT INTO `cjnet_region` VALUES ('218', '15', '通化', '2', '0');
INSERT INTO `cjnet_region` VALUES ('219', '15', '延边', '2', '0');
INSERT INTO `cjnet_region` VALUES ('220', '16', '南京', '2', '0');
INSERT INTO `cjnet_region` VALUES ('221', '16', '苏州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('222', '16', '无锡', '2', '0');
INSERT INTO `cjnet_region` VALUES ('223', '16', '常州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('224', '16', '淮安', '2', '0');
INSERT INTO `cjnet_region` VALUES ('225', '16', '连云港', '2', '0');
INSERT INTO `cjnet_region` VALUES ('226', '16', '南通', '2', '0');
INSERT INTO `cjnet_region` VALUES ('227', '16', '宿迁', '2', '0');
INSERT INTO `cjnet_region` VALUES ('228', '16', '泰州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('229', '16', '徐州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('230', '16', '盐城', '2', '0');
INSERT INTO `cjnet_region` VALUES ('231', '16', '扬州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('232', '16', '镇江', '2', '0');
INSERT INTO `cjnet_region` VALUES ('233', '17', '南昌', '2', '0');
INSERT INTO `cjnet_region` VALUES ('234', '17', '抚州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('235', '17', '赣州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('236', '17', '吉安', '2', '0');
INSERT INTO `cjnet_region` VALUES ('237', '17', '景德镇', '2', '0');
INSERT INTO `cjnet_region` VALUES ('238', '17', '九江', '2', '0');
INSERT INTO `cjnet_region` VALUES ('239', '17', '萍乡', '2', '0');
INSERT INTO `cjnet_region` VALUES ('240', '17', '上饶', '2', '0');
INSERT INTO `cjnet_region` VALUES ('241', '17', '新余', '2', '0');
INSERT INTO `cjnet_region` VALUES ('242', '17', '宜春', '2', '0');
INSERT INTO `cjnet_region` VALUES ('243', '17', '鹰潭', '2', '0');
INSERT INTO `cjnet_region` VALUES ('244', '18', '沈阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('245', '18', '大连', '2', '0');
INSERT INTO `cjnet_region` VALUES ('246', '18', '鞍山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('247', '18', '本溪', '2', '0');
INSERT INTO `cjnet_region` VALUES ('248', '18', '朝阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('249', '18', '丹东', '2', '0');
INSERT INTO `cjnet_region` VALUES ('250', '18', '抚顺', '2', '0');
INSERT INTO `cjnet_region` VALUES ('251', '18', '阜新', '2', '0');
INSERT INTO `cjnet_region` VALUES ('252', '18', '葫芦岛', '2', '0');
INSERT INTO `cjnet_region` VALUES ('253', '18', '锦州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('254', '18', '辽阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('255', '18', '盘锦', '2', '0');
INSERT INTO `cjnet_region` VALUES ('256', '18', '铁岭', '2', '0');
INSERT INTO `cjnet_region` VALUES ('257', '18', '营口', '2', '0');
INSERT INTO `cjnet_region` VALUES ('258', '19', '呼和浩特', '2', '0');
INSERT INTO `cjnet_region` VALUES ('259', '19', '阿拉善盟', '2', '0');
INSERT INTO `cjnet_region` VALUES ('260', '19', '巴彦淖尔盟', '2', '0');
INSERT INTO `cjnet_region` VALUES ('261', '19', '包头', '2', '0');
INSERT INTO `cjnet_region` VALUES ('262', '19', '赤峰', '2', '0');
INSERT INTO `cjnet_region` VALUES ('263', '19', '鄂尔多斯', '2', '0');
INSERT INTO `cjnet_region` VALUES ('264', '19', '呼伦贝尔', '2', '0');
INSERT INTO `cjnet_region` VALUES ('265', '19', '通辽', '2', '0');
INSERT INTO `cjnet_region` VALUES ('266', '19', '乌海', '2', '0');
INSERT INTO `cjnet_region` VALUES ('267', '19', '乌兰察布市', '2', '0');
INSERT INTO `cjnet_region` VALUES ('268', '19', '锡林郭勒盟', '2', '0');
INSERT INTO `cjnet_region` VALUES ('269', '19', '兴安盟', '2', '0');
INSERT INTO `cjnet_region` VALUES ('270', '20', '银川', '2', '0');
INSERT INTO `cjnet_region` VALUES ('271', '20', '固原', '2', '0');
INSERT INTO `cjnet_region` VALUES ('272', '20', '石嘴山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('273', '20', '吴忠', '2', '0');
INSERT INTO `cjnet_region` VALUES ('274', '20', '中卫', '2', '0');
INSERT INTO `cjnet_region` VALUES ('275', '21', '西宁', '2', '0');
INSERT INTO `cjnet_region` VALUES ('276', '21', '果洛', '2', '0');
INSERT INTO `cjnet_region` VALUES ('277', '21', '海北', '2', '0');
INSERT INTO `cjnet_region` VALUES ('278', '21', '海东', '2', '0');
INSERT INTO `cjnet_region` VALUES ('279', '21', '海南', '2', '0');
INSERT INTO `cjnet_region` VALUES ('280', '21', '海西', '2', '0');
INSERT INTO `cjnet_region` VALUES ('281', '21', '黄南', '2', '0');
INSERT INTO `cjnet_region` VALUES ('282', '21', '玉树', '2', '0');
INSERT INTO `cjnet_region` VALUES ('283', '22', '济南', '2', '0');
INSERT INTO `cjnet_region` VALUES ('284', '22', '青岛', '2', '0');
INSERT INTO `cjnet_region` VALUES ('285', '22', '滨州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('286', '22', '德州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('287', '22', '东营', '2', '0');
INSERT INTO `cjnet_region` VALUES ('288', '22', '菏泽', '2', '0');
INSERT INTO `cjnet_region` VALUES ('289', '22', '济宁', '2', '0');
INSERT INTO `cjnet_region` VALUES ('290', '22', '莱芜', '2', '0');
INSERT INTO `cjnet_region` VALUES ('291', '22', '聊城', '2', '0');
INSERT INTO `cjnet_region` VALUES ('292', '22', '临沂', '2', '0');
INSERT INTO `cjnet_region` VALUES ('293', '22', '日照', '2', '0');
INSERT INTO `cjnet_region` VALUES ('294', '22', '泰安', '2', '0');
INSERT INTO `cjnet_region` VALUES ('295', '22', '威海', '2', '0');
INSERT INTO `cjnet_region` VALUES ('296', '22', '潍坊', '2', '0');
INSERT INTO `cjnet_region` VALUES ('297', '22', '烟台', '2', '0');
INSERT INTO `cjnet_region` VALUES ('298', '22', '枣庄', '2', '0');
INSERT INTO `cjnet_region` VALUES ('299', '22', '淄博', '2', '0');
INSERT INTO `cjnet_region` VALUES ('300', '23', '太原', '2', '0');
INSERT INTO `cjnet_region` VALUES ('301', '23', '长治', '2', '0');
INSERT INTO `cjnet_region` VALUES ('302', '23', '大同', '2', '0');
INSERT INTO `cjnet_region` VALUES ('303', '23', '晋城', '2', '0');
INSERT INTO `cjnet_region` VALUES ('304', '23', '晋中', '2', '0');
INSERT INTO `cjnet_region` VALUES ('305', '23', '临汾', '2', '0');
INSERT INTO `cjnet_region` VALUES ('306', '23', '吕梁', '2', '0');
INSERT INTO `cjnet_region` VALUES ('307', '23', '朔州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('308', '23', '忻州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('309', '23', '阳泉', '2', '0');
INSERT INTO `cjnet_region` VALUES ('310', '23', '运城', '2', '0');
INSERT INTO `cjnet_region` VALUES ('311', '24', '西安', '2', '0');
INSERT INTO `cjnet_region` VALUES ('312', '24', '安康', '2', '0');
INSERT INTO `cjnet_region` VALUES ('313', '24', '宝鸡', '2', '0');
INSERT INTO `cjnet_region` VALUES ('314', '24', '汉中', '2', '0');
INSERT INTO `cjnet_region` VALUES ('315', '24', '商洛', '2', '0');
INSERT INTO `cjnet_region` VALUES ('316', '24', '铜川', '2', '0');
INSERT INTO `cjnet_region` VALUES ('317', '24', '渭南', '2', '0');
INSERT INTO `cjnet_region` VALUES ('318', '24', '咸阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('319', '24', '延安', '2', '0');
INSERT INTO `cjnet_region` VALUES ('320', '24', '榆林', '2', '0');
INSERT INTO `cjnet_region` VALUES ('321', '25', '上海', '2', '0');
INSERT INTO `cjnet_region` VALUES ('322', '26', '成都', '2', '0');
INSERT INTO `cjnet_region` VALUES ('323', '26', '绵阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('324', '26', '阿坝', '2', '0');
INSERT INTO `cjnet_region` VALUES ('325', '26', '巴中', '2', '0');
INSERT INTO `cjnet_region` VALUES ('326', '26', '达州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('327', '26', '德阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('328', '26', '甘孜', '2', '0');
INSERT INTO `cjnet_region` VALUES ('329', '26', '广安', '2', '0');
INSERT INTO `cjnet_region` VALUES ('330', '26', '广元', '2', '0');
INSERT INTO `cjnet_region` VALUES ('331', '26', '乐山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('332', '26', '凉山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('333', '26', '眉山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('334', '26', '南充', '2', '0');
INSERT INTO `cjnet_region` VALUES ('335', '26', '内江', '2', '0');
INSERT INTO `cjnet_region` VALUES ('336', '26', '攀枝花', '2', '0');
INSERT INTO `cjnet_region` VALUES ('337', '26', '遂宁', '2', '0');
INSERT INTO `cjnet_region` VALUES ('338', '26', '雅安', '2', '0');
INSERT INTO `cjnet_region` VALUES ('339', '26', '宜宾', '2', '0');
INSERT INTO `cjnet_region` VALUES ('340', '26', '资阳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('341', '26', '自贡', '2', '0');
INSERT INTO `cjnet_region` VALUES ('342', '26', '泸州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('343', '27', '天津', '2', '0');
INSERT INTO `cjnet_region` VALUES ('344', '28', '拉萨', '2', '0');
INSERT INTO `cjnet_region` VALUES ('345', '28', '阿里', '2', '0');
INSERT INTO `cjnet_region` VALUES ('346', '28', '昌都', '2', '0');
INSERT INTO `cjnet_region` VALUES ('347', '28', '林芝', '2', '0');
INSERT INTO `cjnet_region` VALUES ('348', '28', '那曲', '2', '0');
INSERT INTO `cjnet_region` VALUES ('349', '28', '日喀则', '2', '0');
INSERT INTO `cjnet_region` VALUES ('350', '28', '山南', '2', '0');
INSERT INTO `cjnet_region` VALUES ('351', '29', '乌鲁木齐', '2', '0');
INSERT INTO `cjnet_region` VALUES ('352', '29', '阿克苏', '2', '0');
INSERT INTO `cjnet_region` VALUES ('353', '29', '阿拉尔', '2', '0');
INSERT INTO `cjnet_region` VALUES ('354', '29', '巴音郭楞', '2', '0');
INSERT INTO `cjnet_region` VALUES ('355', '29', '博尔塔拉', '2', '0');
INSERT INTO `cjnet_region` VALUES ('356', '29', '昌吉', '2', '0');
INSERT INTO `cjnet_region` VALUES ('357', '29', '哈密', '2', '0');
INSERT INTO `cjnet_region` VALUES ('358', '29', '和田', '2', '0');
INSERT INTO `cjnet_region` VALUES ('359', '29', '喀什', '2', '0');
INSERT INTO `cjnet_region` VALUES ('360', '29', '克拉玛依', '2', '0');
INSERT INTO `cjnet_region` VALUES ('361', '29', '克孜勒苏', '2', '0');
INSERT INTO `cjnet_region` VALUES ('362', '29', '石河子', '2', '0');
INSERT INTO `cjnet_region` VALUES ('363', '29', '图木舒克', '2', '0');
INSERT INTO `cjnet_region` VALUES ('364', '29', '吐鲁番', '2', '0');
INSERT INTO `cjnet_region` VALUES ('365', '29', '五家渠', '2', '0');
INSERT INTO `cjnet_region` VALUES ('366', '29', '伊犁', '2', '0');
INSERT INTO `cjnet_region` VALUES ('367', '30', '昆明', '2', '0');
INSERT INTO `cjnet_region` VALUES ('368', '30', '怒江', '2', '0');
INSERT INTO `cjnet_region` VALUES ('369', '30', '普洱', '2', '0');
INSERT INTO `cjnet_region` VALUES ('370', '30', '丽江', '2', '0');
INSERT INTO `cjnet_region` VALUES ('371', '30', '保山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('372', '30', '楚雄', '2', '0');
INSERT INTO `cjnet_region` VALUES ('373', '30', '大理', '2', '0');
INSERT INTO `cjnet_region` VALUES ('374', '30', '德宏', '2', '0');
INSERT INTO `cjnet_region` VALUES ('375', '30', '迪庆', '2', '0');
INSERT INTO `cjnet_region` VALUES ('376', '30', '红河', '2', '0');
INSERT INTO `cjnet_region` VALUES ('377', '30', '临沧', '2', '0');
INSERT INTO `cjnet_region` VALUES ('378', '30', '曲靖', '2', '0');
INSERT INTO `cjnet_region` VALUES ('379', '30', '文山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('380', '30', '西双版纳', '2', '0');
INSERT INTO `cjnet_region` VALUES ('381', '30', '玉溪', '2', '0');
INSERT INTO `cjnet_region` VALUES ('382', '30', '昭通', '2', '0');
INSERT INTO `cjnet_region` VALUES ('383', '31', '杭州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('384', '31', '湖州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('385', '31', '嘉兴', '2', '0');
INSERT INTO `cjnet_region` VALUES ('386', '31', '金华', '2', '0');
INSERT INTO `cjnet_region` VALUES ('387', '31', '丽水', '2', '0');
INSERT INTO `cjnet_region` VALUES ('388', '31', '宁波', '2', '0');
INSERT INTO `cjnet_region` VALUES ('389', '31', '绍兴', '2', '0');
INSERT INTO `cjnet_region` VALUES ('390', '31', '台州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('391', '31', '温州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('392', '31', '舟山', '2', '0');
INSERT INTO `cjnet_region` VALUES ('393', '31', '衢州', '2', '0');
INSERT INTO `cjnet_region` VALUES ('394', '32', '重庆', '2', '0');
INSERT INTO `cjnet_region` VALUES ('395', '33', '香港', '2', '0');
INSERT INTO `cjnet_region` VALUES ('396', '34', '澳门', '2', '0');
INSERT INTO `cjnet_region` VALUES ('397', '35', '台湾', '2', '0');
INSERT INTO `cjnet_region` VALUES ('398', '36', '迎江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('399', '36', '大观区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('400', '36', '宜秀区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('401', '36', '桐城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('402', '36', '怀宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('403', '36', '枞阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('404', '36', '潜山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('405', '36', '太湖县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('406', '36', '宿松县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('407', '36', '望江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('408', '36', '岳西县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('409', '37', '中市区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('410', '37', '东市区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('411', '37', '西市区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('412', '37', '郊区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('413', '37', '怀远县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('414', '37', '五河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('415', '37', '固镇县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('416', '38', '居巢区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('417', '38', '庐江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('418', '38', '无为县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('419', '38', '含山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('420', '38', '和县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('421', '39', '贵池区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('422', '39', '东至县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('423', '39', '石台县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('424', '39', '青阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('425', '40', '琅琊区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('426', '40', '南谯区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('427', '40', '天长市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('428', '40', '明光市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('429', '40', '来安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('430', '40', '全椒县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('431', '40', '定远县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('432', '40', '凤阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('433', '41', '蚌山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('434', '41', '龙子湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('435', '41', '禹会区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('436', '41', '淮上区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('437', '41', '颍州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('438', '41', '颍东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('439', '41', '颍泉区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('440', '41', '界首市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('441', '41', '临泉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('442', '41', '太和县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('443', '41', '阜南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('444', '41', '颖上县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('445', '42', '相山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('446', '42', '杜集区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('447', '42', '烈山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('448', '42', '濉溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('449', '43', '田家庵区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('450', '43', '大通区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('451', '43', '谢家集区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('452', '43', '八公山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('453', '43', '潘集区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('454', '43', '凤台县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('455', '44', '屯溪区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('456', '44', '黄山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('457', '44', '徽州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('458', '44', '歙县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('459', '44', '休宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('460', '44', '黟县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('461', '44', '祁门县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('462', '45', '金安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('463', '45', '裕安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('464', '45', '寿县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('465', '45', '霍邱县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('466', '45', '舒城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('467', '45', '金寨县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('468', '45', '霍山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('469', '46', '雨山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('470', '46', '花山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('471', '46', '金家庄区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('472', '46', '当涂县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('473', '47', '埇桥区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('474', '47', '砀山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('475', '47', '萧县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('476', '47', '灵璧县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('477', '47', '泗县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('478', '48', '铜官山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('479', '48', '狮子山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('480', '48', '郊区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('481', '48', '铜陵县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('482', '49', '镜湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('483', '49', '弋江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('484', '49', '鸠江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('485', '49', '三山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('486', '49', '芜湖县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('487', '49', '繁昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('488', '49', '南陵县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('489', '50', '宣州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('490', '50', '宁国市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('491', '50', '郎溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('492', '50', '广德县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('493', '50', '泾县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('494', '50', '绩溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('495', '50', '旌德县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('496', '51', '涡阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('497', '51', '蒙城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('498', '51', '利辛县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('499', '51', '谯城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('500', '52', '东城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('501', '52', '西城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('502', '52', '海淀区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('503', '52', '朝阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('504', '52', '崇文区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('505', '52', '宣武区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('506', '52', '丰台区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('507', '52', '石景山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('508', '52', '房山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('509', '52', '门头沟区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('510', '52', '通州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('511', '52', '顺义区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('512', '52', '昌平区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('513', '52', '怀柔区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('514', '52', '平谷区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('515', '52', '大兴区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('516', '52', '密云县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('517', '52', '延庆县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('518', '53', '鼓楼区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('519', '53', '台江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('520', '53', '仓山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('521', '53', '马尾区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('522', '53', '晋安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('523', '53', '福清市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('524', '53', '长乐市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('525', '53', '闽侯县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('526', '53', '连江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('527', '53', '罗源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('528', '53', '闽清县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('529', '53', '永泰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('530', '53', '平潭县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('531', '54', '新罗区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('532', '54', '漳平市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('533', '54', '长汀县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('534', '54', '永定县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('535', '54', '上杭县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('536', '54', '武平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('537', '54', '连城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('538', '55', '延平区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('539', '55', '邵武市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('540', '55', '武夷山市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('541', '55', '建瓯市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('542', '55', '建阳市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('543', '55', '顺昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('544', '55', '浦城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('545', '55', '光泽县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('546', '55', '松溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('547', '55', '政和县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('548', '56', '蕉城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('549', '56', '福安市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('550', '56', '福鼎市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('551', '56', '霞浦县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('552', '56', '古田县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('553', '56', '屏南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('554', '56', '寿宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('555', '56', '周宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('556', '56', '柘荣县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('557', '57', '城厢区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('558', '57', '涵江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('559', '57', '荔城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('560', '57', '秀屿区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('561', '57', '仙游县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('562', '58', '鲤城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('563', '58', '丰泽区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('564', '58', '洛江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('565', '58', '清濛开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('566', '58', '泉港区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('567', '58', '石狮市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('568', '58', '晋江市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('569', '58', '南安市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('570', '58', '惠安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('571', '58', '安溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('572', '58', '永春县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('573', '58', '德化县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('574', '58', '金门县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('575', '59', '梅列区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('576', '59', '三元区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('577', '59', '永安市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('578', '59', '明溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('579', '59', '清流县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('580', '59', '宁化县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('581', '59', '大田县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('582', '59', '尤溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('583', '59', '沙县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('584', '59', '将乐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('585', '59', '泰宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('586', '59', '建宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('587', '60', '思明区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('588', '60', '海沧区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('589', '60', '湖里区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('590', '60', '集美区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('591', '60', '同安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('592', '60', '翔安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('593', '61', '芗城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('594', '61', '龙文区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('595', '61', '龙海市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('596', '61', '云霄县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('597', '61', '漳浦县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('598', '61', '诏安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('599', '61', '长泰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('600', '61', '东山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('601', '61', '南靖县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('602', '61', '平和县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('603', '61', '华安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('604', '62', '皋兰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('605', '62', '城关区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('606', '62', '七里河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('607', '62', '西固区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('608', '62', '安宁区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('609', '62', '红古区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('610', '62', '永登县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('611', '62', '榆中县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('612', '63', '白银区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('613', '63', '平川区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('614', '63', '会宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('615', '63', '景泰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('616', '63', '靖远县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('617', '64', '临洮县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('618', '64', '陇西县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('619', '64', '通渭县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('620', '64', '渭源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('621', '64', '漳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('622', '64', '岷县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('623', '64', '安定区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('624', '64', '安定区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('625', '65', '合作市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('626', '65', '临潭县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('627', '65', '卓尼县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('628', '65', '舟曲县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('629', '65', '迭部县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('630', '65', '玛曲县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('631', '65', '碌曲县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('632', '65', '夏河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('633', '66', '嘉峪关市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('634', '67', '金川区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('635', '67', '永昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('636', '68', '肃州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('637', '68', '玉门市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('638', '68', '敦煌市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('639', '68', '金塔县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('640', '68', '瓜州县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('641', '68', '肃北', '3', '0');
INSERT INTO `cjnet_region` VALUES ('642', '68', '阿克塞', '3', '0');
INSERT INTO `cjnet_region` VALUES ('643', '69', '临夏市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('644', '69', '临夏县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('645', '69', '康乐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('646', '69', '永靖县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('647', '69', '广河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('648', '69', '和政县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('649', '69', '东乡族自治县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('650', '69', '积石山', '3', '0');
INSERT INTO `cjnet_region` VALUES ('651', '70', '成县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('652', '70', '徽县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('653', '70', '康县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('654', '70', '礼县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('655', '70', '两当县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('656', '70', '文县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('657', '70', '西和县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('658', '70', '宕昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('659', '70', '武都区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('660', '71', '崇信县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('661', '71', '华亭县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('662', '71', '静宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('663', '71', '灵台县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('664', '71', '崆峒区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('665', '71', '庄浪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('666', '71', '泾川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('667', '72', '合水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('668', '72', '华池县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('669', '72', '环县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('670', '72', '宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('671', '72', '庆城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('672', '72', '西峰区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('673', '72', '镇原县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('674', '72', '正宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('675', '73', '甘谷县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('676', '73', '秦安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('677', '73', '清水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('678', '73', '秦州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('679', '73', '麦积区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('680', '73', '武山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('681', '73', '张家川', '3', '0');
INSERT INTO `cjnet_region` VALUES ('682', '74', '古浪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('683', '74', '民勤县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('684', '74', '天祝', '3', '0');
INSERT INTO `cjnet_region` VALUES ('685', '74', '凉州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('686', '75', '高台县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('687', '75', '临泽县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('688', '75', '民乐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('689', '75', '山丹县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('690', '75', '肃南', '3', '0');
INSERT INTO `cjnet_region` VALUES ('691', '75', '甘州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('692', '76', '从化市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('693', '76', '天河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('694', '76', '东山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('695', '76', '白云区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('696', '76', '海珠区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('697', '76', '荔湾区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('698', '76', '越秀区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('699', '76', '黄埔区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('700', '76', '番禺区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('701', '76', '花都区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('702', '76', '增城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('703', '76', '从化区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('704', '76', '市郊', '3', '0');
INSERT INTO `cjnet_region` VALUES ('705', '77', '福田区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('706', '77', '罗湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('707', '77', '南山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('708', '77', '宝安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('709', '77', '龙岗区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('710', '77', '盐田区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('711', '78', '湘桥区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('712', '78', '潮安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('713', '78', '饶平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('714', '79', '南城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('715', '79', '东城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('716', '79', '万江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('717', '79', '莞城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('718', '79', '石龙镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('719', '79', '虎门镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('720', '79', '麻涌镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('721', '79', '道滘镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('722', '79', '石碣镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('723', '79', '沙田镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('724', '79', '望牛墩镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('725', '79', '洪梅镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('726', '79', '茶山镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('727', '79', '寮步镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('728', '79', '大岭山镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('729', '79', '大朗镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('730', '79', '黄江镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('731', '79', '樟木头', '3', '0');
INSERT INTO `cjnet_region` VALUES ('732', '79', '凤岗镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('733', '79', '塘厦镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('734', '79', '谢岗镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('735', '79', '厚街镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('736', '79', '清溪镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('737', '79', '常平镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('738', '79', '桥头镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('739', '79', '横沥镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('740', '79', '东坑镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('741', '79', '企石镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('742', '79', '石排镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('743', '79', '长安镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('744', '79', '中堂镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('745', '79', '高埗镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('746', '80', '禅城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('747', '80', '南海区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('748', '80', '顺德区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('749', '80', '三水区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('750', '80', '高明区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('751', '81', '东源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('752', '81', '和平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('753', '81', '源城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('754', '81', '连平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('755', '81', '龙川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('756', '81', '紫金县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('757', '82', '惠阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('758', '82', '惠城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('759', '82', '大亚湾', '3', '0');
INSERT INTO `cjnet_region` VALUES ('760', '82', '博罗县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('761', '82', '惠东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('762', '82', '龙门县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('763', '83', '江海区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('764', '83', '蓬江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('765', '83', '新会区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('766', '83', '台山市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('767', '83', '开平市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('768', '83', '鹤山市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('769', '83', '恩平市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('770', '84', '榕城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('771', '84', '普宁市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('772', '84', '揭东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('773', '84', '揭西县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('774', '84', '惠来县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('775', '85', '茂南区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('776', '85', '茂港区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('777', '85', '高州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('778', '85', '化州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('779', '85', '信宜市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('780', '85', '电白县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('781', '86', '梅县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('782', '86', '梅江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('783', '86', '兴宁市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('784', '86', '大埔县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('785', '86', '丰顺县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('786', '86', '五华县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('787', '86', '平远县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('788', '86', '蕉岭县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('789', '87', '清城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('790', '87', '英德市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('791', '87', '连州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('792', '87', '佛冈县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('793', '87', '阳山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('794', '87', '清新县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('795', '87', '连山', '3', '0');
INSERT INTO `cjnet_region` VALUES ('796', '87', '连南', '3', '0');
INSERT INTO `cjnet_region` VALUES ('797', '88', '南澳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('798', '88', '潮阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('799', '88', '澄海区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('800', '88', '龙湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('801', '88', '金平区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('802', '88', '濠江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('803', '88', '潮南区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('804', '89', '城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('805', '89', '陆丰市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('806', '89', '海丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('807', '89', '陆河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('808', '90', '曲江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('809', '90', '浈江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('810', '90', '武江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('811', '90', '曲江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('812', '90', '乐昌市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('813', '90', '南雄市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('814', '90', '始兴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('815', '90', '仁化县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('816', '90', '翁源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('817', '90', '新丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('818', '90', '乳源', '3', '0');
INSERT INTO `cjnet_region` VALUES ('819', '91', '江城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('820', '91', '阳春市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('821', '91', '阳西县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('822', '91', '阳东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('823', '92', '云城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('824', '92', '罗定市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('825', '92', '新兴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('826', '92', '郁南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('827', '92', '云安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('828', '93', '赤坎区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('829', '93', '霞山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('830', '93', '坡头区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('831', '93', '麻章区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('832', '93', '廉江市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('833', '93', '雷州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('834', '93', '吴川市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('835', '93', '遂溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('836', '93', '徐闻县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('837', '94', '肇庆市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('838', '94', '高要市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('839', '94', '四会市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('840', '94', '广宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('841', '94', '怀集县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('842', '94', '封开县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('843', '94', '德庆县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('844', '95', '石岐街道', '3', '0');
INSERT INTO `cjnet_region` VALUES ('845', '95', '东区街道', '3', '0');
INSERT INTO `cjnet_region` VALUES ('846', '95', '西区街道', '3', '0');
INSERT INTO `cjnet_region` VALUES ('847', '95', '环城街道', '3', '0');
INSERT INTO `cjnet_region` VALUES ('848', '95', '中山港街道', '3', '0');
INSERT INTO `cjnet_region` VALUES ('849', '95', '五桂山街道', '3', '0');
INSERT INTO `cjnet_region` VALUES ('850', '96', '香洲区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('851', '96', '斗门区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('852', '96', '金湾区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('853', '97', '邕宁区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('854', '97', '青秀区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('855', '97', '兴宁区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('856', '97', '良庆区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('857', '97', '西乡塘区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('858', '97', '江南区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('859', '97', '武鸣县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('860', '97', '隆安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('861', '97', '马山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('862', '97', '上林县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('863', '97', '宾阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('864', '97', '横县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('865', '98', '秀峰区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('866', '98', '叠彩区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('867', '98', '象山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('868', '98', '七星区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('869', '98', '雁山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('870', '98', '阳朔县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('871', '98', '临桂县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('872', '98', '灵川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('873', '98', '全州县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('874', '98', '平乐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('875', '98', '兴安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('876', '98', '灌阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('877', '98', '荔浦县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('878', '98', '资源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('879', '98', '永福县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('880', '98', '龙胜', '3', '0');
INSERT INTO `cjnet_region` VALUES ('881', '98', '恭城', '3', '0');
INSERT INTO `cjnet_region` VALUES ('882', '99', '右江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('883', '99', '凌云县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('884', '99', '平果县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('885', '99', '西林县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('886', '99', '乐业县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('887', '99', '德保县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('888', '99', '田林县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('889', '99', '田阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('890', '99', '靖西县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('891', '99', '田东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('892', '99', '那坡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('893', '99', '隆林', '3', '0');
INSERT INTO `cjnet_region` VALUES ('894', '100', '海城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('895', '100', '银海区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('896', '100', '铁山港区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('897', '100', '合浦县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('898', '101', '江州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('899', '101', '凭祥市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('900', '101', '宁明县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('901', '101', '扶绥县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('902', '101', '龙州县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('903', '101', '大新县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('904', '101', '天等县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('905', '102', '港口区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('906', '102', '防城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('907', '102', '东兴市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('908', '102', '上思县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('909', '103', '港北区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('910', '103', '港南区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('911', '103', '覃塘区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('912', '103', '桂平市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('913', '103', '平南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('914', '104', '金城江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('915', '104', '宜州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('916', '104', '天峨县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('917', '104', '凤山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('918', '104', '南丹县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('919', '104', '东兰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('920', '104', '都安', '3', '0');
INSERT INTO `cjnet_region` VALUES ('921', '104', '罗城', '3', '0');
INSERT INTO `cjnet_region` VALUES ('922', '104', '巴马', '3', '0');
INSERT INTO `cjnet_region` VALUES ('923', '104', '环江', '3', '0');
INSERT INTO `cjnet_region` VALUES ('924', '104', '大化', '3', '0');
INSERT INTO `cjnet_region` VALUES ('925', '105', '八步区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('926', '105', '钟山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('927', '105', '昭平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('928', '105', '富川', '3', '0');
INSERT INTO `cjnet_region` VALUES ('929', '106', '兴宾区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('930', '106', '合山市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('931', '106', '象州县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('932', '106', '武宣县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('933', '106', '忻城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('934', '106', '金秀', '3', '0');
INSERT INTO `cjnet_region` VALUES ('935', '107', '城中区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('936', '107', '鱼峰区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('937', '107', '柳北区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('938', '107', '柳南区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('939', '107', '柳江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('940', '107', '柳城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('941', '107', '鹿寨县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('942', '107', '融安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('943', '107', '融水', '3', '0');
INSERT INTO `cjnet_region` VALUES ('944', '107', '三江', '3', '0');
INSERT INTO `cjnet_region` VALUES ('945', '108', '钦南区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('946', '108', '钦北区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('947', '108', '灵山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('948', '108', '浦北县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('949', '109', '万秀区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('950', '109', '蝶山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('951', '109', '长洲区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('952', '109', '岑溪市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('953', '109', '苍梧县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('954', '109', '藤县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('955', '109', '蒙山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('956', '110', '玉州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('957', '110', '北流市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('958', '110', '容县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('959', '110', '陆川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('960', '110', '博白县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('961', '110', '兴业县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('962', '111', '南明区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('963', '111', '云岩区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('964', '111', '花溪区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('965', '111', '乌当区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('966', '111', '白云区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('967', '111', '小河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('968', '111', '金阳新区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('969', '111', '新天园区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('970', '111', '清镇市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('971', '111', '开阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('972', '111', '修文县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('973', '111', '息烽县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('974', '112', '西秀区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('975', '112', '关岭', '3', '0');
INSERT INTO `cjnet_region` VALUES ('976', '112', '镇宁', '3', '0');
INSERT INTO `cjnet_region` VALUES ('977', '112', '紫云', '3', '0');
INSERT INTO `cjnet_region` VALUES ('978', '112', '平坝县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('979', '112', '普定县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('980', '113', '毕节市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('981', '113', '大方县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('982', '113', '黔西县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('983', '113', '金沙县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('984', '113', '织金县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('985', '113', '纳雍县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('986', '113', '赫章县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('987', '113', '威宁', '3', '0');
INSERT INTO `cjnet_region` VALUES ('988', '114', '钟山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('989', '114', '六枝特区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('990', '114', '水城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('991', '114', '盘县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('992', '115', '凯里市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('993', '115', '黄平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('994', '115', '施秉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('995', '115', '三穗县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('996', '115', '镇远县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('997', '115', '岑巩县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('998', '115', '天柱县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('999', '115', '锦屏县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1000', '115', '剑河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1001', '115', '台江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1002', '115', '黎平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1003', '115', '榕江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1004', '115', '从江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1005', '115', '雷山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1006', '115', '麻江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1007', '115', '丹寨县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1008', '116', '都匀市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1009', '116', '福泉市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1010', '116', '荔波县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1011', '116', '贵定县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1012', '116', '瓮安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1013', '116', '独山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1014', '116', '平塘县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1015', '116', '罗甸县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1016', '116', '长顺县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1017', '116', '龙里县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1018', '116', '惠水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1019', '116', '三都', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1020', '117', '兴义市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1021', '117', '兴仁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1022', '117', '普安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1023', '117', '晴隆县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1024', '117', '贞丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1025', '117', '望谟县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1026', '117', '册亨县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1027', '117', '安龙县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1028', '118', '铜仁市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1029', '118', '江口县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1030', '118', '石阡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1031', '118', '思南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1032', '118', '德江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1033', '118', '玉屏', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1034', '118', '印江', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1035', '118', '沿河', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1036', '118', '松桃', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1037', '118', '万山特区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1038', '119', '红花岗区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1039', '119', '务川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1040', '119', '道真县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1041', '119', '汇川区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1042', '119', '赤水市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1043', '119', '仁怀市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1044', '119', '遵义县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1045', '119', '桐梓县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1046', '119', '绥阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1047', '119', '正安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1048', '119', '凤冈县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1049', '119', '湄潭县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1050', '119', '余庆县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1051', '119', '习水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1052', '119', '道真', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1053', '119', '务川', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1054', '120', '秀英区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1055', '120', '龙华区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1056', '120', '琼山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1057', '120', '美兰区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1058', '137', '市区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1059', '137', '洋浦开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1060', '137', '那大镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1061', '137', '王五镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1062', '137', '雅星镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1063', '137', '大成镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1064', '137', '中和镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1065', '137', '峨蔓镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1066', '137', '南丰镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1067', '137', '白马井镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1068', '137', '兰洋镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1069', '137', '和庆镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1070', '137', '海头镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1071', '137', '排浦镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1072', '137', '东成镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1073', '137', '光村镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1074', '137', '木棠镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1075', '137', '新州镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1076', '137', '三都镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1077', '137', '其他', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1078', '138', '长安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1079', '138', '桥东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1080', '138', '桥西区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1081', '138', '新华区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1082', '138', '裕华区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1083', '138', '井陉矿区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1084', '138', '高新区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1085', '138', '辛集市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1086', '138', '藁城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1087', '138', '晋州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1088', '138', '新乐市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1089', '138', '鹿泉市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1090', '138', '井陉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1091', '138', '正定县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1092', '138', '栾城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1093', '138', '行唐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1094', '138', '灵寿县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1095', '138', '高邑县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1096', '138', '深泽县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1097', '138', '赞皇县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1098', '138', '无极县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1099', '138', '平山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1100', '138', '元氏县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1101', '138', '赵县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1102', '139', '新市区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1103', '139', '南市区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1104', '139', '北市区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1105', '139', '涿州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1106', '139', '定州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1107', '139', '安国市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1108', '139', '高碑店市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1109', '139', '满城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1110', '139', '清苑县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1111', '139', '涞水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1112', '139', '阜平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1113', '139', '徐水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1114', '139', '定兴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1115', '139', '唐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1116', '139', '高阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1117', '139', '容城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1118', '139', '涞源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1119', '139', '望都县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1120', '139', '安新县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1121', '139', '易县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1122', '139', '曲阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1123', '139', '蠡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1124', '139', '顺平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1125', '139', '博野县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1126', '139', '雄县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1127', '140', '运河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1128', '140', '新华区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1129', '140', '泊头市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1130', '140', '任丘市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1131', '140', '黄骅市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1132', '140', '河间市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1133', '140', '沧县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1134', '140', '青县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1135', '140', '东光县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1136', '140', '海兴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1137', '140', '盐山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1138', '140', '肃宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1139', '140', '南皮县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1140', '140', '吴桥县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1141', '140', '献县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1142', '140', '孟村', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1143', '141', '双桥区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1144', '141', '双滦区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1145', '141', '鹰手营子矿区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1146', '141', '承德县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1147', '141', '兴隆县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1148', '141', '平泉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1149', '141', '滦平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1150', '141', '隆化县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1151', '141', '丰宁', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1152', '141', '宽城', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1153', '141', '围场', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1154', '142', '从台区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1155', '142', '复兴区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1156', '142', '邯山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1157', '142', '峰峰矿区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1158', '142', '武安市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1159', '142', '邯郸县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1160', '142', '临漳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1161', '142', '成安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1162', '142', '大名县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1163', '142', '涉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1164', '142', '磁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1165', '142', '肥乡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1166', '142', '永年县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1167', '142', '邱县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1168', '142', '鸡泽县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1169', '142', '广平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1170', '142', '馆陶县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1171', '142', '魏县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1172', '142', '曲周县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1173', '143', '桃城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1174', '143', '冀州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1175', '143', '深州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1176', '143', '枣强县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1177', '143', '武邑县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1178', '143', '武强县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1179', '143', '饶阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1180', '143', '安平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1181', '143', '故城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1182', '143', '景县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1183', '143', '阜城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1184', '144', '安次区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1185', '144', '广阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1186', '144', '霸州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1187', '144', '三河市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1188', '144', '固安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1189', '144', '永清县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1190', '144', '香河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1191', '144', '大城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1192', '144', '文安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1193', '144', '大厂', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1194', '145', '海港区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1195', '145', '山海关区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1196', '145', '北戴河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1197', '145', '昌黎县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1198', '145', '抚宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1199', '145', '卢龙县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1200', '145', '青龙', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1201', '146', '路北区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1202', '146', '路南区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1203', '146', '古冶区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1204', '146', '开平区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1205', '146', '丰南区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1206', '146', '丰润区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1207', '146', '遵化市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1208', '146', '迁安市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1209', '146', '滦县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1210', '146', '滦南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1211', '146', '乐亭县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1212', '146', '迁西县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1213', '146', '玉田县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1214', '146', '唐海县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1215', '147', '桥东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1216', '147', '桥西区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1217', '147', '南宫市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1218', '147', '沙河市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1219', '147', '邢台县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1220', '147', '临城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1221', '147', '内丘县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1222', '147', '柏乡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1223', '147', '隆尧县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1224', '147', '任县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1225', '147', '南和县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1226', '147', '宁晋县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1227', '147', '巨鹿县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1228', '147', '新河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1229', '147', '广宗县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1230', '147', '平乡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1231', '147', '威县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1232', '147', '清河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1233', '147', '临西县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1234', '148', '桥西区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1235', '148', '桥东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1236', '148', '宣化区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1237', '148', '下花园区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1238', '148', '宣化县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1239', '148', '张北县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1240', '148', '康保县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1241', '148', '沽源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1242', '148', '尚义县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1243', '148', '蔚县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1244', '148', '阳原县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1245', '148', '怀安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1246', '148', '万全县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1247', '148', '怀来县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1248', '148', '涿鹿县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1249', '148', '赤城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1250', '148', '崇礼县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1251', '149', '金水区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1252', '149', '邙山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1253', '149', '二七区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1254', '149', '管城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1255', '149', '中原区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1256', '149', '上街区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1257', '149', '惠济区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1258', '149', '郑东新区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1259', '149', '经济技术开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1260', '149', '高新开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1261', '149', '出口加工区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1262', '149', '巩义市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1263', '149', '荥阳市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1264', '149', '新密市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1265', '149', '新郑市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1266', '149', '登封市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1267', '149', '中牟县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1268', '150', '西工区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1269', '150', '老城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1270', '150', '涧西区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1271', '150', '瀍河回族区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1272', '150', '洛龙区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1273', '150', '吉利区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1274', '150', '偃师市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1275', '150', '孟津县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1276', '150', '新安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1277', '150', '栾川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1278', '150', '嵩县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1279', '150', '汝阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1280', '150', '宜阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1281', '150', '洛宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1282', '150', '伊川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1283', '151', '鼓楼区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1284', '151', '龙亭区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1285', '151', '顺河回族区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1286', '151', '金明区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1287', '151', '禹王台区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1288', '151', '杞县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1289', '151', '通许县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1290', '151', '尉氏县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1291', '151', '开封县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1292', '151', '兰考县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1293', '152', '北关区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1294', '152', '文峰区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1295', '152', '殷都区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1296', '152', '龙安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1297', '152', '林州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1298', '152', '安阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1299', '152', '汤阴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1300', '152', '滑县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1301', '152', '内黄县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1302', '153', '淇滨区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1303', '153', '山城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1304', '153', '鹤山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1305', '153', '浚县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1306', '153', '淇县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1307', '154', '济源市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1308', '155', '解放区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1309', '155', '中站区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1310', '155', '马村区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1311', '155', '山阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1312', '155', '沁阳市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1313', '155', '孟州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1314', '155', '修武县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1315', '155', '博爱县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1316', '155', '武陟县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1317', '155', '温县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1318', '156', '卧龙区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1319', '156', '宛城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1320', '156', '邓州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1321', '156', '南召县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1322', '156', '方城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1323', '156', '西峡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1324', '156', '镇平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1325', '156', '内乡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1326', '156', '淅川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1327', '156', '社旗县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1328', '156', '唐河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1329', '156', '新野县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1330', '156', '桐柏县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1331', '157', '新华区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1332', '157', '卫东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1333', '157', '湛河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1334', '157', '石龙区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1335', '157', '舞钢市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1336', '157', '汝州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1337', '157', '宝丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1338', '157', '叶县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1339', '157', '鲁山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1340', '157', '郏县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1341', '158', '湖滨区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1342', '158', '义马市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1343', '158', '灵宝市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1344', '158', '渑池县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1345', '158', '陕县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1346', '158', '卢氏县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1347', '159', '梁园区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1348', '159', '睢阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1349', '159', '永城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1350', '159', '民权县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1351', '159', '睢县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1352', '159', '宁陵县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1353', '159', '虞城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1354', '159', '柘城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1355', '159', '夏邑县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1356', '160', '卫滨区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1357', '160', '红旗区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1358', '160', '凤泉区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1359', '160', '牧野区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1360', '160', '卫辉市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1361', '160', '辉县市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1362', '160', '新乡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1363', '160', '获嘉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1364', '160', '原阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1365', '160', '延津县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1366', '160', '封丘县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1367', '160', '长垣县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1368', '161', '浉河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1369', '161', '平桥区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1370', '161', '罗山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1371', '161', '光山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1372', '161', '新县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1373', '161', '商城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1374', '161', '固始县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1375', '161', '潢川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1376', '161', '淮滨县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1377', '161', '息县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1378', '162', '魏都区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1379', '162', '禹州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1380', '162', '长葛市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1381', '162', '许昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1382', '162', '鄢陵县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1383', '162', '襄城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1384', '163', '川汇区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1385', '163', '项城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1386', '163', '扶沟县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1387', '163', '西华县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1388', '163', '商水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1389', '163', '沈丘县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1390', '163', '郸城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1391', '163', '淮阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1392', '163', '太康县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1393', '163', '鹿邑县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1394', '164', '驿城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1395', '164', '西平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1396', '164', '上蔡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1397', '164', '平舆县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1398', '164', '正阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1399', '164', '确山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1400', '164', '泌阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1401', '164', '汝南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1402', '164', '遂平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1403', '164', '新蔡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1404', '165', '郾城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1405', '165', '源汇区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1406', '165', '召陵区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1407', '165', '舞阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1408', '165', '临颍县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1409', '166', '华龙区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1410', '166', '清丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1411', '166', '南乐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1412', '166', '范县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1413', '166', '台前县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1414', '166', '濮阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1415', '167', '道里区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1416', '167', '南岗区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1417', '167', '动力区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1418', '167', '平房区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1419', '167', '香坊区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1420', '167', '太平区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1421', '167', '道外区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1422', '167', '阿城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1423', '167', '呼兰区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1424', '167', '松北区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1425', '167', '尚志市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1426', '167', '双城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1427', '167', '五常市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1428', '167', '方正县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1429', '167', '宾县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1430', '167', '依兰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1431', '167', '巴彦县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1432', '167', '通河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1433', '167', '木兰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1434', '167', '延寿县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1435', '168', '萨尔图区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1436', '168', '红岗区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1437', '168', '龙凤区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1438', '168', '让胡路区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1439', '168', '大同区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1440', '168', '肇州县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1441', '168', '肇源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1442', '168', '林甸县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1443', '168', '杜尔伯特', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1444', '169', '呼玛县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1445', '169', '漠河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1446', '169', '塔河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1447', '170', '兴山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1448', '170', '工农区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1449', '170', '南山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1450', '170', '兴安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1451', '170', '向阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1452', '170', '东山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1453', '170', '萝北县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1454', '170', '绥滨县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1455', '171', '爱辉区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1456', '171', '五大连池市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1457', '171', '北安市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1458', '171', '嫩江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1459', '171', '逊克县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1460', '171', '孙吴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1461', '172', '鸡冠区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1462', '172', '恒山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1463', '172', '城子河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1464', '172', '滴道区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1465', '172', '梨树区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1466', '172', '虎林市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1467', '172', '密山市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1468', '172', '鸡东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1469', '173', '前进区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1470', '173', '郊区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1471', '173', '向阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1472', '173', '东风区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1473', '173', '同江市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1474', '173', '富锦市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1475', '173', '桦南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1476', '173', '桦川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1477', '173', '汤原县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1478', '173', '抚远县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1479', '174', '爱民区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1480', '174', '东安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1481', '174', '阳明区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1482', '174', '西安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1483', '174', '绥芬河市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1484', '174', '海林市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1485', '174', '宁安市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1486', '174', '穆棱市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1487', '174', '东宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1488', '174', '林口县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1489', '175', '桃山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1490', '175', '新兴区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1491', '175', '茄子河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1492', '175', '勃利县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1493', '176', '龙沙区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1494', '176', '昂昂溪区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1495', '176', '铁峰区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1496', '176', '建华区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1497', '176', '富拉尔基区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1498', '176', '碾子山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1499', '176', '梅里斯达斡尔区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1500', '176', '讷河市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1501', '176', '龙江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1502', '176', '依安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1503', '176', '泰来县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1504', '176', '甘南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1505', '176', '富裕县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1506', '176', '克山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1507', '176', '克东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1508', '176', '拜泉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1509', '177', '尖山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1510', '177', '岭东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1511', '177', '四方台区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1512', '177', '宝山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1513', '177', '集贤县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1514', '177', '友谊县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1515', '177', '宝清县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1516', '177', '饶河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1517', '178', '北林区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1518', '178', '安达市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1519', '178', '肇东市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1520', '178', '海伦市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1521', '178', '望奎县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1522', '178', '兰西县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1523', '178', '青冈县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1524', '178', '庆安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1525', '178', '明水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1526', '178', '绥棱县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1527', '179', '伊春区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1528', '179', '带岭区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1529', '179', '南岔区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1530', '179', '金山屯区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1531', '179', '西林区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1532', '179', '美溪区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1533', '179', '乌马河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1534', '179', '翠峦区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1535', '179', '友好区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1536', '179', '上甘岭区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1537', '179', '五营区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1538', '179', '红星区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1539', '179', '新青区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1540', '179', '汤旺河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1541', '179', '乌伊岭区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1542', '179', '铁力市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1543', '179', '嘉荫县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1544', '180', '江岸区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1545', '180', '武昌区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1546', '180', '江汉区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1547', '180', '硚口区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1548', '180', '汉阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1549', '180', '青山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1550', '180', '洪山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1551', '180', '东西湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1552', '180', '汉南区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1553', '180', '蔡甸区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1554', '180', '江夏区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1555', '180', '黄陂区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1556', '180', '新洲区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1557', '180', '经济开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1558', '181', '仙桃市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1559', '182', '鄂城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1560', '182', '华容区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1561', '182', '梁子湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1562', '183', '黄州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1563', '183', '麻城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1564', '183', '武穴市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1565', '183', '团风县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1566', '183', '红安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1567', '183', '罗田县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1568', '183', '英山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1569', '183', '浠水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1570', '183', '蕲春县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1571', '183', '黄梅县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1572', '184', '黄石港区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1573', '184', '西塞山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1574', '184', '下陆区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1575', '184', '铁山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1576', '184', '大冶市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1577', '184', '阳新县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1578', '185', '东宝区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1579', '185', '掇刀区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1580', '185', '钟祥市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1581', '185', '京山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1582', '185', '沙洋县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1583', '186', '沙市区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1584', '186', '荆州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1585', '186', '石首市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1586', '186', '洪湖市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1587', '186', '松滋市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1588', '186', '公安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1589', '186', '监利县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1590', '186', '江陵县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1591', '187', '潜江市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1592', '188', '神农架林区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1593', '189', '张湾区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1594', '189', '茅箭区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1595', '189', '丹江口市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1596', '189', '郧县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1597', '189', '郧西县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1598', '189', '竹山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1599', '189', '竹溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1600', '189', '房县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1601', '190', '曾都区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1602', '190', '广水市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1603', '191', '天门市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1604', '192', '咸安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1605', '192', '赤壁市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1606', '192', '嘉鱼县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1607', '192', '通城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1608', '192', '崇阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1609', '192', '通山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1610', '193', '襄城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1611', '193', '樊城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1612', '193', '襄阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1613', '193', '老河口市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1614', '193', '枣阳市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1615', '193', '宜城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1616', '193', '南漳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1617', '193', '谷城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1618', '193', '保康县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1619', '194', '孝南区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1620', '194', '应城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1621', '194', '安陆市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1622', '194', '汉川市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1623', '194', '孝昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1624', '194', '大悟县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1625', '194', '云梦县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1626', '195', '长阳', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1627', '195', '五峰', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1628', '195', '西陵区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1629', '195', '伍家岗区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1630', '195', '点军区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1631', '195', '猇亭区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1632', '195', '夷陵区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1633', '195', '宜都市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1634', '195', '当阳市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1635', '195', '枝江市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1636', '195', '远安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1637', '195', '兴山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1638', '195', '秭归县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1639', '196', '恩施市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1640', '196', '利川市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1641', '196', '建始县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1642', '196', '巴东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1643', '196', '宣恩县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1644', '196', '咸丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1645', '196', '来凤县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1646', '196', '鹤峰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1647', '197', '岳麓区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1648', '197', '芙蓉区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1649', '197', '天心区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1650', '197', '开福区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1651', '197', '雨花区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1652', '197', '开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1653', '197', '浏阳市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1654', '197', '长沙县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1655', '197', '望城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1656', '197', '宁乡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1657', '198', '永定区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1658', '198', '武陵源区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1659', '198', '慈利县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1660', '198', '桑植县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1661', '199', '武陵区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1662', '199', '鼎城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1663', '199', '津市市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1664', '199', '安乡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1665', '199', '汉寿县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1666', '199', '澧县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1667', '199', '临澧县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1668', '199', '桃源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1669', '199', '石门县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1670', '200', '北湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1671', '200', '苏仙区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1672', '200', '资兴市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1673', '200', '桂阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1674', '200', '宜章县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1675', '200', '永兴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1676', '200', '嘉禾县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1677', '200', '临武县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1678', '200', '汝城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1679', '200', '桂东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1680', '200', '安仁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1681', '201', '雁峰区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1682', '201', '珠晖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1683', '201', '石鼓区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1684', '201', '蒸湘区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1685', '201', '南岳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1686', '201', '耒阳市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1687', '201', '常宁市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1688', '201', '衡阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1689', '201', '衡南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1690', '201', '衡山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1691', '201', '衡东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1692', '201', '祁东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1693', '202', '鹤城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1694', '202', '靖州', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1695', '202', '麻阳', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1696', '202', '通道', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1697', '202', '新晃', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1698', '202', '芷江', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1699', '202', '沅陵县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1700', '202', '辰溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1701', '202', '溆浦县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1702', '202', '中方县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1703', '202', '会同县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1704', '202', '洪江市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1705', '203', '娄星区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1706', '203', '冷水江市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1707', '203', '涟源市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1708', '203', '双峰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1709', '203', '新化县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1710', '204', '城步', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1711', '204', '双清区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1712', '204', '大祥区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1713', '204', '北塔区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1714', '204', '武冈市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1715', '204', '邵东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1716', '204', '新邵县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1717', '204', '邵阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1718', '204', '隆回县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1719', '204', '洞口县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1720', '204', '绥宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1721', '204', '新宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1722', '205', '岳塘区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1723', '205', '雨湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1724', '205', '湘乡市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1725', '205', '韶山市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1726', '205', '湘潭县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1727', '206', '吉首市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1728', '206', '泸溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1729', '206', '凤凰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1730', '206', '花垣县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1731', '206', '保靖县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1732', '206', '古丈县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1733', '206', '永顺县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1734', '206', '龙山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1735', '207', '赫山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1736', '207', '资阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1737', '207', '沅江市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1738', '207', '南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1739', '207', '桃江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1740', '207', '安化县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1741', '208', '江华', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1742', '208', '冷水滩区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1743', '208', '零陵区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1744', '208', '祁阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1745', '208', '东安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1746', '208', '双牌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1747', '208', '道县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1748', '208', '江永县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1749', '208', '宁远县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1750', '208', '蓝山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1751', '208', '新田县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1752', '209', '岳阳楼区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1753', '209', '君山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1754', '209', '云溪区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1755', '209', '汨罗市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1756', '209', '临湘市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1757', '209', '岳阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1758', '209', '华容县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1759', '209', '湘阴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1760', '209', '平江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1761', '210', '天元区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1762', '210', '荷塘区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1763', '210', '芦淞区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1764', '210', '石峰区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1765', '210', '醴陵市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1766', '210', '株洲县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1767', '210', '攸县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1768', '210', '茶陵县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1769', '210', '炎陵县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1770', '211', '朝阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1771', '211', '宽城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1772', '211', '二道区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1773', '211', '南关区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1774', '211', '绿园区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1775', '211', '双阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1776', '211', '净月潭开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1777', '211', '高新技术开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1778', '211', '经济技术开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1779', '211', '汽车产业开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1780', '211', '德惠市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1781', '211', '九台市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1782', '211', '榆树市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1783', '211', '农安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1784', '212', '船营区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1785', '212', '昌邑区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1786', '212', '龙潭区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1787', '212', '丰满区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1788', '212', '蛟河市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1789', '212', '桦甸市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1790', '212', '舒兰市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1791', '212', '磐石市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1792', '212', '永吉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1793', '213', '洮北区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1794', '213', '洮南市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1795', '213', '大安市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1796', '213', '镇赉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1797', '213', '通榆县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1798', '214', '江源区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1799', '214', '八道江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1800', '214', '长白', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1801', '214', '临江市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1802', '214', '抚松县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1803', '214', '靖宇县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1804', '215', '龙山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1805', '215', '西安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1806', '215', '东丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1807', '215', '东辽县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1808', '216', '铁西区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1809', '216', '铁东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1810', '216', '伊通', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1811', '216', '公主岭市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1812', '216', '双辽市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1813', '216', '梨树县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1814', '217', '前郭尔罗斯', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1815', '217', '宁江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1816', '217', '长岭县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1817', '217', '乾安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1818', '217', '扶余县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1819', '218', '东昌区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1820', '218', '二道江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1821', '218', '梅河口市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1822', '218', '集安市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1823', '218', '通化县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1824', '218', '辉南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1825', '218', '柳河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1826', '219', '延吉市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1827', '219', '图们市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1828', '219', '敦化市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1829', '219', '珲春市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1830', '219', '龙井市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1831', '219', '和龙市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1832', '219', '安图县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1833', '219', '汪清县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1834', '220', '玄武区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1835', '220', '鼓楼区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1836', '220', '白下区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1837', '220', '建邺区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1838', '220', '秦淮区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1839', '220', '雨花台区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1840', '220', '下关区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1841', '220', '栖霞区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1842', '220', '浦口区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1843', '220', '江宁区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1844', '220', '六合区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1845', '220', '溧水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1846', '220', '高淳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1847', '221', '沧浪区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1848', '221', '金阊区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1849', '221', '平江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1850', '221', '虎丘区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1851', '221', '吴中区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1852', '221', '相城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1853', '221', '园区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1854', '221', '新区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1855', '221', '常熟市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1856', '221', '张家港市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1857', '221', '玉山镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1858', '221', '巴城镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1859', '221', '周市镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1860', '221', '陆家镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1861', '221', '花桥镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1862', '221', '淀山湖镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1863', '221', '张浦镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1864', '221', '周庄镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1865', '221', '千灯镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1866', '221', '锦溪镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1867', '221', '开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1868', '221', '吴江市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1869', '221', '太仓市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1870', '222', '崇安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1871', '222', '北塘区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1872', '222', '南长区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1873', '222', '锡山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1874', '222', '惠山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1875', '222', '滨湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1876', '222', '新区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1877', '222', '江阴市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1878', '222', '宜兴市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1879', '223', '天宁区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1880', '223', '钟楼区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1881', '223', '戚墅堰区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1882', '223', '郊区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1883', '223', '新北区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1884', '223', '武进区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1885', '223', '溧阳市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1886', '223', '金坛市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1887', '224', '清河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1888', '224', '清浦区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1889', '224', '楚州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1890', '224', '淮阴区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1891', '224', '涟水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1892', '224', '洪泽县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1893', '224', '盱眙县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1894', '224', '金湖县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1895', '225', '新浦区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1896', '225', '连云区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1897', '225', '海州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1898', '225', '赣榆县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1899', '225', '东海县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1900', '225', '灌云县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1901', '225', '灌南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1902', '226', '崇川区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1903', '226', '港闸区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1904', '226', '经济开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1905', '226', '启东市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1906', '226', '如皋市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1907', '226', '通州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1908', '226', '海门市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1909', '226', '海安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1910', '226', '如东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1911', '227', '宿城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1912', '227', '宿豫区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1913', '227', '宿豫县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1914', '227', '沭阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1915', '227', '泗阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1916', '227', '泗洪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1917', '228', '海陵区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1918', '228', '高港区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1919', '228', '兴化市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1920', '228', '靖江市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1921', '228', '泰兴市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1922', '228', '姜堰市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1923', '229', '云龙区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1924', '229', '鼓楼区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1925', '229', '九里区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1926', '229', '贾汪区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1927', '229', '泉山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1928', '229', '新沂市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1929', '229', '邳州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1930', '229', '丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1931', '229', '沛县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1932', '229', '铜山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1933', '229', '睢宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1934', '230', '城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1935', '230', '亭湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1936', '230', '盐都区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1937', '230', '盐都县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1938', '230', '东台市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1939', '230', '大丰市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1940', '230', '响水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1941', '230', '滨海县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1942', '230', '阜宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1943', '230', '射阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1944', '230', '建湖县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1945', '231', '广陵区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1946', '231', '维扬区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1947', '231', '邗江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1948', '231', '仪征市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1949', '231', '高邮市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1950', '231', '江都市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1951', '231', '宝应县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1952', '232', '京口区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1953', '232', '润州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1954', '232', '丹徒区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1955', '232', '丹阳市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1956', '232', '扬中市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1957', '232', '句容市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1958', '233', '东湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1959', '233', '西湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1960', '233', '青云谱区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1961', '233', '湾里区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1962', '233', '青山湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1963', '233', '红谷滩新区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1964', '233', '昌北区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1965', '233', '高新区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1966', '233', '南昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1967', '233', '新建县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1968', '233', '安义县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1969', '233', '进贤县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1970', '234', '临川区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1971', '234', '南城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1972', '234', '黎川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1973', '234', '南丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1974', '234', '崇仁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1975', '234', '乐安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1976', '234', '宜黄县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1977', '234', '金溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1978', '234', '资溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1979', '234', '东乡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1980', '234', '广昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1981', '235', '章贡区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1982', '235', '于都县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1983', '235', '瑞金市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1984', '235', '南康市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1985', '235', '赣县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1986', '235', '信丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1987', '235', '大余县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1988', '235', '上犹县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1989', '235', '崇义县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1990', '235', '安远县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1991', '235', '龙南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1992', '235', '定南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1993', '235', '全南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1994', '235', '宁都县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1995', '235', '兴国县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1996', '235', '会昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1997', '235', '寻乌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1998', '235', '石城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('1999', '236', '安福县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2000', '236', '吉州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2001', '236', '青原区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2002', '236', '井冈山市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2003', '236', '吉安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2004', '236', '吉水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2005', '236', '峡江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2006', '236', '新干县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2007', '236', '永丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2008', '236', '泰和县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2009', '236', '遂川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2010', '236', '万安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2011', '236', '永新县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2012', '237', '珠山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2013', '237', '昌江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2014', '237', '乐平市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2015', '237', '浮梁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2016', '238', '浔阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2017', '238', '庐山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2018', '238', '瑞昌市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2019', '238', '九江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2020', '238', '武宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2021', '238', '修水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2022', '238', '永修县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2023', '238', '德安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2024', '238', '星子县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2025', '238', '都昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2026', '238', '湖口县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2027', '238', '彭泽县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2028', '239', '安源区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2029', '239', '湘东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2030', '239', '莲花县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2031', '239', '芦溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2032', '239', '上栗县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2033', '240', '信州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2034', '240', '德兴市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2035', '240', '上饶县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2036', '240', '广丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2037', '240', '玉山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2038', '240', '铅山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2039', '240', '横峰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2040', '240', '弋阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2041', '240', '余干县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2042', '240', '波阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2043', '240', '万年县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2044', '240', '婺源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2045', '241', '渝水区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2046', '241', '分宜县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2047', '242', '袁州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2048', '242', '丰城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2049', '242', '樟树市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2050', '242', '高安市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2051', '242', '奉新县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2052', '242', '万载县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2053', '242', '上高县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2054', '242', '宜丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2055', '242', '靖安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2056', '242', '铜鼓县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2057', '243', '月湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2058', '243', '贵溪市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2059', '243', '余江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2060', '244', '沈河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2061', '244', '皇姑区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2062', '244', '和平区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2063', '244', '大东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2064', '244', '铁西区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2065', '244', '苏家屯区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2066', '244', '东陵区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2067', '244', '沈北新区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2068', '244', '于洪区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2069', '244', '浑南新区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2070', '244', '新民市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2071', '244', '辽中县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2072', '244', '康平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2073', '244', '法库县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2074', '245', '西岗区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2075', '245', '中山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2076', '245', '沙河口区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2077', '245', '甘井子区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2078', '245', '旅顺口区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2079', '245', '金州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2080', '245', '开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2081', '245', '瓦房店市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2082', '245', '普兰店市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2083', '245', '庄河市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2084', '245', '长海县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2085', '246', '铁东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2086', '246', '铁西区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2087', '246', '立山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2088', '246', '千山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2089', '246', '岫岩', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2090', '246', '海城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2091', '246', '台安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2092', '247', '本溪', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2093', '247', '平山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2094', '247', '明山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2095', '247', '溪湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2096', '247', '南芬区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2097', '247', '桓仁', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2098', '248', '双塔区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2099', '248', '龙城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2100', '248', '喀喇沁左翼蒙古族自治县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2101', '248', '北票市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2102', '248', '凌源市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2103', '248', '朝阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2104', '248', '建平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2105', '249', '振兴区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2106', '249', '元宝区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2107', '249', '振安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2108', '249', '宽甸', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2109', '249', '东港市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2110', '249', '凤城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2111', '250', '顺城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2112', '250', '新抚区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2113', '250', '东洲区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2114', '250', '望花区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2115', '250', '清原', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2116', '250', '新宾', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2117', '250', '抚顺县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2118', '251', '阜新', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2119', '251', '海州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2120', '251', '新邱区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2121', '251', '太平区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2122', '251', '清河门区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2123', '251', '细河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2124', '251', '彰武县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2125', '252', '龙港区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2126', '252', '南票区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2127', '252', '连山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2128', '252', '兴城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2129', '252', '绥中县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2130', '252', '建昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2131', '253', '太和区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2132', '253', '古塔区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2133', '253', '凌河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2134', '253', '凌海市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2135', '253', '北镇市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2136', '253', '黑山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2137', '253', '义县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2138', '254', '白塔区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2139', '254', '文圣区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2140', '254', '宏伟区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2141', '254', '太子河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2142', '254', '弓长岭区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2143', '254', '灯塔市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2144', '254', '辽阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2145', '255', '双台子区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2146', '255', '兴隆台区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2147', '255', '大洼县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2148', '255', '盘山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2149', '256', '银州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2150', '256', '清河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2151', '256', '调兵山市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2152', '256', '开原市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2153', '256', '铁岭县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2154', '256', '西丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2155', '256', '昌图县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2156', '257', '站前区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2157', '257', '西市区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2158', '257', '鲅鱼圈区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2159', '257', '老边区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2160', '257', '盖州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2161', '257', '大石桥市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2162', '258', '回民区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2163', '258', '玉泉区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2164', '258', '新城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2165', '258', '赛罕区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2166', '258', '清水河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2167', '258', '土默特左旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2168', '258', '托克托县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2169', '258', '和林格尔县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2170', '258', '武川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2171', '259', '阿拉善左旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2172', '259', '阿拉善右旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2173', '259', '额济纳旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2174', '260', '临河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2175', '260', '五原县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2176', '260', '磴口县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2177', '260', '乌拉特前旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2178', '260', '乌拉特中旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2179', '260', '乌拉特后旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2180', '260', '杭锦后旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2181', '261', '昆都仑区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2182', '261', '青山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2183', '261', '东河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2184', '261', '九原区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2185', '261', '石拐区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2186', '261', '白云矿区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2187', '261', '土默特右旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2188', '261', '固阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2189', '261', '达尔罕茂明安联合旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2190', '262', '红山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2191', '262', '元宝山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2192', '262', '松山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2193', '262', '阿鲁科尔沁旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2194', '262', '巴林左旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2195', '262', '巴林右旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2196', '262', '林西县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2197', '262', '克什克腾旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2198', '262', '翁牛特旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2199', '262', '喀喇沁旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2200', '262', '宁城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2201', '262', '敖汉旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2202', '263', '东胜区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2203', '263', '达拉特旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2204', '263', '准格尔旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2205', '263', '鄂托克前旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2206', '263', '鄂托克旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2207', '263', '杭锦旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2208', '263', '乌审旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2209', '263', '伊金霍洛旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2210', '264', '海拉尔区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2211', '264', '莫力达瓦', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2212', '264', '满洲里市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2213', '264', '牙克石市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2214', '264', '扎兰屯市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2215', '264', '额尔古纳市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2216', '264', '根河市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2217', '264', '阿荣旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2218', '264', '鄂伦春自治旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2219', '264', '鄂温克族自治旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2220', '264', '陈巴尔虎旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2221', '264', '新巴尔虎左旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2222', '264', '新巴尔虎右旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2223', '265', '科尔沁区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2224', '265', '霍林郭勒市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2225', '265', '科尔沁左翼中旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2226', '265', '科尔沁左翼后旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2227', '265', '开鲁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2228', '265', '库伦旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2229', '265', '奈曼旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2230', '265', '扎鲁特旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2231', '266', '海勃湾区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2232', '266', '乌达区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2233', '266', '海南区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2234', '267', '化德县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2235', '267', '集宁区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2236', '267', '丰镇市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2237', '267', '卓资县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2238', '267', '商都县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2239', '267', '兴和县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2240', '267', '凉城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2241', '267', '察哈尔右翼前旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2242', '267', '察哈尔右翼中旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2243', '267', '察哈尔右翼后旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2244', '267', '四子王旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2245', '268', '二连浩特市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2246', '268', '锡林浩特市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2247', '268', '阿巴嘎旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2248', '268', '苏尼特左旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2249', '268', '苏尼特右旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2250', '268', '东乌珠穆沁旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2251', '268', '西乌珠穆沁旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2252', '268', '太仆寺旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2253', '268', '镶黄旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2254', '268', '正镶白旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2255', '268', '正蓝旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2256', '268', '多伦县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2257', '269', '乌兰浩特市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2258', '269', '阿尔山市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2259', '269', '科尔沁右翼前旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2260', '269', '科尔沁右翼中旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2261', '269', '扎赉特旗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2262', '269', '突泉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2263', '270', '西夏区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2264', '270', '金凤区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2265', '270', '兴庆区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2266', '270', '灵武市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2267', '270', '永宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2268', '270', '贺兰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2269', '271', '原州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2270', '271', '海原县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2271', '271', '西吉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2272', '271', '隆德县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2273', '271', '泾源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2274', '271', '彭阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2275', '272', '惠农县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2276', '272', '大武口区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2277', '272', '惠农区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2278', '272', '陶乐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2279', '272', '平罗县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2280', '273', '利通区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2281', '273', '中卫县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2282', '273', '青铜峡市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2283', '273', '中宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2284', '273', '盐池县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2285', '273', '同心县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2286', '274', '沙坡头区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2287', '274', '海原县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2288', '274', '中宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2289', '275', '城中区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2290', '275', '城东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2291', '275', '城西区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2292', '275', '城北区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2293', '275', '湟中县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2294', '275', '湟源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2295', '275', '大通', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2296', '276', '玛沁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2297', '276', '班玛县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2298', '276', '甘德县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2299', '276', '达日县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2300', '276', '久治县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2301', '276', '玛多县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2302', '277', '海晏县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2303', '277', '祁连县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2304', '277', '刚察县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2305', '277', '门源', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2306', '278', '平安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2307', '278', '乐都县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2308', '278', '民和', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2309', '278', '互助', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2310', '278', '化隆', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2311', '278', '循化', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2312', '279', '共和县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2313', '279', '同德县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2314', '279', '贵德县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2315', '279', '兴海县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2316', '279', '贵南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2317', '280', '德令哈市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2318', '280', '格尔木市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2319', '280', '乌兰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2320', '280', '都兰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2321', '280', '天峻县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2322', '281', '同仁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2323', '281', '尖扎县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2324', '281', '泽库县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2325', '281', '河南蒙古族自治县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2326', '282', '玉树县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2327', '282', '杂多县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2328', '282', '称多县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2329', '282', '治多县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2330', '282', '囊谦县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2331', '282', '曲麻莱县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2332', '283', '市中区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2333', '283', '历下区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2334', '283', '天桥区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2335', '283', '槐荫区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2336', '283', '历城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2337', '283', '长清区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2338', '283', '章丘市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2339', '283', '平阴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2340', '283', '济阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2341', '283', '商河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2342', '284', '市南区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2343', '284', '市北区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2344', '284', '城阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2345', '284', '四方区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2346', '284', '李沧区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2347', '284', '黄岛区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2348', '284', '崂山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2349', '284', '胶州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2350', '284', '即墨市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2351', '284', '平度市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2352', '284', '胶南市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2353', '284', '莱西市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2354', '285', '滨城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2355', '285', '惠民县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2356', '285', '阳信县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2357', '285', '无棣县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2358', '285', '沾化县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2359', '285', '博兴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2360', '285', '邹平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2361', '286', '德城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2362', '286', '陵县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2363', '286', '乐陵市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2364', '286', '禹城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2365', '286', '宁津县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2366', '286', '庆云县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2367', '286', '临邑县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2368', '286', '齐河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2369', '286', '平原县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2370', '286', '夏津县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2371', '286', '武城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2372', '287', '东营区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2373', '287', '河口区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2374', '287', '垦利县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2375', '287', '利津县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2376', '287', '广饶县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2377', '288', '牡丹区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2378', '288', '曹县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2379', '288', '单县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2380', '288', '成武县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2381', '288', '巨野县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2382', '288', '郓城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2383', '288', '鄄城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2384', '288', '定陶县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2385', '288', '东明县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2386', '289', '市中区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2387', '289', '任城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2388', '289', '曲阜市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2389', '289', '兖州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2390', '289', '邹城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2391', '289', '微山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2392', '289', '鱼台县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2393', '289', '金乡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2394', '289', '嘉祥县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2395', '289', '汶上县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2396', '289', '泗水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2397', '289', '梁山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2398', '290', '莱城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2399', '290', '钢城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2400', '291', '东昌府区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2401', '291', '临清市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2402', '291', '阳谷县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2403', '291', '莘县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2404', '291', '茌平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2405', '291', '东阿县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2406', '291', '冠县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2407', '291', '高唐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2408', '292', '兰山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2409', '292', '罗庄区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2410', '292', '河东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2411', '292', '沂南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2412', '292', '郯城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2413', '292', '沂水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2414', '292', '苍山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2415', '292', '费县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2416', '292', '平邑县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2417', '292', '莒南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2418', '292', '蒙阴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2419', '292', '临沭县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2420', '293', '东港区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2421', '293', '岚山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2422', '293', '五莲县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2423', '293', '莒县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2424', '294', '泰山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2425', '294', '岱岳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2426', '294', '新泰市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2427', '294', '肥城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2428', '294', '宁阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2429', '294', '东平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2430', '295', '荣成市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2431', '295', '乳山市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2432', '295', '环翠区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2433', '295', '文登市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2434', '296', '潍城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2435', '296', '寒亭区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2436', '296', '坊子区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2437', '296', '奎文区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2438', '296', '青州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2439', '296', '诸城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2440', '296', '寿光市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2441', '296', '安丘市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2442', '296', '高密市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2443', '296', '昌邑市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2444', '296', '临朐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2445', '296', '昌乐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2446', '297', '芝罘区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2447', '297', '福山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2448', '297', '牟平区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2449', '297', '莱山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2450', '297', '开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2451', '297', '龙口市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2452', '297', '莱阳市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2453', '297', '莱州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2454', '297', '蓬莱市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2455', '297', '招远市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2456', '297', '栖霞市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2457', '297', '海阳市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2458', '297', '长岛县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2459', '298', '市中区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2460', '298', '山亭区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2461', '298', '峄城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2462', '298', '台儿庄区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2463', '298', '薛城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2464', '298', '滕州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2465', '299', '张店区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2466', '299', '临淄区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2467', '299', '淄川区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2468', '299', '博山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2469', '299', '周村区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2470', '299', '桓台县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2471', '299', '高青县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2472', '299', '沂源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2473', '300', '杏花岭区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2474', '300', '小店区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2475', '300', '迎泽区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2476', '300', '尖草坪区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2477', '300', '万柏林区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2478', '300', '晋源区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2479', '300', '高新开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2480', '300', '民营经济开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2481', '300', '经济技术开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2482', '300', '清徐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2483', '300', '阳曲县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2484', '300', '娄烦县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2485', '300', '古交市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2486', '301', '城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2487', '301', '郊区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2488', '301', '沁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2489', '301', '潞城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2490', '301', '长治县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2491', '301', '襄垣县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2492', '301', '屯留县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2493', '301', '平顺县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2494', '301', '黎城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2495', '301', '壶关县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2496', '301', '长子县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2497', '301', '武乡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2498', '301', '沁源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2499', '302', '城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2500', '302', '矿区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2501', '302', '南郊区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2502', '302', '新荣区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2503', '302', '阳高县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2504', '302', '天镇县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2505', '302', '广灵县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2506', '302', '灵丘县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2507', '302', '浑源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2508', '302', '左云县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2509', '302', '大同县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2510', '303', '城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2511', '303', '高平市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2512', '303', '沁水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2513', '303', '阳城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2514', '303', '陵川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2515', '303', '泽州县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2516', '304', '榆次区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2517', '304', '介休市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2518', '304', '榆社县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2519', '304', '左权县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2520', '304', '和顺县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2521', '304', '昔阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2522', '304', '寿阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2523', '304', '太谷县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2524', '304', '祁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2525', '304', '平遥县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2526', '304', '灵石县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2527', '305', '尧都区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2528', '305', '侯马市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2529', '305', '霍州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2530', '305', '曲沃县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2531', '305', '翼城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2532', '305', '襄汾县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2533', '305', '洪洞县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2534', '305', '吉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2535', '305', '安泽县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2536', '305', '浮山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2537', '305', '古县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2538', '305', '乡宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2539', '305', '大宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2540', '305', '隰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2541', '305', '永和县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2542', '305', '蒲县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2543', '305', '汾西县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2544', '306', '离石市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2545', '306', '离石区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2546', '306', '孝义市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2547', '306', '汾阳市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2548', '306', '文水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2549', '306', '交城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2550', '306', '兴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2551', '306', '临县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2552', '306', '柳林县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2553', '306', '石楼县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2554', '306', '岚县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2555', '306', '方山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2556', '306', '中阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2557', '306', '交口县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2558', '307', '朔城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2559', '307', '平鲁区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2560', '307', '山阴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2561', '307', '应县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2562', '307', '右玉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2563', '307', '怀仁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2564', '308', '忻府区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2565', '308', '原平市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2566', '308', '定襄县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2567', '308', '五台县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2568', '308', '代县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2569', '308', '繁峙县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2570', '308', '宁武县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2571', '308', '静乐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2572', '308', '神池县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2573', '308', '五寨县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2574', '308', '岢岚县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2575', '308', '河曲县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2576', '308', '保德县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2577', '308', '偏关县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2578', '309', '城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2579', '309', '矿区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2580', '309', '郊区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2581', '309', '平定县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2582', '309', '盂县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2583', '310', '盐湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2584', '310', '永济市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2585', '310', '河津市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2586', '310', '临猗县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2587', '310', '万荣县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2588', '310', '闻喜县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2589', '310', '稷山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2590', '310', '新绛县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2591', '310', '绛县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2592', '310', '垣曲县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2593', '310', '夏县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2594', '310', '平陆县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2595', '310', '芮城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2596', '311', '莲湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2597', '311', '新城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2598', '311', '碑林区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2599', '311', '雁塔区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2600', '311', '灞桥区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2601', '311', '未央区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2602', '311', '阎良区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2603', '311', '临潼区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2604', '311', '长安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2605', '311', '蓝田县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2606', '311', '周至县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2607', '311', '户县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2608', '311', '高陵县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2609', '312', '汉滨区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2610', '312', '汉阴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2611', '312', '石泉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2612', '312', '宁陕县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2613', '312', '紫阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2614', '312', '岚皋县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2615', '312', '平利县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2616', '312', '镇坪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2617', '312', '旬阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2618', '312', '白河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2619', '313', '陈仓区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2620', '313', '渭滨区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2621', '313', '金台区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2622', '313', '凤翔县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2623', '313', '岐山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2624', '313', '扶风县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2625', '313', '眉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2626', '313', '陇县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2627', '313', '千阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2628', '313', '麟游县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2629', '313', '凤县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2630', '313', '太白县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2631', '314', '汉台区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2632', '314', '南郑县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2633', '314', '城固县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2634', '314', '洋县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2635', '314', '西乡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2636', '314', '勉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2637', '314', '宁强县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2638', '314', '略阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2639', '314', '镇巴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2640', '314', '留坝县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2641', '314', '佛坪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2642', '315', '商州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2643', '315', '洛南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2644', '315', '丹凤县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2645', '315', '商南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2646', '315', '山阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2647', '315', '镇安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2648', '315', '柞水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2649', '316', '耀州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2650', '316', '王益区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2651', '316', '印台区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2652', '316', '宜君县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2653', '317', '临渭区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2654', '317', '韩城市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2655', '317', '华阴市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2656', '317', '华县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2657', '317', '潼关县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2658', '317', '大荔县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2659', '317', '合阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2660', '317', '澄城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2661', '317', '蒲城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2662', '317', '白水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2663', '317', '富平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2664', '318', '秦都区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2665', '318', '渭城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2666', '318', '杨陵区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2667', '318', '兴平市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2668', '318', '三原县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2669', '318', '泾阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2670', '318', '乾县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2671', '318', '礼泉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2672', '318', '永寿县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2673', '318', '彬县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2674', '318', '长武县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2675', '318', '旬邑县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2676', '318', '淳化县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2677', '318', '武功县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2678', '319', '吴起县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2679', '319', '宝塔区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2680', '319', '延长县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2681', '319', '延川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2682', '319', '子长县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2683', '319', '安塞县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2684', '319', '志丹县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2685', '319', '甘泉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2686', '319', '富县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2687', '319', '洛川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2688', '319', '宜川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2689', '319', '黄龙县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2690', '319', '黄陵县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2691', '320', '榆阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2692', '320', '神木县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2693', '320', '府谷县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2694', '320', '横山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2695', '320', '靖边县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2696', '320', '定边县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2697', '320', '绥德县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2698', '320', '米脂县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2699', '320', '佳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2700', '320', '吴堡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2701', '320', '清涧县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2702', '320', '子洲县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2703', '321', '长宁区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2704', '321', '闸北区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2705', '321', '闵行区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2706', '321', '徐汇区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2707', '321', '浦东新区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2708', '321', '杨浦区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2709', '321', '普陀区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2710', '321', '静安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2711', '321', '卢湾区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2712', '321', '虹口区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2713', '321', '黄浦区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2714', '321', '南汇区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2715', '321', '松江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2716', '321', '嘉定区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2717', '321', '宝山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2718', '321', '青浦区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2719', '321', '金山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2720', '321', '奉贤区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2721', '321', '崇明县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2722', '322', '青羊区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2723', '322', '锦江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2724', '322', '金牛区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2725', '322', '武侯区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2726', '322', '成华区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2727', '322', '龙泉驿区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2728', '322', '青白江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2729', '322', '新都区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2730', '322', '温江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2731', '322', '高新区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2732', '322', '高新西区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2733', '322', '都江堰市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2734', '322', '彭州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2735', '322', '邛崃市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2736', '322', '崇州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2737', '322', '金堂县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2738', '322', '双流县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2739', '322', '郫县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2740', '322', '大邑县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2741', '322', '蒲江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2742', '322', '新津县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2743', '322', '都江堰市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2744', '322', '彭州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2745', '322', '邛崃市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2746', '322', '崇州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2747', '322', '金堂县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2748', '322', '双流县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2749', '322', '郫县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2750', '322', '大邑县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2751', '322', '蒲江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2752', '322', '新津县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2753', '323', '涪城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2754', '323', '游仙区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2755', '323', '江油市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2756', '323', '盐亭县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2757', '323', '三台县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2758', '323', '平武县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2759', '323', '安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2760', '323', '梓潼县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2761', '323', '北川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2762', '324', '马尔康县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2763', '324', '汶川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2764', '324', '理县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2765', '324', '茂县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2766', '324', '松潘县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2767', '324', '九寨沟县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2768', '324', '金川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2769', '324', '小金县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2770', '324', '黑水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2771', '324', '壤塘县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2772', '324', '阿坝县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2773', '324', '若尔盖县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2774', '324', '红原县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2775', '325', '巴州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2776', '325', '通江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2777', '325', '南江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2778', '325', '平昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2779', '326', '通川区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2780', '326', '万源市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2781', '326', '达县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2782', '326', '宣汉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2783', '326', '开江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2784', '326', '大竹县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2785', '326', '渠县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2786', '327', '旌阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2787', '327', '广汉市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2788', '327', '什邡市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2789', '327', '绵竹市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2790', '327', '罗江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2791', '327', '中江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2792', '328', '康定县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2793', '328', '丹巴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2794', '328', '泸定县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2795', '328', '炉霍县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2796', '328', '九龙县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2797', '328', '甘孜县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2798', '328', '雅江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2799', '328', '新龙县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2800', '328', '道孚县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2801', '328', '白玉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2802', '328', '理塘县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2803', '328', '德格县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2804', '328', '乡城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2805', '328', '石渠县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2806', '328', '稻城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2807', '328', '色达县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2808', '328', '巴塘县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2809', '328', '得荣县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2810', '329', '广安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2811', '329', '华蓥市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2812', '329', '岳池县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2813', '329', '武胜县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2814', '329', '邻水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2815', '330', '利州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2816', '330', '元坝区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2817', '330', '朝天区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2818', '330', '旺苍县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2819', '330', '青川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2820', '330', '剑阁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2821', '330', '苍溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2822', '331', '峨眉山市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2823', '331', '乐山市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2824', '331', '犍为县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2825', '331', '井研县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2826', '331', '夹江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2827', '331', '沐川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2828', '331', '峨边', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2829', '331', '马边', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2830', '332', '西昌市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2831', '332', '盐源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2832', '332', '德昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2833', '332', '会理县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2834', '332', '会东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2835', '332', '宁南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2836', '332', '普格县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2837', '332', '布拖县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2838', '332', '金阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2839', '332', '昭觉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2840', '332', '喜德县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2841', '332', '冕宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2842', '332', '越西县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2843', '332', '甘洛县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2844', '332', '美姑县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2845', '332', '雷波县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2846', '332', '木里', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2847', '333', '东坡区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2848', '333', '仁寿县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2849', '333', '彭山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2850', '333', '洪雅县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2851', '333', '丹棱县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2852', '333', '青神县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2853', '334', '阆中市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2854', '334', '南部县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2855', '334', '营山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2856', '334', '蓬安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2857', '334', '仪陇县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2858', '334', '顺庆区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2859', '334', '高坪区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2860', '334', '嘉陵区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2861', '334', '西充县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2862', '335', '市中区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2863', '335', '东兴区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2864', '335', '威远县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2865', '335', '资中县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2866', '335', '隆昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2867', '336', '东  区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2868', '336', '西  区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2869', '336', '仁和区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2870', '336', '米易县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2871', '336', '盐边县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2872', '337', '船山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2873', '337', '安居区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2874', '337', '蓬溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2875', '337', '射洪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2876', '337', '大英县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2877', '338', '雨城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2878', '338', '名山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2879', '338', '荥经县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2880', '338', '汉源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2881', '338', '石棉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2882', '338', '天全县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2883', '338', '芦山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2884', '338', '宝兴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2885', '339', '翠屏区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2886', '339', '宜宾县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2887', '339', '南溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2888', '339', '江安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2889', '339', '长宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2890', '339', '高县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2891', '339', '珙县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2892', '339', '筠连县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2893', '339', '兴文县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2894', '339', '屏山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2895', '340', '雁江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2896', '340', '简阳市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2897', '340', '安岳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2898', '340', '乐至县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2899', '341', '大安区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2900', '341', '自流井区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2901', '341', '贡井区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2902', '341', '沿滩区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2903', '341', '荣县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2904', '341', '富顺县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2905', '342', '江阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2906', '342', '纳溪区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2907', '342', '龙马潭区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2908', '342', '泸县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2909', '342', '合江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2910', '342', '叙永县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2911', '342', '古蔺县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2912', '343', '和平区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2913', '343', '河西区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2914', '343', '南开区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2915', '343', '河北区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2916', '343', '河东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2917', '343', '红桥区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2918', '343', '东丽区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2919', '343', '津南区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2920', '343', '西青区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2921', '343', '北辰区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2922', '343', '塘沽区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2923', '343', '汉沽区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2924', '343', '大港区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2925', '343', '武清区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2926', '343', '宝坻区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2927', '343', '经济开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2928', '343', '宁河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2929', '343', '静海县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2930', '343', '蓟县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2931', '344', '城关区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2932', '344', '林周县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2933', '344', '当雄县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2934', '344', '尼木县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2935', '344', '曲水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2936', '344', '堆龙德庆县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2937', '344', '达孜县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2938', '344', '墨竹工卡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2939', '345', '噶尔县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2940', '345', '普兰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2941', '345', '札达县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2942', '345', '日土县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2943', '345', '革吉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2944', '345', '改则县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2945', '345', '措勤县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2946', '346', '昌都县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2947', '346', '江达县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2948', '346', '贡觉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2949', '346', '类乌齐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2950', '346', '丁青县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2951', '346', '察雅县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2952', '346', '八宿县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2953', '346', '左贡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2954', '346', '芒康县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2955', '346', '洛隆县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2956', '346', '边坝县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2957', '347', '林芝县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2958', '347', '工布江达县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2959', '347', '米林县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2960', '347', '墨脱县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2961', '347', '波密县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2962', '347', '察隅县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2963', '347', '朗县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2964', '348', '那曲县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2965', '348', '嘉黎县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2966', '348', '比如县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2967', '348', '聂荣县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2968', '348', '安多县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2969', '348', '申扎县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2970', '348', '索县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2971', '348', '班戈县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2972', '348', '巴青县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2973', '348', '尼玛县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2974', '349', '日喀则市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2975', '349', '南木林县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2976', '349', '江孜县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2977', '349', '定日县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2978', '349', '萨迦县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2979', '349', '拉孜县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2980', '349', '昂仁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2981', '349', '谢通门县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2982', '349', '白朗县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2983', '349', '仁布县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2984', '349', '康马县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2985', '349', '定结县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2986', '349', '仲巴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2987', '349', '亚东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2988', '349', '吉隆县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2989', '349', '聂拉木县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2990', '349', '萨嘎县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2991', '349', '岗巴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2992', '350', '乃东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2993', '350', '扎囊县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2994', '350', '贡嘎县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2995', '350', '桑日县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2996', '350', '琼结县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2997', '350', '曲松县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2998', '350', '措美县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('2999', '350', '洛扎县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3000', '350', '加查县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3001', '350', '隆子县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3002', '350', '错那县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3003', '350', '浪卡子县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3004', '351', '天山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3005', '351', '沙依巴克区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3006', '351', '新市区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3007', '351', '水磨沟区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3008', '351', '头屯河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3009', '351', '达坂城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3010', '351', '米东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3011', '351', '乌鲁木齐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3012', '352', '阿克苏市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3013', '352', '温宿县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3014', '352', '库车县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3015', '352', '沙雅县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3016', '352', '新和县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3017', '352', '拜城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3018', '352', '乌什县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3019', '352', '阿瓦提县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3020', '352', '柯坪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3021', '353', '阿拉尔市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3022', '354', '库尔勒市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3023', '354', '轮台县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3024', '354', '尉犁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3025', '354', '若羌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3026', '354', '且末县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3027', '354', '焉耆', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3028', '354', '和静县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3029', '354', '和硕县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3030', '354', '博湖县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3031', '355', '博乐市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3032', '355', '精河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3033', '355', '温泉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3034', '356', '呼图壁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3035', '356', '米泉市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3036', '356', '昌吉市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3037', '356', '阜康市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3038', '356', '玛纳斯县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3039', '356', '奇台县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3040', '356', '吉木萨尔县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3041', '356', '木垒', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3042', '357', '哈密市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3043', '357', '伊吾县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3044', '357', '巴里坤', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3045', '358', '和田市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3046', '358', '和田县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3047', '358', '墨玉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3048', '358', '皮山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3049', '358', '洛浦县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3050', '358', '策勒县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3051', '358', '于田县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3052', '358', '民丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3053', '359', '喀什市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3054', '359', '疏附县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3055', '359', '疏勒县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3056', '359', '英吉沙县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3057', '359', '泽普县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3058', '359', '莎车县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3059', '359', '叶城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3060', '359', '麦盖提县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3061', '359', '岳普湖县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3062', '359', '伽师县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3063', '359', '巴楚县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3064', '359', '塔什库尔干', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3065', '360', '克拉玛依市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3066', '361', '阿图什市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3067', '361', '阿克陶县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3068', '361', '阿合奇县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3069', '361', '乌恰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3070', '362', '石河子市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3071', '363', '图木舒克市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3072', '364', '吐鲁番市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3073', '364', '鄯善县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3074', '364', '托克逊县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3075', '365', '五家渠市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3076', '366', '阿勒泰市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3077', '366', '布克赛尔', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3078', '366', '伊宁市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3079', '366', '布尔津县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3080', '366', '奎屯市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3081', '366', '乌苏市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3082', '366', '额敏县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3083', '366', '富蕴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3084', '366', '伊宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3085', '366', '福海县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3086', '366', '霍城县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3087', '366', '沙湾县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3088', '366', '巩留县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3089', '366', '哈巴河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3090', '366', '托里县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3091', '366', '青河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3092', '366', '新源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3093', '366', '裕民县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3094', '366', '和布克赛尔', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3095', '366', '吉木乃县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3096', '366', '昭苏县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3097', '366', '特克斯县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3098', '366', '尼勒克县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3099', '366', '察布查尔', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3100', '367', '盘龙区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3101', '367', '五华区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3102', '367', '官渡区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3103', '367', '西山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3104', '367', '东川区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3105', '367', '安宁市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3106', '367', '呈贡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3107', '367', '晋宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3108', '367', '富民县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3109', '367', '宜良县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3110', '367', '嵩明县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3111', '367', '石林县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3112', '367', '禄劝', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3113', '367', '寻甸', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3114', '368', '兰坪', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3115', '368', '泸水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3116', '368', '福贡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3117', '368', '贡山', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3118', '369', '宁洱', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3119', '369', '思茅区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3120', '369', '墨江', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3121', '369', '景东', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3122', '369', '景谷', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3123', '369', '镇沅', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3124', '369', '江城', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3125', '369', '孟连', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3126', '369', '澜沧', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3127', '369', '西盟', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3128', '370', '古城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3129', '370', '宁蒗', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3130', '370', '玉龙', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3131', '370', '永胜县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3132', '370', '华坪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3133', '371', '隆阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3134', '371', '施甸县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3135', '371', '腾冲县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3136', '371', '龙陵县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3137', '371', '昌宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3138', '372', '楚雄市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3139', '372', '双柏县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3140', '372', '牟定县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3141', '372', '南华县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3142', '372', '姚安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3143', '372', '大姚县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3144', '372', '永仁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3145', '372', '元谋县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3146', '372', '武定县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3147', '372', '禄丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3148', '373', '大理市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3149', '373', '祥云县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3150', '373', '宾川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3151', '373', '弥渡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3152', '373', '永平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3153', '373', '云龙县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3154', '373', '洱源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3155', '373', '剑川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3156', '373', '鹤庆县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3157', '373', '漾濞', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3158', '373', '南涧', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3159', '373', '巍山', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3160', '374', '潞西市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3161', '374', '瑞丽市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3162', '374', '梁河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3163', '374', '盈江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3164', '374', '陇川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3165', '375', '香格里拉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3166', '375', '德钦县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3167', '375', '维西', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3168', '376', '泸西县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3169', '376', '蒙自县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3170', '376', '个旧市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3171', '376', '开远市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3172', '376', '绿春县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3173', '376', '建水县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3174', '376', '石屏县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3175', '376', '弥勒县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3176', '376', '元阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3177', '376', '红河县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3178', '376', '金平', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3179', '376', '河口', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3180', '376', '屏边', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3181', '377', '临翔区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3182', '377', '凤庆县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3183', '377', '云县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3184', '377', '永德县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3185', '377', '镇康县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3186', '377', '双江', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3187', '377', '耿马', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3188', '377', '沧源', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3189', '378', '麒麟区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3190', '378', '宣威市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3191', '378', '马龙县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3192', '378', '陆良县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3193', '378', '师宗县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3194', '378', '罗平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3195', '378', '富源县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3196', '378', '会泽县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3197', '378', '沾益县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3198', '379', '文山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3199', '379', '砚山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3200', '379', '西畴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3201', '379', '麻栗坡县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3202', '379', '马关县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3203', '379', '丘北县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3204', '379', '广南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3205', '379', '富宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3206', '380', '景洪市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3207', '380', '勐海县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3208', '380', '勐腊县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3209', '381', '红塔区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3210', '381', '江川县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3211', '381', '澄江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3212', '381', '通海县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3213', '381', '华宁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3214', '381', '易门县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3215', '381', '峨山', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3216', '381', '新平', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3217', '381', '元江', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3218', '382', '昭阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3219', '382', '鲁甸县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3220', '382', '巧家县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3221', '382', '盐津县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3222', '382', '大关县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3223', '382', '永善县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3224', '382', '绥江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3225', '382', '镇雄县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3226', '382', '彝良县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3227', '382', '威信县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3228', '382', '水富县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3229', '383', '西湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3230', '383', '上城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3231', '383', '下城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3232', '383', '拱墅区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3233', '383', '滨江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3234', '383', '江干区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3235', '383', '萧山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3236', '383', '余杭区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3237', '383', '市郊', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3238', '383', '建德市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3239', '383', '富阳市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3240', '383', '临安市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3241', '383', '桐庐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3242', '383', '淳安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3243', '384', '吴兴区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3244', '384', '南浔区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3245', '384', '德清县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3246', '384', '长兴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3247', '384', '安吉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3248', '385', '南湖区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3249', '385', '秀洲区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3250', '385', '海宁市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3251', '385', '嘉善县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3252', '385', '平湖市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3253', '385', '桐乡市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3254', '385', '海盐县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3255', '386', '婺城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3256', '386', '金东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3257', '386', '兰溪市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3258', '386', '市区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3259', '386', '佛堂镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3260', '386', '上溪镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3261', '386', '义亭镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3262', '386', '大陈镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3263', '386', '苏溪镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3264', '386', '赤岸镇', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3265', '386', '东阳市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3266', '386', '永康市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3267', '386', '武义县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3268', '386', '浦江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3269', '386', '磐安县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3270', '387', '莲都区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3271', '387', '龙泉市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3272', '387', '青田县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3273', '387', '缙云县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3274', '387', '遂昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3275', '387', '松阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3276', '387', '云和县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3277', '387', '庆元县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3278', '387', '景宁', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3279', '388', '海曙区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3280', '388', '江东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3281', '388', '江北区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3282', '388', '镇海区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3283', '388', '北仑区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3284', '388', '鄞州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3285', '388', '余姚市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3286', '388', '慈溪市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3287', '388', '奉化市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3288', '388', '象山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3289', '388', '宁海县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3290', '389', '越城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3291', '389', '上虞市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3292', '389', '嵊州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3293', '389', '绍兴县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3294', '389', '新昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3295', '389', '诸暨市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3296', '390', '椒江区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3297', '390', '黄岩区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3298', '390', '路桥区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3299', '390', '温岭市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3300', '390', '临海市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3301', '390', '玉环县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3302', '390', '三门县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3303', '390', '天台县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3304', '390', '仙居县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3305', '391', '鹿城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3306', '391', '龙湾区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3307', '391', '瓯海区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3308', '391', '瑞安市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3309', '391', '乐清市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3310', '391', '洞头县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3311', '391', '永嘉县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3312', '391', '平阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3313', '391', '苍南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3314', '391', '文成县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3315', '391', '泰顺县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3316', '392', '定海区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3317', '392', '普陀区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3318', '392', '岱山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3319', '392', '嵊泗县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3320', '393', '衢州市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3321', '393', '江山市', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3322', '393', '常山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3323', '393', '开化县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3324', '393', '龙游县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3325', '394', '合川区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3326', '394', '江津区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3327', '394', '南川区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3328', '394', '永川区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3329', '394', '南岸区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3330', '394', '渝北区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3331', '394', '万盛区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3332', '394', '大渡口区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3333', '394', '万州区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3334', '394', '北碚区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3335', '394', '沙坪坝区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3336', '394', '巴南区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3337', '394', '涪陵区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3338', '394', '江北区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3339', '394', '九龙坡区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3340', '394', '渝中区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3341', '394', '黔江开发区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3342', '394', '长寿区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3343', '394', '双桥区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3344', '394', '綦江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3345', '394', '潼南县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3346', '394', '铜梁县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3347', '394', '大足县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3348', '394', '荣昌县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3349', '394', '璧山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3350', '394', '垫江县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3351', '394', '武隆县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3352', '394', '丰都县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3353', '394', '城口县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3354', '394', '梁平县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3355', '394', '开县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3356', '394', '巫溪县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3357', '394', '巫山县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3358', '394', '奉节县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3359', '394', '云阳县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3360', '394', '忠县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3361', '394', '石柱', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3362', '394', '彭水', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3363', '394', '酉阳', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3364', '394', '秀山', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3365', '395', '沙田区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3366', '395', '东区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3367', '395', '观塘区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3368', '395', '黄大仙区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3369', '395', '九龙城区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3370', '395', '屯门区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3371', '395', '葵青区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3372', '395', '元朗区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3373', '395', '深水埗区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3374', '395', '西贡区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3375', '395', '大埔区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3376', '395', '湾仔区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3377', '395', '油尖旺区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3378', '395', '北区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3379', '395', '南区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3380', '395', '荃湾区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3381', '395', '中西区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3382', '395', '离岛区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3383', '396', '澳门', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3384', '397', '台北', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3385', '397', '高雄', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3386', '397', '基隆', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3387', '397', '台中', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3388', '397', '台南', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3389', '397', '新竹', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3390', '397', '嘉义', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3391', '397', '宜兰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3392', '397', '桃园县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3393', '397', '苗栗县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3394', '397', '彰化县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3395', '397', '南投县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3396', '397', '云林县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3397', '397', '屏东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3398', '397', '台东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3399', '397', '花莲县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3400', '397', '澎湖县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3401', '3', '合肥', '2', '0');
INSERT INTO `cjnet_region` VALUES ('3402', '3401', '庐阳区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3403', '3401', '瑶海区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3404', '3401', '蜀山区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3405', '3401', '包河区', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3406', '3401', '长丰县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3407', '3401', '肥东县', '3', '0');
INSERT INTO `cjnet_region` VALUES ('3408', '3401', '肥西县', '3', '0');

-- -----------------------------
-- Table structure for `cjnet_reply`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_reply`;
CREATE TABLE `cjnet_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `controller` varchar(128) NOT NULL DEFAULT '',
  `action` varchar(128) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '0',
  `is_same` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:完全相同,1:包含',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:唯一,1:可重复',
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `is_config` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为系统配置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_reply`
-- -----------------------------
INSERT INTO `cjnet_reply` VALUES ('1', '商城', 'Shop', 'reply', '0', '0', '0', '0', '1');
INSERT INTO `cjnet_reply` VALUES ('2', '我的二维码', 'Wxuser', 'reply_erweima', '0', '1', '0', '1', '0');
INSERT INTO `cjnet_reply` VALUES ('3', '洗车', 'Wash', 'reply', '0', '0', '0', '0', '1');
INSERT INTO `cjnet_reply` VALUES ('4', '保险', 'Insurance', 'reply', '0', '0', '0', '0', '1');

-- -----------------------------
-- Table structure for `cjnet_shopset`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_shopset`;
CREATE TABLE `cjnet_shopset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(128) NOT NULL DEFAULT '',
  `cover_img` varchar(255) NOT NULL DEFAULT '',
  `brief` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_shopset`
-- -----------------------------
INSERT INTO `cjnet_shopset` VALUES ('1', '商城', '欢迎来到布道华夏商城', '/Uploads/Goods/2016-04-22/5719a20d5a23c.png', '欢迎来到布道华夏商城', 'Shop/index');

-- -----------------------------
-- Table structure for `cjnet_user_rank`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_user_rank`;
CREATE TABLE `cjnet_user_rank` (
  `rank_id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(128) NOT NULL DEFAULT '',
  `deal_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deal_count` int(11) NOT NULL DEFAULT '0',
  `discount` decimal(10,2) DEFAULT '10.00',
  `invite_num` int(11) NOT NULL DEFAULT '0',
  `invite_rank` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rank_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `cjnet_userrank`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_userrank`;
CREATE TABLE `cjnet_userrank` (
  `rank_id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(128) NOT NULL DEFAULT '',
  `deal_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deal_count` int(11) NOT NULL DEFAULT '0',
  `discount` decimal(10,2) DEFAULT '10.00',
  `invite_num` int(11) NOT NULL DEFAULT '0',
  `invite_rank` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rank_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_userrank`
-- -----------------------------
INSERT INTO `cjnet_userrank` VALUES ('1', 'VIP会员', '1000.00', '0', '10.00', '10', '0', '0', '1461144205');

-- -----------------------------
-- Table structure for `cjnet_wash`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_wash`;
CREATE TABLE `cjnet_wash` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `wname` varchar(255) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '周期次数',
  `cycle_time` int(11) NOT NULL DEFAULT '0' COMMENT '单位周期',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '有效时间',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rebate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '返利金额',
  `brief` varchar(128) NOT NULL DEFAULT '',
  `wash_desc` text NOT NULL,
  `wash_img` varchar(255) NOT NULL DEFAULT '' COMMENT '洗车缩略图',
  `sort` int(11) NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `is_fenxiao` tinyint(1) NOT NULL DEFAULT '0' COMMENT '购买成为分销商',
  `xiangou` int(11) NOT NULL DEFAULT '1',
  `default_bonus_rank` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`wid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_wash`
-- -----------------------------
INSERT INTO `cjnet_wash` VALUES ('1', '年费洗车套餐(测试)', '0.01', '12', '604800', '31536000', '1', '0.00', '洗车全返', '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div id=&quot;cover_id&quot;&gt;\r\n					&lt;div class=&quot;upload-pre-item&quot;&gt;&lt;p&gt;\r\n					&lt;img style=&quot;width: 532px; height: 200px;&quot; src=&quot;http://weixin.budaohuaxia.com/Uploads/Goods/orign/2016-05-02/5726eb10ca487.png&quot; height=&quot;200&quot; width=&quot;532&quot;/&gt; &lt;br/&gt;&lt;/p&gt;&lt;p&gt;\r\n					&lt;/p&gt;&lt;p&gt;\r\n					&lt;img style=&quot;width: 532px; height: 200px;&quot; src=&quot;http://weixin.budaohuaxia.com/Uploads/Goods/orign/2016-05-02/5726eb10ca487.png&quot; height=&quot;200&quot; width=&quot;532&quot;/&gt;\r\n					&lt;/p&gt;&lt;p&gt;					\r\n					&lt;/p&gt;&lt;p&gt;\r\n					&lt;/p&gt;&lt;p&gt;\r\n					&lt;img style=&quot;width: 532px; height: 200px;&quot; src=&quot;http://weixin.budaohuaxia.com/Uploads/Goods/orign/2016-05-02/5726eb10ca487.png&quot; height=&quot;200&quot; width=&quot;532&quot;/&gt;\r\n					&lt;/p&gt;&lt;p&gt;					\r\n					&lt;/p&gt;&lt;p&gt;\r\n					&lt;/p&gt;&lt;p&gt;\r\n					&lt;img style=&quot;width: 532px; height: 200px;&quot; src=&quot;http://weixin.budaohuaxia.com/Uploads/Goods/orign/2016-05-02/5726eb10ca487.png&quot; height=&quot;200&quot; width=&quot;532&quot;/&gt;\r\n					&lt;/p&gt;&lt;p&gt;					\r\n					&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;/div&gt;					\r\n					&lt;/div&gt;', '/Uploads/Goods/orign/2016-05-02/5726eb10ca487.png', '0', '1462168349', '1', '1', '1');

-- -----------------------------
-- Table structure for `cjnet_wash_count`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_wash_count`;
CREATE TABLE `cjnet_wash_count` (
  `wc_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `wbid` int(11) NOT NULL DEFAULT '0' COMMENT '加盟商ID',
  `count` int(11) NOT NULL DEFAULT '1',
  `time` int(11) NOT NULL DEFAULT '0',
  `province` int(11) NOT NULL DEFAULT '0',
  `city` int(11) NOT NULL DEFAULT '0',
  `district` int(11) NOT NULL DEFAULT '0',
  `is_clear` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否结算',
  `clear_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_wash_count`
-- -----------------------------
INSERT INTO `cjnet_wash_count` VALUES ('3', '9', '1', '1', '1462873632', '22', '293', '2421', '0', '0');

-- -----------------------------
-- Table structure for `cjnet_washbranch`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_washbranch`;
CREATE TABLE `cjnet_washbranch` (
  `wb_id` int(11) NOT NULL AUTO_INCREMENT,
  `wb_name` varchar(128) NOT NULL DEFAULT '',
  `count_fee` int(11) NOT NULL DEFAULT '1' COMMENT '一次消费次数',
  `province` int(11) NOT NULL DEFAULT '0',
  `city` int(11) NOT NULL DEFAULT '0',
  `district` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(64) NOT NULL DEFAULT '',
  `phone` char(11) NOT NULL DEFAULT '',
  `branch_pass` char(32) NOT NULL DEFAULT '',
  `address` varchar(150) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '' COMMENT 'beizhu',
  `md5_name` char(32) NOT NULL DEFAULT '',
  `branch_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`wb_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_washbranch`
-- -----------------------------
INSERT INTO `cjnet_washbranch` VALUES ('1', 'song123456', '1', '22', '293', '2421', '1', '0', '0', '', '15764227617', '5978ec3442a15e99e22ab23aeced3214', '测试', '', '5978ec3442a15e99e22ab23aeced3214', '无限轮速');

-- -----------------------------
-- Table structure for `cjnet_washorder`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_washorder`;
CREATE TABLE `cjnet_washorder` (
  `wo_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `wid` int(11) NOT NULL DEFAULT '0',
  `order_time` int(11) NOT NULL DEFAULT '0',
  `pay_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '周期次数',
  `cycle_time` int(11) NOT NULL DEFAULT '0' COMMENT '单位周期',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '有效时间',
  `wash_sn` varchar(64) NOT NULL DEFAULT '',
  `order_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `transaction_id` varchar(64) NOT NULL DEFAULT '',
  `openid` varchar(64) NOT NULL DEFAULT '',
  `is_count` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被使用',
  PRIMARY KEY (`wo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_washorder`
-- -----------------------------
INSERT INTO `cjnet_washorder` VALUES ('1', '27', '1', '1463098975', '1463098991', '1', '0.01', '12', '604800', '31536000', '2016051308225543141', '0.01', '4001472001201605135791666221', 'o8Tgrv4mSdes3jgqLOvlJAt-yUQo', '0');

-- -----------------------------
-- Table structure for `cjnet_washset`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_washset`;
CREATE TABLE `cjnet_washset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(128) NOT NULL DEFAULT '',
  `cover_img` varchar(255) NOT NULL DEFAULT '',
  `brief` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_washset`
-- -----------------------------
INSERT INTO `cjnet_washset` VALUES ('1', '洗车', '洗车优惠活动开始啦！', '/Uploads/Goods/orign/2016-05-02/5726f5dec7eae.png', '欢迎加入洗车活动', 'Wash/index');

-- -----------------------------
-- Table structure for `cjnet_washuser`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_washuser`;
CREATE TABLE `cjnet_washuser` (
  `wu_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `wid` int(11) NOT NULL DEFAULT '0',
  `cycle_time` int(11) NOT NULL DEFAULT '0' COMMENT '单位周期',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `expense` text NOT NULL,
  `openid` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`wu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_washuser`
-- -----------------------------
INSERT INTO `cjnet_washuser` VALUES ('1', '27', '1', '604800', '1463098992', '1494634992', '1', 'a:53:{i:1;a:3:{s:4:\"week\";i:1;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:2;a:3:{s:4:\"week\";i:2;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:3;a:3:{s:4:\"week\";i:3;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:4;a:3:{s:4:\"week\";i:4;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:5;a:3:{s:4:\"week\";i:5;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:6;a:3:{s:4:\"week\";i:6;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:7;a:3:{s:4:\"week\";i:7;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:8;a:3:{s:4:\"week\";i:8;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:9;a:3:{s:4:\"week\";i:9;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:10;a:3:{s:4:\"week\";i:10;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:11;a:3:{s:4:\"week\";i:11;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:12;a:3:{s:4:\"week\";i:12;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:13;a:3:{s:4:\"week\";i:13;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:14;a:3:{s:4:\"week\";i:14;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:15;a:3:{s:4:\"week\";i:15;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:16;a:3:{s:4:\"week\";i:16;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:17;a:3:{s:4:\"week\";i:17;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:18;a:3:{s:4:\"week\";i:18;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:19;a:3:{s:4:\"week\";i:19;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:20;a:3:{s:4:\"week\";i:20;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:21;a:3:{s:4:\"week\";i:21;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:22;a:3:{s:4:\"week\";i:22;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:23;a:3:{s:4:\"week\";i:23;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:24;a:3:{s:4:\"week\";i:24;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:25;a:3:{s:4:\"week\";i:25;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:26;a:3:{s:4:\"week\";i:26;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:27;a:3:{s:4:\"week\";i:27;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:28;a:3:{s:4:\"week\";i:28;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:29;a:3:{s:4:\"week\";i:29;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:30;a:3:{s:4:\"week\";i:30;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:31;a:3:{s:4:\"week\";i:31;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:32;a:3:{s:4:\"week\";i:32;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:33;a:3:{s:4:\"week\";i:33;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:34;a:3:{s:4:\"week\";i:34;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:35;a:3:{s:4:\"week\";i:35;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:36;a:3:{s:4:\"week\";i:36;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:37;a:3:{s:4:\"week\";i:37;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:38;a:3:{s:4:\"week\";i:38;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:39;a:3:{s:4:\"week\";i:39;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:40;a:3:{s:4:\"week\";i:40;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:41;a:3:{s:4:\"week\";i:41;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:42;a:3:{s:4:\"week\";i:42;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:43;a:3:{s:4:\"week\";i:43;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:44;a:3:{s:4:\"week\";i:44;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:45;a:3:{s:4:\"week\";i:45;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:46;a:3:{s:4:\"week\";i:46;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:47;a:3:{s:4:\"week\";i:47;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:48;a:3:{s:4:\"week\";i:48;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:49;a:3:{s:4:\"week\";i:49;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:50;a:3:{s:4:\"week\";i:50;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:51;a:3:{s:4:\"week\";i:51;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:52;a:3:{s:4:\"week\";i:52;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}i:53;a:3:{s:4:\"week\";i:53;s:5:\"count\";s:2:\"12\";s:9:\"count_all\";s:2:\"12\";}}', 'o8Tgrv4mSdes3jgqLOvlJAt-yUQo');

-- -----------------------------
-- Table structure for `cjnet_weixin_log`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_weixin_log`;
CREATE TABLE `cjnet_weixin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cTime` int(11) DEFAULT NULL,
  `cTime_format` varchar(30) DEFAULT NULL,
  `data` text,
  `data_post` text,
  `log_type` varchar(128) NOT NULL DEFAULT '' COMMENT '日志标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_weixin_log`
-- -----------------------------
INSERT INTO `cjnet_weixin_log` VALUES ('1', '1462969596', '2016-05-11 20:26:36', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv7EMelDJ94eh2X9WV7AJ8_I\";s:10:\"CreateTime\";s:10:\"1462969596\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:9:\"subscribe\";s:8:\"EventKey\";s:0:\"\";s:7:\"Encrypt\";s:428:\"1xBX5nLV8dU/1bhUpRsee34rt4J3wa7Momf7GL7HXLzrnpwNjJEbWAKLhLT8b0un5Cuy6EljXSzkZyC2ZuYNB0vNpAnZ4ODXtx2dt3BiV87DlOGSq0XSOtgPez1lJQVSxPeXZUtoXUzLfpRDZrL7B/+9gSYoNC5HahElc+/fjmj7JlQr4XQoEom/ply8+/lhbf0zbiOtF6tQEjXzxM6yeeLIRXqWC1Kihu8sPbjBnZN4RNN8FoymY7GOgfs6a6AAN9YqYNArSE9iPwnIE3TyO2m3dP0GDItXJqoLhRuIs0bHKjJaPwn8adEooUAO8LerJFE7C/51fWrc8RxliZwPgaa6PBV+I/0iaM1xBmyNDF1CisST+1jXtSOx9AyIoMKRQBaZTYlJbS5tKzqcL1d5ap/ZeIg9FSp786Rih5H2ZqE=\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv7EMelDJ94eh2X9WV7AJ8_I\";s:10:\"CreateTime\";s:10:\"1462969596\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:9:\"subscribe\";s:8:\"EventKey\";s:0:\"\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('2', '1462969596', '2016-05-11 20:26:36', 'a:13:{s:9:\"subscribe\";i:1;s:6:\"openid\";s:28:\"o8Tgrv7EMelDJ94eh2X9WV7AJ8_I\";s:8:\"nickname\";s:12:\"天空海阔\";s:3:\"sex\";i:1;s:8:\"language\";s:5:\"zh_CN\";s:4:\"city\";s:6:\"淄博\";s:8:\"province\";s:6:\"山东\";s:7:\"country\";s:6:\"中国\";s:10:\"headimgurl\";s:128:\"http://wx.qlogo.cn/mmopen/2MLY3ic8MJArdFx8oTFVZIDz2Q5HAs25QRgDqNeoicia7hjlvU3Jru4jMZ1yialfkVrkff4tBTPeJvtLDPny88P4ymXJonbc5Fwa/0\";s:14:\"subscribe_time\";i:1462969596;s:6:\"remark\";s:0:\"\";s:7:\"groupid\";i:0;s:10:\"tagid_list\";a:0:{}}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('3', '1463022710', '2016-05-12 11:11:50', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv8Eye6Iv1AAwlW54POqP_58\";s:10:\"CreateTime\";s:10:\"1463022709\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";s:7:\"Encrypt\";s:472:\"xyU7+xZx5dKj5jdY3HNmtvrZCbnF48i1uGaAU1ZSszxs5tzwuAUJ3TDwfxr/g59qGZxaNN5ikzzvJecUsqSbNXufjcpPiZXerINr1Vy0yHDJtmGZj7dhhqq2oiV89P7rNrIKuUzUHf1FUJYnMM4tHz1I+UptE9EIlim5W5f7IIskXNBgoi5/Ankgl8dF0fIR3GPpnOj2TxmHBECpW42QoXza2oDINLBcZLuKzw2Ccb790zjiy9Jg3r/GXONKz28lRBjfTR8a5RZFzPp5UjstHhPbCzHMBun4LC+Bje91e3w2AfBmviD9qUmL7rNpaq20Pj/1HiLE3bKcT0/UaI4652j5W87gl8gHuAnQysAqVxMcSOkRvhsNnO1c2gQ34eypSauY3nVwYqwTZqWOHtC0VBlEMfHwpvCLNKygY0VatgKMK0QQ+4a8g/IEM2HYRvURu7sWy9rWoO5CqXv0encFfQ==\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv8Eye6Iv1AAwlW54POqP_58\";s:10:\"CreateTime\";s:10:\"1463022709\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('4', '1463022722', '2016-05-12 11:12:02', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv8Eye6Iv1AAwlW54POqP_58\";s:10:\"CreateTime\";s:10:\"1463022722\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";s:7:\"Encrypt\";s:472:\"0LmBMY94KCurcy/T3df2msbHJ71y7dFvPbVR3aCJYIeVOi+dQoYisNmDOJrwHJl9Y/ZSwMeyuD2wvQYWznqYDhlEmKVppN44NVOWfWrsuv//KJgRrZ91IymSRqH/tZKqiAZYm5N4deF2aE2/XFqXlZXTXbTE9VsBF+pEYrSYQpsVVns0TDpC90IcdLBv4loKuhbLTS+fmQme4/Png07jso5Et1IkSCqQ9b7q3OMCZv0bcphzVZkmx3kZ39tvN4VEFQdrb9pwTxfGabbuRQM+bTu3Qxyus6glcVBXY4JTd4YuW83XWNVddSmqRnhH578h+BRIwckRZGIEjRi45L5tTV9HQqDjFafB4CTRKpxxHamqCEzVKJmbE6KAKcamBRRw0LqHnhNVXeKDAOSrYFspQc5hflRVevBMSNX9kwtAW8iEuRWCIqjcbzHX9n342bWsNAXjpkhrq8lGwK1wni3j8g==\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv8Eye6Iv1AAwlW54POqP_58\";s:10:\"CreateTime\";s:10:\"1463022722\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('5', '1463023369', '2016-05-12 11:22:49', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv5ARQTYB9e1zoFcxl7J_ISw\";s:10:\"CreateTime\";s:10:\"1463023369\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";s:7:\"Encrypt\";s:472:\"OaESU1I9xW0aY1Us77DIhiSarjRGNQWQXjvzidKqj9OpnBtGStTsWToNxy89QHPT+QfnEhDwWNzM6xlc1BT57hkbIPofoCPWPpHgkZIpUclbIaaULA/EcscvI9McLhW3UubhBiDcNWWrlEiYBZqKf91M1YSdvOKzY1UsmSTc3gsuKzmp+9R/JyioLWsqXYz26EMtOmmnYqN0q/jL4NF53G6f/o0LMldXlSUYZi7isij8r+a+lITKPKXS31jrTUP4izWGe1QodB29T9nD2Kh23qQn54jc4K2qr0AR1MxyXglOHD8lok5xag3ohZVggImrE57lsYjnJfBbEFxdC39Hq5leVTPDqfJ+PSrqbDf7UfySwj8dqIKl4jhofrqKiBGk7yTGq1/qVsLvtPjnYpyIzIHt7Q55+su8dr8v7lkPmBxJ50lsXsw48pLosGdU9fsKrbhqvZDOiRAdEU6cdNjgPw==\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv5ARQTYB9e1zoFcxl7J_ISw\";s:10:\"CreateTime\";s:10:\"1463023369\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('6', '1463025587', '2016-05-12 11:59:47', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv5ARQTYB9e1zoFcxl7J_ISw\";s:10:\"CreateTime\";s:10:\"1463025587\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"KuvgjdvWJVdKMIKubv4qXe5KO2vMupjIO5jy1pYz49ZSpJllYvL2WXdSvgrHOrqS9ZJk76KxOhLXz3CEO8xeL6fnPvAkdPi7AY6kb13smk8mMkbsEBkZXlpNJgChLLwZkUMEwBq0Oo+M3T4w8YsO++IOg507LiIacouZE/zSBoUexOngzwwtNp+so1MtD2+/Wyrv3lSLn5bk1YQ55ZrrLethlIfzGHSFUFIar3qQnr85aNLawSc8GQSR7ULuYNla+6oONSF+ctrahrTMAndD5Blfe+piL68bOzNEwMkQglmM3PeGyF56N1pMByWtqH4KfjUiwLqUGnow9fYgG5Cbwr4bRyd+p3Z7dWe/QsKMYp10pbWEVlkLcX5iG82SvY+YimtTg0D1640KtVqnE54rGmPPQyUZZWNJ7Fp4OINFIC+dvnY2DzOJNWMJ5SDPd1IE/VnTkGEjiS1ckA+OsooymJ50yQto4pNZeFqURJJL1Zp0F7nnyAWDuvuPuHvNKJd+RJnoXw+u1JTuTFRSOoqZbhML+dpi+BtaHWCtDCOboJQ=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv5ARQTYB9e1zoFcxl7J_ISw\";s:10:\"CreateTime\";s:10:\"1463025587\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('7', '1463025591', '2016-05-12 11:59:51', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxeDfDbQYVRj6pO6Zh5W49nUJ0rs92XhWKKcKLTdRUEEg_kDJKkCVhsepcFih9kqbbS1CMTf3e5TaXcI8dAGV6A7wO38jBaIQQ7BMY6ETbov7w\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxeDfDbQYVRj6pO6Zh5W49nUCLNwWaGmrmWdp3UDdvpgBb1iPY0OeBipc2eCMD9UCTN4bcRZ2iINtTvYW6oB4-CUWFG9UJvcjvS8-UbLVki1nQ\";s:6:\"openid\";s:28:\"o8Tgrv5ARQTYB9e1zoFcxl7J_ISw\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('8', '1463025729', '2016-05-12 12:02:09', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxf6fa7CDm-yiqmMRK0mJvW2Q27P4Ow3GDErnDYNarkEjKLAeH--yJes0V9ANO0URUNNLQ_zej7S18HGHJU1k-YvbGTW7OI5MRQaNckTfAwp_w\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxf6fa7CDm-yiqmMRK0mJvW2za3dso3X8vgR37uH3IvMS6qNM1Ai0VtSGpmHpEEp9Ki0afFP9afgRm7N4w7yPB63c1EXc0orNfKbS5OX7aGV7A\";s:6:\"openid\";s:28:\"o8Tgrv8Eye6Iv1AAwlW54POqP_58\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('9', '1463029705', '2016-05-12 13:08:25', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463029705\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"vqE/31rQmo+kYs3Sr8r/Ik7AcUuL5dE9KqyKJZKQ5W5ogkaSmtMu+nWIO02UJeAX7oBcXUXLdBzK4wjcC9jyVHpGkk5fTkHUfEGTIe+aZmURxlQnZiW6qn8Mjc2UVcRaHBw4ScBhp83DTfsfp15CS2vohaColIt4G2ov6Y8ZGiYXPqDoFv+UB3xzKT0qIqomlx1jzKC61QGJNJNj6/1GEg8ejfQtzkqCWqV/a32A7IsXUpOtboYZUqnV9gChHdZ9W3peG4zHqgc9gBAhlAZYYH1TmlCn4LxNnsrx9Vo3kEJz6PQ4JB++rRrdluncgwV63mGwgPzQwPSdX/oyHNL50XYOFAm1XbpKah+C9X3jXEC/8KhQP0wOxDtyn99UgRK5b7OYSLc6Fhhjxt2QxSwfYNlHSvWDAzE0KCBnA6rXKM7dfRHzODNqHD+0IWnwwv2aR9qc0wpm400ufK2pZHFPcdjLOgVVYk8wxwVsJk/rhl0UlTH3x9ke5f74GtXglsRSZmqta+1AQ1/8hcY678FG8nFkMkmzOPu6DuvPheql25M=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463029705\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('10', '1463029707', '2016-05-12 13:08:27', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxe__1PSZxoqtEvsg0SmvMD0OWU7GLp0xV-Oan1yI5Ien4yXRLR1P4YDLs21yiKXCLpCiUXveaM2AYWIfB0iGsed5RZE3dMSk-QZnRPXNAy73g\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxe__1PSZxoqtEvsg0SmvMD0dajkoFVh8uARgdDzHrCr2CRlwHP3L3gTEFVRf-4AzjSNPVx5oULm-oCt9vbQI91jyD6cvwBfX8mDa-DWKQlYwQ\";s:6:\"openid\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('11', '1463030660', '2016-05-12 13:24:20', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463030660\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"zuRxatjZ2aH2Voc5BDOe2bAoqQu9O9H/brSVgMSzkB+S4is/MlOA4XiPq4WMQUr7QgWrCTfmTS9u4YGR4Ws4g+jH5pPgiNe6wOnUuKwDo5vTKTjDTsC2Sya1zoI/7i1HfI4rgdqJKxwFKN+J/BF5ao+qsKoubzqDl9HNZrJwc+IHynKPGjTp9G1en3KYEvUeO4YHs8qjZSr/tmfpzztL9Kcel3BlFmhylDNAWwlVrLf/KQNc6nLqkxf1mIOngGUK0F8TgvmQcupaRmSCUCFTkLM39YE+o0poImodoOiPFdlfUbFDwtMrYzyEo4NhqJuyOgaZW8uw7RY6KDem2OlEvxbh1aiDAchvTDqKP/MSzGHRC5NWB3YVZPLxZdDqeT4f01ojRHCvCnNAZgWdQNijZZoYxVYdfMgn/4xmQZs4cMTEj+7rsrv3DBspSjvIb3WmsW9S3zZSb1a75hSCjX9i8Ud+ErJCBoLPj+nmdT3f7VituycIhSQec6HU72pAN105HgbnswOtGu0Z56hS0TMHvQmVCwe0FMM6pkjdhD7rxy0=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463030660\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('12', '1463030662', '2016-05-12 13:24:22', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxe__1PSZxoqtEvsg0SmvMD0ucJTmtb38LVCUvl3W_-mNSLas8XyAWBmQiLTBdCDfGGNj96kD2gZe47uS0j9SJjCiTOZN0yTAoH5vFplorZQGg\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxe__1PSZxoqtEvsg0SmvMD0-TK3xJVZvWv5Gjk7qGBXuYa4Uy4pH9RdjL4BJcSZbANKrafZeyas9eOb0W5lKgXbrtMAZdUcyzLWF90h78kt7A\";s:6:\"openid\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('13', '1463030681', '2016-05-12 13:24:41', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463030681\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";s:7:\"Encrypt\";s:472:\"YY2P1QpirR1fn06mld7npdENav8bsa+unnJLci8xIxm3NZQyZIyo/Kk7pg4gbThIRTcHVIs/FsufqdXJNF0Hj1akuJvIBJxfeTGJ4H06YZrgyVAN2Cg6C097fT1uId2JTlxm8DodFoIPUk3kBJBVjznymYoq4hbXweQWEnTg/ytcRvfJ6a4mss5hmBhBVOgCnml9hX3vOpf26RkcpnfpyIVU9rQs60qDajeQR7moHA1T49uwG9dCjs0XlM/9rcC6Ka0Tm+7zhyPTrO7/CEC6rbe78vcu7DAMAufPoFDE05V/qF7J2pCo6NEYsf3o10C/bBiXEzMLyZL9dBwxtGPJD7MMH3rBuIqZ0xJgElQMCtmj9IoG3/BXiVnD8ZlV9G357ENaoE2WMgwe3LiPmWRg04JDeGDyEA9rBgLQOubvNVUa4u0cTiZrjX4Bxb3XiyGzQS2IhLWMjlxWXwKelSvhQg==\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463030681\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('14', '1463030686', '2016-05-12 13:24:46', 'a:3:{s:4:\"type\";s:5:\"image\";s:8:\"media_id\";s:64:\"xugV3AIjWC20MJcb3KKSnWBy1D1MpH_kXgSd30ktY4cBgIdCIZEjHkfNGI5dZ5KW\";s:10:\"created_at\";i:1463030686;}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('15', '1463030695', '2016-05-12 13:24:55', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463030695\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:6:\"保险\";s:7:\"Encrypt\";s:428:\"bGLac62WLtatP9RlBRNm1ZsafjvYTGlRjbLcbTKVHVXgJztXH/L1TOlHha1SncB7y45iAYNABCe90sXuvDb2WxdBPl66PJ4maFDtgoAHuKpqOtF2MfV2acaoQgpsX/kiTyYz+iL5IgydE14EDam9QwEWqpkV/e7CFBS6peSm7awMLS7klpRAuKdhf+YqBVHN1U11Pnsb4GUMJYSrp6ND5pzNbLdfgYF5xPuRHusoz2nxAcmD3nm9vdF6JLWIaxVryNVrlDWLBXkMXaZeIa26HemhoGC6xsj5UT2TTeVrXvMXtdb+hnjlqlwfhXHUQY7B50eYmUw7MJEjv8bL41o/cBSNVNGbLW6e+qgk2DKliiCJvcL6dUdb2du2A4r4J6ncLEfVBx0NhADq51wEx7OWRztO6aleOlvhNnsk22hz3cU=\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463030695\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:6:\"保险\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('16', '1463030707', '2016-05-12 13:25:07', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463030707\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:6:\"洗车\";s:7:\"Encrypt\";s:428:\"Bx224DnF9dOvNxD3Is8YYXLcT2ATj+O58muaon7jVz4Yb/5B4kbR0PIaowuSibXJne51Jw2ipaR8YnJQKpxfUgOYphRykrwozrMQ/APqyhoiOhfCtSUXBPMRHTeYdGU5mnq4f9YuBx03pIqJsbWj04wzYvAF35+pFjYEwjrAsBWIVyqUvD1HrEwTmY2BE0X1ZKTAW/YYT5bUe18qCNw0BpHmeBlZyq824dSaBy+cr0jwx/yO7tBrxU64CQTYA/xyUNqljkpKxBtW99+uPfp8N722161eey+GDvTHbNX02ExOMpG4MdCiFXf/2mVf/ueX4+Zm3Ps0pj6ot9LdWmNxZtiLxFu8/L53O0iqMImkyF+aylM0FkZMwcDmWLO62i024QYQr7rOdPwSCwiWXwyD7VQJ4RHZu6mzlBDWO9h9UpQ=\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463030707\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:6:\"洗车\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('17', '1463030747', '2016-05-12 13:25:47', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463030747\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"bUFMhNFmV5IdCZcgNenKj4N1TM4Fels3tg6+7LZnOx0nFjieUKVeO4v7XxznN2jmnspZtwBTymlU8QtHVJMZGr/JJi4fvAv5aB8BZD0TfeU9srPFRSNeEkvwBovIkR66clsmmhoVSVpe32fQqYAeF/Vp5DdpCKo4pA8kR3rssGkd3tBeXqC29pwVebUyL6BeeBoVULQpJptjcHsgRflVazoKCSuyEeaxzXevWQyBq/5k7SH1z4QrX0zACXAsWlr9Iz8gveZ7ePOChByHjLyNmMZ3NPwF1KSGt0tGkUlrmKMzeXmi//Ak9/EJNkLQAQvqdDY853TsJ4qjikev4OKYIEW2erA2HbedulfDny695GFTUTJsBEe0Wjk9RaBX/mKNQ4iPa15kJBaS0LdTkCH1OGFJowWj7Y5Okh2X1o1VpENSXuFQbdz9U29TfuR8kA2gsp4Oux5c8XUKoCJaGiHVZCuCye31briM0nkLPf/Rfj/yr8L3T/1y/HVmUoBAJu/LdawqDazmZNFaeAX6jxYOWWjXfN5jl0j/qWnMrHxz4xs=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463030747\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('18', '1463031851', '2016-05-12 13:44:11', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463031850\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"IAdY8SU578tGfkrCB8GuL9gyifCXqSFRvxO7CKEvA5dDTksTAZgLVAguYzhJ3gyA92pxMY0V9DUIpi4yA3HhNxHekQOcpY29TuqO4WZ8Bl5YhcEaGXNFIt/cyXZnMe0qWLv4Tpe644VFDcPttv6YvlzT66/hTLmUsQeCuNifHGNTVgKh+aldBjqNU+bsIS4wpxrGkImYLVdISSuZ0FbuDBaY1iAZ1+TWS5lIS/rU69DLew+MffWwTpDhQSDxRVL69ozLBxQTG5bWUSv3sTIpK95VBZlUetqN8pDI5PL3aE116gFBA4RywXae/bKRIFbj11Kj8ulvBAklBevSqtLBkK5hab99MChm9/OvtjSnn83wXiDy0hhBNNAEy/sPTfCiVA0BZeLMTC0Kk3r2ors7QDm7e5WTzbEeBXYJ7UyL971rT98rCF5SUeiEubGf4M8auwvtyWBeH5MNQzMdh07qzv7V6IbdiLrQ053UUVjKyMqVOo1eFD6jLDIMGC2JCH2LkhAL89N7n8ra0YZE4GVX9utBSS+3p5zwPJoJCH7zjsU=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463031850\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('19', '1463031853', '2016-05-12 13:44:13', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxe__1PSZxoqtEvsg0SmvMD028bXSkq8rYATT2ptcRPmx8S6LSVVXCFeGoMFQWcQSJ1TsRL6wYnbmMHrrYwsPrtxE2qQCX4S3o5tr8QfV83EIg\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxe__1PSZxoqtEvsg0SmvMD0gTVhZbDO0KjC5hxic6qKxVgBibgovM551_5NCjavBEsM4vRSjzKOpyMr2b5pXf6aGV3BrsnxpPv40_vsdF8JAA\";s:6:\"openid\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('20', '1463032091', '2016-05-12 13:48:11', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463032091\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"YnFeNwJW81EKXWJkec6Rz14OKKq/xxz+NQ9Sts0ElywkdYJf50sCMkJk9JlZuFGfCPFwwrQtvrhJkWdTUYnRTakPufSCU817b26i+7tSTjieQAay900NH/N/38BaUxlI81RSu/4QQP0TCvw1kT8uN48FQjXjEC4IGSryps9a/DWVToU2Jm1NgsqVIAthwmSyrfYdi9g3i7uA2EysPRGmJsoNBFdgB+0QyonKR3u0I3e/QHbk/du8tnq3/YCb64qbBw4OG9S+svwuUkOAUyJ5CPJA/PJdj/qKEJt1sKGmE0mimVeId/HRleGNk3nB7y8gX8K7uAbhbwEf6ctp3IraSFSkNQPfmmIRxpMWSg3ALAIG/oZFBEeLejzLPJsYxmeno7XxCguLyCpr8SVHjPv6k3PVrXmosO7dxIiaj8DWMoLJtV09dm5MhjRNI/AAeiF0gprTUPix8UVeDS4Xa8bhy/c677FgVuHHQjEpK3/Qw/qbACN0XdLB8uRcxaVp6HXUrbnXCfuT38eHSAicNGG3+PG9H/Syoqz1Mm5UKSWZbqQ=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463032091\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('21', '1463032142', '2016-05-12 13:49:02', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv3_ZIu5H8dniiUSXD-_y4ow\";s:10:\"CreateTime\";s:10:\"1463032142\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:9:\"subscribe\";s:8:\"EventKey\";s:10:\"qrscene_21\";s:6:\"Ticket\";s:96:\"gQE48ToAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3YwVEVPa0xsZ0t6NVBWQWwxMm8xAAIEmxM0VwMEAI0nAA==\";s:7:\"Encrypt\";s:640:\"jGJZVw9m4zLESVrRqF4tgfu01QVvsuUAlDiGV593ei09RlGMgAAyn4StQM9G8vsepRnoNBZMcV55dHfhOTS6jmbN5Hc4hbeh41DF4KxRghs86xQRPnO4MV5ileQjlMCNn3xPAPejt6sXjvOkL0fGLADQKVLHYvyTj+znWu5bJmaMJbp4OggSK+PBfqagbm1TXYqPlG9bgLobn5iGIJOQCkOxWLnp4RAUjhP033VEaFQbZynlESOqRCtYXrrPro65LwIGdRnOAVxmMMYaoiwQlJENiPQ0Z2z0a0joRgZLakEVMELrWmMqhQSDTeFq1PWXrmD4pEqcDP9bAfsPeyHESIHqXJp+FkjxuniWUoTuTWg61TN0ZFIHm2iDbLYfvHe6m6fgff5dkhxIxDGaR4JZi4H0fv60G69DWgtctho54RQKrJqPwmihow1kc+h03b21DY7n+geAjv57Ilhii0Ms2XGdfyOF6Y9RhG7vHUtFuogys0Xt6zNzE1abFtwTRJWrQfrk65uQQ92nekg385SdiJrh9bure8JtyHlYLwMinmcULpCmMjovKmWoCVBMJT1sK/5ewFRic7aJ9bFv7TSPcF12w6d8kNjeuCaFyxaASKYkZGKI//AjR2+lhMAILejP\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv3_ZIu5H8dniiUSXD-_y4ow\";s:10:\"CreateTime\";s:10:\"1463032142\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:9:\"subscribe\";s:8:\"EventKey\";s:10:\"qrscene_21\";s:6:\"Ticket\";s:96:\"gQE48ToAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3YwVEVPa0xsZ0t6NVBWQWwxMm8xAAIEmxM0VwMEAI0nAA==\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('22', '1463032142', '2016-05-12 13:49:02', 'a:13:{s:9:\"subscribe\";i:1;s:6:\"openid\";s:28:\"o8Tgrv3_ZIu5H8dniiUSXD-_y4ow\";s:8:\"nickname\";s:9:\"抛物线\";s:3:\"sex\";i:2;s:8:\"language\";s:5:\"zh_CN\";s:4:\"city\";s:0:\"\";s:8:\"province\";s:18:\"里奥加耶戈斯\";s:7:\"country\";s:9:\"阿根廷\";s:10:\"headimgurl\";s:126:\"http://wx.qlogo.cn/mmopen/2DV0O1l3KBDU65zBs5L3nTibibRf8zLzR0EkKrugCgkpGj4DHt1WuQmFfn6pOKly43x650ozAblzxgk0RfZpovGlNfvboBkwDl/0\";s:14:\"subscribe_time\";i:1463032142;s:6:\"remark\";s:0:\"\";s:7:\"groupid\";i:0;s:10:\"tagid_list\";a:0:{}}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('23', '1463032148', '2016-05-12 13:49:08', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv3_ZIu5H8dniiUSXD-_y4ow\";s:10:\"CreateTime\";s:10:\"1463032148\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"bJ36GAmoiUSY5UQAwMCG+IWmsWZedp0va6VE/gphQ5Kw/KOb/se2rL8v3tIshn0duQtoxyCg1pnMnTtG2vlER8Pc8HIIImQYGAqXW+PdEJ73xkqoJeDUipTLvUcLSJKi9QXvQUq4tCxATbFeIFv6Fa0fjzR2uBtxUHn86KV7OO9wrxR9yXrLk7vyV081jKDvHJNk4Tzmobn/jKtxuYbF3M79GNYZ9eVUq2XkkTp6CAhINeDtBSGdpx5OJemq2WA5iHwcfOJzW9dL9BB77QKFrTFHBNprhM69dL57vEcIkVEBunDBTgFVE7HUYYn1rCA3WPNG1Jx6CGsjU7oFpENU11hbX/lOopHa4YFK4CIl3kg1kmPa3hPLngi64Rb1exj06+x9UHC7RCCAKsiUDjyfCOgKn8NWUcMJG0E6o8B/8EtlGA8CJmpTmJDHvf+7UPKE1xFnwCJLZ4TY+3xt8jZMgpuazyUUhTNYTWqliUz01g8T7tuVq5sJOGRtsb0ehixjB9glg7cUzQoYBFtCD7fOEW4kL+4V9HkZuuz6LzXyIt0=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv3_ZIu5H8dniiUSXD-_y4ow\";s:10:\"CreateTime\";s:10:\"1463032148\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('24', '1463032154', '2016-05-12 13:49:14', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxdGrxRCR8R9YLtiDdq9PVFnd-z5XCCL8Kpf6uiXfSoyIQPKH8bqVMY8MjQzIKradzs8W2Q1ZNCb6hRbq26PwotjqgVdQBLbCkMkRAyS10uFmg\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxdGrxRCR8R9YLtiDdq9PVFnUmX124_VZZONvn3fmbUQCYX7utqCw4IX77jbkA4wCWz9jq0PDPHYlxvN7Sf5Elzk83NoXEySxvIGCERJzy1F0g\";s:6:\"openid\";s:28:\"o8Tgrv3_ZIu5H8dniiUSXD-_y4ow\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('25', '1463032266', '2016-05-12 13:51:06', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463032266\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"+RROBf0SyLbt1W2tQYzFFsxJoEPCvd1xK5qYsJj/UKnDZw2oQ0zJo5WmvvmHPXGkPLsR0wF1b0YitBFIw8LEM0soVw2REPd3CufSvZpmeZuJMzntlAHL9faR8WyYrwoiWB7OW68DyG62SJ7Rw6OFUegeSPUPXn6ydWB0zVqlxzicOvGGCvaYvgyaQYjXc7Lt2Wn9GZHStKClX8mXc4SvUR48AhBWktCyFvHWXeWO6BUw+1KdOUEiMWAIbiH2r+EkvNOhO73fQPeW1w2iPXnusZE4oMj9eCmLpmYIkNm8dU7r9SwJR6rMVVzeUi7Je89SyHGIF2hURG/y/eJCreguY3yj4QBZu/kJYHmYM1jFuHHPUar2AMQMurBWGUF4CD3ZpWXIvsZGpm6jY3LPeDb81HBAap+Bdb90XnfZg2Lca+XNMcd0DP7foM4d3X7isuF3S/mpR0GyN1spuh+xW+PTPIqR6yPl9du5BjqL2y2jsnqs0NCYu8BYGNlJUV+G3mtJ1f3flRwo5b3lt8tpGYwbzT7NwcROdX/bkvrDG2SPE7M=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463032266\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('26', '1463032283', '2016-05-12 13:51:23', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463032282\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"CYmQLiXwuTbhurdYwi+lwZavIhwhMZbHx4dO09IXF847UJwjtkw8xeQR5+Io2pZDuaWrqnrUw92Z4apJKfowfKRgWQLdDXSUMY2AGe7o9B+olT2cW7xIprC4Dvb2j2HZ9fjI7LGCfWtUmCTYnEv7c1B9msF9MFWB1Jf/kS6HstSNuKnMkeLVFwk65LLprGxXfQm98aF/SxcYS3m4vWlYO7rZvNHRZlZb50H5QdJw0ST7c0uJaJvlwYUh4dDeALAarKFtMo/omN5FHgwN3jbh6QR9GOCTHt4gyDP1O0Mb3/DsbstHzeuwBN5EPOA0AggVmOmjhrLHVdAwbR/dH56vxOAafl4Bi1BQZsduw1kVRAUFM+O2xmasvdCS+WfoqIk4Ho5hQaB/EHn3OwDs8HBreO55elF0VzhU9x/fCJ2iXn4cDnjJDUlJindlchHtTxR9c0F8tZ+VWBRJO8kakQ9xa9ZTA1mb9iR8rnzwTEYOlcxoDm55MC5KrIphHwwwSmbK8dJSuiE25ir87QqV06SsyuLgKhDikixUPuzrNmLY33Y=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463032282\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('27', '1463038065', '2016-05-12 15:27:45', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv2RftLSg4KwxVzXy2V_00DA\";s:10:\"CreateTime\";s:10:\"1463038065\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"lzqbGKIoyp9+HvJZrHyGcwCZ4ieJMQkX/NxbL+ndJWUUP69jfhY3H+JaD7Rkj4z2/tbi/s+33iBiM0Ypl9x3if6LSagcipuhICSR71iUoIUato97yokss/aY2dpCe7xYyTcmix3c2EHXmB4TZ6e28WWXZAOtsjNSJ6uLw5ivD+39YzHKdvEZ4zQzkyg+6YeIjmf5tvNSPIVgZlZ0vWjKbDgJaBPvP6OJ2HWQPyHfREjLCzcxwgIVwuJTm+KeFMXEG2T4Si5r3Z8DtwyV7gKjYF35VWXCS+F+yJ7hJNsOaGBFM0Rku2cTAJQpg+dDh2ewEXBxMGG8c0YQ9EN/GBfgbpbmdCooHW5kJ0J8Btfyuox+YwwMmNOP+fMTAy9LznSBRRrnStJZ10/hx/+FzDUaHRar7hP7y8avnnk1TQZfZZo4RGs22lrccae70JefUZM5bElvXM+pYgGzVl4RAtJSiHjayaZ4IpecnA81/gDdYlibhiSQvbhR5cx0XV3fldU5BO6r4cvirkOwDNp3whWqX7gaBpNjzYZosEpKN4FDwqA=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv2RftLSg4KwxVzXy2V_00DA\";s:10:\"CreateTime\";s:10:\"1463038065\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('28', '1463038068', '2016-05-12 15:27:48', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463038068\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:6:\"保险\";s:7:\"Encrypt\";s:428:\"qOoh0fQW1Oxx86/Urf/Wh726+OOHGAeJzEtiow5XGAFvSXEA7RnZ9GU/kW/WcoWKAJ4kFkqVxivHLkCu99NGr3TFGCXg2Vsjvu7A18QRVWJ6L5PFthhdIVrMOocBXF9OpvAGjDChNkf9BLxgqeA5ONe/YgODOov+K/4gE9ti2WEEF7XKS75r+sF7ufGl2wyAih+l6NL9Xj4v/YGE8GwN3UKRcAL2r0M32S3l1+/dBsvTBxoKMYosTgVx2wx+uRyBC0YIwz0glwZAhjO6wWAEmOw/6aTRCgaDQNMnOpC4iDPv4RyHOyxIelDOJG1hutb/nDFcy2yUXt45oPjTwt66o5Hgljiv9io5GunwNhdEIQ5rrCZI9icTSE2+QiC7HR4l8o7WirgtnNtbvjfnD0eJzh2DAj/6rZS6dQ5IJgbsDXg=\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463038068\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:6:\"保险\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('29', '1463038069', '2016-05-12 15:27:49', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxfvysiorAKURIOKld1Z-DFVAR-HcFf82B-wTzZNLrZavVoKlmETq3gdY43xvbFgSQGVlgZtW8w6SpyikHHUbxpCiJMuEv-kMK0IT2DaEFoDRg\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxfvysiorAKURIOKld1Z-DFVjd5hc4fxU_bzYJDAKnVnBd95NxAJ1XqAD4sgqetcGOPnDoZP0M8PmffUkTyFy-UdzKmkti4FnWMUBZ1WSbemiw\";s:6:\"openid\";s:28:\"o8Tgrv2RftLSg4KwxVzXy2V_00DA\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('30', '1463038076', '2016-05-12 15:27:56', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxe__1PSZxoqtEvsg0SmvMD0vlFDJJIOCPYNd3GcbwOUQH2O3CpFsC4d6fDrLcFqIng-kI1aPwtB8Dk5f7w3iGXO8WpMxcQhVyvzqB9o9MCpEw\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxe__1PSZxoqtEvsg0SmvMD0erSMNMT_gjitWt3ESamDtYHirY_ue2ZGHUSQjKsAVm3MPj78gPqlXU-M02Jzux8cA5XtqgHtwlxwMNIhRvrw7Q\";s:6:\"openid\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('31', '1463038081', '2016-05-12 15:28:01', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv2RftLSg4KwxVzXy2V_00DA\";s:10:\"CreateTime\";s:10:\"1463038081\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:6:\"保险\";s:7:\"Encrypt\";s:428:\"HWzMW4i5WD+OUpex1VGwRW5ITUfkuNlxuV9YAHICJ/uTp5rXRxhNpuWucyYwV5CEJCRY6IlVv+uqTcBd59NRyJNO8+tQQdJHe5/kNSgd9uYx69pdVzVKgKP0Fqv1xuytbc34sO+SMa5QPin2cxTigsV+tAGycHss7KxbXYoGwXSoOjEWsN/dYbj74z6VewFDXdxHHghwPxQKeGK3pUIqLBKvi2tzW1xalVmZcRc8Fm1CnUTRsf1gVi/1sIFbBSLAmr5x5rgnu3KapwnCxV2qGTtsrAWOYZ1+sftD4mrqer9Rp1hNEeLx8pOkLbo80RLHaSA3rC5P7lFW7bxHKQMwcNQQwJydPkhdTjxP0KKTJgP/IbiXYGbk3GV9J0zDp/1jnCaOe3/M0PzQzLgmUJF0Us3dUl9UvUzKWuK+CWmkI40=\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv2RftLSg4KwxVzXy2V_00DA\";s:10:\"CreateTime\";s:10:\"1463038081\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:6:\"保险\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('32', '1463038230', '2016-05-12 15:30:30', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv2RftLSg4KwxVzXy2V_00DA\";s:10:\"CreateTime\";s:10:\"1463038230\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";s:7:\"Encrypt\";s:472:\"6U2/BgNCarFW72ha3uyZyf16+PxShHLTVbB7a0ALuwCZJJaXutQ76jvIIWjAZr/Gwe/liC7PHLKXbXK9nMXZ7TUNuLymkIhQIEmnvC/IUdS2+V/CwB1f+LT/SXUeuKKdn5XOzS3nVt+xz+0vGbaSH54Mg9gA2vAU6+PdEXwdObJGI8CKQ6a8yHrB9DFosbmCxsO+Z26piKySQO1wQft7WEjSTukcZgyXUZNZqvUGhxGP26EdjRNd9sJGIX5Cw55ALELw/jKJX6iYAgNqZDs1Qsxb+zr8RN+NYuUVJ4dSfpqd6nm3820bC5zpIFak7mcad4NYjY/+K90P6JWvb4QOyrZ3Yfst0jK3tqyk3vh4Z74JHL4PT7BylHBngJ3weq6a2xp7pduoC8XkfEl8pOWEK1JFWEOP3UVhJzN/MLcFJI3P97BOI55SJkDhn6qifAosfjYkmY0DraQZ7wBkLiizPw==\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv2RftLSg4KwxVzXy2V_00DA\";s:10:\"CreateTime\";s:10:\"1463038230\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('33', '1463038235', '2016-05-12 15:30:35', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv2RftLSg4KwxVzXy2V_00DA\";s:10:\"CreateTime\";s:10:\"1463038230\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";s:7:\"Encrypt\";s:472:\"6U2/BgNCarFW72ha3uyZyf16+PxShHLTVbB7a0ALuwCZJJaXutQ76jvIIWjAZr/Gwe/liC7PHLKXbXK9nMXZ7TUNuLymkIhQIEmnvC/IUdS2+V/CwB1f+LT/SXUeuKKdn5XOzS3nVt+xz+0vGbaSH54Mg9gA2vAU6+PdEXwdObJGI8CKQ6a8yHrB9DFosbmCxsO+Z26piKySQO1wQft7WEjSTukcZgyXUZNZqvUGhxGP26EdjRNd9sJGIX5Cw55ALELw/jKJX6iYAgNqZDs1Qsxb+zr8RN+NYuUVJ4dSfpqd6nm3820bC5zpIFak7mcad4NYjY/+K90P6JWvb4QOyrZ3Yfst0jK3tqyk3vh4Z74JHL4PT7BylHBngJ3weq6a2xp7pduoC8XkfEl8pOWEK1JFWEOP3UVhJzN/MLcFJI3P97BOI55SJkDhn6qifAosfjYkmY0DraQZ7wBkLiizPw==\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv2RftLSg4KwxVzXy2V_00DA\";s:10:\"CreateTime\";s:10:\"1463038230\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('34', '1463038237', '2016-05-12 15:30:37', 'a:3:{s:4:\"type\";s:5:\"image\";s:8:\"media_id\";s:64:\"x84Xtningt4B9SFFXMri4Cd6scFX40PDpDh2091RHxTo4sZqb_LYiz5vMw_baqgV\";s:10:\"created_at\";i:1463038237;}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('35', '1463038240', '2016-05-12 15:30:40', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv2RftLSg4KwxVzXy2V_00DA\";s:10:\"CreateTime\";s:10:\"1463038230\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";s:7:\"Encrypt\";s:472:\"6U2/BgNCarFW72ha3uyZyf16+PxShHLTVbB7a0ALuwCZJJaXutQ76jvIIWjAZr/Gwe/liC7PHLKXbXK9nMXZ7TUNuLymkIhQIEmnvC/IUdS2+V/CwB1f+LT/SXUeuKKdn5XOzS3nVt+xz+0vGbaSH54Mg9gA2vAU6+PdEXwdObJGI8CKQ6a8yHrB9DFosbmCxsO+Z26piKySQO1wQft7WEjSTukcZgyXUZNZqvUGhxGP26EdjRNd9sJGIX5Cw55ALELw/jKJX6iYAgNqZDs1Qsxb+zr8RN+NYuUVJ4dSfpqd6nm3820bC5zpIFak7mcad4NYjY/+K90P6JWvb4QOyrZ3Yfst0jK3tqyk3vh4Z74JHL4PT7BylHBngJ3weq6a2xp7pduoC8XkfEl8pOWEK1JFWEOP3UVhJzN/MLcFJI3P97BOI55SJkDhn6qifAosfjYkmY0DraQZ7wBkLiizPw==\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv2RftLSg4KwxVzXy2V_00DA\";s:10:\"CreateTime\";s:10:\"1463038230\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('36', '1463038241', '2016-05-12 15:30:41', 'a:3:{s:4:\"type\";s:5:\"image\";s:8:\"media_id\";s:64:\"y_2AqCHtM0WQhHcBkzZDjV7eHvtck0bCCvmc60lcgeVhalzeDuUHhCmdIxKtr_0c\";s:10:\"created_at\";i:1463038241;}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('37', '1463038258', '2016-05-12 15:30:58', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv5RIT8FS3NzCskYvo4UCkCc\";s:10:\"CreateTime\";s:10:\"1463038258\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"SCAN\";s:8:\"EventKey\";s:2:\"20\";s:6:\"Ticket\";s:96:\"gQE38DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RrVC1zWTdscXF6VHM1bS03R28xAAIEFzE0VwMEAI0nAA==\";s:7:\"Encrypt\";s:600:\"OXiNMyWii1LcqZkJwsJRPh2mYDSQEVzqNkhoEht4o1C3kGFw6zpCU97uNIhsOVtJdHI1MA+dtn7iU/RD4zZToAMMpqyj2nlnkuPIZNtdCNErcWaQqhLCcDSaPP8EQCvb1JhjSrFX0YWjf/l/pAo2gXl6w0bulFKoMMjebZXNgNyd2aMp5g6o6hPFWFP7BBPPXnMmObPulgXZ4t5q9islMBllybaDrRH7o7dsRmvVORZ31qcywvCwGplVB5SNizRjPhxTygLUgAUS7Fuy45VtbJBIYntmLoftoaNAgx5RKQInJiXuv1SCYeE4ky/qqW8QFQKqICUvkZgGpDAze0Un35qllA/ToLmddJDVupLP7hbruNJoBxll64Gqg7FBe09NYO8TcXp7FcCYzYB+9gE4zeijTiy7yH1s7R/bx8rmqmVtNQPfDCqxxQzUj24Kr058FS4160rkihRLJHMzXV/YtChxTu4LGm0XHlZKWfQzM0XNz18KVkekZkBkSJeJLuHA5UbljJw/7TR0vbqEP27ucoiUOzcan6gz4P0Onr8Ciw/YRGk0rvrqf7S7eqarRIDfIIwUl2ILrf9B9/j1qMTxQA==\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv5RIT8FS3NzCskYvo4UCkCc\";s:10:\"CreateTime\";s:10:\"1463038258\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"SCAN\";s:8:\"EventKey\";s:2:\"20\";s:6:\"Ticket\";s:96:\"gQE38DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RrVC1zWTdscXF6VHM1bS03R28xAAIEFzE0VwMEAI0nAA==\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('38', '1463038271', '2016-05-12 15:31:11', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxf2BBeSn80wSrgFW4SO9gztes4V0EVe37GwCH9eBTfRZD_kaKhRyWEKcqNlqT4qinpK3UjSc_UC6_jlrwG7J0GjJM0W6kT18Su-fWJUt_5K5g\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxf2BBeSn80wSrgFW4SO9gztfMUe-w30EtUeIrdRThAk_1VoPmIt10gKUmO_JsNdpELL3xj1iiXNAKST10wN_U8TkA2G3R5ZTVJSeZ16bNA9Dw\";s:6:\"openid\";s:28:\"o8Tgrv5RIT8FS3NzCskYvo4UCkCc\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('39', '1463038279', '2016-05-12 15:31:19', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv2RftLSg4KwxVzXy2V_00DA\";s:10:\"CreateTime\";s:10:\"1463038279\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"rLj9mXcetDYpRx99sRipMLMZqAGSM4/NO0eQOP4TQTIwthlA7paW7fF0QryGKpGjpwh/ffaOo5ySz6bK/ZRuOAcsInuy9c59kHwkdSGJl36IoL7QBHNU4NjIla4oe94l8NFMj2atAFdJ4vSr4tOi7C4z6XdeEb9FxiVysZIG+9+aV4Q3NPCDLJwxfbAml1F2oMs5ygIMlI2XAUMSAlZFOH8gqLFaocswnqAQOuY/zEZEUfhSXS59llK8TtXnp28W9Ihofggr6BidkMHdjp3aQpFohcxi5RXo482bRubcXf209fX3Yndyi9HisEfH3CWcLvaWwpUtU8VjDJbAzcVre2QRMwiv/+RZa0gg/xm5J1Z3ZKpy5Ix0vLwTJmHraT1shQTCLN5f7AiCrLUVP0wMBPVQRHGJjl2NHOLRuDAKsr64h351Cypwbf8QlOi50UnkQ47XX1IX7U9OOPLKgpWLBtSCWXTwuwJVp5aQoWn21cEmvvCnogQobRJkEf+FdPRPRjyRd+1BEcNKotwL1oZpaUWp0fTgqn4sp/iZ2VpEPfM=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv2RftLSg4KwxVzXy2V_00DA\";s:10:\"CreateTime\";s:10:\"1463038279\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('40', '1463038396', '2016-05-12 15:33:16', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxf6fa7CDm-yiqmMRK0mJvW2oeSO92SPKfv1yC1ff7HbkVVx2U4rt6KtVh_tiGQDY-G8z_Z4CKWyZ0z8PqWvmEGvkDr14-SoIAYpaPqBLn_Hgg\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxf6fa7CDm-yiqmMRK0mJvW2Pdi0TeNWfi2ug4KIyMfoN6Y_yKdy6aBhqG1ZpOXAIVnokw7hKTvj1G8LozMZCPwDWp6BZtHftCBDBlEOxpNE0g\";s:6:\"openid\";s:28:\"o8Tgrv8Eye6Iv1AAwlW54POqP_58\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('41', '1463038578', '2016-05-12 15:36:18', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv2RftLSg4KwxVzXy2V_00DA\";s:10:\"CreateTime\";s:10:\"1463038577\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:6:\"洗车\";s:7:\"Encrypt\";s:428:\"TNZuuEJ+fMfziddJmamhPccpJBiQW64bUSUvI5RI7DDygizLTBmcmqYh8/ftnZ7XGy/EVlj3WukJK0//jNslQDgpHlKo7Sd6kYCY6TKF17L5F6xLFaTjTbHmx+kdcCQpQYcBwrn3JirNFQyM8UFxkfIMt/8VwjRwul20bmoajNTe7Y9Yc6LOWdRVgu/qDAT5u0UyIZEonqaCsmy7x6DuIAKKQBf20hr7YOCg9qBvlKgRedZmMcv82LcJgymkxfjejGXyU+5EJOfuejvE5cV1gxTAkqTfJt2GYGS7DtKqUjmHfZ7VjPqfRralXz6LP9+i2ZzPcoxEkRwZYn4iUSe75VOzSBPnq9zF+8+VYX3qNAJnCUOB68Vy1easfB2NRPdxJJ+h73OLpdBvns5dStEYxjPHJTEleyAGceVUuGk4aRY=\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv2RftLSg4KwxVzXy2V_00DA\";s:10:\"CreateTime\";s:10:\"1463038577\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:6:\"洗车\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('42', '1463041537', '2016-05-12 16:25:37', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463041537\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:6:\"保险\";s:7:\"Encrypt\";s:428:\"sjVx5AeA1HEylzv/ElC7bj6iaSRq/flFIVRx7xB0GJNLwajOEA7pGEOXQGb8cz/Qqobb6QYZE/II65H/uvgCzmUyp+osRWG3rCxGU2IB2goQ9F8pGcqJrxghSijzIS1QeV6mbIrJWkjcyNI3MVnig4tWJXY0GTRmAuyy8FG/ltTBLBt4paQ8tH/zC1nSh9n0zhZkcA99rbex032l8UEhkNT+CFhEmYR7bXVxdID9zPzU7zMVH2KnEgKLoWrdMiXvCwM5yaSJFSHYd7pDJHJb1WKuKjRuObPCJy4BvLavGNCz0P9hzC86RpZUvdynFDjD4Q1R4sTpyzU/ax88wB2zp7AUT+CFWspr2lXN3AhNSK7ry6yWzV8NoRxihtYs2NPWy/G8LuUwvw1rsn3YOJkoigRu5+kcjBwmh6rCTjEFxyU=\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463041537\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:6:\"保险\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('43', '1463041548', '2016-05-12 16:25:48', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxe__1PSZxoqtEvsg0SmvMD061VTQzQDVbZGSHN7J2VGZLNTsPaVHeKxd6DgQ9jaHCNEfPO7Rb42FdqnvLNx-u_lS__NNGzBIbiKvJUgGfn2Ew\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxe__1PSZxoqtEvsg0SmvMD02ohSP27NhuEZjBb7sKHc--EuZZsyoRqx243iOe_tcfnxFznCiByQxpeFiek0vhZdsUjmxl4Bk4iSxaiusmONbg\";s:6:\"openid\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('44', '1463041977', '2016-05-12 16:32:57', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463041977\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"r0WDProDwbbLEA69ON9wCsUe2fzrDo0/LMNZeFDW/2viSCynduTppcKwM6bqym2jEeFxTjE6cO+Rwmh9lb+FJ7t6xtLh/9noJsbT66lnU7NjpJvLmci7n808nP4CqMmpckGWTKDWbz6DWVh13NpPKH3JCsGtNbh9J+bowp1UnRwJ6u42YXWwc+/qtVuprN8rxuHdg+g2vD56YrU1EKU6HYGayYJyapn0re4eaeaQSOxMRA82NmcHGGIN29H5vGlpR44UVYubFrhexcFibHLUypxcl+YpMhmjo5Vsfv9QKOojDNqL+UmQzjWqqMq/GWl9umixdguEnjXjLsJStW34PnpzbS4H8kn35NOizTdOZB7GNc7CHQS/cUTUyg2O6WGTCb+fD9WcWCwlSwWGIZFKe2YibWIabOsA98qfntkihzmS9PmKqrybiGgatiRPK/5McNIpKUbT7s5t9ZWtrDEdBlhFQLIQIORHw0BAsKQLrvdgjujedcncPQYmO01GDyuULG1AWnDA/Msgzd1UcPUiqsHu064luwItQYOIYiIO+Xc=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463041977\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('45', '1463042035', '2016-05-12 16:33:55', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463042035\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"JnQl5dGQ2ZvYqD5uIAOrVrU1NGdL6V+bDDhmlpd506cHKDR6rB5X0fKHmik/IKZg0aoq0I+SvMnbQE0YBmCk26Cx50vZmI1f9CsnNSPsYrvMITBdopau0+Ilup1ldFLNcf2WNWKiumIIUyJXpBV/48Bj6ooaTL71eRofIOZ6WAtOJ76aqlgH0nqURJVIlYrkPJKggbX2WZWZF7yUg/Tc4rD/cyC3IB36K/9EdIpjfHUf/9Adh9aCptQdq81AOWg11RPpEOiSW7lPWHqA/eF/ozekZe1g0u23Qz+SaydUNvJ6Ofea07FMwu38YbVnrchAnsQGI4PFwREVHCfW2ejBDo5pmUXg4LvXHJHsQkc9DaueJv7tE+dbzFsfbiPeZfVTLW9PdwpqAX4Kq8SfYk9nZ4olK9JPnK1aSXrhdVVgnlkNHO6uJVM4h+4N1ddCrOp7gENudPSgWm8bxgHDwDhSgWTxT0gxUFuqEsPx06gHEAxWxDOef8IEP3zFtLzxmsYOLMNcF+8A00tWTjOTZ1iVtEaKiYEcAZxr5sJH8tkpMgI=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463042035\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('46', '1463042852', '2016-05-12 16:47:32', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463042852\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"7CZqrMT//dcoP/uABXMyGkmtkghDgsZHUL2U8y8R3OaWotc67jwwX+W9cgfyX3B8yRYII/xKXGj+FuGxLfwiOv15HfDBtkwTv1pceBngu398B7GjAYrxE/0R/qxL4Ihc9UzynBgFgzQsVDIbqp548hS5DCq3wSC38blg07nv+YUu2YRyB0gE6vIpQou1zZU6NGAeITJuf+uDySLic5xEX54ZOOdez6kjusHrwM+pMPQTeRm/KLxZlqmijCRBFuJ0XwkaZPwiOUA5gY7gy58RyRqTFUUbii6UpefdMJltnO//5MGJTxAcllLCTMqVSmUGo4pVV2WJJF8EhMeO5BxlcHqiEeE+w37N59MfAq03jSV4YDq1LvWQQXK457IKGDC+qO+fTPkMhzz4CNNEKjWpT960OFbe34zLrkOOYAT+v+aPRcip37SBbDs4B7NWcKgC9acSpOtRehO6vXf41W1kBPRd+9WjW9YyRpylDKXNxuyR41f8O2LVrZSZ9CS8qZDMh1LpNCW8hXDtXQpe2ihp9+uaD2pbP2HD+Ve5CqWsejE=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463042852\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('47', '1463042856', '2016-05-12 16:47:36', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxe__1PSZxoqtEvsg0SmvMD0q0diGZhPk201pOI7D9MiIaWKJy_FQjnSUb7RpNems0RpVkiAj_pou3fTkW2LywQ4xnA2kX9mlpLK57Hmi-73-g\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxe__1PSZxoqtEvsg0SmvMD0Ah0zfyj7BWkKllj9Dsf43wRsKKc_ahOTAo-Cb_JZi3NQXvZD_6K5hHky62v3FM4NfpvTPMwnvCCfBt-SPiNxiw\";s:6:\"openid\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('48', '1463044296', '2016-05-12 17:11:36', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463044296\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"GbTPnmQuNHyGoCbt8NXaB2Q5nPUAj/ZHtv/sWq+3r0q1UHNXeEA3fz3oJNxdf/RX3uDEV3sW4az7nRa8nJYmnjtIO/yR0MIqt8Vbz5FOTxSeZW0siryu5az3bvcRqVNDAlyQvOkqdHGCqqGcZ6VVsd1pJRG6TMqfrI8+YJa3dQMXT0Dqohl/ar/Z9YW6b4/aNzJiXmsiYqzEtbnMoiOnB57HvIk5AzSEkqWBFKfbRIuyaMRg0fL0wT6hmhcETO6LrK8e6grJttJYQXjCIUsehivmELkCCh9KE1/3Zn2QgqKIW+BRh9/BcBhAPXKTpPJGKzGLnPtF32W9k2kZVIdZCWC7D8EocrqwY4yMJ0BHUrxFl0sgDhwpxXriF18SD3pBHsBx8eueO2nfUC00ivgTttFsay/yznegBXeuD0A5KW9kt8rsTwM70FUULsn0jc/olGYNs9/nNiG8oIvWLpAkOK+A0z3MjlA02Mk7X0U1v94V2b2wT0kaZH5I4wvrgqBnrngqTREcHtIp8q2/pyQHhcdMmP5y6ySD1flbXgTz4ec=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463044296\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('49', '1463098826', '2016-05-13 08:20:26', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:10:\"CreateTime\";s:10:\"1463098825\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"kODtGKyJWCAf9S6mJ2xLMBQmrGCHiJhiQCp+8KUnclWLMYrIKgxT9etrEpTN1q99+8GofwkA9TxQNku810US8mDg6m+QfiIq23psBHUgq+kG9iGtVYgWiYoff9LXgUZs8cMIHoPZBE10qsnxrkQ2HHx4g3kFVeigrGlxFNKHDn3HLZ4VQDki7Gn1PY/8OZq/UqRaOpGkT1vy5ESsDMfeUY8A1JnrYfBhqd0ymwr1b1eHB/jV8DpMqOJzz1rjES5WSXhRZX9oH0zHGAnnrqBuo2iRUKhQ9LmVcMzYyPUz55z2qWfCCqSII4wS0KqNtkDM4P0BitxG2wk/IDUBRIgw0DqY3FmqV45aJ3O9ApWnSmGr3NIcfTcV9MuBSKhFP6bNCtPkxXO9KSwrSHENpf8guxSx5BR8tkQdtZnTVXddIA0ju4y2gV2b9EYF7RBCXV2Re+vJLR6G5GEBe4YujKYi5Iavqp5nVVCI7lL5hEkK7SvKs81wrts5PTpviyMg5oqbTXEhf9qqsntn5Rsgf9JSHETnAX73ij74Eqb1cRr/2D8=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:10:\"CreateTime\";s:10:\"1463098825\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('50', '1463098831', '2016-05-13 08:20:31', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxdZenw5Dh7JR4TQ0HgG0kElOkIoLJfx5G62-gWQQ5R7A28GkjFxbaA8V-Cj1BaXylsJF0GdNRlp0DdQfKqyjdz46Meb6RtyRKIfI-PcCV8J0A\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxdZenw5Dh7JR4TQ0HgG0kEllRxGtetSwJXEWfMnve4bDuClVTUvhSsugn4Hp07ek5MA4LptAGDKWbeWMXqNBs4WNd8F5VPbPmpY9Lu5h36rYQ\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('51', '1463098992', '2016-05-13 08:23:12', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('52', '1463098993', '2016-05-13 08:23:13', 'a:19:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";s:3:\"uid\";s:2:\"27\";s:8:\"pay_info\";s:18:\"洗车套餐购买\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('53', '1463099007', '2016-05-13 08:23:27', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('54', '1463099007', '2016-05-13 08:23:27', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('55', '1463099024', '2016-05-13 08:23:44', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('56', '1463099024', '2016-05-13 08:23:44', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('57', '1463099031', '2016-05-13 08:23:51', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:10:\"CreateTime\";s:10:\"1463099031\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"gCAViYlFUQW3IJ6KFMVSs5SNUYsRVD6tWbFuvyuddjIcA1LzyE/XiTx+Vql+8sQ4Ai+1YN1ngPGut2VtVt3pLPC7aEj2njDZmcHuSbGqpHdNRqm4ob8EMsrMB1jmuWHRZioqT1EeXNLb+xrueYkLH8yPKiZLnT2UAwwTRMXtRtQJ+uMx6SBxSCaU5FXOMxQQD5Ugro5Un219qkRBvTWhVV6ut241HHdTg5s0Koksc+UKrVRGqdXD7nnujZYOhhH7/4eW/R+NVCEfOTPVujtdEyu4EFlN545lL81qIQIYwOknxLceT7Loe0tTM4xFoYjOhWiDCnr/sbFR8fKDVn0B/EJzC6CGHPvNR3fBKCH/PpqbzSgki2cPIV4Uo7gtl13Tv+f0lvmF7SvgEVVAL2+T69kRXVIDDP/FBaqmbypxxdKJfUbW5weC97WIhcMyXX25J+0Ueg5QZVFQRqAGWCnOwcN8wF0KefzGj9D2r/ri22SK8z0nUaz0opd2yAyb41+vsLdpTzgUbf16NLCom31aW2Li3eTZsFEMifxvx1e6GEs=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:10:\"CreateTime\";s:10:\"1463099031\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('58', '1463099057', '2016-05-13 08:24:17', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('59', '1463099057', '2016-05-13 08:24:17', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('60', '1463099240', '2016-05-13 08:27:20', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('61', '1463099241', '2016-05-13 08:27:21', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('62', '1463101043', '2016-05-13 08:57:23', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('63', '1463101043', '2016-05-13 08:57:23', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('64', '1463102812', '2016-05-13 09:26:52', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv44lFzInIILXEl3gt3o8-Eg\";s:10:\"CreateTime\";s:10:\"1463102812\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"twdt6g1cTnI4eDafYxR0AEwzv7zfqxij7q72QfZEDVFv8ne3GXJjucj+MsPTgpoHT3oWey2AgfRQhDdn+WBA+nocVROzzphaL+v18Kdjb2P1ztKSaPT7spuaywIINo14au15j/seX2HyOl2XXSZjG6/3IlO1zjgO3TjO6cD81LKW9Pl/uHsSVIKP6ZDDTGcukSZA+Lyf4H7MKm0D6xuc6SxJAhLUo4+UmZUJ2O37jyClfPByQ7QRaNz/o9BooiJFymeL85phzEXSblBt25qJ/6tTcQhVuOUi99xTPXl0oIW+ZfKW1Aj6vTf8XCmFhTYJU4zcH6NrNvhKjzxS3gk7g9fZjS3WkswxJDaYevcLIZdd/L95vw5N3I+/a+DPNWdbqPYdrHeDJdItug+v3rKHIRmeFRX1Y/Zz6+wBJ+tQibwV4Q0v+KreKWWKhx4ZP7HzZVHY6Jb7QH3mqjulvQryFcAN7Nyt7xJGZ7ITTktMhsvcs0LzUZZpVOXhwPB8Mgd77tFUGZm5IYp9FjLE/RVpfWQkNO6OmStPL1JLQkbCToQ=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv44lFzInIILXEl3gt3o8-Eg\";s:10:\"CreateTime\";s:10:\"1463102812\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('65', '1463102817', '2016-05-13 09:26:57', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxcryE9BEeLlQxtDGYE-CFK5BIUBrB9reIUt9xY1TF6qPmriBMO6ZoIMVzyu3-do_hyGsq8UxAQu0YK59k-1mdHoS7qRalDsXbxXMniTt9zRcQ\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxcryE9BEeLlQxtDGYE-CFK5_z9Wp6npFJ-vYKnZcyk1r39cR4YyGg80Z94gVfqpM1uktRHeWHkxTiL218xdZFJW4PRfhn0ZYWGXq0EtrRD1qQ\";s:6:\"openid\";s:28:\"o8Tgrv44lFzInIILXEl3gt3o8-Eg\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('66', '1463102828', '2016-05-13 09:27:08', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv44lFzInIILXEl3gt3o8-Eg\";s:10:\"CreateTime\";s:10:\"1463102828\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:6:\"保险\";s:7:\"Encrypt\";s:428:\"MbyA41qkNsjecXs+NXa1aGyFnd6I64eifhIcMmmkkUtzNCcO/CGNMtOPAy0xNCVF4yojKiSWK0r3ohvqJGHTM5gkswvXyIX5yLSTvtI7os1SCC6L7+ZiEFFcTCI+3x8F8C9d2lfrIBGInWMiQGHkAtwKTTWcQgvfsz3fn/5HfFx3i0SeFAyFCa7z1VKJ6mBlWu5Hx7q3Qe617rG0hk5O7pKQ1QEik6muiDOMIkyCYZX1d2+3qQ3m1qMNnR1nBj5MBvtOw0kGxDVESL1as/jTMQrjV6wDtrnlZAZ3TMuCpuUWhY/ZavLYcLcruri+Itpravss/YEoHKd5aerwyozVM8A/jr3Z/iN5T+HeXQiABtduHRizaGOXpLpyfMhR0gzU6ftmKmemuq8UZbD1FZreguXCDImyP/NXnoj2MR/Z6ko=\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv44lFzInIILXEl3gt3o8-Eg\";s:10:\"CreateTime\";s:10:\"1463102828\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:6:\"保险\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('67', '1463102844', '2016-05-13 09:27:24', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('68', '1463102845', '2016-05-13 09:27:25', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('69', '1463102927', '2016-05-13 09:28:47', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv44lFzInIILXEl3gt3o8-Eg\";s:10:\"CreateTime\";s:10:\"1463102927\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:6:\"洗车\";s:7:\"Encrypt\";s:428:\"FCajMqAl1mXKJUr0MRkKQtb0hf1b0nQt7yED8uvXlbtghHh2DNLjOUTcmVa9Gic431a5iSTqdo5C5Hvau9WKzVf3ut4Rv8YPPOe1n4Ui5bG5ywYt9o7vs1zdI7xb6NI5GM6n54+v/SCPpxgN0LwOXyBMr/tgnXKyMzk1XCVA3AHCGTRHOEVXBVp7YMvgY+eCem51gvXx4VnBIN5BP7vBmFQimWSyyq6Pw7ROJ79gJBMoGNmZESykmnG6cvmh29EcTUc06J8lhLDqoUVRbSfKxxP0z5l0lGy1SSND0PhyXo/hp2OXveCdH2t55pQCwsgjArNRm15DL1j9AMcI/fdMsHn7q2CjGe27FnlJZ12BUqt0dcGpLMBTUYdyaIfo8z7EBvbqyxT9CjupZ99GD7k4TZDUUIgJ5KFFmkbzMzQ/PHw=\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv44lFzInIILXEl3gt3o8-Eg\";s:10:\"CreateTime\";s:10:\"1463102927\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:6:\"洗车\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('70', '1463102969', '2016-05-13 09:29:29', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv44lFzInIILXEl3gt3o8-Eg\";s:10:\"CreateTime\";s:10:\"1463102969\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";s:7:\"Encrypt\";s:472:\"RQr51MVOagS3hJMQvnDVpDnWZgTJq1EJVqS6v2dXutOKBj3JYJC3Fb6DBCrjME8sKhpkeDXjCIb6+BiYDOnYHfd7WlPqwrpmifRPdm8EN1ODrHSZUokI7s28KrXOUcA4RLzEUT9eRAZ2ZXpOZl7z0PqiqRQEf503uhlAzKSefyGteKb493IM8xqE3S38ScPHLXsxSRfTZagw38RbuMsWB0E0WAp7ZrT+t0ps66bWp6u5Obo2Qi0qXc8tPtpMOvqtyNIg8MstXzoWaIuNMUdfYsCjej4t5iVkF/0XWooLuEMKPz1qvayZsQ3xPIwhtU3sKWU5GyQL8BM5H5/4sNMwaxgTs+56AsMNVhAj2N3xb0sd6fMmvBrlTy54EzflkZWXKcvDmrMEBzNemg5idM/1rtKIjIofKfs3wMPxarIgsHHkgm1qfCJwAb1pmZFUASOR0vYDxQ9JG0YlsdUq2rsIjA==\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv44lFzInIILXEl3gt3o8-Eg\";s:10:\"CreateTime\";s:10:\"1463102969\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('71', '1463102983', '2016-05-13 09:29:43', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv44lFzInIILXEl3gt3o8-Eg\";s:10:\"CreateTime\";s:10:\"1463102983\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"0kXKcuPl42pE5ay8Gwtagrfs/Z2QK7zpnFX5uiyMKnxdN754wI5weEpW7e9f+9Yi+n+RMzBh38R1zIda/OoqRxH+0uKmq9ek7Bcm1coYnzXigtulbmhoQBlQkCTKjE5gZPRl9AfV5xN335nyV6bUeexicVdXf7jUJoCQTJs14c1wx3wlNA4kpvqNZvxJS/IBwAZl5aPcbXjuY7nx9tedoTxXoFHjqQ2Ru9ZUZ+X7QaO6rN/4r/zUcEcmpEOy8XGDk3WV5o2ENbrpnSmdLIcvgnrXoaD/MdXgjQtOOJZ2LZX81emlr2b1Xr5NmKCqZb1DQNmJR+tkiQfh6WHiZY0N2aITsjX4oivqvcyiEr1DbdnCg+o6gxeVrcor4AKNgwIJikd7iWdJHHmBkqIXdK0BlWXW6mUHoM6h8DUJyR3UJDelwWGKyaqhMWUMi86WihAAHWqLwDPbuRJBnyLF1RjEh85Uzc41z/tfN51rcbKaSmjWuX1xkQsIGI6rqamRrXuJh1UZzzEKk8luYmzijRr4WYhlmuJxsui4PiRDZp/iRjk=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8Tgrv44lFzInIILXEl3gt3o8-Eg\";s:10:\"CreateTime\";s:10:\"1463102983\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('72', '1463104648', '2016-05-13 09:57:28', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('73', '1463104648', '2016-05-13 09:57:28', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('74', '1463106451', '2016-05-13 10:27:31', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('75', '1463106451', '2016-05-13 10:27:31', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('76', '1463106848', '2016-05-13 10:34:08', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463106848\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"zYVN11FHNh9h4C+6rJQ2BYh9II4AQpifyyImclT4mWL4AALPFW9sWh1L66lubuKoJDWtXTmomxevrdLc2OcZPUDKIth7QHg59sXGFX//r8V40/FZPnHPoWuJnYHCqexq6NvMOmGNi3hLKToI5LZ30xdKyxlMfJjT0YU6zkjvVXGsepWTAJLcYIiCT+jo0+viG67UKLPB/hbz5ibcsDi7CODqBd4q3EfwC/3wryZCZrJhFP53ZgXnSIkNDlKW30c3f9RnZsFBNuw6SIBqUDXlY3iS3N4bBEuRX8qzBvfY3r3VMVC+J7npfq/RW76RkU1rds98TWxNwfdg+YyCQNVIeYZq3TM31Ai9Ac2KyXvnsaWuhqr4L/zUISh7x7iz+EQzv/Hf0kNlA72rJwAmtvJqjCWo+ZYtKHVIQLBIMSltVCBrftFvnWujhl2/8tcGpPxaASOBpFnwjFYhvKr5B+IsHLbeBVKHTQabYkK70oRAoyM20Sc7XiHDw76YNBz7hHRrvYZxQPHPQgT3t7kWngBIbY5Ipnz0bTcJE7CFrfu0WR0=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:10:\"CreateTime\";s:10:\"1463106848\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('77', '1463106852', '2016-05-13 10:34:12', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxe__1PSZxoqtEvsg0SmvMD0-TG9TxuHUlnx9G3bcecBoUSTuolhSRB1akVYQHgVtPvc_vUpUuH0lVOCsCTi4aElDY6CMuElueVGEGZ5X7MNEg\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxe__1PSZxoqtEvsg0SmvMD06UpewPq0rRzVrmXZ-u9YFDiuoTz6dT_BXS4s3LBqn57zcBoM_B95knxqMbjqzcOG9XavZ5gCJC7ZAQpmp8yBUw\";s:6:\"openid\";s:28:\"o8TgrvzHZ3hyazdp8imBF-b5yDQY\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('78', '1463109121', '2016-05-13 11:12:01', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvxdaJzRcw1ZzkM7wBytnVRw\";s:10:\"CreateTime\";s:10:\"1463109121\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"2bpJky1Qq7EbCJk4PEosiig99CxZm5gICRzyVdqSvVfGQrVQcbOfhRnxHMZlhpId2HhAgugzzKt1NoOjJqFhmkGooX8vOPZDhOxeAxCDP1YA0YRvof9QWIpfrALa0XjYxtgd+ZXf9nqJGZNkUkhln22deKmotEdJPVTDdN5fUJ08X+oMtMX/JVVC3HfY3eMUYog2yF3iICeiqT/+qQwI2KixJB5LJsUz9+JASClqS+odN9Z/ZV8C4mixPVXYyVpctwM3cih3cdFfSXuxGv6jlyhmNvzebUr7PE1NecWZk3iCVBGf2ysx6bN96LH1Gwma3R9M8KQLJfsXAvEAN/60S5LlwN0AD+BYZIYrzzkzMMxALqu3ocLaeoOEv9chZjQw7oVwa/c4Uaf2r5HGFIRIGiL7J81RJwc+/4bDXAzGOMV1/m739y7qDulyheWGXcWxRObdE/U3V8RyLicwxvmqULjsv78ROJMR1RmpCCRK1Hrls+Zfrn52jJvrrD5llLxkBHAHgrqTYRAmq39WlNJkRIPlgiYFAoYuiPKC4RSHUjQ=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvxdaJzRcw1ZzkM7wBytnVRw\";s:10:\"CreateTime\";s:10:\"1463109121\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('79', '1463109124', '2016-05-13 11:12:04', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxdzgWSYJEqKDhGDeXPsu0iDHNAG_6ndBcA7hli0X9SJx6BOG7uP4UbIYBGs96Wm9X9OSkeC3O6ATPyHcYG0HweuQoIaYwxgJ9UijR_pXESwJw\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxdzgWSYJEqKDhGDeXPsu0iDhsgAxVTElhju0LAvYVs8_tvc6ceDID2HuSxJQSFgEI4qX8qh6fcyNGqmtHGVjm3rGGIIpcEbTckneN6ts6uRvw\";s:6:\"openid\";s:28:\"o8TgrvxdaJzRcw1ZzkM7wBytnVRw\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('80', '1463109218', '2016-05-13 11:13:38', '', 'a:8:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvxdaJzRcw1ZzkM7wBytnVRw\";s:10:\"CreateTime\";s:10:\"1463109218\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";s:7:\"Encrypt\";s:472:\"w8MFbrvw2me1nPwcnd5dTL2/R84lT1Fp1iscBjie3xM8LUDyY2k0aL1GRw/e9M5qPpD9pXJEjc+36XncxNPjynch8+v8/Vr70d32upBX1enHBLHbMtyO03youEoHj35U0nfZ78jcio0T+g52/+sHna9+WrQwIUYNzZVxWxfmKq/dFwxq+Hrk5ZI7fcUcbiJJy/alKR0rEHgsTlNteEIgd3hJU8sLr9AjuNHaTPlTRlTKhiJ+NrJzWM7AAA8GD5Vm8mH26mYv3Xp22qFHYD+3KKtsYyZ2zWCXMHjLnP5G8zuXimuISpW8GGlC759mkeHtAnCJUzWdIWqd74GA9juxO9ZoaiK6A+mJc53skP42BqVkh6pQ0kE6/JeMLsjPTPzCwQ9VTgehr7ZzagK2Snn4C6wHXVh3MgdakfaC+6poMcHaq/8xG8qlPExAMQvh+WN2ViKr9ihosOq+bDHJ8Z/hig==\";s:7:\"Decrypt\";a:6:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvxdaJzRcw1ZzkM7wBytnVRw\";s:10:\"CreateTime\";s:10:\"1463109218\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:5:\"CLICK\";s:8:\"EventKey\";s:15:\"我的二维码\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('81', '1463109222', '2016-05-13 11:13:42', '', 'a:9:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvxdaJzRcw1ZzkM7wBytnVRw\";s:10:\"CreateTime\";s:10:\"1463109222\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";s:7:\"Encrypt\";s:556:\"d29uNpA+CML0Xi7FmtBQfy/Dc9eKZMzXRjtre0yDYMRGfzR4f077NtOCxocRH6LIp0hNpRuU9cxcY6XOFx6B9dHlQ1MslDlR2EMRwZmLCDsiqUHfyr+iTF122MoOLHI/oRFe4SKBZL8BqYsRGBaCH1gGvUoCyp9kILOh+CDYjMOlZCqMSBgvGDJCVRbBKbYDpxxp/FwKczgFf3DAYSmCibCEH1PsJPz/OC6ZMFnOVEEdTwSLUF1B2pkdfXjlXTjtAz6vU0ofn1WAnlUTaBCLAJHUtYoFRabEv2eIZZsuLQDClxd7Z0HiuC9u2l3TRDtfzDfN2yVts87sX+juVcsLoCw+qoK0spaRfeLFQDaZ+UaAs8SnLqSmqo9GCm3YkvmvC2M/ZpPHQDKjIMJ/lq+T7oP2c2Bc6GcpuJlpBp8tslICOkls85Gssgq8SQ1JoMhOSnKJ9cR/jyUzX6MnmJs/UH6lB7I/Q1XkDK+4KvJLNR0BcVrqKwgzcE6IOw2wPE+dxElPr9dM/LPnptOhaqlL5YswSgj4dkTLeDlC42Siq0M=\";s:7:\"Decrypt\";a:7:{s:10:\"ToUserName\";s:15:\"gh_86a4c60ff2de\";s:12:\"FromUserName\";s:28:\"o8TgrvxdaJzRcw1ZzkM7wBytnVRw\";s:10:\"CreateTime\";s:10:\"1463109222\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:4:\"VIEW\";s:8:\"EventKey\";s:55:\"http://weixin.budaohuaxia.com/index.php/Shop/index.html\";s:6:\"MenuId\";s:9:\"405474050\";}}', '接收消息');
INSERT INTO `cjnet_weixin_log` VALUES ('82', '1463109564', '2016-05-13 11:19:24', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxf6fa7CDm-yiqmMRK0mJvW2cr7YQ0-E3eDaVuVX1z5rWLIbhbE1hFH6ags1Yp8LPjYy42_XcfGUN0ZwHGRU3Eo9OHETNlkcQFdQphD7RPGN8Q\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxf6fa7CDm-yiqmMRK0mJvW2R6dvUmvRJTsjS1fg1jV1TObYRqzt7ud2Xmczrb5wJhFYU2j3l7oj4_gxWiuySjkfazGz2s0QxN2K2wDEuv2K8g\";s:6:\"openid\";s:28:\"o8Tgrv8Eye6Iv1AAwlW54POqP_58\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('83', '1463109736', '2016-05-13 11:22:16', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxf6fa7CDm-yiqmMRK0mJvW2O4Ht5JOJ7ylq2FWC5F1Aen8SD_EiBg9iUn03DmTpTpKDIX3lFAa3QZqne0morwE9UwD5znV5CZ-xKSPs8it5PA\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxf6fa7CDm-yiqmMRK0mJvW2IjaL1xx4Vu1S5vl8zedODIxaxenjEjFJPT0AC-LyZlfnrOGGOKpBryASuQogNDzhjykAqrVuKtSx_0KG3ThDHQ\";s:6:\"openid\";s:28:\"o8Tgrv8Eye6Iv1AAwlW54POqP_58\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('84', '1463110057', '2016-05-13 11:27:37', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('85', '1463110065', '2016-05-13 11:27:45', 'a:17:{s:5:\"appid\";s:18:\"wx93d2941a86ed8965\";s:6:\"attach\";s:47:\"洗车套餐购买-o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:9:\"bank_type\";s:3:\"CFT\";s:8:\"cash_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:12:\"is_subscribe\";s:1:\"Y\";s:6:\"mch_id\";s:10:\"1335852801\";s:9:\"nonce_str\";s:32:\"1epq4i9rw7qtr9iz73lxs603zx49mjlj\";s:6:\"openid\";s:28:\"o8Tgrv4mSdes3jgqLOvlJAt-yUQo\";s:12:\"out_trade_no\";s:19:\"2016051308225543141\";s:11:\"result_code\";s:7:\"SUCCESS\";s:11:\"return_code\";s:7:\"SUCCESS\";s:4:\"sign\";s:32:\"D44BEA550FF32573D48E5BD9742F309B\";s:8:\"time_end\";s:14:\"20160513082311\";s:9:\"total_fee\";s:1:\"1\";s:10:\"trade_type\";s:5:\"JSAPI\";s:14:\"transaction_id\";s:28:\"4001472001201605135791666221\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('86', '1463110501', '2016-05-13 11:35:01', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxf6fa7CDm-yiqmMRK0mJvW25OxOMC4yXghkU5ImtbY8rAW0QMlFU2u1iN6E4e9rupBkj7_YkxcUJyLITYIyDKokp2QlCPOji-rCqoDG6Gl0hA\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxf6fa7CDm-yiqmMRK0mJvW2sA5rR7NsNNXnXdXKfbb9t7LbucTAavJvXzLZPnrtbpyzm6LdyrU248Di0_lfVgKnMjxhIZVM3SfPFM3Kq1_Jng\";s:6:\"openid\";s:28:\"o8Tgrv8Eye6Iv1AAwlW54POqP_58\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');
INSERT INTO `cjnet_weixin_log` VALUES ('87', '1463110619', '2016-05-13 11:36:59', 'a:5:{s:12:\"access_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxf6fa7CDm-yiqmMRK0mJvW2pCK5xUrgWRiatQzYicTWGSeCgUK9n5XJSm2ktG49i5N59adwSy_aZj1VmSJ0SjKOFPgwPVoh3xRbLwoB7FAatg\";s:10:\"expires_in\";i:7200;s:13:\"refresh_token\";s:150:\"OezXcEiiBSKSxW0eoylIeOn8u1hkxbbZERWgEIoxaxf6fa7CDm-yiqmMRK0mJvW27RuBhOKI7VtbRjCQDL92iQmdqr2IGBzIfy3R4rNDpMPfLssFpxR9Cud9p2TSjquktGgwLLKINtgv6iU07xkwxw\";s:6:\"openid\";s:28:\"o8Tgrv8Eye6Iv1AAwlW54POqP_58\";s:5:\"scope\";s:15:\"snsapi_userinfo\";}', '', '');

-- -----------------------------
-- Table structure for `cjnet_wxuser`
-- -----------------------------
DROP TABLE IF EXISTS `cjnet_wxuser`;
CREATE TABLE `cjnet_wxuser` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(128) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_agent` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_jifen` int(11) NOT NULL DEFAULT '0',
  `count_uid` varchar(64) NOT NULL DEFAULT '0,0,0' COMMENT '用户上三级ID集合',
  `user_rank` int(11) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `lasttime` int(11) NOT NULL DEFAULT '0',
  `user_phone` char(11) NOT NULL DEFAULT '',
  `user_mail` varchar(128) NOT NULL DEFAULT '',
  `user_sex` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0女  1男',
  `is_subscribe` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户是否关注',
  `headimgurl` varchar(255) NOT NULL DEFAULT '',
  `nickname` varchar(128) NOT NULL DEFAULT '',
  `subscribe_time` int(11) NOT NULL DEFAULT '0',
  `user_address` varchar(128) DEFAULT NULL,
  `pro_name` varchar(64) NOT NULL DEFAULT '',
  `city_name` varchar(64) NOT NULL DEFAULT '',
  `country` varchar(64) NOT NULL DEFAULT '中国' COMMENT '国家',
  `truename` varchar(128) NOT NULL DEFAULT '',
  `beizhu` varchar(255) NOT NULL DEFAULT '',
  `user_pass` char(32) NOT NULL DEFAULT '',
  `unionid` varchar(128) NOT NULL DEFAULT '',
  `wxchat_id` varchar(64) NOT NULL DEFAULT '' COMMENT '微信公众平台',
  `is_jiameng` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是加盟店',
  `cartnumber` varchar(128) NOT NULL DEFAULT '' COMMENT '车牌号',
  `agent_rank` tinyint(1) NOT NULL DEFAULT '0',
  `bonus_rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `cjnet_wxuser`
-- -----------------------------
INSERT INTO `cjnet_wxuser` VALUES ('2', 'oB99awF-fMNJ3IVptXSZ8uXI-NS0', '0', '1460635048', '0.00', '0', '1', '0', '0,0,0', '1', '0', '', '', '1', '1', 'http://wx.qlogo.cn/mmopen/ccic0QODdib8OAdjwP6qn3d49jkIhzRRgn8TwvcpGicRGIiaFfp2eSR5O66o5UZQ8gd5mQibnH52Y6iczzngOle5F2O3ESOK90610a/0', '回忆', '1461633331', '', '广东', '揭阳', '中国', '张明', '', '', '', '0', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('4', 'oB99awC8ghscPxpb7MpLuU7LqqKg', '0', '1460970008', '0.00', '0', '-1', '0', '0,0,0', '1', '0', '', '', '1', '1', 'http://wx.qlogo.cn/mmopen/ccic0QODdib8MkoSBTuHPaJkPoDv1SQJechm6OtJrChpH8lc1ToSZwf3sI5P2VehLueOLdbVnmpBibpFlDpz5OTFibq13Aae9fBz/0', '^ω^^ω^', '1461225080', '', '山东', '青岛', '中国', '', '', '', '', '0', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('5', 'oB99awONiE2IP18lEPS_4RblYVDo', '0', '1461489383', '0.00', '0', '1', '0', '0,0,0', '0', '0', '', '', '1', '1', 'http://wx.qlogo.cn/mmopen/8oYFQiamHGhDicEvW0b7gCywtMcsYmgGc3w8aWA6MoJAXs6ELr7iaibBhKMPKnl0DDjruIGf4m9icxRn23Sb97WyqnjOibthIc15DB/0', '龙溟', '1461489381', '', '山东', '青岛', '中国', '', '', '', '', '0', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('6', 'oB99awBJIKSu8RlZBax1_qE4Ou8E', '0', '1461490587', '0.00', '0', '1', '0', '0,0,0', '0', '0', '', '', '2', '1', 'http://wx.qlogo.cn/mmopen/9tpQXRPlCicQbr4kJVzDxs6sm2OHvtu3xYxf4vibNnQ2V0fAW9yzUfOrc62mZr160w7h4eChia7aLV5kYEU71rTKYCXQnOvbyaL/0', '此号停用(～o～)zZ', '1461490585', '', '山东', '青岛', '中国', '', '', '', '', '0', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('7', 'o8Tgrv8Eye6Iv1AAwlW54POqP_58', '0', '1461729077', '10.01', '1', '1', '0', '0,0,0', '0', '0', '15764227617', '', '1', '0', 'http://wx.qlogo.cn/mmopen/2DV0O1l3KBDgEXGEOkA6bqs4A7JqPjmxiaA6wuNPYdXLmLtibzfknHnDBla59VBJFQ8VV8KUqOphEJ05UdPaON1NVZB5JZJuBI/0', '回忆', '1461729077', '', '广东', '揭阳', '中国', '张明', '', '', '', '0', '0', '鲁ATP679', '0', '1');
INSERT INTO `cjnet_wxuser` VALUES ('8', 'o8Tgrv-6S14tlmyJqk-EB0AGbKQg', '0', '1461735473', '0.00', '0', '1', '0', '0,0,0', '0', '0', '', '', '2', '1', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELTdW6QK9au3k16BSDVZ8PichQwTwI0hZv2uasKh2lLTibr4BsHc0icUyWo8dqM0gB0D1v8aruKLHh5g/0', '在小一♚', '1461735472', '', '天津', '', '中国', '', '', '', '', '', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('9', 'o8TgrvxdaJzRcw1ZzkM7wBytnVRw', '0', '1461745111', '0.00', '1', '1', '0', '0,0,0', '0', '0', '', '', '1', '1', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDppCaiaIvWHia368DXKfCg1IvQZctPLgRgy4ibtpJNfibrWgpWWLkWHa3wbr9kfLPNUD1CYKzHN0Ayvg/0', '重楼#崔宏伟#互联网和技术', '1461745109', '', '山东', '青岛', '中国', '', '', '', '', '', '0', '', '0', '1');
INSERT INTO `cjnet_wxuser` VALUES ('10', 'o8Tgrv5ARQTYB9e1zoFcxl7J_ISw', '0', '1461754751', '0.00', '1', '1', '0', '0,0,0', '0', '0', '', '', '1', '1', 'http://wx.qlogo.cn/mmopen/ff2C6CcibVWjJq96uJlia9kBwzcxkVM9u2UguTc15FcB4BE6xU20DKdxia9mzkpGOeCiaG2JI5l7QMIb3OicVWibBic5iaVrXmCJzwtf/0', '龙溟', '1462849651', '', '山东', '青岛', '中国', '', '', '', '', '', '0', '', '0', '1');
INSERT INTO `cjnet_wxuser` VALUES ('11', 'o8Tgrv9dbBLon41RhSwIYDipKZQE', '0', '1461821700', '0.00', '0', '1', '0', '0,0,0', '0', '0', '', '', '1', '1', 'http://wx.qlogo.cn/mmopen/2DV0O1l3KBDU65zBs5L3nUvkXSr7O4HfodcRX0mUzgwiaC6dA7vnUhvOTn5xeCQqTt6p4ibAEkM5ReXyAs0uOEnc0cftgNfibNV/0', '安生', '1461821698', '', '山东', '日照', '中国', '', '', '', '', '', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('12', 'o8Tgrv5vMSL9hVoM2-fgxpxblrJk', '0', '1461914208', '0.00', '0', '1', '0', '0,0,0', '0', '0', '', '', '1', '1', 'http://wx.qlogo.cn/mmopen/2DV0O1l3KBDU65zBs5L3nQUb4RPia2NdM4xFhvRbTcU7bticKlJx1eejibwtWdLSwvZS3KS9ibcC8iaLQp4uFsq4fXsrsO4H7M3PU/0', '周扬凯--隆和城●大溪谷', '1461914202', '', '山东', '青岛', '中国', '', '', '', '', '', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('13', 'o8Tgrv32srdE6JnqG2iC0RRMAWkY', '0', '1462185183', '0.00', '0', '1', '0', '0,0,0', '0', '0', '', '', '2', '1', 'http://wx.qlogo.cn/mmopen/XCopLcwfzedM2Hk4KicCflxJAic5XiajMjL1ygn3d5aDrDeFyT8mxzHIEMZicbF9KCKo9gMribWkF6nIZTvptVRyKlfA55LpGbNtF/0', '周李慧 18553289992', '1462185181', '', '山东', '青岛', '中国', '', '', '', '', '', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('14', 'o8Tgrv6VHJxyBv0PVDjjNVW2c7tE', '0', '1462248316', '0.00', '0', '1', '0', '0,0,0', '0', '0', '', '', '1', '1', 'http://wx.qlogo.cn/mmopen/iampvAVSsbCkteeYKI3o8K28M8UiawdMsIw1vq8YHBG0FCqXc9b1veia9dP2qGmibdlbzicLTNUnqDHOHDnYiamdUesrhh9reS0Rjd/0', '007', '1462248315', '', '', '', '马绍尔群岛', '', '', '', '', '', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('15', 'o8Tgrvygd-jmVY9UuVixJADtYbbk', '0', '1462324121', '0.00', '0', '1', '0', '0,0,0', '0', '0', '', '', '1', '1', 'http://wx.qlogo.cn/mmopen/2MLY3ic8MJArdFx8oTFVZIISS6rHkYsMK6zlBQF9xdR11Aia3JeXQjmjtRPpUhdibyysGScBRfkpFj2Nk95InYzP4PYNvy65X5ib/0', '二东', '1462324117', '', '江苏', '徐州', '中国', '', '', '', '', '', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('16', 'o8Tgrv_juBi073cCO8w1YQytCz_8', '0', '1462364280', '0.00', '0', '1', '0', '0,0,0', '0', '0', '', '', '1', '1', 'http://wx.qlogo.cn/mmopen/2DV0O1l3KBDU65zBs5L3nQI06rFr9Gfgo73wSTvkkY8AYht1vX8icScbus5p2HXDNRwDrFvDqh9eOcEtiaDkexV0oXvk7kc6HE/0', '^ω^^ω^', '1462873981', '', '山东', '青岛', '中国', '', '', '', '', '', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('17', 'o8TgrvyqNQu9uC4w9oGCUkCccCw0', '0', '1462594827', '0.00', '0', '1', '0', '0,0,0', '0', '0', '', '', '1', '1', 'http://wx.qlogo.cn/mmopen/2MLY3ic8MJApYERYMPjWBhm1ecgkcp6BBDlmUAVS6ziagVXNQtWicy6jMys8cEiaNznJZBBLl5czZ9yseKISInU7Fo8WyVdYUazv/0', '征  服', '1462594825', '', '山东', '青岛', '中国', '', '', '', '', '', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('18', 'o8Tgrv1YchhPKAgXFT34qXPwqdlc', '0', '1462766493', '0.00', '0', '1', '0', '0,0,0', '0', '0', '', '', '1', '1', 'http://wx.qlogo.cn/mmopen/2DV0O1l3KBCftbamePeh9DosUI9nXh0M8bujZcIRPz0gpHK3dx6g0eibBTSn3fLRJFoDfATbajhicL5rRYKjwjicQuwsNkqyUoC/0', '杨阔', '1462766493', '', '河北', '石家庄', '中国', '', '', '', '', '', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('19', 'o8Tgrvw_AfiG0NzQeWoBJNVg9hJw', '0', '1462863561', '0.00', '0', '1', '0', '0,0,0', '0', '0', '', '', '2', '1', 'http://wx.qlogo.cn/mmopen/ff2C6CcibVWjJq96uJlia9kN7Oj9AxccNk5erpibXMV2uRyFxmXo7sRZ2Iic3jk6sqNibAG7OmaDVtyiaNoiafWC901h6EiaYSAwwaHk/0', 'Dying in the sun', '1462863613', '', '山东', '青岛', '中国', '', '', '', '', '', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('20', 'o8Tgrv2RftLSg4KwxVzXy2V_00DA', '0', '1462863771', '0.00', '1', '1', '0', '0,0,0', '0', '0', '', '', '1', '0', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBAT7XOkb2PECnuYwAkufQ6AeUCDJkKmiaibzuYibbdSsHvLvibwstOER7TM3aSQgC6uDibj2hmJLOCMgQ/0', '中国汽车后市场联合会：姜广海', '1462863771', '', '山东', '青岛', '中国', '', '', '', '', '', '0', '', '0', '1');
INSERT INTO `cjnet_wxuser` VALUES ('21', 'o8TgrvzHZ3hyazdp8imBF-b5yDQY', '0', '1462863775', '0.00', '1', '1', '0', '0,0,0', '0', '0', '18661952117', '', '1', '0', 'http://wx.qlogo.cn/mmopen/2DV0O1l3KBDU65zBs5L3nReOQeV4y2kAvQkhV9icdJSXI4ChzpIvnHIfsAkjDOWGrvicIdYbrymSRtoDic34NsAZ2p4etQJopgE/0', '无限轮速唐13963998324', '1462863775', '', '山东', '青岛', '中国', '一分', '', '', '', '', '0', '鲁B12345', '0', '1');
INSERT INTO `cjnet_wxuser` VALUES ('22', 'o8Tgrv_0SeWeXnOoRX2oPKcJ_CQo', '20', '1462864163', '0.00', '1', '1', '0', '0,0,0', '0', '0', '', '', '1', '1', 'http://wx.qlogo.cn/mmopen/2MLY3ic8MJArdFx8oTFVZIAar8IRW3WdTcZ0BHrhiaIIEKtGxqtymaSuUibWEn2Lr9jbbeLsdSd3lZBzRia2ylBV1wrNIavxaVca/0', '山东交院青岛培训基地', '1462864163', '', '山东', '青岛', '中国', '', '', '', '', '', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('23', 'o8Tgrv5RIT8FS3NzCskYvo4UCkCc', '0', '1462953460', '0.00', '0', '1', '0', '0,0,0', '0', '0', '', '', '1', '0', 'http://wx.qlogo.cn/mmopen/2DV0O1l3KBBp8xa1vQqtDM3ZyQfcwOOOTWtO2Qb6eW0opEbEWTpxEcnY0E6YqrkFuomqGgib9yxBlmnqL02jVTSdu5oV78tpH/0', '无限轮速 邵隽 13026501777', '1462953460', '', '山东', '青岛', '中国', '', '', '', '', '', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('24', 'o8Tgrv44lFzInIILXEl3gt3o8-Eg', '0', '1462956638', '0.00', '0', '1', '0', '0,0,0', '0', '0', '', '', '1', '0', 'http://wx.qlogo.cn/mmopen/XCopLcwfzefpVbTawR74N6QY7eclwV3oqeY8oylSicIEiaT3Pg3NCyfCQssemnwQiatbAv0Fcx2QXULafSmb8bvGD5Be1ogh07I/0', '狼王-汪琳翔(蓝海商会)13678842421', '1462956637', '', '山东', '青岛', '中国', '', '', '', '', '', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('25', 'o8Tgrv7EMelDJ94eh2X9WV7AJ8_I', '0', '1462969596', '0.00', '0', '1', '0', '0,0,0', '0', '0', '', '', '1', '1', 'http://wx.qlogo.cn/mmopen/2MLY3ic8MJArdFx8oTFVZIDz2Q5HAs25QRgDqNeoicia7hjlvU3Jru4jMZ1yialfkVrkff4tBTPeJvtLDPny88P4ymXJonbc5Fwa/0', '天空海阔', '1462969596', '', '山东', '淄博', '中国', '', '', '', '', '', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('26', 'o8Tgrv3_ZIu5H8dniiUSXD-_y4ow', '21', '1463032142', '0.00', '0', '1', '0', '0,0,0', '0', '0', '', '', '2', '1', 'http://wx.qlogo.cn/mmopen/2DV0O1l3KBDU65zBs5L3nTibibRf8zLzR0EkKrugCgkpGj4DHt1WuQmFfn6pOKly43x650ozAblzxgk0RfZpovGlNfvboBkwDl/0', '抛物线', '1463032142', '', '里奥加耶戈斯', '', '阿根廷', '', '', '', '', '', '0', '', '0', '0');
INSERT INTO `cjnet_wxuser` VALUES ('27', 'o8Tgrv4mSdes3jgqLOvlJAt-yUQo', '7', '1463098832', '0.00', '1', '1', '0', '0,0,0', '0', '0', '15764255668', '', '1', '0', 'http://wx.qlogo.cn/mmopen/2MLY3ic8MJArdFx8oTFVZINgXaKicthDPCgw8gfPIgvkyzVKyFG8YL5S9kyCESdt61hnCO3vaDhbeTRibHvjeFusRcgwJaUVS1l/0', '刘振华', '1463098832', '', '山东', '青岛', '中国', '刘振华', '', '', '', '', '0', '鲁A12138', '0', '1');
