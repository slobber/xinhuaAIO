/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : school

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2013-11-18 18:44:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for school_building
-- ----------------------------
DROP TABLE IF EXISTS `school_building`;
CREATE TABLE `school_building` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campusId` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_building_campus1_idx` (`campusId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school_building
-- ----------------------------

-- ----------------------------
-- Table structure for school_location
-- ----------------------------
DROP TABLE IF EXISTS `school_location`;
CREATE TABLE `school_location` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `buildingId` int(11) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `floor` smallint(6) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `interiorPhoneNo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`lid`),
  KEY `fk_location_building1_idx` (`buildingId`),
  KEY `fk_location_department1_idx` (`departmentId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school_location
-- ----------------------------

-- ----------------------------
-- Table structure for sys_app
-- ----------------------------
DROP TABLE IF EXISTS `sys_app`;
CREATE TABLE `sys_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `search_url` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `description` text,
  `categoryId` int(11) DEFAULT NULL,
  `type` enum('insite','3thparty') NOT NULL,
  `callback_url` varchar(255) NOT NULL,
  `secret_key` char(16) NOT NULL,
  `status` enum('open','close','remove') DEFAULT NULL,
  `seq` smallint(6) NOT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of sys_app
-- ----------------------------
INSERT INTO `sys_app` VALUES ('2', 'home', '主页', 'home', 'Home/Search/do', 'slobber', '用户登录后的主页应用，包括了平台的基础功能等模块。', '1', 'insite', '', '', 'open', '1');
INSERT INTO `sys_app` VALUES ('3', 'calendar', '日历', 'calendar', 'Calendar/Search/do', 'slobber', null, '1', 'insite', '', '', 'open', '2');
INSERT INTO `sys_app` VALUES ('4', 'activity', '活动', 'bell', 'Activity/Search/do', 'slobber', null, '1', 'insite', '', '', 'open', '3');
INSERT INTO `sys_app` VALUES ('5', 'group', '群组', 'group', 'Group/Search/do', 'slobber', null, '1', 'insite', '', '', 'open', '4');
INSERT INTO `sys_app` VALUES ('6', 'course', '课程', 'book', 'Course/Search/do', 'slobber', null, '2', 'insite', '', '', 'open', '5');
INSERT INTO `sys_app` VALUES ('7', 'honor', '奖惩', 'trophy', 'Honor/Search/do', 'slobber', null, '3', 'insite', '', '', 'open', '6');
INSERT INTO `sys_app` VALUES ('8', 'admin', '后台管理', 'user-md', null, 'slobber', null, '6', 'insite', '', '', 'open', '99');
INSERT INTO `sys_app` VALUES ('9', 'student', '学籍', 'hospital-o', 'Student/Search/do', 'slobber', null, '2', 'insite', '', '', 'open', '7');
INSERT INTO `sys_app` VALUES ('10', 'personnel', '人事', 'personnel', 'Personnel/Search/do', 'slobber', null, '5', 'insite', '', '', 'open', '0');
INSERT INTO `sys_app` VALUES ('11', 'gather', '文档收集', 'inbox', 'Gather/Search/do', 'slobber', null, '1', 'insite', '', '', 'open', '0');
INSERT INTO `sys_app` VALUES ('12', 'report', '报表', 'bar-chart-o', 'Report/Search/do', 'slobber', null, '1', 'insite', '', '', 'open', '0');
INSERT INTO `sys_app` VALUES ('13', 'appraisal', '评比', null, null, null, null, null, 'insite', '', '', null, '0');
INSERT INTO `sys_app` VALUES ('1', 'base', '基础', null, null, 'slobber', null, '0', 'insite', '', '', 'open', '0');
INSERT INTO `sys_app` VALUES ('14', 'exam', '考试', 'file-text-o', 'Exam/Search/do', 'slobber', null, '2', 'insite', '', '', 'open', '0');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'S<span class=\"inverse\">chool</span>AIO', '0');
INSERT INTO `sys_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', '新华中学校园网管理系统', '1');
INSERT INTO `sys_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', '天津新华中学,数字化校园,办公OA', '3');
INSERT INTO `sys_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '0');
INSERT INTO `sys_config` VALUES ('5', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '0');
INSERT INTO `sys_config` VALUES ('6', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '4');
INSERT INTO `sys_config` VALUES ('7', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '0');
INSERT INTO `sys_config` VALUES ('8', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '0');
INSERT INTO `sys_config` VALUES ('17', 'APP_CATEGORY', '2', '应用分类', '20', '', '', '0', '0', '0', '', '0');
INSERT INTO `sys_config` VALUES ('18', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '0');
INSERT INTO `sys_config` VALUES ('10', 'AOTUSAVE_DRAFT', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1379484574', '1', '60', '0');
INSERT INTO `sys_config` VALUES ('11', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '5');
INSERT INTO `sys_config` VALUES ('12', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '0');
INSERT INTO `sys_config` VALUES ('13', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '0');
INSERT INTO `sys_config` VALUES ('14', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '0');
INSERT INTO `sys_config` VALUES ('15', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '0');
INSERT INTO `sys_config` VALUES ('16', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '0');
