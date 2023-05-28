/*
Navicat MySQL Data Transfer

Source Server         : xhu
Source Server Version : 50151
Source Host           : localhost:3306
Source Database       : exam

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2018-09-17 13:32:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `clazz`
-- ----------------------------
DROP TABLE IF EXISTS `clazz`;
CREATE TABLE `clazz` (
  `clazz_id` int(11) NOT NULL,
  `clazz_name` varchar(50) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`clazz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clazz
-- ----------------------------
INSERT INTO `clazz` VALUES ('1', '一班', '1');
INSERT INTO `clazz` VALUES ('2', '二班', '1');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '软件工程');
INSERT INTO `department` VALUES ('2', '能源工程');
INSERT INTO `department` VALUES ('3', '机械工程');

-- ----------------------------
-- Table structure for `difficulty`
-- ----------------------------
DROP TABLE IF EXISTS `difficulty`;
CREATE TABLE `difficulty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diffcultly_level` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of difficulty
-- ----------------------------
INSERT INTO `difficulty` VALUES ('1', '简单');
INSERT INTO `difficulty` VALUES ('2', '一般');
INSERT INTO `difficulty` VALUES ('3', '难');
INSERT INTO `difficulty` VALUES ('4', '很难');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_content` varchar(100) NOT NULL,
  `publish_time` date NOT NULL,
  `news_title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '最新成绩公示', '2018-08-15', '成绩公示');
INSERT INTO `news` VALUES ('2', '成绩一', '2018-08-01', '成绩公告一');
INSERT INTO `news` VALUES ('3', '成绩二', '2018-08-14', '成绩公告二');
INSERT INTO `news` VALUES ('4', '成绩三', '2018-08-18', '成绩公告三');
INSERT INTO `news` VALUES ('5', '成绩四', '2018-08-15', '成绩公告四');
INSERT INTO `news` VALUES ('6', '成绩五', '2018-08-20', '成绩公告五');
INSERT INTO `news` VALUES ('7', '成绩六', '2018-08-27', '成绩公告六');
INSERT INTO `news` VALUES ('8', '成绩七', '2018-08-11', '成绩公告七');
INSERT INTO `news` VALUES ('9', '123', '2018-09-05', '123');

-- ----------------------------
-- Table structure for `paper`
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `paper_id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_name` varchar(20) NOT NULL,
  `allscore` int(11) NOT NULL,
  `paper_time` int(11) NOT NULL,
  `create_time` date NOT NULL,
  PRIMARY KEY (`paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('77', 'test1', '100', '100', '2018-09-04');
INSERT INTO `paper` VALUES ('78', '物联网', '100', '123', '2018-09-05');
INSERT INTO `paper` VALUES ('85', 'koko', '100', '100', '2018-09-10');
INSERT INTO `paper` VALUES ('86', 'al', '10', '100', '2018-09-11');
INSERT INTO `paper` VALUES ('87', 'java基础', '90', '90', '2018-09-12');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(50) NOT NULL COMMENT '权限名称',
  `p_method` varchar(20) DEFAULT NULL COMMENT '方法',
  `level_p` int(11) DEFAULT NULL COMMENT '父节点',
  `level` int(11) DEFAULT NULL COMMENT '权限级别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '权限菜单', null, null, '0');
INSERT INTO `permission` VALUES ('2', '管理员维护', 'adminList', '0', '1');
INSERT INTO `permission` VALUES ('3', '查看所有的考生', 'searchstu', '1', '2');
INSERT INTO `permission` VALUES ('4', '用户管理', 'usermanage', '1', '3');
INSERT INTO `permission` VALUES ('5', '分配权限', 'distributeperm', '1', '4');
INSERT INTO `permission` VALUES ('6', '试题管理', 'questionList', '0', '5');
INSERT INTO `permission` VALUES ('7', '新增', 'questionInsert', '5', '6');
INSERT INTO `permission` VALUES ('8', '修改', 'questionUpdate', '5', '7');
INSERT INTO `permission` VALUES ('9', '删除', 'questionDel', '5', '8');
INSERT INTO `permission` VALUES ('10', '学生管理', 'stumanage', '0', '9');
INSERT INTO `permission` VALUES ('11', '查询学生', 'selectstudent', '9', '10');
INSERT INTO `permission` VALUES ('12', '考生管理', 'manage', '0', '11');
INSERT INTO `permission` VALUES ('13', '成绩查询', 'search', '11', '12');
INSERT INTO `permission` VALUES ('14', '添加公告', 'add', '1', '13');
INSERT INTO `permission` VALUES ('15', '添加权限', 'add1', '1', '14');
INSERT INTO `permission` VALUES ('18', '试卷管理', 'paperPage.do', '5', '15');
INSERT INTO `permission` VALUES ('21', '成绩管理', '', '11', '16');
INSERT INTO `permission` VALUES ('22', '考试管理', '', '11', '17');
INSERT INTO `permission` VALUES ('23', '考试查询', '', '11', '18');
INSERT INTO `permission` VALUES ('24', '题库管理', '', '5', '19');
INSERT INTO `permission` VALUES ('25', '试卷阅卷', '', '5', '20');

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT,
  `q_content` varchar(100) NOT NULL,
  `q_type` int(11) NOT NULL,
  `a_option` varchar(50) DEFAULT NULL,
  `b_option` varchar(50) DEFAULT NULL,
  `c_option` varchar(50) DEFAULT NULL,
  `d_option` varchar(50) DEFAULT NULL,
  `answer` varchar(50) NOT NULL,
  `score` int(10) NOT NULL,
  `difficulty_id` int(11) NOT NULL,
  `question_create_time` date NOT NULL,
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '在JAVA中经常使用System.out对象的print()与println()方法实现控制台输出，则下面选项中描述正确的是', '1', ' print()可以实现控制台输出并实现换行', 'println()在实现控制台输出前先进行换行', ') print()实现控制台输出，但是不换行', 'println()在控制台输出时，前后都进行换行', 'B', '7', '1', '2018-08-27');
INSERT INTO `question` VALUES ('4', '就AVAV', '4', '', '', '', '', '无', '10', '1', '2018-09-11');
INSERT INTO `question` VALUES ('5', 'java有是解释型语言', '3', '', '', '', '', '✔', '5', '1', '2018-09-11');
INSERT INTO `question` VALUES ('6', 'java可以多继承', '3', '', '', '', '', '✖', '5', '1', '2018-09-11');
INSERT INTO `question` VALUES ('7', 'srping执行流程', '4', '', '', '', '', '主观题', '5', '3', '2018-09-11');
INSERT INTO `question` VALUES ('8', '什么是java的自动拆箱和自动装箱', '1', '', '', '', '', '主观题', '10', '1', '2018-09-11');
INSERT INTO `question` VALUES ('9', 'hashmap和hashtable的区别', '4', '', '', '', '', '主观题', '10', '2', '2018-09-11');
INSERT INTO `question` VALUES ('15', 'jajja', '4', '', '', '', '', '主观题', '10', '1', '2018-09-12');

-- ----------------------------
-- Table structure for `question_paper`
-- ----------------------------
DROP TABLE IF EXISTS `question_paper`;
CREATE TABLE `question_paper` (
  `qp_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `paper_id` int(11) NOT NULL,
  PRIMARY KEY (`qp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_paper
-- ----------------------------
INSERT INTO `question_paper` VALUES ('25', '6', '9');
INSERT INTO `question_paper` VALUES ('26', '5', '9');
INSERT INTO `question_paper` VALUES ('27', '1', '10');
INSERT INTO `question_paper` VALUES ('28', '2', '10');
INSERT INTO `question_paper` VALUES ('29', '3', '10');
INSERT INTO `question_paper` VALUES ('30', '4', '10');
INSERT INTO `question_paper` VALUES ('31', '7', '10');
INSERT INTO `question_paper` VALUES ('32', '5', '10');
INSERT INTO `question_paper` VALUES ('33', '6', '10');
INSERT INTO `question_paper` VALUES ('34', '1', '11');
INSERT INTO `question_paper` VALUES ('35', '2', '11');
INSERT INTO `question_paper` VALUES ('36', '3', '11');
INSERT INTO `question_paper` VALUES ('37', '4', '11');
INSERT INTO `question_paper` VALUES ('38', '5', '11');
INSERT INTO `question_paper` VALUES ('39', '1', '12');
INSERT INTO `question_paper` VALUES ('40', '2', '12');
INSERT INTO `question_paper` VALUES ('41', '3', '12');
INSERT INTO `question_paper` VALUES ('42', '6', '12');
INSERT INTO `question_paper` VALUES ('43', '1', '13');
INSERT INTO `question_paper` VALUES ('44', '3', '14');
INSERT INTO `question_paper` VALUES ('45', '2', '14');
INSERT INTO `question_paper` VALUES ('46', '6', '15');
INSERT INTO `question_paper` VALUES ('47', '4', '15');
INSERT INTO `question_paper` VALUES ('48', '3', '16');
INSERT INTO `question_paper` VALUES ('49', '2', '16');
INSERT INTO `question_paper` VALUES ('50', '3', '20');
INSERT INTO `question_paper` VALUES ('51', '2', '20');
INSERT INTO `question_paper` VALUES ('52', '1', '21');
INSERT INTO `question_paper` VALUES ('53', '2', '21');
INSERT INTO `question_paper` VALUES ('54', '1', '22');
INSERT INTO `question_paper` VALUES ('55', '2', '22');
INSERT INTO `question_paper` VALUES ('56', '3', '22');
INSERT INTO `question_paper` VALUES ('57', '4', '22');
INSERT INTO `question_paper` VALUES ('58', '2', '23');
INSERT INTO `question_paper` VALUES ('59', '2', '24');
INSERT INTO `question_paper` VALUES ('60', '1', '25');
INSERT INTO `question_paper` VALUES ('61', '2', '25');
INSERT INTO `question_paper` VALUES ('62', '1', '26');
INSERT INTO `question_paper` VALUES ('63', '2', '26');
INSERT INTO `question_paper` VALUES ('64', '3', '27');
INSERT INTO `question_paper` VALUES ('65', '3', '28');
INSERT INTO `question_paper` VALUES ('66', '6', '29');
INSERT INTO `question_paper` VALUES ('67', '4', '29');
INSERT INTO `question_paper` VALUES ('68', '6', '30');
INSERT INTO `question_paper` VALUES ('69', '4', '30');
INSERT INTO `question_paper` VALUES ('70', '1', '31');
INSERT INTO `question_paper` VALUES ('71', '2', '31');
INSERT INTO `question_paper` VALUES ('72', '3', '31');
INSERT INTO `question_paper` VALUES ('73', '4', '31');
INSERT INTO `question_paper` VALUES ('74', '6', '31');
INSERT INTO `question_paper` VALUES ('75', '1', '32');
INSERT INTO `question_paper` VALUES ('76', '2', '32');
INSERT INTO `question_paper` VALUES ('77', '3', '32');
INSERT INTO `question_paper` VALUES ('78', '4', '32');
INSERT INTO `question_paper` VALUES ('79', '6', '32');
INSERT INTO `question_paper` VALUES ('80', '1', '33');
INSERT INTO `question_paper` VALUES ('81', '2', '33');
INSERT INTO `question_paper` VALUES ('82', '3', '33');
INSERT INTO `question_paper` VALUES ('83', '4', '33');
INSERT INTO `question_paper` VALUES ('84', '6', '33');
INSERT INTO `question_paper` VALUES ('85', '2', '34');
INSERT INTO `question_paper` VALUES ('86', '3', '34');
INSERT INTO `question_paper` VALUES ('87', '3', '35');
INSERT INTO `question_paper` VALUES ('88', '4', '35');
INSERT INTO `question_paper` VALUES ('89', '6', '36');
INSERT INTO `question_paper` VALUES ('90', '4', '36');
INSERT INTO `question_paper` VALUES ('91', '2', '37');
INSERT INTO `question_paper` VALUES ('92', '3', '37');
INSERT INTO `question_paper` VALUES ('93', '2', '38');
INSERT INTO `question_paper` VALUES ('94', '3', '38');
INSERT INTO `question_paper` VALUES ('95', '2', '39');
INSERT INTO `question_paper` VALUES ('96', '3', '39');
INSERT INTO `question_paper` VALUES ('97', '3', '40');
INSERT INTO `question_paper` VALUES ('98', '4', '40');
INSERT INTO `question_paper` VALUES ('99', '3', '41');
INSERT INTO `question_paper` VALUES ('100', '4', '41');
INSERT INTO `question_paper` VALUES ('101', '3', '42');
INSERT INTO `question_paper` VALUES ('102', '4', '42');
INSERT INTO `question_paper` VALUES ('103', '1', '43');
INSERT INTO `question_paper` VALUES ('104', '2', '43');
INSERT INTO `question_paper` VALUES ('105', '1', '44');
INSERT INTO `question_paper` VALUES ('106', '2', '44');
INSERT INTO `question_paper` VALUES ('107', '2', '45');
INSERT INTO `question_paper` VALUES ('108', '1', '45');
INSERT INTO `question_paper` VALUES ('109', '1', '49');
INSERT INTO `question_paper` VALUES ('110', '2', '49');
INSERT INTO `question_paper` VALUES ('111', '1', '50');
INSERT INTO `question_paper` VALUES ('112', '2', '50');
INSERT INTO `question_paper` VALUES ('113', '1', '51');
INSERT INTO `question_paper` VALUES ('114', '2', '51');
INSERT INTO `question_paper` VALUES ('115', '1', '52');
INSERT INTO `question_paper` VALUES ('116', '2', '52');
INSERT INTO `question_paper` VALUES ('117', '1', '53');
INSERT INTO `question_paper` VALUES ('118', '2', '53');
INSERT INTO `question_paper` VALUES ('119', '1', '55');
INSERT INTO `question_paper` VALUES ('120', '2', '55');
INSERT INTO `question_paper` VALUES ('179', '1', '77');
INSERT INTO `question_paper` VALUES ('180', '2', '77');
INSERT INTO `question_paper` VALUES ('181', '3', '77');
INSERT INTO `question_paper` VALUES ('182', '4', '77');
INSERT INTO `question_paper` VALUES ('183', '5', '77');
INSERT INTO `question_paper` VALUES ('184', '1', '78');
INSERT INTO `question_paper` VALUES ('185', '4', '78');
INSERT INTO `question_paper` VALUES ('186', '5', '78');
INSERT INTO `question_paper` VALUES ('187', '10', '78');
INSERT INTO `question_paper` VALUES ('188', '11', '78');
INSERT INTO `question_paper` VALUES ('189', '12', '78');
INSERT INTO `question_paper` VALUES ('190', '7', '78');
INSERT INTO `question_paper` VALUES ('191', '6', '78');
INSERT INTO `question_paper` VALUES ('192', '2', '78');
INSERT INTO `question_paper` VALUES ('201', '4', '81');
INSERT INTO `question_paper` VALUES ('202', '5', '81');
INSERT INTO `question_paper` VALUES ('203', '10', '81');
INSERT INTO `question_paper` VALUES ('213', '1', '85');
INSERT INTO `question_paper` VALUES ('214', '2', '85');
INSERT INTO `question_paper` VALUES ('215', '3', '85');
INSERT INTO `question_paper` VALUES ('216', '1', '86');
INSERT INTO `question_paper` VALUES ('217', '2', '86');
INSERT INTO `question_paper` VALUES ('218', '3', '86');
INSERT INTO `question_paper` VALUES ('219', '4', '86');
INSERT INTO `question_paper` VALUES ('220', '2', '87');
INSERT INTO `question_paper` VALUES ('221', '7', '87');
INSERT INTO `question_paper` VALUES ('222', '8', '87');
INSERT INTO `question_paper` VALUES ('223', '5', '87');

-- ----------------------------
-- Table structure for `question_type`
-- ----------------------------
DROP TABLE IF EXISTS `question_type`;
CREATE TABLE `question_type` (
  `question_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_type_name` varchar(20) NOT NULL,
  PRIMARY KEY (`question_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_type
-- ----------------------------
INSERT INTO `question_type` VALUES ('1', '单选题');
INSERT INTO `question_type` VALUES ('2', '多选题');
INSERT INTO `question_type` VALUES ('3', '判断题');
INSERT INTO `question_type` VALUES ('4', '简答题');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `remake` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '管理员');
INSERT INTO `role` VALUES ('2', 'student', '学生');
INSERT INTO `role` VALUES ('3', 'teacher', '教师');

-- ----------------------------
-- Table structure for `role_p`
-- ----------------------------
DROP TABLE IF EXISTS `role_p`;
CREATE TABLE `role_p` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `r_id` int(11) NOT NULL COMMENT '角色id',
  `l_id` int(11) NOT NULL COMMENT 'lid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_p
-- ----------------------------
INSERT INTO `role_p` VALUES ('1', '1', '1');
INSERT INTO `role_p` VALUES ('2', '1', '2');
INSERT INTO `role_p` VALUES ('3', '1', '3');
INSERT INTO `role_p` VALUES ('4', '1', '4');
INSERT INTO `role_p` VALUES ('5', '1', '5');
INSERT INTO `role_p` VALUES ('13', '2', '1');
INSERT INTO `role_p` VALUES ('14', '2', '12');
INSERT INTO `role_p` VALUES ('15', '2', '13');
INSERT INTO `role_p` VALUES ('24', '1', '15');
INSERT INTO `role_p` VALUES ('25', '1', '14');
INSERT INTO `role_p` VALUES ('26', '3', '1');
INSERT INTO `role_p` VALUES ('27', '3', '12');
INSERT INTO `role_p` VALUES ('28', '3', '21');
INSERT INTO `role_p` VALUES ('29', '3', '22');
INSERT INTO `role_p` VALUES ('30', '3', '10');
INSERT INTO `role_p` VALUES ('31', '3', '11');
INSERT INTO `role_p` VALUES ('33', '3', '6');
INSERT INTO `role_p` VALUES ('34', '3', '18');
INSERT INTO `role_p` VALUES ('36', '3', '24');
INSERT INTO `role_p` VALUES ('37', '3', '25');
INSERT INTO `role_p` VALUES ('38', '2', '23');
INSERT INTO `role_p` VALUES ('39', '3', '12');
INSERT INTO `role_p` VALUES ('40', '3', '13');
INSERT INTO `role_p` VALUES ('41', '3', '21');

-- ----------------------------
-- Table structure for `role_user`
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('1', '1', '1');
INSERT INTO `role_user` VALUES ('2', '1', '2');
INSERT INTO `role_user` VALUES ('3', '2', '3');
INSERT INTO `role_user` VALUES ('4', '3', '4');
INSERT INTO `role_user` VALUES ('6', '1', '10');
INSERT INTO `role_user` VALUES ('9', '1', '14');
INSERT INTO `role_user` VALUES ('10', '1', '15');
INSERT INTO `role_user` VALUES ('11', '1', '16');
INSERT INTO `role_user` VALUES ('12', '1', '17');
INSERT INTO `role_user` VALUES ('14', '1', '19');
INSERT INTO `role_user` VALUES ('15', '1', '1');
INSERT INTO `role_user` VALUES ('16', '1', '22');
INSERT INTO `role_user` VALUES ('17', '3', '23');
INSERT INTO `role_user` VALUES ('18', '2', '18');
INSERT INTO `role_user` VALUES ('19', '2', '25');
INSERT INTO `role_user` VALUES ('20', '2', '28');
INSERT INTO `role_user` VALUES ('21', '1', '24');
INSERT INTO `role_user` VALUES ('22', '17', '2');
INSERT INTO `role_user` VALUES ('23', '2', '29');
INSERT INTO `role_user` VALUES ('24', '2', '30');
INSERT INTO `role_user` VALUES ('25', '2', '31');
INSERT INTO `role_user` VALUES ('26', '2', '32');
INSERT INTO `role_user` VALUES ('27', '2', '33');
INSERT INTO `role_user` VALUES ('28', '2', '34');
INSERT INTO `role_user` VALUES ('29', '33', '3');
INSERT INTO `role_user` VALUES ('30', '32', '3');
INSERT INTO `role_user` VALUES ('31', '2', '35');
INSERT INTO `role_user` VALUES ('32', '2', '37');

-- ----------------------------
-- Table structure for `shortanswer`
-- ----------------------------
DROP TABLE IF EXISTS `shortanswer`;
CREATE TABLE `shortanswer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` varchar(50) NOT NULL,
  `objectivescore` int(11) NOT NULL,
  `subjectiveanswer` varchar(500) NOT NULL,
  `stuname` varchar(20) NOT NULL,
  `papername` varchar(50) NOT NULL,
  `readstatu` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shortanswer
-- ----------------------------
INSERT INTO `shortanswer` VALUES ('36', '10001', '17', 'eee&&', 'jijiji', 'test1', '1');
INSERT INTO `shortanswer` VALUES ('39', '10001', '7', '', 'jijiji', '编译原理', '1');
INSERT INTO `shortanswer` VALUES ('40', '10001', '17', 'aaaa&&', 'jijiji', 'jsbs', '1');
INSERT INTO `shortanswer` VALUES ('41', '10001', '17', 'sisisisiisgasdgsdga fagagasga ga gagaga sdgas s &&', 'jijiji', 'koko', '1');
INSERT INTO `shortanswer` VALUES ('42', '73920', '7', 'sdsd&&sdad&&', 'aaaa', 'al', '1');
INSERT INTO `shortanswer` VALUES ('43', '73920', '17', '11jijk&&', 'student_1', 'jsbs', '1');
INSERT INTO `shortanswer` VALUES ('44', '73920', '0', 'fdadgasdga&&', 'student_1', 'java基础', '1');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(50) NOT NULL,
  `stu_id` varchar(50) NOT NULL,
  `clazz_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `teacher_id` int(50) DEFAULT NULL,
  `account` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stu_id` (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('12', '123', '93513', '1', '1', '1', 'student_aaavv');
INSERT INTO `student` VALUES ('13', '11111', '90718', '1', '1', '1', 'sssssss');
INSERT INTO `student` VALUES ('14', 'lolololo', '87437', '1', '1', '1', 'lolololo');
INSERT INTO `student` VALUES ('15', 'oppop', '87205', '1', '1', '1', 'koloho');
INSERT INTO `student` VALUES ('16', 'lo', '10001', '2', '2', '3', 'ji');
INSERT INTO `student` VALUES ('17', 'aaaa', '73920', '1', '1', '3', 'student_1');
INSERT INTO `student` VALUES ('18', 'qq', '24039', '1', '1', null, 'student_2');
INSERT INTO `student` VALUES ('19', 'iosios', '19625', '1', '1', null, 'iosios');
INSERT INTO `student` VALUES ('20', 'qqq', '25390', '1', '1', null, 'student_3');
INSERT INTO `student` VALUES ('21', '学生', '54183', '2', '2', null, 'student_10');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `teacher_id` varchar(50) NOT NULL DEFAULT '3',
  `teacher_name` varchar(20) NOT NULL,
  `department_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '1', 'teacher', '1', '1');
INSERT INTO `teacher` VALUES ('2', '2', '2', '2', '2');
INSERT INTO `teacher` VALUES ('4', '3', 'liuliu', '1', '23');

-- ----------------------------
-- Table structure for `t_exam`
-- ----------------------------
DROP TABLE IF EXISTS `t_exam`;
CREATE TABLE `t_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(50) NOT NULL,
  `exam_time` date NOT NULL,
  `exam_statu` int(11) NOT NULL DEFAULT '0',
  `exam_score` int(11) DEFAULT NULL,
  `stu_id` varchar(50) NOT NULL,
  `paper_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21867 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_exam
-- ----------------------------
INSERT INTO `t_exam` VALUES ('21853', '物联网', '2018-09-08', '0', null, '10001', '78');
INSERT INTO `t_exam` VALUES ('21855', 'javaweb', '2018-09-14', '0', null, '10001', '72');
INSERT INTO `t_exam` VALUES ('21856', '编译原理', '2018-09-10', '1', null, '10001', '82');
INSERT INTO `t_exam` VALUES ('21857', 'test1', '2018-09-07', '1', '29', '10001', '77');
INSERT INTO `t_exam` VALUES ('21858', 'c++', '2018-09-10', '0', null, '10001', '83');
INSERT INTO `t_exam` VALUES ('21859', 'jsbs', '2018-09-10', '1', null, '10001', '84');
INSERT INTO `t_exam` VALUES ('21860', 'koko', '2018-09-10', '1', '39', '10001', '85');
INSERT INTO `t_exam` VALUES ('21861', 'al', '2018-09-20', '0', null, '10001', '86');
INSERT INTO `t_exam` VALUES ('21862', 'al', '2018-09-20', '1', '29', '73920', '86');
INSERT INTO `t_exam` VALUES ('21865', 'jsbs', '2018-09-12', '1', '27', '73920', '84');
INSERT INTO `t_exam` VALUES ('21866', '物联网', '2018-12-30', '0', null, '73920', '78');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `randcode` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('23', 'teacher', '123', null, null, '0');
INSERT INTO `user` VALUES ('24', 'admin_1', '123', null, null, '0');
INSERT INTO `user` VALUES ('30', 'koloho', '123456', '970901255@qq.com', null, '0');
INSERT INTO `user` VALUES ('31', 'jijiji', '123456', '850595063@qq.com', null, '0');
INSERT INTO `user` VALUES ('32', 'student_1', '123', '3203679029@qq.com', null, '0');
INSERT INTO `user` VALUES ('33', 'student_2', '111', '32036790219@qq.com', null, '0');
INSERT INTO `user` VALUES ('34', 'iosios', '123456', '850595063@qq.com', null, '0');
INSERT INTO `user` VALUES ('35', 'student_3', '123', 'qweq@qq.com', null, '0');
INSERT INTO `user` VALUES ('37', 'student_10', '123456', '823990448@qq.com', '0.9061595721970375', '0');
