/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50146
Source Host           : localhost:3306
Source Database       : spring-security-demo

Target Server Type    : MYSQL
Target Server Version : 50146
File Encoding         : 65001

Date: 2016-01-10 00:08:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `persistent_logins`
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `series` varchar(64) COLLATE utf8_bin NOT NULL,
  `token` varchar(64) COLLATE utf8_bin NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------

-- ----------------------------
-- Table structure for `t_users`
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `d_username` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `d_password` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `d_enabled` int(1) DEFAULT NULL,
  `D_ACCOUNTNONEXPIRED` int(1) DEFAULT '1' COMMENT '表示帐号是否未过期',
  `D_ACCOUNTNONLOCKED` int(1) DEFAULT '1' COMMENT '表示帐号是否未锁定',
  `D_CREDENTIALSNONEXPIRED` int(1) DEFAULT '1' COMMENT '表示登录凭据是否未过期',
  PRIMARY KEY (`d_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES ('mike', '$2a$10$S3sptCoEh2SofpCHfJvqzu29EkiiUmORrwXXxaZy0vdGqowISXSJu', '1', '1', '1', '1');
INSERT INTO `t_users` VALUES ('yjmyzz', '$2a$10$S3sptCoEh2SofpCHfJvqzu29EkiiUmORrwXXxaZy0vdGqowISXSJu', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `t_user_attempts`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_attempts`;
CREATE TABLE `t_user_attempts` (
  `D_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `D_USERNAME` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名，外建引用T_USERS中的D_USERNAME',
  `D_ATTEMPTS` int(4) DEFAULT NULL COMMENT '登录次数',
  `D_LASTMODIFIED` date DEFAULT NULL COMMENT '最后登录错误的日期',
  PRIMARY KEY (`D_ID`),
  KEY `FK_username` (`D_USERNAME`),
  CONSTRAINT `FK_username` FOREIGN KEY (`D_USERNAME`) REFERENCES `t_users` (`d_username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user_attempts
-- ----------------------------
INSERT INTO `t_user_attempts` VALUES ('1', 'mike', '0', null);

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
