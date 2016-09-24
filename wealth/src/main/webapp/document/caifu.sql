/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : caifu

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2016-09-23 15:31:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `article_id` bigint(20) NOT NULL COMMENT '文章ID',
  `title` varchar(1024) NOT NULL COMMENT '文章标题',
  `created_at` datetime NOT NULL COMMENT '文章创建时间',
  `comment_count` bigint(20) DEFAULT NULL COMMENT '评论数',
  `article_type` varchar(4) DEFAULT NULL COMMENT '文章类型(枚举类型)',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('305', '我为什么要开这个专栏', '2016-07-28 00:24:55', '2782', '1001');
INSERT INTO `articles` VALUES ('311', '你真的理解什么是“财富自由”吗？', '2016-07-28 05:31:30', '2027', '1001');
INSERT INTO `articles` VALUES ('318', '出售时间之前你要牢记的三条铁律（上）', '2016-07-29 04:44:42', '1749', '1001');
INSERT INTO `articles` VALUES ('322', '出售时间之前你要牢记的三条铁律（下）', '2016-07-30 00:41:46', '1362', '1001');
INSERT INTO `articles` VALUES ('327', '开始前的正式邀请：请与我一起生活一年', '2016-07-31 08:20:13', '6478', '1001');
INSERT INTO `articles` VALUES ('332', '你拥有的最宝贵的财富是什么？', '2016-08-01 04:02:42', '4622', '1001');
INSERT INTO `articles` VALUES ('340', '你拥有的最宝贵的财富是什么？（问答01）', '2016-08-02 07:36:45', '1578', '1002');
INSERT INTO `articles` VALUES ('348', '你拥有的最宝贵的财富是什么？（问答02）', '2016-08-03 05:48:37', '1925', '1002');
INSERT INTO `articles` VALUES ('355', '你拥有的最宝贵的财富是什么？（问答03）', '2016-08-04 05:14:02', '1703', '1002');
INSERT INTO `articles` VALUES ('364', '我们重新理解了注意力', '2016-08-05 04:39:20', '1743', '1003');
INSERT INTO `articles` VALUES ('373', '第一周发奖名单', '2016-08-06 04:18:05', '828', '1004');
INSERT INTO `articles` VALUES ('374', '用什么换什么相对更划算？', '2016-08-07 04:01:24', '2082', '1005');
INSERT INTO `articles` VALUES ('375', '付费就是捡便宜', '2016-08-07 22:25:40', '2929', '1002');
INSERT INTO `articles` VALUES ('392', '付费就是捡便宜（问答02）', '2016-08-10 02:57:44', '1714', '1002');
INSERT INTO `articles` VALUES ('401', '付费就是捡便宜（问答03）', '2016-08-11 03:18:18', '1833', '1002');
INSERT INTO `articles` VALUES ('411', '我们重新理解了付费', '2016-08-12 02:48:05', '1656', '1003');
INSERT INTO `articles` VALUES ('423', '第二周发奖名单', '2016-08-13 02:59:53', '637', '1004');
INSERT INTO `articles` VALUES ('424', '你最想要的东西竟然是最大的负担', '2016-08-14 01:59:20', '3486', '1005');
INSERT INTO `articles` VALUES ('425', '你人生最重的枷锁是什么？', '2016-08-14 02:19:10', '3317', '1001');
INSERT INTO `articles` VALUES ('436', '你人生最重的枷锁是什么？（问答01）', '2016-08-16 03:41:26', '2063', '1002');
INSERT INTO `articles` VALUES ('442', '你人生最重的枷锁是什么？（问答02）', '2016-08-17 06:22:42', '3237', '1002');
INSERT INTO `articles` VALUES ('451', '你人生最重的枷锁是什么？（问答03）', '2016-08-18 01:44:45', '2148', '1002');
INSERT INTO `articles` VALUES ('460', '我们重新认识了枷锁', '2016-08-19 02:07:41', '1757', '1003');
INSERT INTO `articles` VALUES ('467', '福利丨第三周发奖名单', '2016-08-20 00:30:20', '719', '1004');
INSERT INTO `articles` VALUES ('471', '预告丨我们生活的根基应该是什么？', '2016-08-20 01:48:19', '2694', '1005');
INSERT INTO `articles` VALUES ('472', '“活在当下”vs“活在未来”', '2016-08-20 02:16:32', '3202', '1001');
INSERT INTO `articles` VALUES ('487', '问答01 |  “活在当下”vs“活在未来”', '2016-08-23 07:13:16', '1754', '1002');
INSERT INTO `articles` VALUES ('494', '问答02 |  “活在当下”vs“活在未来”', '2016-08-24 04:53:12', '1618', '1002');
INSERT INTO `articles` VALUES ('505', '问答03 |  “活在当下”vs“活在未来”', '2016-08-25 05:00:29', '1540', '1002');
INSERT INTO `articles` VALUES ('509', '我们重新认识了生活的根基', '2016-08-26 04:38:33', '1443', '1003');
INSERT INTO `articles` VALUES ('520', '福利 | 第四周发奖名单', '2016-08-27 02:49:10', '781', '1004');
INSERT INTO `articles` VALUES ('527', '预告 | 为什么有些人运气总是那么好？', '2016-08-28 01:01:11', '2601', '1005');
INSERT INTO `articles` VALUES ('530', '遇到贵人的科学方法', '2016-08-28 23:52:53', '3498', '1001');
INSERT INTO `articles` VALUES ('539', '问答01 | 遇到贵人的科学方法', '2016-08-30 04:45:14', '1693', '1002');
INSERT INTO `articles` VALUES ('566', '问答02 | 遇到贵人的科学方法', '2016-08-31 05:45:23', '1690', '1002');
INSERT INTO `articles` VALUES ('574', '问答03  | 遇到贵人的科学方法', '2016-09-01 03:35:32', '1499', '1002');
INSERT INTO `articles` VALUES ('579', '我们重新认识了“遇到贵人的方法”', '2016-09-02 04:09:24', '1331', '1003');
INSERT INTO `articles` VALUES ('590', '福利 | 第五周发奖名单', '2016-09-03 04:58:33', '920', '1004');
INSERT INTO `articles` VALUES ('604', '预告 | 你的钱算得上是“资本”吗？', '2016-09-04 02:13:20', '3426', '1005');
INSERT INTO `articles` VALUES ('763', '你到底有没有资本', '2016-09-05 05:52:12', '3130', '1001');
INSERT INTO `articles` VALUES ('775', '问答01 | 你到底有没有资本', '2016-09-06 04:40:53', '1913', '1002');
INSERT INTO `articles` VALUES ('780', '问答02 | 你到底有没有资本', '2016-09-07 04:11:03', '1642', '1002');
INSERT INTO `articles` VALUES ('792', '问答3丨你到底有没有资本', '2016-09-08 05:11:36', '1572', '1002');
INSERT INTO `articles` VALUES ('799', '我们重新认识了“资本”', '2016-09-09 02:58:53', '1417', '1003');
INSERT INTO `articles` VALUES ('809', '福利 | 第六周发奖名单', '2016-09-10 04:35:10', '901', '1004');
INSERT INTO `articles` VALUES ('815', '预告 | 你也许并不了解“落后”', '2016-09-11 01:06:50', '3083', '1005');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` varchar(32) NOT NULL COMMENT '数据ID',
  `user_name` varchar(1024) NOT NULL COMMENT '用户名',
  `article_id` bigint(20) NOT NULL COMMENT '文章ID',
  `created_at` datetime DEFAULT NULL COMMENT '评论创建时间',
  `comment_id` bigint(20) DEFAULT NULL COMMENT '评论ID',
  `content` longtext COMMENT '评论内容',
  `indexs` bigint(20) DEFAULT NULL COMMENT '当前文章评论所处楼层',
  `user_avatar` varchar(2048) DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- ----------------------------
-- Table structure for enumerate
-- ----------------------------
DROP TABLE IF EXISTS `enumerate`;
CREATE TABLE `enumerate` (
  `id` varchar(4) NOT NULL,
  `name` varchar(1024) DEFAULT NULL COMMENT '枚举名称',
  `type_name` varchar(1024) DEFAULT NULL COMMENT '类型名称',
  `type_code` varchar(2) DEFAULT NULL COMMENT '类型编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of enumerate
-- ----------------------------
INSERT INTO `enumerate` VALUES ('1001', '正文首次', '文章类型', '10');
INSERT INTO `enumerate` VALUES ('1002', '问答', '文章类型', '10');
INSERT INTO `enumerate` VALUES ('1003', '正文更新', '文章类型', '10');
INSERT INTO `enumerate` VALUES ('1004', '一周奖励', '文章类型', '10');
INSERT INTO `enumerate` VALUES ('1005', '下周预告', '文章类型', '10');