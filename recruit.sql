/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : recruit

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2021-02-09 21:06:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for deliver
-- ----------------------------
DROP TABLE IF EXISTS `deliver`;
CREATE TABLE `deliver` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(4) NOT NULL COMMENT '岗位',
  `uid` int(4) NOT NULL COMMENT '用户',
  `result` varchar(20) NOT NULL COMMENT '投递结果',
  `audit` int(4) NOT NULL COMMENT '是否审核',
  `isdel` int(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of deliver
-- ----------------------------
INSERT INTO `deliver` VALUES ('1', '1', '24', '未通过', '0', '0');
INSERT INTO `deliver` VALUES ('2', '2', '22', '未通过', '0', '0');
INSERT INTO `deliver` VALUES ('3', '2', '23', '未通过', '0', '0');
INSERT INTO `deliver` VALUES ('4', '2', '24', '已通过', '1', '0');
INSERT INTO `deliver` VALUES ('17', '4', '24', '未通过', '0', '0');
INSERT INTO `deliver` VALUES ('18', '1', '1', '未通过', '0', '0');
INSERT INTO `deliver` VALUES ('19', '2', '1', '未通过', '0', '0');
INSERT INTO `deliver` VALUES ('20', '1', '1', '未通过', '0', '0');
INSERT INTO `deliver` VALUES ('21', '26', '26', '已通过', '1', '0');

-- ----------------------------
-- Table structure for firm
-- ----------------------------
DROP TABLE IF EXISTS `firm`;
CREATE TABLE `firm` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `firmid` int(6) NOT NULL COMMENT '企业编号',
  `firm` varchar(20) NOT NULL COMMENT '企业名称',
  `name` varchar(20) NOT NULL COMMENT '负责人',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `address` varchar(20) NOT NULL COMMENT '地址',
  `email` varchar(20) NOT NULL COMMENT '邮箱',
  `audit` int(4) NOT NULL COMMENT '是否审核',
  `isdel` int(4) DEFAULT NULL COMMENT '删除标记',
  `password` varchar(20) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of firm
-- ----------------------------
INSERT INTO `firm` VALUES ('1', '20183131', '任我游', '张三', '187424242', '府谷街22号', '432515@qq.com', '1', '0', '123456');
INSERT INTO `firm` VALUES ('17', '21212', '网飞', '张天', '17845673456', '安防街11号', '42141@qq.com', '1', '0', '123456');
INSERT INTO `firm` VALUES ('18', '239148', '盛大', '刘华', '18756473456', '爱福街5号', '1231@163.com', '1', '0', '123456');
INSERT INTO `firm` VALUES ('19', '123', '逗鱼', '李峰', '17645342345', '安达街10号', '12415@iCloud.com', '1', '0', '123');
INSERT INTO `firm` VALUES ('20', '5678', '拉钩', '王焕', '18965554543', '文化路22号', 'djiq@qq.com', '0', '0', '123');
INSERT INTO `firm` VALUES ('21', '666', 'IT跃迁谷', '大谷', '13888888888', '中国', '1@qq.com', '1', '0', '123');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `isdel` int(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'admin', '123', '0');
INSERT INTO `manager` VALUES ('5', 'ada', 'dad', '0');
INSERT INTO `manager` VALUES ('6', 'dadad', 'dadad', '0');
INSERT INTO `manager` VALUES ('8', '阿斯达', '12323', null);
INSERT INTO `manager` VALUES ('9', 'ada', 'dad', null);
INSERT INTO `manager` VALUES ('10', 'dadad', 'dadad', null);
INSERT INTO `manager` VALUES ('11', 'ada', '12323', null);
INSERT INTO `manager` VALUES ('12', 'ada', 'dad', null);
INSERT INTO `manager` VALUES ('13', 'dadad', 'dadad', null);
INSERT INTO `manager` VALUES ('14', '阿斯达', '12323', null);
INSERT INTO `manager` VALUES ('15', 'ada', 'dad', null);
INSERT INTO `manager` VALUES ('16', 'dadad', 'dadad', null);
INSERT INTO `manager` VALUES ('17', 'ada', '12323', null);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(20) NOT NULL COMMENT '标题',
  `photo` varchar(20) NOT NULL COMMENT '图片',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `ntime` varchar(20) DEFAULT NULL COMMENT '时间',
  `isdel` int(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '今天天气不错', '123.jpg', '今天最高气温26度', '2021-01-03 16:28:45', '0');
INSERT INTO `news` VALUES ('7', '萨德', '123.jpg', '就业形势大好', '2021-01-03 16:28:45', '0');
INSERT INTO `news` VALUES ('8', '萨德', '123.jpg', '1231', '2021-01-03 16:28:45', '0');
INSERT INTO `news` VALUES ('9', '发打发斯蒂芬', '123.jpg', '阿斯蒂芬阿斯蒂芬', '2021-01-03 16:28:45', '0');
INSERT INTO `news` VALUES ('10', '阿道夫', '123.jpg', '深度分多少分', '2021-01-03 16:28:45', '0');
INSERT INTO `news` VALUES ('11', '撒旦飞洒', '123.jpg', '大师傅啥的说法', '2021-01-03 16:28:45', '0');
INSERT INTO `news` VALUES ('12', '萨德', '123.jpg', '就业形势大好', '2021-01-03 16:28:45', '0');
INSERT INTO `news` VALUES ('13', '萨德', '123.jpg', '1231', '2021-01-03 16:28:45', '0');
INSERT INTO `news` VALUES ('14', '发打发斯蒂芬', '123.jpg', '阿斯蒂芬阿斯蒂芬', '2021-01-03 16:28:45', '0');
INSERT INTO `news` VALUES ('16', '撒旦飞洒', '123.jpg', '大师傅啥的说法', '2021-01-03 16:28:45', '0');
INSERT INTO `news` VALUES ('17', '今天天气不错', '123.jpg', '今天天气十分良好，适合出门面试', '2021-01-03 16:28:45', null);
INSERT INTO `news` VALUES ('18', '新消息！IT跃迁谷招人啦！！', 'IT跃迁谷.jpg', 'IT跃迁谷招人啦！！', '2021-02-09 20:57:38', null);

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rname` varchar(20) NOT NULL COMMENT '留言人姓名',
  `unote` varchar(200) NOT NULL COMMENT '留言内容',
  `utime` varchar(20) DEFAULT NULL COMMENT '留言时间',
  `isdel` int(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('1', '张三', '你好吗', '2021-01-03 16:28:45', '0');
INSERT INTO `note` VALUES ('2', '李四', '你好吗', '2021-01-03 16:28:45', '0');
INSERT INTO `note` VALUES ('3', '张三', '你好吗', '2021-01-03 16:28:45', '0');
INSERT INTO `note` VALUES ('4', '王天成', '你好吗', '2021-01-03 16:28:45', '0');
INSERT INTO `note` VALUES ('5', '王天成', '真香警告', '2021-01-03 16:28:45', null);
INSERT INTO `note` VALUES ('6', '王天成', '天气真不错', '2021-01-03 16:28:45', '0');
INSERT INTO `note` VALUES ('7', '小谷', '我是小谷，我想当IT跃迁谷的王牌讲师！！', '2021-02-09 20:59:57', '0');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(20) NOT NULL COMMENT '标题',
  `content` varchar(400) NOT NULL COMMENT '内容',
  `ntime` varchar(20) DEFAULT NULL COMMENT '时间',
  `isdel` int(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '新增50个岗位', '今日新增50个岗位', '2021-01-03 16:28:45', '0');
INSERT INTO `notice` VALUES ('7', '企业入驻', '最近有3家大型企业入驻网站，岗位大大增加，希望求职者能找到属于自己合适的工作', '2021-01-03 16:28:45', null);
INSERT INTO `notice` VALUES ('9', '新消息！IT跃迁谷招人啦！！', '2021年新的时候来临，IT跃迁谷开始招人了。', '2021-02-09 20:57:18', null);

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `post` varchar(20) NOT NULL COMMENT '岗位名称',
  `num` int(4) NOT NULL COMMENT '招聘人数',
  `education` varchar(20) NOT NULL COMMENT '学历',
  `salary` int(4) NOT NULL COMMENT '工资',
  `audit` int(4) NOT NULL COMMENT '是否审核',
  `isdel` int(4) DEFAULT NULL COMMENT '删除标记',
  `fname` varchar(20) NOT NULL COMMENT '企业名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', 'Java工程师', '5', '本科', '3500', '1', '0', '任我游');
INSERT INTO `post` VALUES ('2', 'Java框架师', '5', '高中', '400', '1', '0', '逗鱼');
INSERT INTO `post` VALUES ('3', 'c工程师', '5', '本科', '3500', '1', '0', '盛大');
INSERT INTO `post` VALUES ('4', '工程师', '5', '本科', '3500', '1', '0', '任我游');
INSERT INTO `post` VALUES ('5', 'Java工程师', '5', '本科', '3500', '1', '0', '盛大');
INSERT INTO `post` VALUES ('6', 'Java工程师', '5', '本科', '3500', '1', '0', '逗鱼');
INSERT INTO `post` VALUES ('7', 'Java工程师', '5', '本科', '3500', '1', '0', '网飞');
INSERT INTO `post` VALUES ('8', 'c工程师', '5', '本科', '3500', '1', '0', '任我游');
INSERT INTO `post` VALUES ('10', 'Java工程师', '5', '本科', '3500', '1', '0', '网飞');
INSERT INTO `post` VALUES ('23', '.NET工程师', '5', '本科', '10000', '1', '0', '逗鱼');
INSERT INTO `post` VALUES ('24', '前端设计', '10', '本科', '4000', '1', '0', '逗鱼');
INSERT INTO `post` VALUES ('25', 'IT跃迁谷金牌讲师', '1000', '博士及以上', '1000000', '1', '0', 'IT跃迁谷');
INSERT INTO `post` VALUES ('26', 'IT跃迁谷王牌讲师', '1000', '博士及以上', '1000000', '1', '0', 'IT跃迁谷');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nid` int(4) NOT NULL COMMENT '留言id',
  `rname` varchar(20) NOT NULL COMMENT '回复人姓名',
  `fnote` varchar(200) NOT NULL COMMENT '回复内容',
  `ftime` varchar(20) DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '1', '张三', '你好', '2021-01-03 16:28:45');
INSERT INTO `reply` VALUES ('3', '2', '李四', '你好', '2021-01-03 16:28:45');
INSERT INTO `reply` VALUES ('4', '4', '李峰', '你好', '2021-01-03 16:28:45');
INSERT INTO `reply` VALUES ('5', '4', '李峰', '不好', '2021-01-03 16:28:45');
INSERT INTO `reply` VALUES ('6', '7', '大谷', '你好！我是大谷，我想邀请你来当王牌讲师！', '2021-02-09 21:01:44');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `sex` varchar(20) NOT NULL COMMENT '性别',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `email` varchar(20) NOT NULL COMMENT '邮箱',
  `major` varchar(20) NOT NULL COMMENT '专业',
  `place` varchar(20) NOT NULL COMMENT '籍贯',
  `education` varchar(20) NOT NULL COMMENT '学历',
  `resume` varchar(20) DEFAULT NULL COMMENT '简历',
  `remark` varchar(20) DEFAULT NULL COMMENT '备注',
  `audit` int(4) NOT NULL COMMENT '是否审核',
  `isdel` int(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'qwer', '123456', '龙傲天', 'male', '18956473547', '23853@qq.com', '挖掘机', '湖北荆州', '博士', '11', null, '1', '0');
INSERT INTO `user` VALUES ('7', 'abc', '123456', '龙傲天', '男', '18956473547', '23853@qq.com', '挖掘机', '湖北荆州', '博士', '11', null, '0', '0');
INSERT INTO `user` VALUES ('8', 'www', '123456', '龙傲天', '男', '18956473547', '23853@qq.com', '挖掘机', '湖北荆州', '博士', '11', null, '1', '0');
INSERT INTO `user` VALUES ('9', 'qqq', '123456', '龙傲天', '男', '18956473547', '23853@qq.com', '挖掘机', '湖北荆州', '博士', '11', null, '1', '0');
INSERT INTO `user` VALUES ('10', 'eee', '123456', '龙傲天', '男', '18956473547', '23853@qq.com', '挖掘机', '湖北荆州', '博士', '11', null, '1', '0');
INSERT INTO `user` VALUES ('22', '阿斯达', '123456', '小旋风', '男', '18965554', 'djiwieq@qq.com', '搬砖', '湖北仙桃', '本科', '滴滴的简历.docx', '', '0', null);
INSERT INTO `user` VALUES ('23', 'adminwww', 'www', 'wwwww', '男', '18965554543', 'djiwieq@qq.com', '11', '1', '高中', '123.jpg', '', '0', null);
INSERT INTO `user` VALUES ('24', '333', '333', '王天成', '男', '18965554543', 'djiwieq@qq.com', '软件工程', '上海', '本科', '王的简历.docx', '', '1', '0');
INSERT INTO `user` VALUES ('25', 'asd', '123', '丽莎', '女', '18965554543', 'djiwieq@qq.com', '软件工程', '北京城区', '本科', '滴滴的简历.docx', '', '1', '0');
INSERT INTO `user` VALUES ('26', 'ITyqg', '123', '小谷', '男', '13888888888', '1@qq.com', '英语', '中国', '博士及以上', 'IT跃迁谷.jpg', 'IT跃迁谷', '1', '0');
