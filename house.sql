/*
 Navicat Premium Data Transfer

 Source Server         : localhost_mysql
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : house

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 21/02/2022 20:29:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userpwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'wym', '12345678');

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house`  (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `house_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租房描述',
  `house_model` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋类型，几室几厅',
  `house_area` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋面积',
  `house_floor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋楼层',
  `house_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出租方式',
  `house_price` int(10) NOT NULL COMMENT '出租价格',
  `house_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出租地址',
  `house_image` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋简介照片',
  `community_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小区名字',
  `house_linkman` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋联系电话',
  `house_oriented` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋朝向',
  `house_detailes_img` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋详细页面展示图片',
  `publisher` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '管理员' COMMENT '发布人',
  `publish_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`h_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES (30, '碧家全新公寓 东坑店 高颜值配置 24H管家', '1室0厅1卫', '20', '中层/9层', '整租', 600, '东坑城区', 'http://localhost:8090/static/img/pc0_9MBfWEFgK.jpg', '碧桂园豪庭一期', '13813813800', '南北', 'http://localhost:8090/static/img/pc0_9MBfWEFgK.jpg~http://localhost:8090/static/img/b3be60f4-1db7-4f30-b739-bb33f0b0b74e_1000.jpg~http://localhost:8090/static/img/dca05f50-99f6-471a-a8ea-34c426153951_1000.jpg~', 'wym', '2019-12-12 00:28:43');
INSERT INTO `t_house` VALUES (31, '温馨一房一厅拎包入住，业主急租，看房方便', '1室1厅1卫', '55', '中层/30层', '合租', 1700, '虎门万达中心', 'http://localhost:8090/static/img/pc1_C5B5lnMLr_1.jpg.1440x1080.jpg', '虎门万达广场', '18818818822', '东西', 'http://localhost:8090/static/img/pc0_hFZRdZLcF_1.jpg.1440x1080.jpg~http://localhost:8090/static/img/pc0_KjAN71puf_1.jpg.1440x1080.jpg~http://localhost:8090/static/img/pc0_qrsdjowCK_1.jpg.1440x1080.jpg~', 'wym', '2019-12-12 00:32:02');
INSERT INTO `t_house` VALUES (32, '市政中心 豪装修5房2厅 宽敞明亮 温馨舒适体验家的感觉', '5室2厅2卫 ', '283', '低层/16层', '整租', 10000, '南城行政中心', 'http://localhost:8090/static/img/pc0_KjAN71puf_1.jpg.1440x1080.jpg', '凯名轩', '16816816800', '南北', 'http://localhost:8090/static/img/pc1_C5B5lnMLr_1.jpg.1440x1080.jpg~http://localhost:8090/static/img/pc0_hFZRdZLcF_1.jpg.1440x1080.jpg~http://localhost:8090/static/img/pc0_KjAN71puf_1.jpg.1440x1080.jpg~http://localhost:8090/static/img/pc0_qrsdjowCK_1.jpg.1440x1080.jpg~', 'wym', '2019-12-12 00:36:46');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_id` int(11) NOT NULL COMMENT '房屋租赁id',
  `u_id` int(11) NOT NULL COMMENT '用户id',
  `order_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`o_id`) USING BTREE,
  INDEX `fk1`(`h_id`) USING BTREE,
  INDEX `fk2`(`u_id`) USING BTREE,
  CONSTRAINT `fk1` FOREIGN KEY (`h_id`) REFERENCES `t_house` (`h_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk2` FOREIGN KEY (`u_id`) REFERENCES `t_users` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (11, 30, 3, '2019-12-12 00:46:14', 'wym');
INSERT INTO `t_order` VALUES (12, 30, 3, '2019-12-12 00:54:44', 'wym');
INSERT INTO `t_order` VALUES (16, 30, 11, '2022-02-21 19:51:53', '李先生');

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users`  (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `u_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `u_phone_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户注册手机号码，用于找回密码',
  `u_nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '昵称',
  PRIMARY KEY (`u_id`) USING BTREE,
  UNIQUE INDEX `uniq`(`u_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES (3, 'wym', '123456', '13556730677', 'wym');
INSERT INTO `t_users` VALUES (11, 'lzk', 'lzk', '18320495603', '李先生');

SET FOREIGN_KEY_CHECKS = 1;
