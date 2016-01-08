/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50146
Source Host           : localhost:3306
Source Database       : spring-security-demo

Target Server Type    : MYSQL
Target Server Version : 50146
File Encoding         : 65001

Date: 2016-01-08 14:22:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_users`
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `d_username` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `d_password` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `d_enabled` int(1) DEFAULT NULL,
  PRIMARY KEY (`d_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES ('mike', 'mike123', '1');
INSERT INTO `t_users` VALUES ('yjmyzz', '123456', '1');

-- ----------------------------
-- Table structure for `t_user_roles`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_roles`;
CREATE TABLE `t_user_roles` (
  `d_user_role_id` int(10) NOT NULL DEFAULT '0',
  `d_username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `d_role` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`d_user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user_roles
-- ----------------------------
INSERT INTO `t_user_roles` VALUES ('1', 'mike', 'POWER');
INSERT INTO `t_user_roles` VALUES ('2', 'yjmyzz', 'ADMIN');
INSERT INTO `t_user_roles` VALUES ('3', 'yjmyzz', 'POWER');
