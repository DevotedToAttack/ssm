/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 11/01/2020 23:57:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, '温热', 123);
INSERT INTO `account` VALUES (2, '轻松的', 131);
INSERT INTO `account` VALUES (3, NULL, NULL);
INSERT INTO `account` VALUES (4, 'qwe', 123);
INSERT INTO `account` VALUES (5, '武仙神', 123);
INSERT INTO `account` VALUES (6, 'qwe', 12322);
INSERT INTO `account` VALUES (7, 'wxb', 1111);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('E61D65F673D54F68B0861025C69773DB', '张三', '小三', '18888888888', 'zs@163.com');

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller`  (
  `orderId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `travellerId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`orderId`, `travellerId`) USING BTREE,
  INDEX `travellerId`(`travellerId`) USING BTREE,
  CONSTRAINT `order_traveller_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_traveller_ibfk_2` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('3081770BC3984EF092D9E99760FDABDE', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('E4DD4C45EED84870ABA83574A801083E', 'EE7A71FB6945483FBF91543DBE851960');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `orderNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `peopleCount` int(11) NULL DEFAULT NULL,
  `orderDesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payType` int(11) NULL DEFAULT NULL,
  `orderStatus` int(11) NULL DEFAULT NULL,
  `productId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `memberId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderNum`(`orderNum`) USING BTREE,
  INDEX `productId`(`productId`) USING BTREE,
  INDEX `memberId`(`memberId`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '12345', '2019-12-09 20:35:53', 20, '																												没什么\r\n						\r\n						\r\n						\r\n						', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '67890', '2019-11-16 22:23:38', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('3081770BC3984EF092D9E99760FDABDE', '55555', '2019-11-16 22:24:24', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', '33333', '2019-12-09 18:57:42', 1, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '54321', '2019-11-16 22:04:40', 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', '22222', '2019-11-16 22:24:10', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '98765', '2019-11-16 22:23:57', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', '44444', '2019-11-16 22:24:19', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('E4DD4C45EED84870ABA83574A801083E', '11111', '2019-11-16 22:24:05', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `permissionName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'ordersFindAll', '/orders/findAll.do');
INSERT INTO `permission` VALUES ('2', 'ordersFindById', '/orders/findById.do');
INSERT INTO `permission` VALUES ('3', 'productFindAll', '/product/findAll.do');
INSERT INTO `permission` VALUES ('4', 'productSave', '/product/save.do');
INSERT INTO `permission` VALUES ('5', 'userFindAll', '/user/findAll.do');
INSERT INTO `permission` VALUES ('6', 'userFindById', '/user/findById.do');
INSERT INTO `permission` VALUES ('7', 'userSave', '/user/save.do');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `productNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cityName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DepartureTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `productPrice` double NULL DEFAULT NULL,
  `productDesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productStatus` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product`(`id`, `productNum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1287ABF2A4C544568B8A7C69F36BF8B7', 'itcast-003', '上海石日游', '上海', '2019-12-13 00:00:00', 1800, 'aaaaaa', 1);
INSERT INTO `product` VALUES ('12B7ABF2A4C544568B0A7C69F36BF8B7', 'itcast-004', '北京一日游', '北京', '2019-11-17 09:55:41', 2000, '还不错', 1);
INSERT INTO `product` VALUES ('398d679d-12b4-11ea-9f31-b06ebf0d3dea', '3123132131232', '广东七日游', '广州', '2019-11-20 20:45:00', 10000, '阿松大', 1);
INSERT INTO `product` VALUES ('676C5BD1D35E429A8C2E114939C5685A', 'itcast-002', '北京三日游', '北京', '2019-10-10 10:10:00', 1200, '不错的旅行', 1);
INSERT INTO `product` VALUES ('9F71F01CB448476DAFB309AA6DF9497F', 'itcast-001', '北京三日游', '北京', '2018-10-10 10:10:00', 1200, '不错的旅行', 1);
INSERT INTO `product` VALUES ('b784e129-12a7-11ea-9f31-b06ebf0d3dea', '3123132131232', '广东七日游', '广州', '2019-11-20 20:45:00', 10000, '很快乐', 1);
INSERT INTO `product` VALUES ('cfa2eaff-086c-11ea-8704-b06ebf0d', '123 ', '北京一日游', '北京', '2019-11-16 20:12:00', 1000, '很开心很开心很开心很开心', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1111', 'admin', 'vip');
INSERT INTO `role` VALUES ('2222', 'user', 'vip');
INSERT INTO `role` VALUES ('8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea', 'traveller', 'vip');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `permissionId` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleId` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`permissionId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1111');
INSERT INTO `role_permission` VALUES ('2', '1111');
INSERT INTO `role_permission` VALUES ('3', '1111');
INSERT INTO `role_permission` VALUES ('4', '1111');
INSERT INTO `role_permission` VALUES ('5', '1111');
INSERT INTO `role_permission` VALUES ('6', '1111');
INSERT INTO `role_permission` VALUES ('7', '1111');
INSERT INTO `role_permission` VALUES ('1', '2222');
INSERT INTO `role_permission` VALUES ('2', '2222');
INSERT INTO `role_permission` VALUES ('3', '2222');
INSERT INTO `role_permission` VALUES ('4', '2222');
INSERT INTO `role_permission` VALUES ('1', '8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea');
INSERT INTO `role_permission` VALUES ('2', '8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea');
INSERT INTO `role_permission` VALUES ('3', '8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea');
INSERT INTO `role_permission` VALUES ('4', '8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `visitTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `executionTime` int(11) NULL DEFAULT NULL,
  `method` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('00244ce9-1b04-11ea-927a-b06ebf0d3dea', '2019-12-10 12:17:36', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 3, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('0077f579-27a6-11ea-acaa-005056c00001', '2019-12-26 14:07:31', 'admin', '127.0.0.1', '/user/delete.do', 14, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](a0f912f7-27a5-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('007eb18f-27a6-11ea-acaa-005056c00001', '2019-12-26 14:07:31', 'admin', '127.0.0.1', '/user/findAll.do', 6, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('00b7ce07-2876-11ea-a089-b06ebf0d3dea', '2019-12-27 14:56:27', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 44, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,676C5BD1D35E429A8C2E114939C5685A,)');
INSERT INTO `syslog` VALUES ('00e399c7-1699-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:21:36', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('014d2420-1bdd-11ea-b8f6-b06ebf0d3dea', '2019-12-11 14:11:01', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 47, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('017f97bd-2254-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:37:56', 'admin', '127.0.0.1', '/user/findAll.do', 10, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('018ed62d-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:51:50', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 10, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('022479d6-1a8b-11ea-927a-b06ebf0d3dea', '2019-12-09 21:51:30', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 56, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('026c53df-258c-11ea-acaa-005056c00001', '2019-12-23 21:56:25', 'admin', '127.0.0.1', '/user/findUserByIdAndAllRole.do', 21, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('027e0fe8-169a-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:28:48', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 11, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('02cd3a33-1e6e-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:34:03', 'admin', '127.0.0.1', '/permission/findAll.do', 3, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('02ce608e-28bd-11ea-a089-b06ebf0d3dea', '2019-12-27 23:24:42', 'admin', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 22, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('02daeb1d-1c0e-11ea-b8f6-b06ebf0d3dea', '2019-12-11 20:01:49', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 31, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('037cca43-19d7-11ea-927a-b06ebf0d3dea', '2019-12-09 00:23:05', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 13, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('039a3bbb-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:52:18', 'admin', '127.0.0.1', '/user/findById.do', 3, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](f347c94d-2253-11ea-ac96-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('044b13e9-2254-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:38:00', 'admin', '127.0.0.1', '/user/findUserByIdAndAllRole.do', 9, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](f347c94d-2253-11ea-ac96-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('046df543-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:51:55', 'admin', '0:0:0:0:0:0:0:1', '/product/findString.do', 20, '[类名] cn.controller.ProductController[方法名] findString[方法的参数 ](0,4,7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('04daa516-169a-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:28:52', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 16, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('0505872c-258c-11ea-acaa-005056c00001', '2019-12-23 21:56:29', 'admin', '127.0.0.1', '/user/findAll.do', 11, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('069fa8fa-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:16:01', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 210, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('06cce36b-291c-11ea-a089-b06ebf0d3dea', '2019-12-28 10:44:51', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 34, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('06ed712b-27a5-11ea-acaa-005056c00001', '2019-12-26 14:00:32', 'admin', '127.0.0.1', '/product/findAll.do', 22, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('06f0cf6e-1582-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:04:39', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 41, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('070cd311-1b25-11ea-927a-b06ebf0d3dea', '2019-12-10 16:14:01', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 22, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('07442143-28c2-11ea-a089-b06ebf0d3dea', '2019-12-28 00:00:37', 'admin', '0:0:0:0:0:0:0:1', '/user/alter.do', 88, '[类名] cn.controller.UserController[方法名] alter[方法的参数 ](UserInfo{id=\'077cc486-27a6-11ea-acaa-005056c00001\', email=\'111111\', username=\'text2\', password=\'$2a$10$kbvzoarhFHLUwkJdkso3ve0RGBEdhh7ya7i.4woLzfC/eGilUdtz2\', phoneNum=\'1111111\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('074ad5a8-28c2-11ea-a089-b06ebf0d3dea', '2019-12-28 00:00:37', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 11, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('0772e4b6-1bdd-11ea-b8f6-b06ebf0d3dea', '2019-12-11 14:11:11', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 16, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('077d536d-27a6-11ea-acaa-005056c00001', '2019-12-26 14:07:43', 'admin', '127.0.0.1', '/user/save.do', 90, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'2222222\', username=\'text1\', password=\'$2a$10$VdQYMv3PQfkYCAmlYga83eeItGAYzSVoGjgOF21tQGhPJKi4g1jfm\', phoneNum=\'2222222\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('07825fb4-27a6-11ea-acaa-005056c00001', '2019-12-26 14:07:43', 'admin', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('07e0647f-291e-11ea-a089-b06ebf0d3dea', '2019-12-28 10:59:11', 'admin', '0:0:0:0:0:0:0:1', '/user/save.do', 111, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'111777777\', username=\'text6\', password=\'$2a$10$/JxbK4Q.IVenCguo2ctOTefPRSQIXjOqhCm1BVVEOidzuvlkw.p4G\', phoneNum=\'11177777\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('07e4d38a-291e-11ea-a089-b06ebf0d3dea', '2019-12-28 10:59:11', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 11, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('07f9aab1-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:52:26', 'admin', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('0867d710-22ec-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:46:13', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 90, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('08986890-1bdd-11ea-b8f6-b06ebf0d3dea', '2019-12-11 14:11:13', 'admin', '0:0:0:0:0:0:0:1', '/permission/findById', 3, '[类名] cn.controller.PermissionController[方法名] findById[方法的参数 ](2,)');
INSERT INTO `syslog` VALUES ('08bb31b3-169a-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:28:59', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('0997936e-18fc-11ea-927a-b06ebf0d3dea', '2019-12-07 22:15:35', 'admin', '0:0:0:0:0:0:0:1', '/user/delete.do', 14, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](,)');
INSERT INTO `syslog` VALUES ('099ddee6-18fc-11ea-927a-b06ebf0d3dea', '2019-12-07 22:15:36', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('09a8f9d8-22ec-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:46:15', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 10, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('09ec4b14-1bdd-11ea-b8f6-b06ebf0d3dea', '2019-12-11 14:11:15', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 4, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('0a6fd946-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:52:30', 'admin', '127.0.0.1', '/user/findUserByIdAndAllRole.do', 8, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](f347c94d-2253-11ea-ac96-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('0a9d3435-1bd9-11ea-b8f6-b06ebf0d3dea', '2019-12-11 13:42:38', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 106, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('0b4852de-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:10:53', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 17, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('0b592bb7-169a-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:29:03', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 12, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('0b9915fc-1bdd-11ea-b8f6-b06ebf0d3dea', '2019-12-11 14:11:18', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 6, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('0bded8be-28a5-11ea-a089-b06ebf0d3dea', '2019-12-27 20:33:09', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 20, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('0bfad5cd-1b68-11ea-927a-b06ebf0d3dea', '2019-12-11 00:13:45', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 28, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('0c473396-28c2-11ea-a089-b06ebf0d3dea', '2019-12-28 00:00:45', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 13, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('0c8af1ba-291c-11ea-a089-b06ebf0d3dea', '2019-12-28 10:45:00', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 22, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('0cf39547-27a6-11ea-acaa-005056c00001', '2019-12-26 14:07:52', 'admin', '127.0.0.1', '/user/findUserByIdAndAllRole.do', 12, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('0d6fd3c5-1b68-11ea-927a-b06ebf0d3dea', '2019-12-11 00:13:48', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 17, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('0d861bc2-28bb-11ea-a089-b06ebf0d3dea', '2019-12-27 23:10:41', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 113, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('0d90a467-1b4f-11ea-927a-b06ebf0d3dea', '2019-12-10 21:14:50', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 110, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('0da3c5f6-1761-11ea-927a-b06ebf0d3dea', '2019-12-05 21:13:39', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('0dd4dea0-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:52:35', 'admin', '127.0.0.1', '/user/addRoleToUser.do', 97, '[类名] cn.controller.UserController[方法名] addRoleToUser[方法的参数 ](f347c94d-2253-11ea-ac96-b06ebf0d3dea,[Ljava.lang.String;@532f5c08,)');
INSERT INTO `syslog` VALUES ('0dda644b-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:52:35', 'admin', '127.0.0.1', '/user/findAll.do', 11, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('0ddd1103-1582-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:04:51', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('0e4f54a9-19db-11ea-927a-b06ebf0d3dea', '2019-12-09 00:52:01', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 13, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('0e832673-1e79-11ea-ac96-b06ebf0d3dea', '2019-12-14 21:53:07', 'admin', '127.0.0.1', '/product/findAll.do', 8, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('0ea7cc05-1b68-11ea-927a-b06ebf0d3dea', '2019-12-11 00:13:50', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 19, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('0ece011e-28c2-11ea-a089-b06ebf0d3dea', '2019-12-28 00:00:49', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('0ef1548b-1c0e-11ea-b8f6-b06ebf0d3dea', '2019-12-11 20:02:09', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findString.do', 14, '[类名] cn.controller.SysLogController[方法名] findString[方法的参数 ](0,631,2019-12-11 20,)');
INSERT INTO `syslog` VALUES ('0f1eb055-1b4f-11ea-927a-b06ebf0d3dea', '2019-12-10 21:14:53', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 22, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('0f32a76e-27a6-11ea-acaa-005056c00001', '2019-12-26 14:07:56', 'admin', '127.0.0.1', '/user/addRoleToUser.do', 8, '[类名] cn.controller.UserController[方法名] addRoleToUser[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,[Ljava.lang.String;@ac35a8a,)');
INSERT INTO `syslog` VALUES ('0f33e56f-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:43:31', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 93, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('0f374b1c-27a6-11ea-acaa-005056c00001', '2019-12-26 14:07:56', 'admin', '127.0.0.1', '/user/findAll.do', 9, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('0f4c1b8b-169a-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:29:10', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 8, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('0f5513c6-27a7-11ea-acaa-005056c00001', '2019-12-26 14:15:05', 'text1', '127.0.0.1', '/product/findAll.do', 10, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('0f9ffa40-16c2-11ea-b69d-b06ebf0d3dea', '2019-12-05 02:15:30', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findString.do', 26, '[类名] cn.controller.SysLogController[方法名] findString[方法的参数 ](0,93,2019-12-04,)');
INSERT INTO `syslog` VALUES ('0fb5ddd9-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:52:14', 'admin', '0:0:0:0:0:0:0:1', '/product/findString.do', 18, '[类名] cn.controller.ProductController[方法名] findString[方法的参数 ](0,4,tcast,)');
INSERT INTO `syslog` VALUES ('0ffe3566-22ec-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:46:26', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 16, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('10b17ed1-1e79-11ea-ac96-b06ebf0d3dea', '2019-12-14 21:53:10', 'admin', '127.0.0.1', '/orders/findAll.do', 41, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('10f6bb7b-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:43:34', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 24, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('113d970c-1b4f-11ea-927a-b06ebf0d3dea', '2019-12-10 21:14:57', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 18, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('11473c92-1b68-11ea-927a-b06ebf0d3dea', '2019-12-11 00:13:54', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 10, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1,2,12B7ABF2A4C544568B0A7C69F36BF8B7,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('1149dbf1-291c-11ea-a089-b06ebf0d3dea', '2019-12-28 10:45:08', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 8, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('1159d107-1bdd-11ea-b8f6-b06ebf0d3dea', '2019-12-11 14:11:28', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 4, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('11b39a7c-159a-11ea-b69d-b06ebf0d3dea', '2019-12-03 14:56:45', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 121, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('11e581ae-1582-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:04:57', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 20, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('11ffdef2-291c-11ea-a089-b06ebf0d3dea', '2019-12-28 10:45:09', 'admin', '0:0:0:0:0:0:0:1', '/permission/findById', 5, '[类名] cn.controller.PermissionController[方法名] findById[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('12c18ff5-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:43:37', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('12cc70c8-1b4f-11ea-927a-b06ebf0d3dea', '2019-12-10 21:14:59', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 24, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('12f7453d-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:11:06', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 8, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('138116db-291c-11ea-a089-b06ebf0d3dea', '2019-12-28 10:45:12', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 16, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('13c0e881-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:43:39', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 51, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('13f1f90f-27a5-11ea-acaa-005056c00001', '2019-12-26 14:00:54', 'admin', '127.0.0.1', '/orders/findAll.do', 77, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('13f65bae-28c2-11ea-a089-b06ebf0d3dea', '2019-12-28 00:00:58', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 22, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('14251eeb-1b68-11ea-927a-b06ebf0d3dea', '2019-12-11 00:13:59', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 17, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('142b88a3-1b4f-11ea-927a-b06ebf0d3dea', '2019-12-10 21:15:01', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 4, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,4,)');
INSERT INTO `syslog` VALUES ('14d302d1-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:43:41', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 18, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('157a7e0a-1b4f-11ea-927a-b06ebf0d3dea', '2019-12-10 21:15:04', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 40, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,9F71F01CB448476DAFB309AA6DF9497F,)');
INSERT INTO `syslog` VALUES ('15897c80-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:43:42', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 9, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,398d679d-12b4-11ea-9f31-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('158d8d56-291c-11ea-a089-b06ebf0d3dea', '2019-12-28 10:45:15', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('15a04ab0-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:52:24', 'admin', '0:0:0:0:0:0:0:1', '/product/findString.do', 19, '[类名] cn.controller.ProductController[方法名] findString[方法的参数 ](0,4,544,)');
INSERT INTO `syslog` VALUES ('15a9aa2e-1b68-11ea-927a-b06ebf0d3dea', '2019-12-11 00:14:01', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 6, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1,2,12B7ABF2A4C544568B0A7C69F36BF8B7,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('15c474be-1a89-11ea-927a-b06ebf0d3dea', '2019-12-09 21:37:44', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 159, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('16a422b0-19db-11ea-927a-b06ebf0d3dea', '2019-12-09 00:52:15', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('171d8430-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:43:44', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('177a2893-1a89-11ea-927a-b06ebf0d3dea', '2019-12-09 21:37:47', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 15, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('1787b427-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:04:14', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 11, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('17d34442-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:43:46', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 13, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,398d679d-12b4-11ea-9f31-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('181712ac-28bb-11ea-a089-b06ebf0d3dea', '2019-12-27 23:10:58', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 17, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('186d5425-1bdd-11ea-b8f6-b06ebf0d3dea', '2019-12-11 14:11:39', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 14, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('189a964b-1bd8-11ea-b8f6-b06ebf0d3dea', '2019-12-11 13:35:52', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 257, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('1935f66f-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:43:48', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('1937c104-1761-11ea-927a-b06ebf0d3dea', '2019-12-05 21:13:59', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 12, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('193a09cf-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:04:17', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 5, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('19884687-28bb-11ea-a089-b06ebf0d3dea', '2019-12-27 23:11:01', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 15, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('19d4b0a6-16c2-11ea-b69d-b06ebf0d3dea', '2019-12-05 02:15:47', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findString.do', 9, '[类名] cn.controller.SysLogController[方法名] findString[方法的参数 ](0,10,2019-12-04,)');
INSERT INTO `syslog` VALUES ('19ee6365-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:43:49', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 39, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('1b133bac-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:43:51', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 24, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('1b18fecb-1bdd-11ea-b8f6-b06ebf0d3dea', '2019-12-11 14:11:44', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 19, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('1b64f780-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:52:34', 'admin', '0:0:0:0:0:0:0:1', '/product/findString.do', 133, '[类名] cn.controller.ProductController[方法名] findString[方法的参数 ](0,4,阿大撒,)');
INSERT INTO `syslog` VALUES ('1bdb394e-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:43:52', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 42, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('1befd155-1b66-11ea-927a-b06ebf0d3dea', '2019-12-10 23:59:53', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 193, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('1c4aded6-1582-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:05:15', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 18, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('1cb88078-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:04:23', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 4, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('1cd002eb-1a8b-11ea-927a-b06ebf0d3dea', '2019-12-09 21:52:15', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 12, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('1de23aee-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:45:07', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 147, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('1ed1983c-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:53:04', 'admin', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('1edd5431-1a8b-11ea-927a-b06ebf0d3dea', '2019-12-09 21:52:18', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 21, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](cdd798c6-1a8a-11ea-927a-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('1fc79b52-28ce-11ea-a089-b06ebf0d3dea', '2019-12-28 01:27:12', 'admin', '127.0.0.1', '/product/findAll.do', 101, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('2030a92d-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 190, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('20654870-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:04:29', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 36, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('206d4815-1582-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:05:22', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('2073abe4-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:53:07', 'admin', '127.0.0.1', '/user/findUserByIdAndAllRole.do', 7, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](f347c94d-2253-11ea-ac96-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('20753f2b-1e6d-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:27:43', 'admin', '127.0.0.1', '/user/addRoleToUser.do', 4, '[类名] cn.controller.UserController[方法名] addRoleToUser[方法的参数 ](9a3497d3-1e6c-11ea-ac96-b06ebf0d3dea,[Ljava.lang.String;@4eedf929,)');
INSERT INTO `syslog` VALUES ('207a433c-1e6d-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:27:43', 'admin', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('215b582b-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:45:13', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 15, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('226c61a0-1a8b-11ea-927a-b06ebf0d3dea', '2019-12-09 21:52:24', 'admin', '0:0:0:0:0:0:0:1', '/user/addRoleToUser.do', 17, '[类名] cn.controller.UserController[方法名] addRoleToUser[方法的参数 ](cdd798c6-1a8a-11ea-927a-b06ebf0d3dea,[Ljava.lang.String;@d5fabcd,)');
INSERT INTO `syslog` VALUES ('2271af2d-1a8b-11ea-927a-b06ebf0d3dea', '2019-12-09 21:52:24', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 10, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('22912419-1582-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:05:25', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('22977217-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:53:10', 'admin', '127.0.0.1', '/user/addRoleToUser.do', 7, '[类名] cn.controller.UserController[方法名] addRoleToUser[方法的参数 ](f347c94d-2253-11ea-ac96-b06ebf0d3dea,[Ljava.lang.String;@4181585d,)');
INSERT INTO `syslog` VALUES ('229c782b-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:53:10', 'admin', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('22b1c151-1a82-11ea-927a-b06ebf0d3dea', '2019-12-09 20:47:59', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 15, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('231a2fbb-1e6d-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:27:47', 'admin', '127.0.0.1', '/role/findAll.do', 4, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('237e1e14-1bdd-11ea-b8f6-b06ebf0d3dea', '2019-12-11 14:11:58', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 3, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('238df272-1e60-11ea-ac96-b06ebf0d3dea', '2019-12-14 18:54:45', 'admin', '127.0.0.1', '/product/findAll.do', 17, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('239457fe-1a82-11ea-927a-b06ebf0d3dea', '2019-12-09 20:48:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 17, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('24070d72-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:00:06', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 62, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('241040d0-1e60-11ea-ac96-b06ebf0d3dea', '2019-12-14 18:54:45', 'admin', '127.0.0.1', '/product/findAll.do', 9, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,4,)');
INSERT INTO `syslog` VALUES ('24dea210-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:04:37', 'admin', '0:0:0:0:0:0:0:1', '/orders/findByIdOnlyOrder.do', 8, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('24e5d29b-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:44:07', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('2545e2f6-1b1d-11ea-927a-b06ebf0d3dea', '2019-12-10 15:17:35', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 264, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('25ca9d99-28a7-11ea-a089-b06ebf0d3dea', '2019-12-27 20:48:11', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 42, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('26552cb3-16c2-11ea-b69d-b06ebf0d3dea', '2019-12-05 02:16:08', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findString.do', 17, '[类名] cn.controller.SysLogController[方法名] findString[方法的参数 ](0,10,2019-12-04,)');
INSERT INTO `syslog` VALUES ('26744be2-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:00:11', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 38, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](2,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('26d4d879-28d2-11ea-a089-b06ebf0d3dea', '2019-12-28 01:56:02', 'admin', '127.0.0.1', '/product/findAll.do', 11, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('277d5ff0-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:44:12', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 22, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('27b6b19c-1a7a-11ea-927a-b06ebf0d3dea', '2019-12-09 19:50:51', 'admin', '0:0:0:0:0:0:0:1', '/orders/findByIdOnlyOrder.do', 14, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('28c4aaab-28d2-11ea-a089-b06ebf0d3dea', '2019-12-28 01:56:05', 'admin', '127.0.0.1', '/product/findByIdAlter.do', 22, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](676C5BD1D35E429A8C2E114939C5685A,)');
INSERT INTO `syslog` VALUES ('28e7437d-1b5e-11ea-927a-b06ebf0d3dea', '2019-12-10 23:02:59', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 166, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('28f824f7-169a-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:29:53', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 3, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('29065c32-1b62-11ea-927a-b06ebf0d3dea', '2019-12-10 23:31:37', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('29552730-1b1d-11ea-927a-b06ebf0d3dea', '2019-12-10 15:17:42', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 14, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('29d82ed0-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:00:16', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 84, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('29f1f80e-1b62-11ea-927a-b06ebf0d3dea', '2019-12-10 23:31:38', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 24, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('2a2e1e7c-27a8-11ea-acaa-005056c00001', '2019-12-26 14:23:00', 'admin', '127.0.0.1', '/permission/findAll.do', 4, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('2a416881-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:52:59', 'admin', '0:0:0:0:0:0:0:1', '/product/findString.do', 16, '[类名] cn.controller.ProductController[方法名] findString[方法的参数 ](0,4,544,)');
INSERT INTO `syslog` VALUES ('2a601af8-28d2-11ea-a089-b06ebf0d3dea', '2019-12-28 01:56:08', 'admin', '127.0.0.1', '/product/findAll.do', 10, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('2b473b16-27a8-11ea-acaa-005056c00001', '2019-12-26 14:23:02', 'admin', '127.0.0.1', '/role/findAll.do', 4, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('2ba86a26-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:00:19', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 36, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](2,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('2badc254-1e60-11ea-ac96-b06ebf0d3dea', '2019-12-14 18:54:58', 'admin', '127.0.0.1', '/product/findAll.do', 11, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](3,4,)');
INSERT INTO `syslog` VALUES ('2be13d50-1b5e-11ea-927a-b06ebf0d3dea', '2019-12-10 23:03:04', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 66, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('2c18f781-27a8-11ea-acaa-005056c00001', '2019-12-26 14:23:03', 'admin', '127.0.0.1', '/user/findAll.do', 17, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('2d2d5f91-2593-11ea-acaa-005056c00001', '2019-12-23 22:47:43', 'admin', '127.0.0.1', '/orders/findAll.do', 52, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('2d4c66e4-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:00:22', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 185, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('2db64d47-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:44:22', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 13, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('2dcf7c78-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:53:05', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 22, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('2e376b22-1a7a-11ea-927a-b06ebf0d3dea', '2019-12-09 19:51:02', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('2e78a530-1b5e-11ea-927a-b06ebf0d3dea', '2019-12-10 23:03:08', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 62, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('2f450b03-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:00:25', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 49, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,1,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('2f9c602d-169a-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:30:04', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('2fd32abc-1a76-11ea-927a-b06ebf0d3dea', '2019-12-09 19:22:27', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 191, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('301d0af0-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:04:56', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 49, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('303e0dda-1c0e-11ea-b8f6-b06ebf0d3dea', '2019-12-11 20:03:05', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 16, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('305597b1-2593-11ea-acaa-005056c00001', '2019-12-23 22:47:48', 'admin', '127.0.0.1', '/orders/findAll.do', 33, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('307a7d8c-28a7-11ea-a089-b06ebf0d3dea', '2019-12-27 20:48:29', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 4, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('30db7b82-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:50:38', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 21, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('31f9a428-28d1-11ea-a089-b06ebf0d3dea', '2019-12-28 01:49:11', 'admin', '127.0.0.1', '/user/findUserByIdAndAllRole.do', 9, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](d9635978-28d0-11ea-a089-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('32298c38-2593-11ea-acaa-005056c00001', '2019-12-23 22:47:51', 'admin', '127.0.0.1', '/orders/findAll.do', 32, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](1,3,)');
INSERT INTO `syslog` VALUES ('3251bc0b-1b56-11ea-927a-b06ebf0d3dea', '2019-12-10 22:05:59', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('3281a3f0-2240-11ea-ac96-b06ebf0d3dea', '2019-12-19 17:16:08', 'admin', '127.0.0.1', '/user/findAll.do', 140, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('32d4c863-1a7a-11ea-927a-b06ebf0d3dea', '2019-12-09 19:51:10', 'admin', '0:0:0:0:0:0:0:1', '/orders/findByIdOnlyOrder.do', 41, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('33160210-1b5e-11ea-927a-b06ebf0d3dea', '2019-12-10 23:03:16', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 48, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('334538ad-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:50:42', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllRole.do', 83, '[类名] cn.controller.RoleController[方法名] findRoleByIdAndAllRole[方法的参数 ](1111,)');
INSERT INTO `syslog` VALUES ('33714d63-1b56-11ea-927a-b06ebf0d3dea', '2019-12-10 22:06:00', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 8, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('33950547-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:53:14', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 19, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('33a95acc-1e4c-11ea-ac96-b06ebf0d3dea', '2019-12-14 16:32:02', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 30, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('33d6847e-1a8b-11ea-927a-b06ebf0d3dea', '2019-12-09 21:52:53', 'admin2', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('346bdc49-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:53:40', 'admin', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('346c1209-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:50:44', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('34a2d767-28a7-11ea-a089-b06ebf0d3dea', '2019-12-27 20:48:36', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 30, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('34a3ead3-1b56-11ea-927a-b06ebf0d3dea', '2019-12-10 22:06:02', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('34ffb398-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:05:04', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 20, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](2FF351C4AC744E2092DCF08CFD314420,)');
INSERT INTO `syslog` VALUES ('351243b4-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:50:45', 'admin', '0:0:0:0:0:0:0:1', '/role/findById', 13, '[类名] cn.controller.RoleController[方法名] findById[方法的参数 ](1111,)');
INSERT INTO `syslog` VALUES ('3526eb17-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:15:10', 'admin', '127.0.0.1', '/role/findAll.do', 5, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('35381e9c-2593-11ea-acaa-005056c00001', '2019-12-23 22:47:57', 'admin', '127.0.0.1', '/permission/findAll.do', 9, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('359883c5-1b56-11ea-927a-b06ebf0d3dea', '2019-12-10 22:06:04', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 28, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('35ce7e4d-16c2-11ea-b69d-b06ebf0d3dea', '2019-12-05 02:16:34', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findString.do', 20, '[类名] cn.controller.SysLogController[方法名] findString[方法的参数 ](0,10,ysLogController,)');
INSERT INTO `syslog` VALUES ('360367cd-1a76-11ea-927a-b06ebf0d3dea', '2019-12-09 19:22:37', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 36, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('3611d367-1e60-11ea-ac96-b06ebf0d3dea', '2019-12-14 18:55:16', 'admin', '127.0.0.1', '/user/findAll.do', 20, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('36378a61-1a89-11ea-927a-b06ebf0d3dea', '2019-12-09 21:38:38', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 4, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('36a9293a-1b56-11ea-927a-b06ebf0d3dea', '2019-12-10 22:06:06', 'admin', '0:0:0:0:0:0:0:1', '/orders/findByIdOnlyOrder.do', 66, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](96CC8BD43C734CC2ACBFF09501B4DD5D,)');
INSERT INTO `syslog` VALUES ('36b6350f-1e60-11ea-ac96-b06ebf0d3dea', '2019-12-14 18:55:17', 'admin', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('36cc72a9-22eb-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:40:21', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 98, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('36f06501-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:15:13', 'admin', '127.0.0.1', '/role/findAll.do', 13, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](1,2,)');
INSERT INTO `syslog` VALUES ('371fba86-2593-11ea-acaa-005056c00001', '2019-12-23 22:48:00', 'admin', '127.0.0.1', '/orders/findAll.do', 31, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('373ce89b-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:00:39', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 65, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](2FF351C4AC744E2092DCF08CFD314420,)');
INSERT INTO `syslog` VALUES ('377c7dc0-1e4c-11ea-ac96-b06ebf0d3dea', '2019-12-14 16:32:08', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('37bbd836-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:05:08', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 45, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('37be699a-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:44:39', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 10, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('37e39469-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:53:46', 'admin', '127.0.0.1', '/user/findById.do', 12, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](f347c94d-2253-11ea-ac96-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('3806afa8-1a7a-11ea-927a-b06ebf0d3dea', '2019-12-09 19:51:19', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 18, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('3810398c-1a76-11ea-927a-b06ebf0d3dea', '2019-12-09 19:22:41', 'admin', '0:0:0:0:0:0:0:1', '/orders/findByIdOnlyOrder.do', 32, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('38225128-175f-11ea-927a-b06ebf0d3dea', '2019-12-05 21:00:31', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 112, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('38956748-1e4c-11ea-ac96-b06ebf0d3dea', '2019-12-14 16:32:10', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 12, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('38acc7dc-1b56-11ea-927a-b06ebf0d3dea', '2019-12-10 22:06:09', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 22, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('390c95f6-2593-11ea-acaa-005056c00001', '2019-12-23 22:48:03', 'admin', '127.0.0.1', '/orders/findAll.do', 35, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('39804be7-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:15:17', 'admin', '127.0.0.1', '/role/findAll.do', 11, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](2,2,)');
INSERT INTO `syslog` VALUES ('39be6e57-1bd4-11ea-b8f6-b06ebf0d3dea', '2019-12-11 13:08:10', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 165, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('39f99b0a-1b56-11ea-927a-b06ebf0d3dea', '2019-12-10 22:06:11', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 28, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](A0657832D93E4B10AE88A2D4B70B1A28,)');
INSERT INTO `syslog` VALUES ('3a92f33c-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:00:44', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 36, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,1,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('3b596544-1b56-11ea-927a-b06ebf0d3dea', '2019-12-10 22:06:14', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 25, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('3b66de83-175f-11ea-927a-b06ebf0d3dea', '2019-12-05 21:00:37', 'admin', '0:0:0:0:0:0:0:1', '/user/findString.do', 149, '[类名] cn.controller.UserController[方法名] findString[方法的参数 ](0,5,a-a745-b,)');
INSERT INTO `syslog` VALUES ('3be9e641-1e67-11ea-ac96-b06ebf0d3dea', '2019-12-14 19:45:32', 'user', '127.0.0.1', '/user/findAll.do', 28, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('3c59f3b1-1e60-11ea-ac96-b06ebf0d3dea', '2019-12-14 18:55:26', 'admin', '127.0.0.1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,2,)');
INSERT INTO `syslog` VALUES ('3c9e5456-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:00:48', 'admin', '0:0:0:0:0:0:0:1', '/orders/findByIdOnlyOrder.do', 28, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](2FF351C4AC744E2092DCF08CFD314420,)');
INSERT INTO `syslog` VALUES ('3cb49bee-1bd4-11ea-b8f6-b06ebf0d3dea', '2019-12-11 13:08:15', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 28, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('3cb8b443-1e60-11ea-ac96-b06ebf0d3dea', '2019-12-14 18:55:27', 'admin', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,2,)');
INSERT INTO `syslog` VALUES ('3d322a56-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:15:23', 'admin', '127.0.0.1', '/role/findAll.do', 13, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](1,2,)');
INSERT INTO `syslog` VALUES ('3d738460-1e4c-11ea-ac96-b06ebf0d3dea', '2019-12-14 16:32:18', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 18, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('3e27ad41-1b32-11ea-927a-b06ebf0d3dea', '2019-12-10 17:48:36', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 21, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('3e7bda97-27a8-11ea-acaa-005056c00001', '2019-12-26 14:23:34', 'admin', '127.0.0.1', '/user/findString.do', 11, '[类名] cn.controller.UserController[方法名] findString[方法的参数 ](0,5,sss,)');
INSERT INTO `syslog` VALUES ('3eafe4d0-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:15:26', 'admin', '127.0.0.1', '/role/findAll.do', 6, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](2,2,)');
INSERT INTO `syslog` VALUES ('3f133d79-1a76-11ea-927a-b06ebf0d3dea', '2019-12-09 19:22:53', 'admin', '0:0:0:0:0:0:0:1', '/orders/alter.do', 6, '[类名] cn.controller.OrdersController[方法名] alter[方法的参数 ](Orders{id=\'null\', orderNum=\'null\', orderTime=null, orderTimeStr=\'null\', orderStatus=null, peopleCount=0, product=null, travellers=null, member=null, payType=null, payTypeStr=\'null\', orderDesc=\'null\'},)');
INSERT INTO `syslog` VALUES ('3f4de59f-258b-11ea-acaa-005056c00001', '2019-12-23 21:50:57', 'admin', '127.0.0.1', '/user/findAll.do', 91, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('3f6c3346-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:00:52', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 44, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,1,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('407266c6-175f-11ea-927a-b06ebf0d3dea', '2019-12-05 21:00:45', 'admin', '0:0:0:0:0:0:0:1', '/user/findString.do', 10, '[类名] cn.controller.UserController[方法名] findString[方法的参数 ](0,5,6f6c57a,)');
INSERT INTO `syslog` VALUES ('4088cc62-2240-11ea-ac96-b06ebf0d3dea', '2019-12-19 17:16:31', 'admin', '127.0.0.1', '/orders/findAll.do', 83, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('40f54efd-1bd4-11ea-b8f6-b06ebf0d3dea', '2019-12-11 13:08:22', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('41230aaa-1b32-11ea-927a-b06ebf0d3dea', '2019-12-10 17:48:41', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 18, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('41a84553-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:54:02', 'admin', '127.0.0.1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('41cb973c-1e4c-11ea-ac96-b06ebf0d3dea', '2019-12-14 16:32:25', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 10, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('42bbc37a-1a88-11ea-927a-b06ebf0d3dea', '2019-12-09 21:31:50', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 178, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('42c14e6e-1a76-11ea-927a-b06ebf0d3dea', '2019-12-09 19:22:59', 'admin', '0:0:0:0:0:0:0:1', '/orders/findByIdOnlyOrder.do', 24, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('438439df-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:51:09', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 24, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('44065115-1a88-11ea-927a-b06ebf0d3dea', '2019-12-09 21:31:52', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 6, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('44826261-28c2-11ea-a089-b06ebf0d3dea', '2019-12-28 00:02:19', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 14, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](4,10,)');
INSERT INTO `syslog` VALUES ('44b68f0c-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:53:43', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 11, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('450b8ad9-175f-11ea-927a-b06ebf0d3dea', '2019-12-05 21:00:53', 'admin', '0:0:0:0:0:0:0:1', '/user/findString.do', 29, '[类名] cn.controller.UserController[方法名] findString[方法的参数 ](0,5,a-a745-b,)');
INSERT INTO `syslog` VALUES ('45881913-175f-11ea-927a-b06ebf0d3dea', '2019-12-05 21:00:54', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('4601f563-159a-11ea-b69d-b06ebf0d3dea', '2019-12-03 14:58:13', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 172, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('462a9db0-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:15:38', 'admin', '127.0.0.1', '/role/findAll.do', 13, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](2,2,)');
INSERT INTO `syslog` VALUES ('46989cf3-1a88-11ea-927a-b06ebf0d3dea', '2019-12-09 21:31:56', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 30, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('46a72195-27a7-11ea-acaa-005056c00001', '2019-12-26 14:16:38', 'text1', '127.0.0.1', '/product/findAll.do', 8, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('46d50e2d-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:15:40', 'admin', '127.0.0.1', '/role/findRoleByIdAndAllRole.do', 11, '[类名] cn.controller.RoleController[方法名] findRoleByIdAndAllRole[方法的参数 ](8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('46de5761-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:53:47', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 13, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('47504e50-1a88-11ea-927a-b06ebf0d3dea', '2019-12-09 21:31:57', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 15, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('47ac9dd0-16c2-11ea-b69d-b06ebf0d3dea', '2019-12-05 02:17:04', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findString.do', 19, '[类名] cn.controller.SysLogController[方法名] findString[方法的参数 ](0,10,findAll,)');
INSERT INTO `syslog` VALUES ('48c3e413-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:53:50', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 11, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('493eaa7d-1b51-11ea-927a-b06ebf0d3dea', '2019-12-10 21:30:49', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 18, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('49be6431-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:34:45', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 413, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('4a60f520-1e67-11ea-ac96-b06ebf0d3dea', '2019-12-14 19:45:56', 'user', '127.0.0.1', '/user/save.do', 106, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'2532725086@qq.com\', username=\'longlog\', password=\'$2a$10$iUts4nBgnU9wQNuwMwyiv.0kUO8hkSicwVBf0igxvy0bxZ9Ycz5Ma\', phoneNum=\'13005602715\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('4a6ccc79-159a-11ea-b69d-b06ebf0d3dea', '2019-12-03 14:58:20', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 28, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](1,15,)');
INSERT INTO `syslog` VALUES ('4a716237-1e67-11ea-ac96-b06ebf0d3dea', '2019-12-14 19:45:56', 'user', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('4ac73607-1586-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:35:11', 'user', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 22, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('4b49134a-28bb-11ea-a089-b06ebf0d3dea', '2019-12-27 23:12:24', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 106, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('4b4b1d3b-1a76-11ea-927a-b06ebf0d3dea', '2019-12-09 19:23:13', 'admin', '0:0:0:0:0:0:0:1', '/orders/alter.do', 2, '[类名] cn.controller.OrdersController[方法名] alter[方法的参数 ](Orders{id=\'null\', orderNum=\'null\', orderTime=null, orderTimeStr=\'null\', orderStatus=null, peopleCount=0, product=null, travellers=null, member=null, payType=null, payTypeStr=\'null\', orderDesc=\'null\'},)');
INSERT INTO `syslog` VALUES ('4bba80ae-27a7-11ea-acaa-005056c00001', '2019-12-26 14:16:47', 'text1', '127.0.0.1', '/product/findAll.do', 8, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('4bd00ce5-22eb-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:40:57', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 16, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('4bf5e97c-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:34:49', 'admin', '0:0:0:0:0:0:0:1', '/orders/findByIdOnlyOrder.do', 25, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('4ccc09e2-1b55-11ea-927a-b06ebf0d3dea', '2019-12-10 21:59:33', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 161, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('4ce831ab-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:54:21', 'admin', '127.0.0.1', '/user/findById.do', 9, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](f347c94d-2253-11ea-ac96-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('4e686824-1b55-11ea-927a-b06ebf0d3dea', '2019-12-10 21:59:36', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 36, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('4e71d0bf-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:34:53', 'admin', '0:0:0:0:0:0:0:1', '/orders/alter.do', 5, '[类名] cn.controller.OrdersController[方法名] alter[方法的参数 ](Orders{id=\'0E7231DC797C486290E8713CA3C6ECCC\', orderNum=\'12345\', orderTime=null, orderTimeStr=\'null\', orderStatus=null, peopleCount=2, product=null, travellers=null, member=null, payType=null, payTypeStr=\'null\', orderDesc=\'							没什么\r\n						\'},)');
INSERT INTO `syslog` VALUES ('4e7ae3df-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:34:53', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('4ed2a1cd-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:15:14', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 100, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('4f9a1ebd-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:54:26', 'admin', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('5007a091-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:15:16', 'admin', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 20, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('504d1418-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:05:50', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 9, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('508b34ce-1b55-11ea-927a-b06ebf0d3dea', '2019-12-10 21:59:40', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 17, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('50da1761-28d0-11ea-a089-b06ebf0d3dea', '2019-12-28 01:42:53', 'admin', '127.0.0.1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('51020e12-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:05:51', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 11, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('513009e8-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:34:58', 'admin', '0:0:0:0:0:0:0:1', '/orders/findByIdOnlyOrder.do', 22, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('5151c414-1b55-11ea-927a-b06ebf0d3dea', '2019-12-10 21:59:41', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 57, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('518abaf1-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:46:34', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 17, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('51a394fc-1e6c-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:21:56', 'admin', '127.0.0.1', '/user/findUserByIdAndAllRole.do', 7, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](4a5fd5a4-1e67-11ea-ac96-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('51ab0bb3-159d-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:20:01', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 70, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](1,20,)');
INSERT INTO `syslog` VALUES ('527f65b5-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:54:06', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 9, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('52b1a253-1754-11ea-927a-b06ebf0d3dea', '2019-12-05 19:42:31', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 74, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('53299bc3-1e6c-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:21:58', 'admin', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('537df7fb-1bd4-11ea-b8f6-b06ebf0d3dea', '2019-12-11 13:08:53', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 22, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,398d679d-12b4-11ea-9f31-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('53b12003-159d-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:20:04', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 7, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](2,20,)');
INSERT INTO `syslog` VALUES ('547880f4-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:35:03', 'admin', '0:0:0:0:0:0:0:1', '/orders/alter.do', 18, '[类名] cn.controller.OrdersController[方法名] alter[方法的参数 ](Orders{id=\'0E7231DC797C486290E8713CA3C6ECCC\', orderNum=\'12345\', orderTime=null, orderTimeStr=\'null\', orderStatus=null, peopleCount=20, product=null, travellers=null, member=null, payType=null, payTypeStr=\'null\', orderDesc=\'														没什么\r\n						\r\n						\'},)');
INSERT INTO `syslog` VALUES ('5481d482-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:35:04', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 19, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('54ad902f-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:05:57', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('553da3f7-1e60-11ea-ac96-b06ebf0d3dea', '2019-12-14 18:56:08', 'admin', '127.0.0.1', '/product/findById.do', 200, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('5543e692-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:54:11', 'admin', '0:0:0:0:0:0:0:1', '/role/findString.do', 6, '[类名] cn.controller.RoleController[方法名] findString[方法的参数 ](0,5,admin,)');
INSERT INTO `syslog` VALUES ('5588f9f3-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:05:58', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 17, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('55cfafeb-159d-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:20:08', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 12, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](2,20,)');
INSERT INTO `syslog` VALUES ('55f16bde-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:01:30', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 85, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('5615a03f-1bd4-11ea-b8f6-b06ebf0d3dea', '2019-12-11 13:08:57', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 27, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('5615fc61-1b44-11ea-927a-b06ebf0d3dea', '2019-12-10 19:58:08', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 13, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('56b12e1e-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:06:00', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 15, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('56b2109b-1b51-11ea-927a-b06ebf0d3dea', '2019-12-10 21:31:12', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 18, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('56d96402-2590-11ea-acaa-005056c00001', '2019-12-23 22:27:25', 'admin', '127.0.0.1', '/user/findAll.do', 9, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('579e85fe-1bd4-11ea-b8f6-b06ebf0d3dea', '2019-12-11 13:09:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 74, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](2FF351C4AC744E2092DCF08CFD314420,)');
INSERT INTO `syslog` VALUES ('57a66898-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:01:33', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 34, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](2,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('57b38b12-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:35:09', 'admin', '0:0:0:0:0:0:0:1', '/orders/findString.do', 122, '[类名] cn.controller.OrdersController[方法名] findString[方法的参数 ](0,10,20,)');
INSERT INTO `syslog` VALUES ('57b80588-159d-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:20:11', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 15, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](1,20,)');
INSERT INTO `syslog` VALUES ('57ccd7b5-1754-11ea-927a-b06ebf0d3dea', '2019-12-05 19:42:40', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findString.do', 187, '[类名] cn.controller.SysLogController[方法名] findString[方法的参数 ](0,103,,)');
INSERT INTO `syslog` VALUES ('57f61c4c-1b51-11ea-927a-b06ebf0d3dea', '2019-12-10 21:31:14', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 13, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('58547641-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:18:18', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 127, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('5876f4b9-1bdb-11ea-b8f6-b06ebf0d3dea', '2019-12-11 13:59:08', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 107, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('588ffa52-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:54:16', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('58ae803a-1b51-11ea-927a-b06ebf0d3dea', '2019-12-10 21:31:15', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 42, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('596f5214-159d-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:20:14', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 17, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](1,20,)');
INSERT INTO `syslog` VALUES ('59a172cf-1e60-11ea-ac96-b06ebf0d3dea', '2019-12-14 18:56:15', 'admin', '127.0.0.1', '/role/findAll.do', 36, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('59a2bbfd-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:54:43', 'admin', '127.0.0.1', '/user/delete.do', 6, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](f347c94d-2253-11ea-ac96-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('59a8455b-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:54:43', 'admin', '127.0.0.1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('59f3d14d-1b55-11ea-927a-b06ebf0d3dea', '2019-12-10 21:59:55', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 14, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('5a2e0da2-27a5-11ea-acaa-005056c00001', '2019-12-26 14:02:52', 'admin', '127.0.0.1', '/user/findAll.do', 11, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('5aa71a7c-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:01:38', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('5b577540-175f-11ea-927a-b06ebf0d3dea', '2019-12-05 21:01:30', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 12, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('5b830203-1918-11ea-927a-b06ebf0d3dea', '2019-12-08 01:38:19', 'admin', '0:0:0:0:0:0:0:1', '/user/delete.do', 5, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](,)');
INSERT INTO `syslog` VALUES ('5b8de2ac-1918-11ea-927a-b06ebf0d3dea', '2019-12-08 01:38:19', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 12, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('5ba6111d-1bd4-11ea-b8f6-b06ebf0d3dea', '2019-12-11 13:09:07', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 12, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('5bae521a-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:54:22', 'admin', '0:0:0:0:0:0:0:1', '/role/findString.do', 7, '[类名] cn.controller.RoleController[方法名] findString[方法的参数 ](0,5,ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('5bbd78e0-28bb-11ea-a089-b06ebf0d3dea', '2019-12-27 23:12:52', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('5be8f44e-16c2-11ea-b69d-b06ebf0d3dea', '2019-12-05 02:17:38', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findString.do', 9, '[类名] cn.controller.SysLogController[方法名] findString[方法的参数 ](0,10,08bb31b3-169a-11ea-b69d-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('5c2e366d-1e60-11ea-ac96-b06ebf0d3dea', '2019-12-14 18:56:20', 'admin', '127.0.0.1', '/role/findRoleByIdAndAllRole.do', 13, '[类名] cn.controller.RoleController[方法名] findRoleByIdAndAllRole[方法的参数 ](2222,)');
INSERT INTO `syslog` VALUES ('5c3d50ec-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:01:41', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 19, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('5c97ae57-1b51-11ea-927a-b06ebf0d3dea', '2019-12-10 21:31:22', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 17, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('5d6f88d4-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:54:25', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('5d944033-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:46:54', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 35, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('5e07b618-1bdc-11ea-b8f6-b06ebf0d3dea', '2019-12-11 14:06:27', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 164, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('5e1740d7-28c0-11ea-a089-b06ebf0d3dea', '2019-12-27 23:48:43', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('5e4f9520-28bf-11ea-a089-b06ebf0d3dea', '2019-12-27 23:41:34', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 18, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('5e7bf220-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:16:19', 'admin', '127.0.0.1', '/role/findAll.do', 11, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](2,2,)');
INSERT INTO `syslog` VALUES ('5e96c0e5-28bb-11ea-a089-b06ebf0d3dea', '2019-12-27 23:12:57', 'admin', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 8, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('5ebb62b7-1e4c-11ea-ac96-b06ebf0d3dea', '2019-12-14 16:33:14', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 17, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('5f9d94ad-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:06:15', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 11, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('5fca8455-27a5-11ea-acaa-005056c00001', '2019-12-26 14:03:01', 'admin', '127.0.0.1', '/user/findUserByIdAndAllRole.do', 23, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('5ffbb10f-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:46:58', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 12, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('609b8bd9-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:54:54', 'admin', '127.0.0.1', '/user/save.do', 91, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'2532725086@qq.com\', username=\'longlog\', password=\'$2a$10$yssU3P04UJlowWcToEE.Le8zELEhhkOxfIlMomwdRI8ajSleWcCq2\', phoneNum=\'13005602715\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('60a08e1c-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:54:54', 'admin', '127.0.0.1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('60d9e343-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:54:30', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 15, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('61036d8f-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:16:23', 'admin', '127.0.0.1', '/orders/findAll.do', 60, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('615366df-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:54:31', 'admin', '0:0:0:0:0:0:0:1', '/user/findString.do', 5, '[类名] cn.controller.UserController[方法名] findString[方法的参数 ](0,5,,)');
INSERT INTO `syslog` VALUES ('61e4b256-27a5-11ea-acaa-005056c00001', '2019-12-26 14:03:05', 'admin', '127.0.0.1', '/user/findAll.do', 10, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('625c7783-191c-11ea-927a-b06ebf0d3dea', '2019-12-08 02:07:08', 'admin', '0:0:0:0:0:0:0:1', '/user/delete.do', 3, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](,)');
INSERT INTO `syslog` VALUES ('6264ff21-191c-11ea-927a-b06ebf0d3dea', '2019-12-08 02:07:08', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 16, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('6275bfd4-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:54:33', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('6281264a-28bb-11ea-a089-b06ebf0d3dea', '2019-12-27 23:13:03', 'admin', '0:0:0:0:0:0:0:1', '/user/alter.do', 87, '[类名] cn.controller.UserController[方法名] alter[方法的参数 ](UserInfo{id=\'null\', email=\'22211111\', username=\'text2\', password=\'$2a$10$DkhpBvOSgkEg8isC9yEHLO/fVEQcOjnDO3YKXMFZR0lCoZwMG5LLa\', phoneNum=\'2222222\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('6288a7aa-28bb-11ea-a089-b06ebf0d3dea', '2019-12-27 23:13:03', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 17, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('631ad65c-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:16:27', 'admin', '127.0.0.1', '/orders/findById.do', 16, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('63de4de0-1b44-11ea-927a-b06ebf0d3dea', '2019-12-10 19:58:31', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 31, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('6414cd00-18fd-11ea-927a-b06ebf0d3dea', '2019-12-07 22:25:17', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 117, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('64a23efd-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:35:31', 'admin', '0:0:0:0:0:0:0:1', '/orders/findByIdOnlyOrder.do', 10, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('65071eb2-28a3-11ea-a089-b06ebf0d3dea', '2019-12-27 20:21:20', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('6541de5d-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:54:38', 'admin', '0:0:0:0:0:0:0:1', '/user/findString.do', 7, '[类名] cn.controller.UserController[方法名] findString[方法的参数 ](0,5,7735@qq.com,)');
INSERT INTO `syslog` VALUES ('65a10d1b-1bdc-11ea-b8f6-b06ebf0d3dea', '2019-12-11 14:06:39', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 19, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('65a42d74-19d5-11ea-927a-b06ebf0d3dea', '2019-12-09 00:11:31', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 110, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('65c1dfb1-1b44-11ea-927a-b06ebf0d3dea', '2019-12-10 19:58:34', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 11, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('6639d5ba-28bb-11ea-a089-b06ebf0d3dea', '2019-12-27 23:13:10', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('66784331-1bdc-11ea-b8f6-b06ebf0d3dea', '2019-12-11 14:06:41', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 33, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('66858e69-1b45-11ea-927a-b06ebf0d3dea', '2019-12-10 20:05:45', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 14, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('66dae08f-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:01:59', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 15, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](f6f6c57a-0f46-11ea-a745-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('66dd869c-2920-11ea-a089-b06ebf0d3dea', '2019-12-28 11:16:10', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 22, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('671a0a45-1b44-11ea-927a-b06ebf0d3dea', '2019-12-10 19:58:36', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('67596ef5-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:54:41', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('6799e003-28bb-11ea-a089-b06ebf0d3dea', '2019-12-27 23:13:12', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('67c1d18f-1a82-11ea-927a-b06ebf0d3dea', '2019-12-09 20:49:55', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 18, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('67c9858b-1e67-11ea-ac96-b06ebf0d3dea', '2019-12-14 19:46:45', 'admin', '127.0.0.1', '/user/findAll.do', 6, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('67ff2e3f-28b1-11ea-a089-b06ebf0d3dea', '2019-12-27 22:01:37', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 37, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('68079286-2920-11ea-a089-b06ebf0d3dea', '2019-12-28 11:16:12', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllRole.do', 3, '[类名] cn.controller.RoleController[方法名] findRoleByIdAndAllRole[方法的参数 ](8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('684f73f8-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:52:11', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 14, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('68628f99-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:02:01', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('6892b0e8-175e-11ea-927a-b06ebf0d3dea', '2019-12-05 20:54:43', 'admin', '0:0:0:0:0:0:0:1', '/user/findString.do', 13, '[类名] cn.controller.UserController[方法名] findString[方法的参数 ](0,5,7735@qq.com,)');
INSERT INTO `syslog` VALUES ('689a2591-1b25-11ea-927a-b06ebf0d3dea', '2019-12-10 16:16:44', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 156, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('689cd91a-1a8c-11ea-927a-b06ebf0d3dea', '2019-12-09 22:01:31', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 46, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('68acb805-2977-11ea-a089-b06ebf0d3dea', '2019-12-28 21:38:59', 'sss2', '0:0:0:0:0:0:0:1', '/product/findById.do', 170, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,676C5BD1D35E429A8C2E114939C5685A,)');
INSERT INTO `syslog` VALUES ('6978e8d7-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:52:13', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('69820a16-1b4f-11ea-927a-b06ebf0d3dea', '2019-12-10 21:17:24', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 230, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('699634f2-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:02:03', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 95, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('69a770ff-2920-11ea-a089-b06ebf0d3dea', '2019-12-28 11:16:14', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('69bc46f0-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:16:38', 'admin', '127.0.0.1', '/orders/findById.do', 20, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('69df578e-1a82-11ea-927a-b06ebf0d3dea', '2019-12-09 20:49:58', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 16, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('69df60f4-28b1-11ea-a089-b06ebf0d3dea', '2019-12-27 22:01:41', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 66, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('6a1ffa3a-1b25-11ea-927a-b06ebf0d3dea', '2019-12-10 16:16:47', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 4, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('6a387fee-2920-11ea-a089-b06ebf0d3dea', '2019-12-28 11:16:15', 'admin', '0:0:0:0:0:0:0:1', '/role/findById', 6, '[类名] cn.controller.RoleController[方法名] findById[方法的参数 ](8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('6a84c067-1e67-11ea-ac96-b06ebf0d3dea', '2019-12-14 19:46:50', 'admin', '127.0.0.1', '/user/findUserByIdAndAllRole.do', 8, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](4a5fd5a4-1e67-11ea-ac96-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('6b1579c5-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:35:41', 'admin', '0:0:0:0:0:0:0:1', '/orders/alter.do', 5, '[类名] cn.controller.OrdersController[方法名] alter[方法的参数 ](Orders{id=\'0E7231DC797C486290E8713CA3C6ECCC\', orderNum=\'1234566\', orderTime=null, orderTimeStr=\'null\', orderStatus=null, peopleCount=20, product=null, travellers=null, member=null, payType=null, payTypeStr=\'null\', orderDesc=\'																					没什么\r\n						\r\n						\r\n						\'},)');
INSERT INTO `syslog` VALUES ('6b1f7bbe-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:35:42', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 4, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('6b3616ba-1b4f-11ea-927a-b06ebf0d3dea', '2019-12-10 21:17:27', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 10, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,4,)');
INSERT INTO `syslog` VALUES ('6ba23975-1b44-11ea-927a-b06ebf0d3dea', '2019-12-10 19:58:44', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 22, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('6bd1a765-28bf-11ea-a089-b06ebf0d3dea', '2019-12-27 23:41:57', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('6c1abdf1-1b25-11ea-927a-b06ebf0d3dea', '2019-12-10 16:16:50', 'admin', '0:0:0:0:0:0:0:1', '/product/alter.do', 7, '[类名] cn.controller.ProductController[方法名] alter[方法的参数 ](Product{id=\'1287ABF2A4C544568B8A7C69F36BF8B7\', productNum=\'itcast-003\', productName=\'上海石日游\', cityName=\'上海\', departureTime=null, departureTimeStr=\'null\', productPrice=1800.0, productDesc=\'aaaaaa\', productStatus=1, productStatusStr=\'null\'},)');
INSERT INTO `syslog` VALUES ('6c2d1a36-1b25-11ea-927a-b06ebf0d3dea', '2019-12-10 16:16:50', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('6c39d115-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:16:42', 'admin', '127.0.0.1', '/orders/findAll.do', 70, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('6c5a368d-1760-11ea-927a-b06ebf0d3dea', '2019-12-05 21:09:08', 'user', '0:0:0:0:0:0:0:1', '/user/save.do', 93, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'12342423423@qq.com\', username=\'sss\', password=\'$2a$10$D.RAUOOS5Nkle1ygBn.vO.rakqs53N/C.tYsb5YfD76Wu/u6yqBZm\', phoneNum=\'1453336256\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('6c6161e9-1760-11ea-927a-b06ebf0d3dea', '2019-12-05 21:09:09', 'user', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('6c73bd35-1b4f-11ea-927a-b06ebf0d3dea', '2019-12-10 21:17:30', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 36, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,9F71F01CB448476DAFB309AA6DF9497F,)');
INSERT INTO `syslog` VALUES ('6da15a3c-28bf-11ea-a089-b06ebf0d3dea', '2019-12-27 23:42:00', 'admin', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 7, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('6e30f5ec-1e67-11ea-ac96-b06ebf0d3dea', '2019-12-14 19:46:56', 'admin', '127.0.0.1', '/user/addRoleToUser.do', 98, '[类名] cn.controller.UserController[方法名] addRoleToUser[方法的参数 ](4a5fd5a4-1e67-11ea-ac96-b06ebf0d3dea,[Ljava.lang.String;@7b040589,)');
INSERT INTO `syslog` VALUES ('6e356120-1a82-11ea-927a-b06ebf0d3dea', '2019-12-09 20:50:06', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 12, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('6e3627c1-1e67-11ea-ac96-b06ebf0d3dea', '2019-12-14 19:46:56', 'admin', '127.0.0.1', '/user/findAll.do', 4, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('6e4574e6-2977-11ea-a089-b06ebf0d3dea', '2019-12-28 21:39:08', 'sss2', '0:0:0:0:0:0:0:1', '/user/findAll.do', 47, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('6eae7839-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:16:46', 'admin', '127.0.0.1', '/orders/findByIdOnlyOrder.do', 11, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](2FF351C4AC744E2092DCF08CFD314420,)');
INSERT INTO `syslog` VALUES ('6edab04e-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:35:48', 'admin', '0:0:0:0:0:0:0:1', '/orders/findByIdOnlyOrder.do', 9, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('6f0c38a1-22eb-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:41:56', 'admin', '0:0:0:0:0:0:0:1', '/permission/findById', 11, '[类名] cn.controller.PermissionController[方法名] findById[方法的参数 ](3,)');
INSERT INTO `syslog` VALUES ('6f57a7d0-28bf-11ea-a089-b06ebf0d3dea', '2019-12-27 23:42:03', 'admin', '0:0:0:0:0:0:0:1', '/user/alter.do', 91, '[类名] cn.controller.UserController[方法名] alter[方法的参数 ](UserInfo{id=\'077cc486-27a6-11ea-acaa-005056c00001\', email=\'111111\', username=\'text2\', password=\'$2a$10$ACR4HC6dvse47nDvn0jMWejdM/6RV4uJawsxGEY.Fl6tadSRAOTDy\', phoneNum=\'2222222\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('6f5ac049-28bf-11ea-a089-b06ebf0d3dea', '2019-12-27 23:42:03', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 9, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('70f597e7-19cf-11ea-927a-b06ebf0d3dea', '2019-12-08 23:28:53', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 90, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('7160fa26-1bd9-11ea-b8f6-b06ebf0d3dea', '2019-12-11 13:45:31', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 99, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('71cf53b2-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:09:26', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 29, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('71cffb23-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:35:53', 'admin', '0:0:0:0:0:0:0:1', '/orders/alter.do', 20, '[类名] cn.controller.OrdersController[方法名] alter[方法的参数 ](Orders{id=\'0E7231DC797C486290E8713CA3C6ECCC\', orderNum=\'12345\', orderTime=null, orderTimeStr=\'null\', orderStatus=null, peopleCount=20, product=null, travellers=null, member=null, payType=null, payTypeStr=\'null\', orderDesc=\'																												没什么\r\n						\r\n						\r\n						\r\n						\'},)');
INSERT INTO `syslog` VALUES ('71d7110f-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:35:53', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('720c1310-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:02:17', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 17, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('72e21893-1b4f-11ea-927a-b06ebf0d3dea', '2019-12-10 21:17:40', 'admin', '0:0:0:0:0:0:0:1', '/orders/findByIdOnlyOrder.do', 44, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](3081770BC3984EF092D9E99760FDABDE,)');
INSERT INTO `syslog` VALUES ('73694ad6-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:02:20', 'admin', '0:0:0:0:0:0:0:1', '/permission/findById', 13, '[类名] cn.controller.PermissionController[方法名] findById[方法的参数 ](2,)');
INSERT INTO `syslog` VALUES ('73cb1a41-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:35:56', 'admin', '0:0:0:0:0:0:0:1', '/orders/findByIdOnlyOrder.do', 19, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('73fa5470-1b44-11ea-927a-b06ebf0d3dea', '2019-12-10 19:58:58', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 21, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('74b8acb0-1b4f-11ea-927a-b06ebf0d3dea', '2019-12-10 21:17:43', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 30, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,9F71F01CB448476DAFB309AA6DF9497F,)');
INSERT INTO `syslog` VALUES ('752491da-1b63-11ea-927a-b06ebf0d3dea', '2019-12-10 23:40:54', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 15, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('7582f569-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:02:23', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 287, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('759ea01f-1b4f-11ea-927a-b06ebf0d3dea', '2019-12-10 21:17:45', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 25, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](3081770BC3984EF092D9E99760FDABDE,)');
INSERT INTO `syslog` VALUES ('761274e3-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:36:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 13, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('767fa911-28ac-11ea-a089-b06ebf0d3dea', '2019-12-27 21:26:14', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 95, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('76b3ef79-16b7-11ea-b69d-b06ebf0d3dea', '2019-12-05 00:59:38', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findString.do', 190, '[类名] cn.controller.SysLogController[方法名] findString[方法的参数 ](0,10,00e39,)');
INSERT INTO `syslog` VALUES ('774a4d3e-28ce-11ea-a089-b06ebf0d3dea', '2019-12-28 01:29:38', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 104, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('774e15bb-1b4f-11ea-927a-b06ebf0d3dea', '2019-12-10 21:17:48', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 21, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,9F71F01CB448476DAFB309AA6DF9497F,)');
INSERT INTO `syslog` VALUES ('775e1fc0-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:52:36', 'admin', '0:0:0:0:0:0:0:1', '/user/save.do', 101, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'1234243323423@qq.com\', username=\'admin5\', password=\'$2a$10$NTMn8cXgiwCXqHw9wT6/c.rneg40jCc/4ZLtUtcMPw3Jkxe5QIqVW\', phoneNum=\'14522265865\', status=0, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('7765d5dd-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:52:36', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 17, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('77a7c1ab-1a8b-11ea-927a-b06ebf0d3dea', '2019-12-09 21:54:47', 'admin2', '0:0:0:0:0:0:0:1', '/user/findAll.do', 10, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('77cbb197-1a81-11ea-927a-b06ebf0d3dea', '2019-12-09 20:43:12', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('78222641-28ac-11ea-a089-b06ebf0d3dea', '2019-12-27 21:26:17', 'admin', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 20, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('789bbc81-1b63-11ea-927a-b06ebf0d3dea', '2019-12-10 23:41:00', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 16, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('7948dfc3-1b44-11ea-927a-b06ebf0d3dea', '2019-12-10 19:59:07', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('796c7efe-1b4f-11ea-927a-b06ebf0d3dea', '2019-12-10 21:17:51', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,4,)');
INSERT INTO `syslog` VALUES ('79e168b7-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:36:06', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 20, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('79fec9c7-1b63-11ea-927a-b06ebf0d3dea', '2019-12-10 23:41:02', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 34, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](1,2,)');
INSERT INTO `syslog` VALUES ('7a1814c5-1b59-11ea-927a-b06ebf0d3dea', '2019-12-10 22:29:27', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 115, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('7a1f29fe-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:29:20', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 111, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('7a40c4c4-28bd-11ea-a089-b06ebf0d3dea', '2019-12-27 23:28:02', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 148, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('7adb936a-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:49:16', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 117, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('7b05ddda-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:17:51', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 56, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('7b9847c0-1582-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:07:55', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 15, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('7bcc70c5-2876-11ea-a089-b06ebf0d3dea', '2019-12-27 14:59:53', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 84, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('7c4bfd5c-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:36:10', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 16, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('7c74bb99-28bd-11ea-a089-b06ebf0d3dea', '2019-12-27 23:28:06', 'admin', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 16, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('7c7fc102-1b59-11ea-927a-b06ebf0d3dea', '2019-12-10 22:29:31', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 73, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('7cc0ae31-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:17:10', 'admin', '127.0.0.1', '/orders/findAll.do', 40, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('7d02ea7b-28ac-11ea-a089-b06ebf0d3dea', '2019-12-27 21:26:25', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 15, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('7d04593b-27a7-11ea-acaa-005056c00001', '2019-12-26 14:18:09', 'text1', '127.0.0.1', '/product/findAll.do', 5, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('7d63d270-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:16:32', 'admin', '0:0:0:0:0:0:0:1', '/user/save.do', 93, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'222222111\', username=\'text1\', password=\'$2a$10$FHsmDT2jEe8XQHnGZ9Cf2.Gyz5y2RXP1amTxSxNcjqEkjMG5wbm5K\', phoneNum=\'2222222\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('7d6b3380-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:16:32', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('7e35ba52-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:49:21', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 34, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('7e4b446e-2592-11ea-acaa-005056c00001', '2019-12-23 22:42:50', 'admin', '127.0.0.1', '/permission/findAll.do', 19, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('7ed7386a-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:36:15', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 25, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('7f3fcdaf-28bd-11ea-a089-b06ebf0d3dea', '2019-12-27 23:28:10', 'admin', '0:0:0:0:0:0:0:1', '/user/alter.do', 92, '[类名] cn.controller.UserController[方法名] alter[方法的参数 ](UserInfo{id=\'null\', email=\'111111\', username=\'text2\', password=\'$2a$10$KRvUlxA4BZAKE3H40lp/x.YR3PAh0Y/4fxtW0wOCDPkxvQxTQmp/G\', phoneNum=\'2222222\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('7f4799e1-28bd-11ea-a089-b06ebf0d3dea', '2019-12-27 23:28:11', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('7f4a8d73-28ac-11ea-a089-b06ebf0d3dea', '2019-12-27 21:26:29', 'admin', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 16, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('7f91d249-169d-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:53:46', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 6, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('7fe2d102-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:17:15', 'admin', '127.0.0.1', '/product/findAll.do', 33, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('7fe8ae72-1b59-11ea-927a-b06ebf0d3dea', '2019-12-10 22:29:37', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 18, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](1,2,)');
INSERT INTO `syslog` VALUES ('8031c72b-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:07:10', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('8035c286-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:47:52', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 20, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('804f1805-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:36:17', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 0, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('807fdebe-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:16:38', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 16, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('8094c0e8-1a8b-11ea-927a-b06ebf0d3dea', '2019-12-09 21:55:02', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('80a24aec-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:49:25', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 12, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('80c470d9-28ac-11ea-a089-b06ebf0d3dea', '2019-12-27 21:26:32', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 15, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('815ecdbf-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:36:19', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 15, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('815f0b8b-28d2-11ea-a089-b06ebf0d3dea', '2019-12-28 01:58:33', 'admin', '127.0.0.1', '/product/findByIdAlter.do', 17, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](676C5BD1D35E429A8C2E114939C5685A,)');
INSERT INTO `syslog` VALUES ('816d0b99-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:16:39', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('81a07c6d-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:17:18', 'admin', '127.0.0.1', '/product/findById.do', 115, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('81e0b5f4-1b55-11ea-927a-b06ebf0d3dea', '2019-12-10 22:01:02', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 15, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,398d679d-12b4-11ea-9f31-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('821d9944-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:36:20', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 0, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('826740c1-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:47:56', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 20, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](2,)');
INSERT INTO `syslog` VALUES ('826a51bb-1a8b-11ea-927a-b06ebf0d3dea', '2019-12-09 21:55:05', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 20, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](cdd798c6-1a8a-11ea-927a-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('82c9eda8-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:36:21', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 24, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('83468a48-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:18:05', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 16, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('8372dc69-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:36:22', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 0, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('83895202-28ac-11ea-a089-b06ebf0d3dea', '2019-12-27 21:26:36', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 12, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('83bb9ecc-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:17:22', 'admin', '127.0.0.1', '/product/findAll.do', 7, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('83d6a014-1b55-11ea-927a-b06ebf0d3dea', '2019-12-10 22:01:06', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 13, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('83e9e2e5-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:07:16', 'admin', '0:0:0:0:0:0:0:1', '/user/delete.do', 25, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](cb33ed74-1b53-11ea-927a-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('83ec0e53-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:07:16', 'admin', '0:0:0:0:0:0:0:1', '/user/delete.do', 14, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](cb33ed74-1b53-11ea-927a-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('83f32111-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:07:16', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 17, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('83fcf797-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:29:36', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 27, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('841fa48b-1a80-11ea-927a-b06ebf0d3dea', '2019-12-09 20:36:23', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('84466e62-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:49:32', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 17, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('845b45c9-1b63-11ea-927a-b06ebf0d3dea', '2019-12-10 23:41:20', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 15, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('847f5d43-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:17:23', 'admin', '127.0.0.1', '/product/findById.do', 14, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,398d679d-12b4-11ea-9f31-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('848a86d5-28a4-11ea-a089-b06ebf0d3dea', '2019-12-27 20:29:22', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 17, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('8498bb78-1a82-11ea-927a-b06ebf0d3dea', '2019-12-09 20:50:43', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 14, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('8509f075-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:19:33', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 161, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('8536e588-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:49:33', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 33, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('85a237ef-1b59-11ea-927a-b06ebf0d3dea', '2019-12-10 22:29:47', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 57, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('85a5651d-1b55-11ea-927a-b06ebf0d3dea', '2019-12-10 22:01:09', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 121, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('85cda753-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:17:25', 'admin', '127.0.0.1', '/product/findAll.do', 8, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('860e99fa-1a8b-11ea-927a-b06ebf0d3dea', '2019-12-09 21:55:11', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 12, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('862db126-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:18:10', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 16, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('86354eeb-2877-11ea-a089-b06ebf0d3dea', '2019-12-27 15:07:20', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,4,)');
INSERT INTO `syslog` VALUES ('8645eed8-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:49:35', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 14, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('86534d2a-28a4-11ea-a089-b06ebf0d3dea', '2019-12-27 20:29:25', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('866f8406-1a88-11ea-927a-b06ebf0d3dea', '2019-12-09 21:33:43', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 132, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('869dc43d-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:19:36', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 26, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('86ada38e-28a6-11ea-a089-b06ebf0d3dea', '2019-12-27 20:43:44', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 74, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('86cf0cda-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:18:11', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 10, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('86e464da-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:17:27', 'admin', '127.0.0.1', '/product/findById.do', 32, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('8704afa9-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:49:36', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 18, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](398d679d-12b4-11ea-9f31-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('871adccb-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:29:41', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('87410f08-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:48:04', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('87784998-1916-11ea-927a-b06ebf0d3dea', '2019-12-08 01:25:13', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 349, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('87c9069a-1a88-11ea-927a-b06ebf0d3dea', '2019-12-09 21:33:46', 'admin', '0:0:0:0:0:0:0:1', '/product/alter.do', 7, '[类名] cn.controller.ProductController[方法名] alter[方法的参数 ](Product{id=\'1287ABF2A4C544568B8A7C69F36BF8B7\', productNum=\'null\', productName=\'null\', cityName=\'null\', departureTime=null, departureTimeStr=\'null\', productPrice=0.0, productDesc=\'null\', productStatus=null, productStatusStr=\'null\'},)');
INSERT INTO `syslog` VALUES ('87cfcab8-28a2-11ea-a089-b06ebf0d3dea', '2019-12-27 20:15:08', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 128, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('87e1a08f-27a5-11ea-acaa-005056c00001', '2019-12-26 14:04:08', 'admin', '127.0.0.1', '/user/save.do', 335, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'2532725086@qq.com\', username=\'text1\', password=\'$2a$10$2QM92l0/3tYTPe4LxBJNzuF896wknAyTqcdl9rQ46vY9MXnEs9cIu\', phoneNum=\'13005602715\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('87e5db27-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:49:38', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 17, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('8826e612-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:48:05', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 11, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](f6f6c57a-0f46-11ea-a745-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('883f16fb-1b59-11ea-927a-b06ebf0d3dea', '2019-12-10 22:29:51', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 55, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](2,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('8874e882-28ac-11ea-a089-b06ebf0d3dea', '2019-12-27 21:26:44', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 4, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('88d49fb8-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:53:05', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('88da5185-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:19:39', 'admin', '0:0:0:0:0:0:0:1', '/user/delete.do', 9, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](e5cb7900-18fb-11ea-927a-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('88e4df2e-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:19:39', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 20, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('8939eba0-19d9-11ea-927a-b06ebf0d3dea', '2019-12-09 00:41:08', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 22, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('89ba237c-16bc-11ea-b69d-b06ebf0d3dea', '2019-12-05 01:35:58', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 15, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('8a132254-1afe-11ea-927a-b06ebf0d3dea', '2019-12-10 11:38:30', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 198, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('8a32909f-1b59-11ea-927a-b06ebf0d3dea', '2019-12-10 22:29:54', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 45, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('8a59b296-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:14:26', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 24, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('8a66fef7-1b63-11ea-927a-b06ebf0d3dea', '2019-12-10 23:41:30', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 5, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](1,2,)');
INSERT INTO `syslog` VALUES ('8b32ae3a-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:29:48', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 4, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](609b0ded-2256-11ea-ac96-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('8b416e6c-27a5-11ea-acaa-005056c00001', '2019-12-26 14:04:14', 'admin', '127.0.0.1', '/user/save.do', 210, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'2532725086@qq.com\', username=\'text1\', password=\'$2a$10$rQY6MNV7DQZO5nwjAKj71.wcjvP4EjVgNTUwYLDRbcajYuf6fYS36\', phoneNum=\'13005602715\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('8b5c1b93-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:17:34', 'admin', '127.0.0.1', '/orders/findById.do', 16, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](96CC8BD43C734CC2ACBFF09501B4DD5D,)');
INSERT INTO `syslog` VALUES ('8b75bb68-28be-11ea-a089-b06ebf0d3dea', '2019-12-27 23:35:40', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 96, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('8b8b3f24-28ac-11ea-a089-b06ebf0d3dea', '2019-12-27 21:26:50', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 11, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('8bca9d43-1916-11ea-927a-b06ebf0d3dea', '2019-12-08 01:25:21', 'admin', '0:0:0:0:0:0:0:1', '/user/delete.do', 8, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](,)');
INSERT INTO `syslog` VALUES ('8bd5666b-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:49:44', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 19, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('8bd69ee0-1916-11ea-927a-b06ebf0d3dea', '2019-12-08 01:25:21', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 12, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('8bdcbd43-2874-11ea-a089-b06ebf0d3dea', '2019-12-27 14:46:01', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 186, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('8bf1773f-28a6-11ea-a089-b06ebf0d3dea', '2019-12-27 20:43:53', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 16, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('8c7e3e32-1e6c-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:23:35', 'admin', '127.0.0.1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('8ca4db4a-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:53:12', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 11, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('8cad4db2-1a8b-11ea-927a-b06ebf0d3dea', '2019-12-09 21:55:22', 'admin', '0:0:0:0:0:0:0:1', '/user/delete.do', 14, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](cdd798c6-1a8a-11ea-927a-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('8cb318a7-1a8b-11ea-927a-b06ebf0d3dea', '2019-12-09 21:55:22', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 11, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('8cb8cdcc-1b63-11ea-927a-b06ebf0d3dea', '2019-12-10 23:41:34', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 17, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('8cefed13-28d1-11ea-a089-b06ebf0d3dea', '2019-12-28 01:51:43', 'admin', '127.0.0.1', '/user/addRoleToUser.do', 5, '[类名] cn.controller.UserController[方法名] addRoleToUser[方法的参数 ](d9635978-28d0-11ea-a089-b06ebf0d3dea,[Ljava.lang.String;@18388131,)');
INSERT INTO `syslog` VALUES ('8cf4ff38-28d1-11ea-a089-b06ebf0d3dea', '2019-12-28 01:51:43', 'admin', '127.0.0.1', '/user/findAll.do', 9, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('8cf87d67-175f-11ea-927a-b06ebf0d3dea', '2019-12-05 21:02:54', 'user', '0:0:0:0:0:0:0:1', '/user/findAll.do', 12, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('8cf883aa-1582-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:08:24', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 18, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('8d8ace3f-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:17:38', 'admin', '127.0.0.1', '/product/findById.do', 30, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('8d8e4c1b-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:29:52', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 10, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('8d9686f2-1e6c-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:23:36', 'admin', '127.0.0.1', '/user/findUserByIdAndAllRole.do', 13, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('8daddef6-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:14:32', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 8, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('8ddee4ba-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:53:14', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('8de4ed75-28be-11ea-a089-b06ebf0d3dea', '2019-12-27 23:35:45', 'admin', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 18, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('8df90f80-27bb-11ea-acaa-005056c00001', '2019-12-26 16:41:48', 'admin', '127.0.0.1', '/orders/findAll.do', 51, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('8e5d5964-292e-11ea-a089-b06ebf0d3dea', '2019-12-28 12:57:29', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('8e792de0-27a5-11ea-acaa-005056c00001', '2019-12-26 14:04:19', 'admin', '127.0.0.1', '/user/save.do', 190, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'2532725086@qq.com\', username=\'text1\', password=\'$2a$10$XAA7YXtwegAzZ6YFjmcmbeDg9C.wZnWuUhoQi5nxaouP9GYugGVmC\', phoneNum=\'13005602715\', status=0, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('8eddede4-1a8c-11ea-927a-b06ebf0d3dea', '2019-12-09 22:02:35', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 15, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('8efa306b-1bd8-11ea-b8f6-b06ebf0d3dea', '2019-12-11 13:39:11', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 274, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('8f0e2794-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:49:50', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 35, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](3081770BC3984EF092D9E99760FDABDE,)');
INSERT INTO `syslog` VALUES ('8f359c11-2874-11ea-a089-b06ebf0d3dea', '2019-12-27 14:46:07', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 59, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('8f4044e0-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:17:41', 'admin', '127.0.0.1', '/product/findAll.do', 5, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('8f4dceda-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:14:35', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 5, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('8f50c750-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:29:55', 'admin', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 11, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](6c58d2aa-1760-11ea-927a-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('8ff14a22-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:18:26', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 29, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('903ef4c7-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:48:19', 'admin', '0:0:0:0:0:0:0:1', '/user/addRoleToUser.do', 17, '[类名] cn.controller.UserController[方法名] addRoleToUser[方法的参数 ](f6f6c57a-0f46-11ea-a745-b06ebf0d3dea,[Ljava.lang.String;@27a0c60e,)');
INSERT INTO `syslog` VALUES ('9047ab2f-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:48:19', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('90659162-291d-11ea-a089-b06ebf0d3dea', '2019-12-28 10:55:51', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('9084816b-16b5-11ea-b69d-b06ebf0d3dea', '2019-12-05 00:46:03', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 10, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('90c1fb72-1582-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:08:30', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 17, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](3081770BC3984EF092D9E99760FDABDE,)');
INSERT INTO `syslog` VALUES ('90c6d930-1e6c-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:23:42', 'admin', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('913cb568-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:14:38', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 13, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('9175337b-1a8c-11ea-927a-b06ebf0d3dea', '2019-12-09 22:02:40', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 20, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('9192c67d-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:17:45', 'admin', '127.0.0.1', '/product/findAll.do', 6, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,4,)');
INSERT INTO `syslog` VALUES ('91c58730-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:48:21', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 14, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](f6f6c57a-0f46-11ea-a745-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('91fcdeaa-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:49:55', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('92118545-292e-11ea-a089-b06ebf0d3dea', '2019-12-28 12:57:35', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('92600346-1582-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:08:33', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('927c08e0-292f-11ea-a089-b06ebf0d3dea', '2019-12-28 13:04:45', 'sss2', '0:0:0:0:0:0:0:1', '/product/findAll.do', 29, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('929d532c-16b5-11ea-b69d-b06ebf0d3dea', '2019-12-05 00:46:06', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('929f83dd-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:18:31', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllRole.do', 17, '[类名] cn.controller.RoleController[方法名] findRoleByIdAndAllRole[方法的参数 ](1111,)');
INSERT INTO `syslog` VALUES ('92a30f27-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:53:22', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 4, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](775d58d6-2875-11ea-a089-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('92c13359-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:17:47', 'admin', '127.0.0.1', '/product/findById.do', 15, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,b784e129-12a7-11ea-9f31-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('930cab76-1a8c-11ea-927a-b06ebf0d3dea', '2019-12-09 22:02:42', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 19, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('9331686d-1afe-11ea-927a-b06ebf0d3dea', '2019-12-10 11:38:45', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 19, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('93939941-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:49:57', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 22, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](676C5BD1D35E429A8C2E114939C5685A,)');
INSERT INTO `syslog` VALUES ('9394ff5d-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:14:42', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 18, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](3,5,)');
INSERT INTO `syslog` VALUES ('93edcdbe-292e-11ea-a089-b06ebf0d3dea', '2019-12-28 12:57:38', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 7, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](775d58d6-2875-11ea-a089-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('93fb4c70-28a5-11ea-a089-b06ebf0d3dea', '2019-12-27 20:36:57', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 49, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](6c58d2aa-1760-11ea-927a-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('94256658-1a8c-11ea-927a-b06ebf0d3dea', '2019-12-09 22:02:44', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 22, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('94575350-1a8c-11ea-927a-b06ebf0d3dea', '2019-12-09 22:02:45', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('9461c2e0-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:30:04', 'admin', '0:0:0:0:0:0:0:1', '/user/alter.do', 92, '[类名] cn.controller.UserController[方法名] alter[方法的参数 ](UserInfo{id=\'6c58d2aa-1760-11ea-927a-b06ebf0d3dea\', email=\'12342423423@qq.com\', username=\'sss\', password=\'$2a$10$oYBjm8hpnWQvwxK9oyJnEetuE4qd4YrhzKe5JVnSH.WlpTMgAYzZq\', phoneNum=\'1453336256\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('946a4489-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:30:04', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('947b38bd-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:18:34', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('94a32716-28be-11ea-a089-b06ebf0d3dea', '2019-12-27 23:35:56', 'admin', '0:0:0:0:0:0:0:1', '/user/alter.do', 100, '[类名] cn.controller.UserController[方法名] alter[方法的参数 ](UserInfo{id=\'077cc486-27a6-11ea-acaa-005056c00001\', email=\'111111\', username=\'text2\', password=\'$2a$10$TNW02cZPJm1D9wpU8s7mX.A6wVrynaeuq/Bq8B9NH34cRugKn.u2G\', phoneNum=\'2222222\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('94adee66-28be-11ea-a089-b06ebf0d3dea', '2019-12-27 23:35:56', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('94e3350a-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:14:44', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 6, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](7,5,)');
INSERT INTO `syslog` VALUES ('94e74d92-27a5-11ea-acaa-005056c00001', '2019-12-26 14:04:30', 'admin', '127.0.0.1', '/user/save.do', 218, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'2532725086@qq.com\', username=\'text1\', password=\'$2a$10$txSV3U4/KlNljcoGTvzEdOICKq8FiISBLSUQ87OgCetYUa5NnhG9u\', phoneNum=\'13005602715\', status=0, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('952e7074-292e-11ea-a089-b06ebf0d3dea', '2019-12-28 12:57:40', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('9552fd6b-28d1-11ea-a089-b06ebf0d3dea', '2019-12-28 01:51:57', 'admin', '127.0.0.1', '/user/findAll.do', 11, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('955f6fb2-28a5-11ea-a089-b06ebf0d3dea', '2019-12-27 20:37:00', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 9, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('960c0b2b-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:53:28', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 15, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('96318678-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:48:29', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('96682d75-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:20:02', 'admin', '0:0:0:0:0:0:0:1', '/user/save.do', 446, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'12342423423@qq.com\', username=\'admin2\', password=\'$2a$10$5Rd01a4EYVX6PuFfVwKEFekRTjH8rryR2HoPVvGJjb0gY4.cr7EUW\', phoneNum=\'1452336256\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('96f87a7c-1a8c-11ea-927a-b06ebf0d3dea', '2019-12-09 22:02:49', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 20, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](1,2,)');
INSERT INTO `syslog` VALUES ('96f8ce65-2590-11ea-acaa-005056c00001', '2019-12-23 22:29:12', 'admin', '127.0.0.1', '/user/findString.do', 117, '[类名] cn.controller.UserController[方法名] findString[方法的参数 ](0,5,,)');
INSERT INTO `syslog` VALUES ('9725a353-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:53:29', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 20, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](775d58d6-2875-11ea-a089-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('9725ed69-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:14:48', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 28, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('973ee14e-2590-11ea-acaa-005056c00001', '2019-12-23 22:29:13', 'admin', '127.0.0.1', '/user/findString.do', 11, '[类名] cn.controller.UserController[方法名] findString[方法的参数 ](0,5,,)');
INSERT INTO `syslog` VALUES ('97431152-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:30:09', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 10, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](6c58d2aa-1760-11ea-927a-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('97841a0a-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:48:31', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 8, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](6c58d2aa-1760-11ea-927a-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('9796a86e-1a8c-11ea-927a-b06ebf0d3dea', '2019-12-09 22:02:50', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 13, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,2,)');
INSERT INTO `syslog` VALUES ('97fa50d2-22eb-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:43:04', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 138, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('9801bf06-1a8c-11ea-927a-b06ebf0d3dea', '2019-12-09 22:02:51', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 3, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,2,)');
INSERT INTO `syslog` VALUES ('9815083d-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:14:49', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 4, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('98235c40-292e-11ea-a089-b06ebf0d3dea', '2019-12-28 12:57:45', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('986f15d1-1a7a-11ea-927a-b06ebf0d3dea', '2019-12-09 19:54:01', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('9878bcba-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:14:50', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 14, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](4,5,)');
INSERT INTO `syslog` VALUES ('98a62969-1cea-11ea-ac96-b06ebf0d3dea', '2019-12-12 22:20:49', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 109, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('98d93469-27a7-11ea-acaa-005056c00001', '2019-12-26 14:18:56', 'text1', '127.0.0.1', '/product/findString.do', 290, '[类名] cn.controller.ProductController[方法名] findString[方法的参数 ](0,4,北京,)');
INSERT INTO `syslog` VALUES ('98eca04a-19d5-11ea-927a-b06ebf0d3dea', '2019-12-09 00:12:57', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 198, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('9914c1be-2590-11ea-acaa-005056c00001', '2019-12-23 22:29:16', 'admin', '127.0.0.1', '/role/findAll.do', 23, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('993060f4-1a8c-11ea-927a-b06ebf0d3dea', '2019-12-09 22:02:53', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 3, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](398d679d-12b4-11ea-9f31-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('99d1c3b1-1b4f-11ea-927a-b06ebf0d3dea', '2019-12-10 21:18:46', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 17, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('99d8caef-27a7-11ea-acaa-005056c00001', '2019-12-26 14:18:58', 'text1', '127.0.0.1', '/product/findAll.do', 7, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('9a352c67-1e6c-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:23:57', 'admin', '127.0.0.1', '/user/save.do', 90, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'\', username=\'abin\', password=\'$2a$10$TFwcm8hoJEQjGYdGjA8tMuj8vBTlyPuaSU/aMjP8C9bv5g7Rwd7/C\', phoneNum=\'\', status=0, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('9a3a2df0-1e6c-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:23:58', 'admin', '127.0.0.1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('9a4d1de2-1a8c-11ea-927a-b06ebf0d3dea', '2019-12-09 22:02:55', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 15, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,2,)');
INSERT INTO `syslog` VALUES ('9a533ac8-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:30:14', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('9a8819dd-1cea-11ea-ac96-b06ebf0d3dea', '2019-12-12 22:20:52', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 134, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('9a8b7d7d-1a7a-11ea-927a-b06ebf0d3dea', '2019-12-09 19:54:04', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 18, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('9a9a080c-27a7-11ea-acaa-005056c00001', '2019-12-26 14:18:59', 'text1', '127.0.0.1', '/product/findString.do', 151, '[类名] cn.controller.ProductController[方法名] findString[方法的参数 ](0,4,北京,)');
INSERT INTO `syslog` VALUES ('9ab43471-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:20:09', 'admin', '0:0:0:0:0:0:0:1', '/user/save.do', 218, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'12342423423@qq.com\', username=\'admin2\', password=\'$2a$10$X/RV7IAFXi.LA.aGtQLN4OY1PhXrqBP0ysqNTEm97UwPmxHuG08tu\', phoneNum=\'14523362562\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('9ac8248a-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:53:36', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 10, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('9b65af30-292e-11ea-a089-b06ebf0d3dea', '2019-12-28 12:57:51', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 8, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](a706dbcb-2911-11ea-a089-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('9b96859b-27a7-11ea-acaa-005056c00001', '2019-12-26 14:19:01', 'text1', '127.0.0.1', '/product/findAll.do', 8, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('9b9d325d-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:48:38', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 17, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('9bf37f84-1a8c-11ea-927a-b06ebf0d3dea', '2019-12-09 22:02:57', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 27, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('9c20bc24-1e78-11ea-ac96-b06ebf0d3dea', '2019-12-14 21:49:55', 'admin', '127.0.0.1', '/product/findAll.do', 10, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('9c2d09a5-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:14:56', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 11, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](5,5,)');
INSERT INTO `syslog` VALUES ('9c7540e5-1b62-11ea-927a-b06ebf0d3dea', '2019-12-10 23:34:50', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 311, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('9cac9a6a-1e6c-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:24:02', 'admin', '127.0.0.1', '/user/findUserByIdAndAllRole.do', 6, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](9a3497d3-1e6c-11ea-ac96-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('9ccf5fa6-1a8c-11ea-927a-b06ebf0d3dea', '2019-12-09 22:02:59', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 39, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('9d0fca8a-1a7a-11ea-927a-b06ebf0d3dea', '2019-12-09 19:54:08', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 16, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('9d6127f5-1a7a-11ea-927a-b06ebf0d3dea', '2019-12-09 19:54:09', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 22, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('9d6201c8-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:48:41', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 23, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('9e16edf0-2258-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:10:56', 'admin', '127.0.0.1', '/sysLog/findAll.do', 75, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('9e75d898-19dc-11ea-927a-b06ebf0d3dea', '2019-12-09 01:03:13', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('9e9a5863-1b4f-11ea-927a-b06ebf0d3dea', '2019-12-10 21:18:54', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 12, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('9ebab3e2-1b2d-11ea-927a-b06ebf0d3dea', '2019-12-10 17:15:31', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 173, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('9ee72b48-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:15:01', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 11, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](4,5,)');
INSERT INTO `syslog` VALUES ('9ef58f07-1a7a-11ea-927a-b06ebf0d3dea', '2019-12-09 19:54:11', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('9f0686c1-1b1f-11ea-927a-b06ebf0d3dea', '2019-12-10 15:35:18', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 253, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('9f81a2b7-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:18:08', 'admin', '127.0.0.1', '/product/findAll.do', 9, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,4,)');
INSERT INTO `syslog` VALUES ('9fa64298-1b2d-11ea-927a-b06ebf0d3dea', '2019-12-10 17:15:33', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 15, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('a01115f7-1761-11ea-927a-b06ebf0d3dea', '2019-12-05 21:17:45', 'sss', '0:0:0:0:0:0:0:1', '/product/findAll.do', 20, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('a0640c3c-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:15:03', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 12, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](3,5,)');
INSERT INTO `syslog` VALUES ('a09960e3-1a7a-11ea-927a-b06ebf0d3dea', '2019-12-09 19:54:14', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 0, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('a0a771e5-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:20:19', 'admin', '0:0:0:0:0:0:0:1', '/user/save.do', 89, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'123424232423@qq.com\', username=\'admin2\', password=\'$2a$10$d20FiGOoCY9CmIiAPKqyIuUEMt9rnTaKUKKa12c3jmBM5D3YaPOqK\', phoneNum=\'14523362562\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('a0ab3e41-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:20:19', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('a0e4a179-27a7-11ea-acaa-005056c00001', '2019-12-26 14:19:10', 'text1', '127.0.0.1', '/product/findString.do', 13, '[类名] cn.controller.ProductController[方法名] findString[方法的参数 ](0,4,aaa,)');
INSERT INTO `syslog` VALUES ('a0f9e27b-27a5-11ea-acaa-005056c00001', '2019-12-26 14:04:51', 'admin', '127.0.0.1', '/user/save.do', 88, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'2222222\', username=\'text1\', password=\'$2a$10$T4JUJBK9cewcIUbNZEgqnOF56LiodNTb1P.ZoHJy9euIiNAhA2lx.\', phoneNum=\'2222222\', status=0, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('a102abf0-27a5-11ea-acaa-005056c00001', '2019-12-26 14:04:51', 'admin', '127.0.0.1', '/user/findAll.do', 13, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('a14d8733-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:15:05', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 6, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('a15a9b0e-1b1f-11ea-927a-b06ebf0d3dea', '2019-12-10 15:35:22', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 19, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('a1843b0f-27eb-11ea-acaa-005056c00001', '2019-12-26 22:25:56', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 15, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('a19523d9-1a7a-11ea-927a-b06ebf0d3dea', '2019-12-09 19:54:16', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 63, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('a1ffc686-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:15:06', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 10, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('a23af1bb-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:10:47', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 281, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('a2526c4c-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:15:07', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 13, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('a27586d8-16b0-11ea-b69d-b06ebf0d3dea', '2019-12-05 00:10:45', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 12, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('a2969132-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:18:13', 'admin', '127.0.0.1', '/product/findAll.do', 16, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,4,)');
INSERT INTO `syslog` VALUES ('a2dd348f-1a8c-11ea-927a-b06ebf0d3dea', '2019-12-09 22:03:09', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 13, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('a2f386a6-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:15:08', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 5, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('a30b09ee-1c0d-11ea-b8f6-b06ebf0d3dea', '2019-12-11 19:59:08', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('a31b5cb2-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:48:50', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllRole.do', 3, '[类名] cn.controller.RoleController[方法名] findRoleByIdAndAllRole[方法的参数 ](8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('a34bf58e-159c-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:15:08', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 5, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](3,5,)');
INSERT INTO `syslog` VALUES ('a3904380-16b0-11ea-b69d-b06ebf0d3dea', '2019-12-05 00:10:47', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 22, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('a4065520-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:18:16', 'admin', '127.0.0.1', '/product/findAll.do', 8, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,4,)');
INSERT INTO `syslog` VALUES ('a44c98a4-1754-11ea-927a-b06ebf0d3dea', '2019-12-05 19:44:48', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 69, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('a45c5383-292e-11ea-a089-b06ebf0d3dea', '2019-12-28 12:58:06', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('a46bf5a7-16b0-11ea-b69d-b06ebf0d3dea', '2019-12-05 00:10:49', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 11, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('a49af38d-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:10:52', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 36, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('a4b09871-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:18:17', 'admin', '127.0.0.1', '/product/findAll.do', 10, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](1,4,)');
INSERT INTO `syslog` VALUES ('a4bf70dd-1b52-11ea-927a-b06ebf0d3dea', '2019-12-10 21:40:32', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 170, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('a4c4bb4a-1a8c-11ea-927a-b06ebf0d3dea', '2019-12-09 22:03:12', 'admin', '0:0:0:0:0:0:0:1', '/orders/findByIdOnlyOrder.do', 7, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('a5917b45-16b0-11ea-b69d-b06ebf0d3dea', '2019-12-05 00:10:51', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 10, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('a5955246-1a7a-11ea-927a-b06ebf0d3dea', '2019-12-09 19:54:23', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 12, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('a5b09a6d-292e-11ea-a089-b06ebf0d3dea', '2019-12-28 12:58:08', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 7, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](a706dbcb-2911-11ea-a089-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('a642d774-16b0-11ea-b69d-b06ebf0d3dea', '2019-12-05 00:10:52', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 11, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('a684d2c1-1b62-11ea-927a-b06ebf0d3dea', '2019-12-10 23:35:07', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 72, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('a707c23d-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:30:35', 'admin', '0:0:0:0:0:0:0:1', '/user/save.do', 91, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'14522335@qq.com\', username=\'sss2\', password=\'$2a$10$3OxbrcHf83Wg6Yj06m0eMeJLUey4f8W1AVC7OEuyzIyQZzDzxfJPu\', phoneNum=\'14522565865\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('a70bfd25-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:30:35', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('a73aeb97-1b52-11ea-927a-b06ebf0d3dea', '2019-12-10 21:40:37', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 70, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1,5,1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('a73ec5ea-1c0d-11ea-b8f6-b06ebf0d3dea', '2019-12-11 19:59:15', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('a75ff6f2-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:10:56', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 9, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('a7a52743-27eb-11ea-acaa-005056c00001', '2019-12-26 22:26:07', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('a7dd42e3-28bd-11ea-a089-b06ebf0d3dea', '2019-12-27 23:29:19', 'admin', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 12, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('a7e7c744-1a8c-11ea-927a-b06ebf0d3dea', '2019-12-09 22:03:17', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 23, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('a8278df2-1b62-11ea-927a-b06ebf0d3dea', '2019-12-10 23:35:10', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 25, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('a89ab938-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:10:58', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 52, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('a8fb8e88-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:49:00', 'admin', '0:0:0:0:0:0:0:1', '/role/addPermissionToRole.do', 16, '[类名] cn.controller.RoleController[方法名] addPermissionToRole[方法的参数 ](8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea,[Ljava.lang.String;@228766a4,)');
INSERT INTO `syslog` VALUES ('a9047d38-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:49:00', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('a97f8548-1e4c-11ea-ac96-b06ebf0d3dea', '2019-12-14 16:35:19', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllRole.do', 25, '[类名] cn.controller.RoleController[方法名] findRoleByIdAndAllRole[方法的参数 ](1111,)');
INSERT INTO `syslog` VALUES ('a99f2adb-1b62-11ea-927a-b06ebf0d3dea', '2019-12-10 23:35:13', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 103, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('a9a5acc0-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:30:39', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('a9aa4bf7-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:56:57', 'admin', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('a9b8d71a-28bd-11ea-a089-b06ebf0d3dea', '2019-12-27 23:29:22', 'admin', '0:0:0:0:0:0:0:1', '/user/alter.do', 86, '[类名] cn.controller.UserController[方法名] alter[方法的参数 ](UserInfo{id=\'null\', email=\'111111\', username=\'text2\', password=\'$2a$10$75dWMJsnrCAheIRea7eZG.7yTxng60G9dgAiCSWJLjv7iZPOJL1Wa\', phoneNum=\'2222222\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('a9be61fb-28bd-11ea-a089-b06ebf0d3dea', '2019-12-27 23:29:22', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('a9c54524-291c-11ea-a089-b06ebf0d3dea', '2019-12-28 10:49:24', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 106, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('a9f5947e-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:17:47', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,10,)');
INSERT INTO `syslog` VALUES ('aa7f9c6e-1b2c-11ea-927a-b06ebf0d3dea', '2019-12-10 17:08:41', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 34, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('aa93ec34-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:49:03', 'admin', '0:0:0:0:0:0:0:1', '/role/findById', 17, '[类名] cn.controller.RoleController[方法名] findById[方法的参数 ](8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('aaec1c0f-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:30:41', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 5, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](a706dbcb-2911-11ea-a089-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('aaf3b8ae-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:20:36', 'admin', '0:0:0:0:0:0:0:1', '/user/save.do', 90, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'123313123@qq.com\', username=\'admin3\', password=\'$2a$10$4mrCTLrvfsexAt6pzr0ZtuJva0vVCJSuCEQXKpM.hEvgNYTM7Xy1e\', phoneNum=\'175332668695\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('aaf8534c-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:20:37', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('ab396a5a-1afc-11ea-927a-b06ebf0d3dea', '2019-12-10 11:25:07', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 39, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('ab700719-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:54:03', 'admin', '0:0:0:0:0:0:0:1', '/user/save.do', 100, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'14522235@qq.com\', username=\'admin6\', password=\'$2a$10$rz6Pc0hL5Z4PZ2OQc0jJyODVINBHBO65aWvGXnDhHH/cKAdeE0Ebq\', phoneNum=\'17532668595\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('ab74340b-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:54:04', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 10, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('ac4b15cd-1b62-11ea-927a-b06ebf0d3dea', '2019-12-10 23:35:17', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 122, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('ac4f5ef7-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:11:04', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 429, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,3,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('ac5bf5e7-1e77-11ea-ac96-b06ebf0d3dea', '2019-12-14 21:43:12', 'admin', '127.0.0.1', '/permission/findAll.do', 5, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('ac618290-28a5-11ea-a089-b06ebf0d3dea', '2019-12-27 20:37:38', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 16, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('acf9291b-291c-11ea-a089-b06ebf0d3dea', '2019-12-28 10:49:29', 'admin', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 10, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('ad0b5bfa-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:30:45', 'admin', '0:0:0:0:0:0:0:1', '/user/addRoleToUser.do', 13, '[类名] cn.controller.UserController[方法名] addRoleToUser[方法的参数 ](a706dbcb-2911-11ea-a089-b06ebf0d3dea,[Ljava.lang.String;@38935c40,)');
INSERT INTO `syslog` VALUES ('ad108077-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:30:45', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('ad8f0bee-292f-11ea-a089-b06ebf0d3dea', '2019-12-28 13:05:31', 'sss2', '0:0:0:0:0:0:0:1', '/product/findById.do', 25, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('ad9e2065-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:17:53', 'admin', '0:0:0:0:0:0:0:1', '/user/delete.do', 8, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](7d62c8cb-28b3-11ea-a089-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('ada3a791-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:17:53', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('adb7e37f-19db-11ea-927a-b06ebf0d3dea', '2019-12-09 00:56:29', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 15, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('adbae86c-1c0d-11ea-b8f6-b06ebf0d3dea', '2019-12-11 19:59:26', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](1,1,)');
INSERT INTO `syslog` VALUES ('adf4c67c-1afc-11ea-927a-b06ebf0d3dea', '2019-12-10 11:25:11', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 19, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('ae2d9875-1e77-11ea-ac96-b06ebf0d3dea', '2019-12-14 21:43:15', 'admin', '127.0.0.1', '/sysLog/findAll.do', 44, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('ae44be45-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:11:08', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 62, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](2,3,12B7ABF2A4C544568B0A7C69F36BF8B7,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('ae7cc60f-1e4c-11ea-ac96-b06ebf0d3dea', '2019-12-14 16:35:28', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 16, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('aecc3758-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:20:43', 'admin', '0:0:0:0:0:0:0:1', '/user/delete.do', 5, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](aaf2c896-19d6-11ea-927a-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('aece2e48-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:20:43', 'admin', '0:0:0:0:0:0:0:1', '/user/delete.do', 9, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](aaf2c896-19d6-11ea-927a-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('aed3ee3f-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:20:43', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 12, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('aed43461-22eb-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:43:43', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 30, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('aed45e12-292f-11ea-a089-b06ebf0d3dea', '2019-12-28 13:05:33', 'sss2', '0:0:0:0:0:0:0:1', '/product/findAll.do', 13, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('aee0960e-1b54-11ea-927a-b06ebf0d3dea', '2019-12-10 21:55:08', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 114, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('af21ad05-1c0d-11ea-b8f6-b06ebf0d3dea', '2019-12-11 19:59:28', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](1,2,)');
INSERT INTO `syslog` VALUES ('af826d5b-2258-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:11:26', 'admin', '127.0.0.1', '/sysLog/findString.do', 28, '[类名] cn.controller.SysLogController[方法名] findString[方法的参数 ](0,744,12-19,)');
INSERT INTO `syslog` VALUES ('af929ccd-1afa-11ea-927a-b06ebf0d3dea', '2019-12-10 11:10:55', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 237, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('afc89270-1b61-11ea-927a-b06ebf0d3dea', '2019-12-10 23:28:13', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 40, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('affa5cff-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:19:20', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllRole.do', 12, '[类名] cn.controller.RoleController[方法名] findRoleByIdAndAllRole[方法的参数 ](2222,)');
INSERT INTO `syslog` VALUES ('b00c91ad-291c-11ea-a089-b06ebf0d3dea', '2019-12-28 10:49:34', 'admin', '0:0:0:0:0:0:0:1', '/user/alter.do', 88, '[类名] cn.controller.UserController[方法名] alter[方法的参数 ](UserInfo{id=\'077cc486-27a6-11ea-acaa-005056c00001\', email=\'111222\', username=\'text2\', password=\'$2a$10$a09Ffi/jW51epwsYMFC6reCebF796sTYh8T7s80jclrQTmwf6J3Ri\', phoneNum=\'1111111\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('b0187913-291c-11ea-a089-b06ebf0d3dea', '2019-12-28 10:49:35', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('b038e8fc-1b22-11ea-927a-b06ebf0d3dea', '2019-12-10 15:57:16', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 162, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('b16aaf46-1a85-11ea-927a-b06ebf0d3dea', '2019-12-09 21:13:27', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 16, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('b19c7d26-2911-11ea-a089-b06ebf0d3dea', '2019-12-28 09:30:53', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('b1b87122-16b0-11ea-b69d-b06ebf0d3dea', '2019-12-05 00:11:11', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 12, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('b1f025d9-292f-11ea-a089-b06ebf0d3dea', '2019-12-28 13:05:38', 'sss2', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 60, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('b2059d6a-1afa-11ea-927a-b06ebf0d3dea', '2019-12-10 11:10:59', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 39, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('b2236d7d-19db-11ea-927a-b06ebf0d3dea', '2019-12-09 00:56:36', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('b24ec006-1e4c-11ea-ac96-b06ebf0d3dea', '2019-12-14 16:35:34', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 4, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('b26858b3-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:11:15', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 47, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,3,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('b26d0bc1-1b22-11ea-927a-b06ebf0d3dea', '2019-12-10 15:57:20', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 5, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('b2fd2f16-2256-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:57:12', 'admin', '127.0.0.1', '/user/findString.do', 280, '[类名] cn.controller.UserController[方法名] findString[方法的参数 ](0,5,sss,)');
INSERT INTO `syslog` VALUES ('b31973b1-292f-11ea-a089-b06ebf0d3dea', '2019-12-28 13:05:40', 'sss2', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('b330d3f0-1c0d-11ea-b8f6-b06ebf0d3dea', '2019-12-11 19:59:35', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllRole.do', 11, '[类名] cn.controller.RoleController[方法名] findRoleByIdAndAllRole[方法的参数 ](1111,)');
INSERT INTO `syslog` VALUES ('b33edbd3-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:19:26', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 16, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('b3776029-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:11:17', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 44, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](2,3,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('b3be0214-1b54-11ea-927a-b06ebf0d3dea', '2019-12-10 21:55:17', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 23, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('b3e5ce3d-1e4c-11ea-ac96-b06ebf0d3dea', '2019-12-14 16:35:37', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 3, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('b406c233-22eb-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:43:52', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 26, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('b43a2fb3-19db-11ea-927a-b06ebf0d3dea', '2019-12-09 00:56:40', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 18, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('b4aecc2d-291c-11ea-a089-b06ebf0d3dea', '2019-12-28 10:49:42', 'text2', '0:0:0:0:0:0:0:1', '/user/findAll.do', 12, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('b4ca2727-1afc-11ea-927a-b06ebf0d3dea', '2019-12-10 11:25:23', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 24, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('b4cc306f-1b62-11ea-927a-b06ebf0d3dea', '2019-12-10 23:35:31', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 65, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('b4eb542e-1a83-11ea-927a-b06ebf0d3dea', '2019-12-09 20:59:14', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('b517af2b-22eb-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:43:53', 'admin', '0:0:0:0:0:0:0:1', '/role/findById', 9, '[类名] cn.controller.RoleController[方法名] findById[方法的参数 ](1111,)');
INSERT INTO `syslog` VALUES ('b5244b6c-1c0d-11ea-b8f6-b06ebf0d3dea', '2019-12-11 19:59:38', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](1,2,)');
INSERT INTO `syslog` VALUES ('b53a89b7-2592-11ea-acaa-005056c00001', '2019-12-23 22:44:22', 'admin', '127.0.0.1', '/sysLog/findAll.do', 88, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('b590d770-1e78-11ea-ac96-b06ebf0d3dea', '2019-12-14 21:50:37', 'admin', '127.0.0.1', '/product/findAll.do', 8, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('b5afbbe2-191c-11ea-927a-b06ebf0d3dea', '2019-12-08 02:09:28', 'admin', '0:0:0:0:0:0:0:1', '/user/delete.do', 11, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](,)');
INSERT INTO `syslog` VALUES ('b5b6d02e-191c-11ea-927a-b06ebf0d3dea', '2019-12-08 02:09:28', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('b5d7eddd-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:19:30', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 26, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('b5edd883-1afc-11ea-927a-b06ebf0d3dea', '2019-12-10 11:25:25', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 5, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('b5efb532-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:11:21', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 23, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](2,3,12B7ABF2A4C544568B0A7C69F36BF8B7,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('b5fe28ea-27a5-11ea-acaa-005056c00001', '2019-12-26 14:05:26', 'admin', '127.0.0.1', '/user/findUserByIdAndAllRole.do', 6, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](a0f912f7-27a5-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('b614ce3e-1a83-11ea-927a-b06ebf0d3dea', '2019-12-09 20:59:16', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 9, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('b63b787a-1c0d-11ea-b8f6-b06ebf0d3dea', '2019-12-11 19:59:40', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllRole.do', 10, '[类名] cn.controller.RoleController[方法名] findRoleByIdAndAllRole[方法的参数 ](2222,)');
INSERT INTO `syslog` VALUES ('b6e348ec-1b62-11ea-927a-b06ebf0d3dea', '2019-12-10 23:35:35', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 139, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('b7215a35-1afc-11ea-927a-b06ebf0d3dea', '2019-12-10 11:25:27', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 17, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('b76b1149-19db-11ea-927a-b06ebf0d3dea', '2019-12-09 00:56:45', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('b777fd06-1c0d-11ea-b8f6-b06ebf0d3dea', '2019-12-11 19:59:42', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 16, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](1,2,)');
INSERT INTO `syslog` VALUES ('b88771ef-19db-11ea-927a-b06ebf0d3dea', '2019-12-09 00:56:47', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 11, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](2FF351C4AC744E2092DCF08CFD314420,)');
INSERT INTO `syslog` VALUES ('b8b31376-1c0d-11ea-b8f6-b06ebf0d3dea', '2019-12-11 19:59:44', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllRole.do', 6, '[类名] cn.controller.RoleController[方法名] findRoleByIdAndAllRole[方法的参数 ](2222,)');
INSERT INTO `syslog` VALUES ('b8c35bc0-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:18:51', 'admin', '127.0.0.1', '/sysLog/findAll.do', 28, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('b90e8686-1e91-11ea-ac96-b06ebf0d3dea', '2019-12-15 00:49:41', 'admin', '127.0.0.1', '/product/findAll.do', 19, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('b91a949e-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:11:26', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 6, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,3,,)');
INSERT INTO `syslog` VALUES ('b92446e7-19d9-11ea-927a-b06ebf0d3dea', '2019-12-09 00:42:29', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,4,)');
INSERT INTO `syslog` VALUES ('b9810576-19da-11ea-927a-b06ebf0d3dea', '2019-12-09 00:49:39', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 13, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('babb0367-2920-11ea-a089-b06ebf0d3dea', '2019-12-28 11:18:30', 'admin', '0:0:0:0:0:0:0:1', '/role/findById', 7, '[类名] cn.controller.RoleController[方法名] findById[方法的参数 ](8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('babc3318-1a83-11ea-927a-b06ebf0d3dea', '2019-12-09 20:59:24', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 16, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('badef192-292f-11ea-a089-b06ebf0d3dea', '2019-12-28 13:05:53', 'sss2', '0:0:0:0:0:0:0:1', '/product/findAll.do', 11, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('bafacc96-1c0d-11ea-b8f6-b06ebf0d3dea', '2019-12-11 19:59:48', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](1,2,)');
INSERT INTO `syslog` VALUES ('bb177d82-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:49:31', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('bb3a6ffe-19db-11ea-927a-b06ebf0d3dea', '2019-12-09 00:56:51', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 11, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('bbcd738a-1a83-11ea-927a-b06ebf0d3dea', '2019-12-09 20:59:25', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 24, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('bbd8a9b5-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:48:21', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 28, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('bbf39a12-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:11:31', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 6, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,3,,)');
INSERT INTO `syslog` VALUES ('bc918bf5-28d1-11ea-a089-b06ebf0d3dea', '2019-12-28 01:53:03', 'admin', '127.0.0.1', '/sysLog/findAll.do', 16, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('bcb510a9-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:49:33', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 5, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](6c58d2aa-1760-11ea-927a-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('bd04864b-1b54-11ea-927a-b06ebf0d3dea', '2019-12-10 21:55:32', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 23, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('bd139514-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:11:33', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 8, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,3,,)');
INSERT INTO `syslog` VALUES ('bd4295c6-19db-11ea-927a-b06ebf0d3dea', '2019-12-09 00:56:55', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 11, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](2FF351C4AC744E2092DCF08CFD314420,)');
INSERT INTO `syslog` VALUES ('bd7c1d85-1697-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:12:33', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 117, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('bdfefec4-2920-11ea-a089-b06ebf0d3dea', '2019-12-28 11:18:36', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 11, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('be007530-1b54-11ea-927a-b06ebf0d3dea', '2019-12-10 21:55:34', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 32, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('be9d4486-16b6-11ea-b69d-b06ebf0d3dea', '2019-12-05 00:54:29', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 111, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('becb31b7-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:21:10', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 14, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](2,)');
INSERT INTO `syslog` VALUES ('bf664be0-1b54-11ea-927a-b06ebf0d3dea', '2019-12-10 21:55:36', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('bf809039-2920-11ea-a089-b06ebf0d3dea', '2019-12-28 11:18:38', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllRole.do', 4, '[类名] cn.controller.RoleController[方法名] findRoleByIdAndAllRole[方法的参数 ](8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('c00c0d03-1a83-11ea-927a-b06ebf0d3dea', '2019-12-09 20:59:32', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('c042469a-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:19:47', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 3, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('c04525c4-1b54-11ea-927a-b06ebf0d3dea', '2019-12-10 21:55:38', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 45, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('c0466c3c-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:21:12', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('c06d62ba-27a4-11ea-acaa-005056c00001', '2019-12-26 13:58:34', 'admin', '127.0.0.1', '/user/findAll.do', 100, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('c0830452-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:19:04', 'admin', '127.0.0.1', '/role/findAll.do', 4, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('c0d7d2e8-1db9-11ea-ac96-b06ebf0d3dea', '2019-12-13 23:03:42', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 120, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('c0f66496-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:21:13', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 22, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](2,)');
INSERT INTO `syslog` VALUES ('c1268000-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:49:41', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 15, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('c13867aa-1a83-11ea-927a-b06ebf0d3dea', '2019-12-09 20:59:34', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 27, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('c1882310-1b62-11ea-927a-b06ebf0d3dea', '2019-12-10 23:35:53', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 49, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('c1aa64b1-2874-11ea-a089-b06ebf0d3dea', '2019-12-27 14:47:31', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 189, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('c1d14636-19db-11ea-927a-b06ebf0d3dea', '2019-12-09 00:57:02', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 5, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('c20af171-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:19:50', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 5, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('c256f997-1b46-11ea-927a-b06ebf0d3dea', '2019-12-10 20:15:28', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 19, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('c28b1d71-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:19:07', 'admin', '127.0.0.1', '/permission/findAll.do', 5, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('c2ddfd7c-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:48:33', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('c2f17a72-1a83-11ea-927a-b06ebf0d3dea', '2019-12-09 20:59:37', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 18, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('c3698358-1760-11ea-927a-b06ebf0d3dea', '2019-12-05 21:11:35', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 9, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('c36ffdd0-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:21:18', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('c3c6c5de-1b46-11ea-927a-b06ebf0d3dea', '2019-12-10 20:15:31', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 12, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('c3f2d943-1e4b-11ea-ac96-b06ebf0d3dea', '2019-12-14 16:28:54', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 108, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('c411e791-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:19:10', 'admin', '127.0.0.1', '/user/findAll.do', 3, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('c4c12a2c-1e91-11ea-ac96-b06ebf0d3dea', '2019-12-15 00:50:00', 'admin', '127.0.0.1', '/product/findAll.do', 8, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,4,)');
INSERT INTO `syslog` VALUES ('c5950f32-19d9-11ea-927a-b06ebf0d3dea', '2019-12-09 00:42:50', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 1, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](cfa2eaff-086c-11ea-8704-b06ebf0d,)');
INSERT INTO `syslog` VALUES ('c644cfc5-27a5-11ea-acaa-005056c00001', '2019-12-26 14:05:53', 'admin', '127.0.0.1', '/user/addRoleToUser.do', 9, '[类名] cn.controller.UserController[方法名] addRoleToUser[方法的参数 ](a0f912f7-27a5-11ea-acaa-005056c00001,[Ljava.lang.String;@740c2173,)');
INSERT INTO `syslog` VALUES ('c64a2ed4-27a5-11ea-acaa-005056c00001', '2019-12-26 14:05:53', 'admin', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('c654fc45-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:19:13', 'admin', '127.0.0.1', '/sysLog/findAll.do', 19, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('c6772429-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:18:35', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 121, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('c693250b-19d9-11ea-927a-b06ebf0d3dea', '2019-12-09 00:42:51', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,4,)');
INSERT INTO `syslog` VALUES ('c6de8793-1e91-11ea-ac96-b06ebf0d3dea', '2019-12-15 00:50:04', 'admin', '127.0.0.1', '/permission/findAll.do', 5, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('c757d88d-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:19:59', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 3, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](1,3,)');
INSERT INTO `syslog` VALUES ('c7953c34-19d9-11ea-927a-b06ebf0d3dea', '2019-12-09 00:42:53', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 0, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](cfa2eaff-086c-11ea-8704-b06ebf0d,)');
INSERT INTO `syslog` VALUES ('c79e0726-22eb-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:44:24', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('c7a3ebc3-18fb-11ea-927a-b06ebf0d3dea', '2019-12-07 22:13:45', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 160, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('c7fc4b02-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:18:38', 'admin', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 17, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('c813bbee-27a5-11ea-acaa-005056c00001', '2019-12-26 14:05:56', 'admin', '127.0.0.1', '/user/findById.do', 14, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](a0f912f7-27a5-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('c8142f62-28a8-11ea-a089-b06ebf0d3dea', '2019-12-27 20:59:53', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 32, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('c87b81e0-19d9-11ea-927a-b06ebf0d3dea', '2019-12-09 00:42:55', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 14, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,4,)');
INSERT INTO `syslog` VALUES ('c895b08e-1585-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:31:32', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 130, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('c8b7f13a-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:20:02', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 5, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](3,3,)');
INSERT INTO `syslog` VALUES ('c8c8c875-1e91-11ea-ac96-b06ebf0d3dea', '2019-12-15 00:50:07', 'admin', '127.0.0.1', '/permission/findById', 3, '[类名] cn.controller.PermissionController[方法名] findById[方法的参数 ](4,)');
INSERT INTO `syslog` VALUES ('c8e37a31-22eb-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:44:27', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 5, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('ca12b8c6-28be-11ea-a089-b06ebf0d3dea', '2019-12-27 23:37:25', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 109, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('ca26deaa-19d9-11ea-927a-b06ebf0d3dea', '2019-12-09 00:42:57', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 0, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](b784e129-12a7-11ea-9f31-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('ca824aff-28a8-11ea-a089-b06ebf0d3dea', '2019-12-27 20:59:57', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 6, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('caa030cd-27a5-11ea-acaa-005056c00001', '2019-12-26 14:06:01', 'admin', '127.0.0.1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('caf65329-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:18:43', 'admin', '0:0:0:0:0:0:0:1', '/user/alter.do', 5, '[类名] cn.controller.UserController[方法名] alter[方法的参数 ](UserInfo{id=\'null\', email=\'2222211\', username=\'text1\', password=\'$2a$10$VdQYMv3PQfkYCAmlYga83eeItGAYzSVoGjgOF21tQGhPJKi4g1jfm\', phoneNum=\'2222222\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('cafd4a8e-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:18:43', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('cb043d41-2253-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:36:24', 'admin', '127.0.0.1', '/role/findAll.do', 121, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('cb1889e0-19d9-11ea-927a-b06ebf0d3dea', '2019-12-09 00:42:59', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,4,)');
INSERT INTO `syslog` VALUES ('cb1a5f08-19db-11ea-927a-b06ebf0d3dea', '2019-12-09 00:57:18', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 13, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('cb34897c-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:48:46', 'admin', '0:0:0:0:0:0:0:1', '/user/save.do', 92, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'123213123@qq.com\', username=\'admin2\', password=\'$2a$10$2dtxmbt/6QcHS1N9Ro3Qvu/rh/CtMlPa1ZcZW1xlxkcvLEFKZHz7W\', phoneNum=\'14535565865\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('cb3cc859-1b53-11ea-927a-b06ebf0d3dea', '2019-12-10 21:48:47', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('cb6f198d-292e-11ea-a089-b06ebf0d3dea', '2019-12-28 12:59:11', 'admin', '0:0:0:0:0:0:0:1', '/user/addRoleToUser.do', 12, '[类名] cn.controller.UserController[方法名] addRoleToUser[方法的参数 ](a706dbcb-2911-11ea-a089-b06ebf0d3dea,[Ljava.lang.String;@780cb3ea,)');
INSERT INTO `syslog` VALUES ('cb73d58b-292e-11ea-a089-b06ebf0d3dea', '2019-12-28 12:59:11', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 3, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('cc6fde87-2876-11ea-a089-b06ebf0d3dea', '2019-12-27 15:02:08', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 43, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('cc97a713-28a8-11ea-a089-b06ebf0d3dea', '2019-12-27 21:00:01', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('cce9e8f6-2920-11ea-a089-b06ebf0d3dea', '2019-12-28 11:19:01', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllRole.do', 9, '[类名] cn.controller.RoleController[方法名] findRoleByIdAndAllRole[方法的参数 ](8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('ccf903ca-28be-11ea-a089-b06ebf0d3dea', '2019-12-27 23:37:30', 'admin', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 11, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('cdd83fc9-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:50:02', 'admin', '0:0:0:0:0:0:0:1', '/user/save.do', 93, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'122313123@qq.com\', username=\'admin2\', password=\'$2a$10$Q4gLmYoqjpf5T2.Lm96.0eZ8FCxAt9xPVs0Lx64NYet4IZaCSKfpu\', phoneNum=\'17222668695\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('cddd2cbc-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:50:02', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 10, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('ce0a6594-1a7d-11ea-927a-b06ebf0d3dea', '2019-12-09 20:16:58', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 18, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('ce1e9974-1585-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:31:42', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 24, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('ce4808c8-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:18:48', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 18, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,10,)');
INSERT INTO `syslog` VALUES ('ce4f157a-19d9-11ea-927a-b06ebf0d3dea', '2019-12-09 00:43:04', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('ce5469f1-292e-11ea-a089-b06ebf0d3dea', '2019-12-28 12:59:16', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('ce97c577-28a8-11ea-a089-b06ebf0d3dea', '2019-12-27 21:00:04', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('cf4a4685-1e91-11ea-ac96-b06ebf0d3dea', '2019-12-15 00:50:18', 'admin', '127.0.0.1', '/sysLog/findAll.do', 34, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('cf516998-19d9-11ea-927a-b06ebf0d3dea', '2019-12-09 00:43:06', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 10, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('cf5cda9b-1b57-11ea-927a-b06ebf0d3dea', '2019-12-10 22:17:31', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 240, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('cfca3587-291e-11ea-a089-b06ebf0d3dea', '2019-12-28 11:04:47', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 11, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('cfdeccf7-2592-11ea-acaa-005056c00001', '2019-12-23 22:45:07', 'admin', '127.0.0.1', '/product/findAll.do', 33, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('d0337423-2253-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:36:33', 'admin', '127.0.0.1', '/role/findAll.do', 7, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('d07606ec-1b57-11ea-927a-b06ebf0d3dea', '2019-12-10 22:17:33', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 23, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('d1805908-27a4-11ea-acaa-005056c00001', '2019-12-26 13:59:03', 'admin', '127.0.0.1', '/role/findAll.do', 18, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('d1ab7843-1a7d-11ea-927a-b06ebf0d3dea', '2019-12-09 20:17:03', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 1877, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('d1c15b11-2876-11ea-a089-b06ebf0d3dea', '2019-12-27 15:02:17', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 9, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('d1fb3b1a-1b57-11ea-927a-b06ebf0d3dea', '2019-12-10 22:17:36', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('d203c3c8-27a5-11ea-acaa-005056c00001', '2019-12-26 14:06:13', 'admin', '127.0.0.1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('d211a982-1585-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:31:48', 'admin', '0:0:0:0:0:0:0:1', '/permission/findById', 13, '[类名] cn.controller.PermissionController[方法名] findById[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('d2e24f0f-2920-11ea-a089-b06ebf0d3dea', '2019-12-28 11:19:11', 'admin', '0:0:0:0:0:0:0:1', '/role/addPermissionToRole.do', 13, '[类名] cn.controller.RoleController[方法名] addPermissionToRole[方法的参数 ](8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea,[Ljava.lang.String;@555d2c61,)');
INSERT INTO `syslog` VALUES ('d2e6587f-2920-11ea-a089-b06ebf0d3dea', '2019-12-28 11:19:11', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('d391a8df-2253-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:36:39', 'admin', '127.0.0.1', '/role/findById', 8, '[类名] cn.controller.RoleController[方法名] findById[方法的参数 ](1111,)');
INSERT INTO `syslog` VALUES ('d434f3b9-28cf-11ea-a089-b06ebf0d3dea', '2019-12-28 01:39:24', 'admin', '127.0.0.1', '/product/findString.do', 217, '[类名] cn.controller.ProductController[方法名] findString[方法的参数 ](0,4,aaaa,)');
INSERT INTO `syslog` VALUES ('d43b9f5a-2258-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:12:27', 'admin', '127.0.0.1', '/permission/findAll.do', 5, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('d444ac21-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:19:37', 'admin', '127.0.0.1', '/sysLog/findAll.do', 27, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('d461f960-291e-11ea-a089-b06ebf0d3dea', '2019-12-28 11:04:54', 'admin', '0:0:0:0:0:0:0:1', '/user/delete.do', 15, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](07df530f-291e-11ea-a089-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('d467c769-291e-11ea-a089-b06ebf0d3dea', '2019-12-28 11:04:55', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('d46f7444-1b57-11ea-927a-b06ebf0d3dea', '2019-12-10 22:17:40', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 53, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('d4862b3d-28bc-11ea-a089-b06ebf0d3dea', '2019-12-27 23:23:24', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 129, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('d49c5d3c-2920-11ea-a089-b06ebf0d3dea', '2019-12-28 11:19:14', 'admin', '0:0:0:0:0:0:0:1', '/role/findById', 7, '[类名] cn.controller.RoleController[方法名] findById[方法的参数 ](8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('d55c777a-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:19:00', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 15, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,10,)');
INSERT INTO `syslog` VALUES ('d5ae08c2-2253-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:36:42', 'admin', '127.0.0.1', '/role/findAll.do', 9, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('d5b21f7b-175d-11ea-927a-b06ebf0d3dea', '2019-12-05 20:50:37', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 97, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('d5e4f222-27a5-11ea-acaa-005056c00001', '2019-12-26 14:06:19', 'admin', '127.0.0.1', '/user/findById.do', 8, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](a0f912f7-27a5-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('d5eec1e4-291e-11ea-a089-b06ebf0d3dea', '2019-12-28 11:04:57', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('d5fde7d5-28bc-11ea-a089-b06ebf0d3dea', '2019-12-27 23:23:27', 'admin', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 10, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('d625939b-1a7d-11ea-927a-b06ebf0d3dea', '2019-12-09 20:17:13', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('d774c37a-1b57-11ea-927a-b06ebf0d3dea', '2019-12-10 22:17:45', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 19, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](1,2,)');
INSERT INTO `syslog` VALUES ('d79f9470-28a4-11ea-a089-b06ebf0d3dea', '2019-12-27 20:31:41', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 72, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('d7a30c30-1a7d-11ea-927a-b06ebf0d3dea', '2019-12-09 20:17:15', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 209, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('d7af623a-18fb-11ea-927a-b06ebf0d3dea', '2019-12-07 22:14:12', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 20, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](f6f6c57a-0f46-11ea-a745-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('d7b95927-291e-11ea-a089-b06ebf0d3dea', '2019-12-28 11:05:00', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('d82d7fb5-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:12:18', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 24, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('d82f5921-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:21:52', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('d8938d11-1e6d-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:32:52', 'admin', '127.0.0.1', '/role/findRoleByIdAndAllRole.do', 8, '[类名] cn.controller.RoleController[方法名] findRoleByIdAndAllRole[方法的参数 ](1111,)');
INSERT INTO `syslog` VALUES ('d8e02d79-28bc-11ea-a089-b06ebf0d3dea', '2019-12-27 23:23:31', 'admin', '0:0:0:0:0:0:0:1', '/user/alter.do', 91, '[类名] cn.controller.UserController[方法名] alter[方法的参数 ](UserInfo{id=\'null\', email=\'221111\', username=\'text2\', password=\'$2a$10$eiO5wulqUtrg/xMQ9X4US..IkVMS7lltE08nNgGw9dDYVzHO4HLhe\', phoneNum=\'2222222\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('d8e9c8b2-28bc-11ea-a089-b06ebf0d3dea', '2019-12-27 23:23:31', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('d94c0bb3-18fb-11ea-927a-b06ebf0d3dea', '2019-12-07 22:14:14', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('d964239a-28d0-11ea-a089-b06ebf0d3dea', '2019-12-28 01:46:42', 'admin', '127.0.0.1', '/user/save.do', 87, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'2222222\', username=\'text\', password=\'$2a$10$SpsyNP5b3ToVi1wCjjmi7eG5z5dL4tbNtcpaTAJvdFaFo8wPR8u6W\', phoneNum=\'2222222\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('d96cdad4-28d0-11ea-a089-b06ebf0d3dea', '2019-12-28 01:46:42', 'admin', '127.0.0.1', '/user/findAll.do', 16, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('d96fb860-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:12:20', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 53, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('d9822d23-1a7d-11ea-927a-b06ebf0d3dea', '2019-12-09 20:17:18', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 60, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('d9ae85cc-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:21:55', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 16, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('d9c3d7b9-27a5-11ea-acaa-005056c00001', '2019-12-26 14:06:26', 'admin', '127.0.0.1', '/user/findAll.do', 24, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('d9dbe28c-1e91-11ea-ac96-b06ebf0d3dea', '2019-12-15 00:50:36', 'admin', '127.0.0.1', '/permission/findById', 5, '[类名] cn.controller.PermissionController[方法名] findById[方法的参数 ](4,)');
INSERT INTO `syslog` VALUES ('da44860b-175d-11ea-927a-b06ebf0d3dea', '2019-12-05 20:50:44', 'admin', '0:0:0:0:0:0:0:1', '/permission/findString.do', 117, '[类名] cn.controller.PermissionController[方法名] findString[方法的参数 ](0,5,6ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('da663642-2253-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:36:50', 'admin', '127.0.0.1', '/user/findAll.do', 11, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('da7cccd7-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:19:09', 'admin', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 19, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('db01a1a7-22eb-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:44:57', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 12, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('db3a0f95-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:12:23', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 46, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('db56c617-1b27-11ea-927a-b06ebf0d3dea', '2019-12-10 16:34:16', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 216, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('dba693b1-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:21:58', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 21, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('dbfaf304-28bc-11ea-a089-b06ebf0d3dea', '2019-12-27 23:23:37', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 9, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('dc2dd4f0-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:12:25', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 40, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](2,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('dcc8dff9-1b66-11ea-927a-b06ebf0d3dea', '2019-12-11 00:05:16', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 77, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('dcee5074-28bc-11ea-a089-b06ebf0d3dea', '2019-12-27 23:23:38', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('dcee56a1-22eb-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:45:00', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 18, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('dcf2b78b-1e91-11ea-ac96-b06ebf0d3dea', '2019-12-15 00:50:41', 'admin', '127.0.0.1', '/permission/findAll.do', 5, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('dd06204c-1a7d-11ea-927a-b06ebf0d3dea', '2019-12-09 20:17:24', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 22, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('dd1e3070-1e6d-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:32:59', 'admin', '127.0.0.1', '/role/findAll.do', 4, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('dd204c92-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:12:26', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 220, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](3,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('dd22d6e9-1697-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:13:26', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 21, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('dd603b92-292f-11ea-a089-b06ebf0d3dea', '2019-12-28 13:06:51', 'sss2', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 47, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('dd92898e-19d9-11ea-927a-b06ebf0d3dea', '2019-12-09 00:43:30', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 24, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('dd9dd983-19d5-11ea-927a-b06ebf0d3dea', '2019-12-09 00:14:52', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 106, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('ddb5630c-1b27-11ea-927a-b06ebf0d3dea', '2019-12-10 16:34:20', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdAlter.do', 3, '[类名] cn.controller.ProductController[方法名] findByIdOnlyOrder[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('ddca19ae-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:12:28', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 39, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](3,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('de0eb5d0-22eb-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:45:02', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 13, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('de51f13a-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:50:30', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('de5d4991-1e6d-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:33:01', 'admin', '127.0.0.1', '/role/findById', 4, '[类名] cn.controller.RoleController[方法名] findById[方法的参数 ](8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('de6afccf-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:12:29', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 24, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](2,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('de8c1553-292f-11ea-a089-b06ebf0d3dea', '2019-12-28 13:06:53', 'sss2', '0:0:0:0:0:0:0:1', '/orders/findById.do', 12, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('de906ade-1e91-11ea-ac96-b06ebf0d3dea', '2019-12-15 00:50:44', 'admin', '127.0.0.1', '/sysLog/findAll.do', 26, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('ded2e881-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:19:16', 'admin', '0:0:0:0:0:0:0:1', '/user/alter.do', 4, '[类名] cn.controller.UserController[方法名] alter[方法的参数 ](UserInfo{id=\'null\', email=\'2222222\', username=\'text1\', password=\'$2a$10$VdQYMv3PQfkYCAmlYga83eeItGAYzSVoGjgOF21tQGhPJKi4g1jfm\', phoneNum=\'2222111\', status=0, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('ded8dee7-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:19:16', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 9, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('dee80881-19d6-11ea-927a-b06ebf0d3dea', '2019-12-09 00:22:04', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('df0b3194-27a5-11ea-acaa-005056c00001', '2019-12-26 14:06:35', 'admin', '127.0.0.1', '/user/save.do', 264, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'2222222\', username=\'text1\', password=\'$2a$10$8okBJgj9fV6B3Sr5Og7RrOTq8pW9QcgVt1WuoNJepYwBM2obDOY3a\', phoneNum=\'2222222\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('df596d85-27a4-11ea-acaa-005056c00001', '2019-12-26 13:59:26', 'admin', '127.0.0.1', '/permission/findAll.do', 30, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('df5b7cfe-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:12:30', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 28, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('df92bfd0-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:19:56', 'admin', '127.0.0.1', '/sysLog/findAll.do', 16, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](1,15,)');
INSERT INTO `syslog` VALUES ('dfd236e8-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:12:31', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 13, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('e04bb14f-2253-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:37:00', 'admin', '127.0.0.1', '/user/delete.do', 19, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](4a5fd5a4-1e67-11ea-ac96-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('e0628c38-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:12:32', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 17, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('e06c08a5-2253-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:37:00', 'admin', '127.0.0.1', '/user/findAll.do', 16, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('e06c975e-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:50:33', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 38, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](cdd798c6-1a8a-11ea-927a-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('e079a7f8-28d0-11ea-a089-b06ebf0d3dea', '2019-12-28 01:46:54', 'admin', '127.0.0.1', '/user/findAll.do', 9, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,5,)');
INSERT INTO `syslog` VALUES ('e0868e85-1e6d-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:33:05', 'admin', '127.0.0.1', '/role/findAll.do', 4, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('e141c0cd-28b3-11ea-a089-b06ebf0d3dea', '2019-12-27 22:19:20', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 10, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](2,10,)');
INSERT INTO `syslog` VALUES ('e15615cb-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:12:34', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 23, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('e1daffd5-1b67-11ea-927a-b06ebf0d3dea', '2019-12-11 00:12:34', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 8, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1,2,12B7ABF2A4C544568B0A7C69F36BF8B7,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('e1ebd3ef-2258-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:12:50', 'admin', '127.0.0.1', '/permission/findById', 4, '[类名] cn.controller.PermissionController[方法名] findById[方法的参数 ](2,)');
INSERT INTO `syslog` VALUES ('e1f4f8af-1e6d-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:33:07', 'admin', '127.0.0.1', '/permission/findAll.do', 17, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('e20a906d-22eb-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:45:09', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 52, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('e214765c-1e4c-11ea-ac96-b06ebf0d3dea', '2019-12-14 16:36:54', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 26, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('e2cbe401-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:50:37', 'admin', '0:0:0:0:0:0:0:1', '/user/addRoleToUser.do', 20, '[类名] cn.controller.UserController[方法名] addRoleToUser[方法的参数 ](cdd798c6-1a8a-11ea-927a-b06ebf0d3dea,[Ljava.lang.String;@5aa5233e,)');
INSERT INTO `syslog` VALUES ('e2d0d7d5-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:50:37', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 11, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('e3084ea9-22eb-11ea-bbfc-b06ebf0d3dea', '2019-12-20 13:45:10', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 23, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](2FF351C4AC744E2092DCF08CFD314420,)');
INSERT INTO `syslog` VALUES ('e3568547-159a-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:02:37', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 37, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('e38eeeea-27a5-11ea-acaa-005056c00001', '2019-12-26 14:06:42', 'admin', '127.0.0.1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('e390f581-2593-11ea-acaa-005056c00001', '2019-12-23 22:52:49', 'admin', '127.0.0.1', '/orders/findAll.do', 33, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('e3d60bf5-2253-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:37:06', 'admin', '127.0.0.1', '/user/delete.do', 10, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](9a3497d3-1e6c-11ea-ac96-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('e3db9b81-2253-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:37:06', 'admin', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('e438dc4e-19d9-11ea-927a-b06ebf0d3dea', '2019-12-09 00:43:41', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 14, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](3081770BC3984EF092D9E99760FDABDE,)');
INSERT INTO `syslog` VALUES ('e43a2cca-1e6d-11ea-ac96-b06ebf0d3dea', '2019-12-14 20:33:11', 'admin', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('e4efe659-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:50:41', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 12, '[类名] cn.controller.UserController[方法名] findById[方法的参数 ](cdd798c6-1a8a-11ea-927a-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('e5504ece-1b61-11ea-927a-b06ebf0d3dea', '2019-12-10 23:29:43', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 36, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('e562b447-175d-11ea-927a-b06ebf0d3dea', '2019-12-05 20:51:03', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 22, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('e59a477b-19d9-11ea-927a-b06ebf0d3dea', '2019-12-09 00:43:43', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 12, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('e5cc6d97-18fb-11ea-927a-b06ebf0d3dea', '2019-12-07 22:14:35', 'admin', '0:0:0:0:0:0:0:1', '/user/save.do', 98, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'12313123@qq.com\', username=\'user2\', password=\'$2a$10$JGzRakBC3uxNxIKONMp3CecoeQBuP.diS6bbuU3gZLHNJ13rY.vA.\', phoneNum=\'17532668695\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('e5d26669-1760-11ea-927a-b06ebf0d3dea', '2019-12-05 21:12:32', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 18, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('e5dbfe22-18fb-11ea-927a-b06ebf0d3dea', '2019-12-07 22:14:36', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('e6c4e3c7-2593-11ea-acaa-005056c00001', '2019-12-23 22:52:54', 'admin', '127.0.0.1', '/orders/findAll.do', 42, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('e6e81edd-292f-11ea-a089-b06ebf0d3dea', '2019-12-28 13:07:07', 'sss2', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 44, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('e73c2ced-1c0d-11ea-b8f6-b06ebf0d3dea', '2019-12-11 20:01:02', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 52, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('e7484435-1760-11ea-927a-b06ebf0d3dea', '2019-12-05 21:12:35', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 19, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('e78956ae-1753-11ea-927a-b06ebf0d3dea', '2019-12-05 19:39:32', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 152, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('e7cef200-159b-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:09:54', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 16, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('e7d2cff4-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:52:19', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 14, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('e820cefe-175d-11ea-927a-b06ebf0d3dea', '2019-12-05 20:51:08', 'admin', '0:0:0:0:0:0:0:1', '/user/findString.do', 15, '[类名] cn.controller.UserController[方法名] findString[方法的参数 ](0,5,-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('e85a7d81-1b61-11ea-927a-b06ebf0d3dea', '2019-12-10 23:29:48', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 13, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('e89d7214-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:20:55', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 7, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](3,3,)');
INSERT INTO `syslog` VALUES ('e8dd849f-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:20:11', 'admin', '127.0.0.1', '/user/findAll.do', 10, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('e8eee73c-1581-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:03:48', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 306, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('e951320e-1760-11ea-927a-b06ebf0d3dea', '2019-12-05 21:12:38', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 13, '[类名] cn.controller.UserController[方法名] findUserByIdAndAllRole[方法的参数 ](6c58d2aa-1760-11ea-927a-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('e96906a6-292f-11ea-a089-b06ebf0d3dea', '2019-12-28 13:07:11', 'sss2', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 50, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](2,3,)');
INSERT INTO `syslog` VALUES ('e97f0cf2-1b61-11ea-927a-b06ebf0d3dea', '2019-12-10 23:29:50', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 17, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('ea275684-292f-11ea-a089-b06ebf0d3dea', '2019-12-28 13:07:12', 'sss2', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 35, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](3,3,)');
INSERT INTO `syslog` VALUES ('eaaab88d-2920-11ea-a089-b06ebf0d3dea', '2019-12-28 11:19:51', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 38, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('eab44ec5-18fb-11ea-927a-b06ebf0d3dea', '2019-12-07 22:14:44', 'admin', '0:0:0:0:0:0:0:1', '/user/delete.do', 15, '[类名] cn.controller.UserController[方法名] delete[方法的参数 ](,)');
INSERT INTO `syslog` VALUES ('eaba0bef-18fb-11ea-927a-b06ebf0d3dea', '2019-12-07 22:14:44', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('eacaa298-2592-11ea-acaa-005056c00001', '2019-12-23 22:45:52', 'admin', '127.0.0.1', '/orders/findAll.do', 84, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('eae55fd8-19d9-11ea-927a-b06ebf0d3dea', '2019-12-09 00:43:52', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 14, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('eb150b0b-175d-11ea-927a-b06ebf0d3dea', '2019-12-05 20:51:13', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('ebc95014-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:21:00', 'admin', '0:0:0:0:0:0:0:1', '/permission/findById', 3, '[类名] cn.controller.PermissionController[方法名] findById[方法的参数 ](6,)');
INSERT INTO `syslog` VALUES ('ebef02a4-2259-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:20:16', 'admin', '127.0.0.1', '/sysLog/findAll.do', 19, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('ec281786-1756-11ea-927a-b06ebf0d3dea', '2019-12-05 20:01:08', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 126, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('ec8f1725-1b61-11ea-927a-b06ebf0d3dea', '2019-12-10 23:29:55', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('ecad43e4-1b62-11ea-927a-b06ebf0d3dea', '2019-12-10 23:37:05', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 50, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1,2,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('ed6343e4-1760-11ea-927a-b06ebf0d3dea', '2019-12-05 21:12:45', 'admin', '0:0:0:0:0:0:0:1', '/user/addRoleToUser.do', 11, '[类名] cn.controller.UserController[方法名] addRoleToUser[方法的参数 ](6c58d2aa-1760-11ea-927a-b06ebf0d3dea,[Ljava.lang.String;@66a94321,)');
INSERT INTO `syslog` VALUES ('ed66aab7-1760-11ea-927a-b06ebf0d3dea', '2019-12-05 21:12:45', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 10, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('ed6739f0-292f-11ea-a089-b06ebf0d3dea', '2019-12-28 13:07:18', 'sss2', '0:0:0:0:0:0:0:1', '/orders/findById.do', 23, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](A0657832D93E4B10AE88A2D4B70B1A28,)');
INSERT INTO `syslog` VALUES ('ed730a31-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:21:03', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 5, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](3,3,)');
INSERT INTO `syslog` VALUES ('ee001f9a-1b61-11ea-927a-b06ebf0d3dea', '2019-12-10 23:29:58', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 15, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('ee25d318-28be-11ea-a089-b06ebf0d3dea', '2019-12-27 23:38:26', 'admin', '0:0:0:0:0:0:0:1', '/user/alter.do', 98, '[类名] cn.controller.UserController[方法名] alter[方法的参数 ](UserInfo{id=\'077cc486-27a6-11ea-acaa-005056c00001\', email=\'111111\', username=\'text2\', password=\'$2a$10$IbgEGMTZWMiJyITIJEDTs.f1Yn08pdDA/8ApuWUnJtPejRY3Brnce\', phoneNum=\'2222222\', status=1, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('ee2d757e-28be-11ea-a089-b06ebf0d3dea', '2019-12-27 23:38:26', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 16, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('ee2e2792-175d-11ea-927a-b06ebf0d3dea', '2019-12-05 20:51:18', 'admin', '0:0:0:0:0:0:0:1', '/user/findString.do', 21, '[类名] cn.controller.UserController[方法名] findString[方法的参数 ](0,5,user2,)');
INSERT INTO `syslog` VALUES ('ee3960e6-1e5f-11ea-ac96-b06ebf0d3dea', '2019-12-14 18:53:15', 'admin', '127.0.0.1', '/product/findAll.do', 143, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('ee519920-1e91-11ea-ac96-b06ebf0d3dea', '2019-12-15 00:51:09', 'admin', '127.0.0.1', '/sysLog/findString.do', 1118, '[类名] cn.controller.SysLogController[方法名] findString[方法的参数 ](0,703,12-15,)');
INSERT INTO `syslog` VALUES ('eeba117c-1bdc-11ea-b8f6-b06ebf0d3dea', '2019-12-11 14:10:29', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 149, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('ef06449a-27a4-11ea-acaa-005056c00001', '2019-12-26 13:59:52', 'admin', '127.0.0.1', '/sysLog/findAll.do', 93, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('ef19c330-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:52:31', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 24, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('ef1e49a3-27a7-11ea-acaa-005056c00001', '2019-12-26 14:21:21', 'text1', '127.0.0.1', '/product/findString.do', 15, '[类名] cn.controller.ProductController[方法名] findString[方法的参数 ](0,4,aaa,)');
INSERT INTO `syslog` VALUES ('ef26b1ed-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:50:58', 'admin2', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('ef2c2b26-2593-11ea-acaa-005056c00001', '2019-12-23 22:53:09', 'admin', '127.0.0.1', '/orders/findAll.do', 38, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('efd47392-18fb-11ea-927a-b06ebf0d3dea', '2019-12-07 22:14:52', 'admin', '0:0:0:0:0:0:0:1', '/user/findString.do', 127, '[类名] cn.controller.UserController[方法名] findString[方法的参数 ](0,10,,)');
INSERT INTO `syslog` VALUES ('efd5277b-1bdc-11ea-b8f6-b06ebf0d3dea', '2019-12-11 14:10:31', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 66, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('f07c723d-2593-11ea-acaa-005056c00001', '2019-12-23 22:53:11', 'admin', '127.0.0.1', '/orders/findAll.do', 28, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('f091cbd4-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:52:33', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 11, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('f0ad3e20-159b-11ea-b69d-b06ebf0d3dea', '2019-12-03 15:10:09', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 14, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('f0b6819b-1698-11ea-b69d-b06ebf0d3dea', '2019-12-04 21:21:09', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 6, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('f1420959-1756-11ea-927a-b06ebf0d3dea', '2019-12-05 20:01:16', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 49, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('f28a4e9d-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:52:37', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 17, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](2,4,)');
INSERT INTO `syslog` VALUES ('f2b70e11-2258-11ea-ac96-b06ebf0d3dea', '2019-12-19 20:13:18', 'admin', '127.0.0.1', '/role/findAll.do', 6, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('f3016831-27a7-11ea-acaa-005056c00001', '2019-12-26 14:21:27', 'text1', '127.0.0.1', '/product/findAll.do', 8, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('f33d4e60-1b56-11ea-927a-b06ebf0d3dea', '2019-12-10 22:11:22', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 114, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('f3488b3a-2253-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:37:32', 'admin', '127.0.0.1', '/user/save.do', 91, '[类名] cn.controller.UserController[方法名] save[方法的参数 ](UserInfo{id=\'null\', email=\'2532725086@qq.com\', username=\'longlog\', password=\'$2a$10$rJC3a.zWsEgCwhxTCcF1he0d7r3Zs8uWRKxEpWp30weKEt0ynDsZu\', phoneNum=\'13005602715\', status=0, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('f350175e-2253-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:37:32', 'admin', '127.0.0.1', '/user/findAll.do', 9, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('f41c33cd-1b4b-11ea-927a-b06ebf0d3dea', '2019-12-10 20:52:39', 'admin', '0:0:0:0:0:0:0:1', '/product/findByIdOrders.do', 19, '[类名] cn.controller.ProductController[方法名] findByIdOrders[方法的参数 ](9F71F01CB448476DAFB309AA6DF9497F,)');
INSERT INTO `syslog` VALUES ('f45ad7f8-1753-11ea-927a-b06ebf0d3dea', '2019-12-05 19:39:53', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findString.do', 161, '[类名] cn.controller.SysLogController[方法名] findString[方法的参数 ](0,101,as,)');
INSERT INTO `syslog` VALUES ('f4ae4127-28be-11ea-a089-b06ebf0d3dea', '2019-12-27 23:38:37', 'text2', '0:0:0:0:0:0:0:1', '/user/findAll.do', 11, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('f4cedceb-1b56-11ea-927a-b06ebf0d3dea', '2019-12-10 22:11:25', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 71, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,12B7ABF2A4C544568B0A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('f4d2a76f-2593-11ea-acaa-005056c00001', '2019-12-23 22:53:18', 'admin', '127.0.0.1', '/product/findAll.do', 12, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('f507cd45-1756-11ea-927a-b06ebf0d3dea', '2019-12-05 20:01:23', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 20, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('f517300b-16b5-11ea-b69d-b06ebf0d3dea', '2019-12-05 00:48:51', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 164, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('f573ed56-175d-11ea-927a-b06ebf0d3dea', '2019-12-05 20:51:30', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('f57b0c8d-1e75-11ea-ac96-b06ebf0d3dea', '2019-12-14 21:30:56', 'admin', '127.0.0.1', '/permission/findAll.do', 5, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('f593efa5-1b61-11ea-927a-b06ebf0d3dea', '2019-12-10 23:30:11', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 17, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('f67de1e8-28be-11ea-a089-b06ebf0d3dea', '2019-12-27 23:38:40', 'text2', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 14, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('f6a2f61e-27a4-11ea-acaa-005056c00001', '2019-12-26 14:00:05', 'admin', '127.0.0.1', '/sysLog/findAll.do', 80, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('f6e03806-175d-11ea-927a-b06ebf0d3dea', '2019-12-05 20:51:32', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 21, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('f6f2460c-1a8a-11ea-927a-b06ebf0d3dea', '2019-12-09 21:51:11', 'admin2', '0:0:0:0:0:0:0:1', '/user/findAll.do', 11, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('f7133f4c-1b61-11ea-927a-b06ebf0d3dea', '2019-12-10 23:30:13', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 18, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('f7c777ee-1b56-11ea-927a-b06ebf0d3dea', '2019-12-10 22:11:30', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 35, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](1,2,)');
INSERT INTO `syslog` VALUES ('f8099446-28c1-11ea-a089-b06ebf0d3dea', '2019-12-28 00:00:11', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 117, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('f810f9a9-19d9-11ea-927a-b06ebf0d3dea', '2019-12-09 00:44:14', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 13, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('f857ee18-28be-11ea-a089-b06ebf0d3dea', '2019-12-27 23:38:43', 'text2', '0:0:0:0:0:0:0:1', '/user/alter.do', 87, '[类名] cn.controller.UserController[方法名] alter[方法的参数 ](UserInfo{id=\'077cc486-27a6-11ea-acaa-005056c00001\', email=\'111111\', username=\'text2\', password=\'$2a$10$Gl6ORSHqaxg5sH9/QAZRh.42BsUBbXoTYAMF3qDDUQaV71k1IQDEK\', phoneNum=\'2222222\', status=0, statusStr=\'null\', roles=null},)');
INSERT INTO `syslog` VALUES ('f85b30bf-28be-11ea-a089-b06ebf0d3dea', '2019-12-27 23:38:43', 'text2', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,5,)');
INSERT INTO `syslog` VALUES ('f86958c9-27a7-11ea-acaa-005056c00001', '2019-12-26 14:21:36', 'admin', '127.0.0.1', '/sysLog/findAll.do', 20, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('f8783edb-2593-11ea-acaa-005056c00001', '2019-12-23 22:53:24', 'admin', '127.0.0.1', '/product/findAll.do', 4, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('f88a9ab6-1c0d-11ea-b8f6-b06ebf0d3dea', '2019-12-11 20:01:31', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findString.do', 185, '[类名] cn.controller.SysLogController[方法名] findString[方法的参数 ](0,629,2019-12-11,)');
INSERT INTO `syslog` VALUES ('f901fe13-1a78-11ea-927a-b06ebf0d3dea', '2019-12-09 19:42:23', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 149, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('f910d79d-1e75-11ea-ac96-b06ebf0d3dea', '2019-12-14 21:31:02', 'admin', '127.0.0.1', '/permission/findById', 6, '[类名] cn.controller.PermissionController[方法名] findById[方法的参数 ](1,)');
INSERT INTO `syslog` VALUES ('f91964fc-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:56:14', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 32, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('f99112f8-1bdc-11ea-b8f6-b06ebf0d3dea', '2019-12-11 14:10:48', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 74, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('f9ac01bc-2253-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:37:43', 'admin', '127.0.0.1', '/role/findAll.do', 6, '[类名] cn.controller.RoleController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('f9d53c3f-1b27-11ea-927a-b06ebf0d3dea', '2019-12-10 16:35:07', 'admin', '0:0:0:0:0:0:0:1', '/product/alter.do', 10, '[类名] cn.controller.ProductController[方法名] alter[方法的参数 ](Product{id=\'1287ABF2A4C544568B8A7C69F36BF8B7\', productNum=\'itcast-003\', productName=\'上海石日游\', cityName=\'上海\', departureTime=Fri Dec 13 00:00:00 CST 2019, departureTimeStr=\'2019-12-13 13:30\', productPrice=1800.0, productDesc=\'aaaaaa\', productStatus=1, productStatusStr=\'null\'},)');
INSERT INTO `syslog` VALUES ('f9f0e8aa-1b27-11ea-927a-b06ebf0d3dea', '2019-12-10 16:35:07', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 9, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('f9f0f409-2593-11ea-acaa-005056c00001', '2019-12-23 22:53:27', 'admin', '127.0.0.1', '/orders/findAll.do', 29, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('fa171564-175d-11ea-927a-b06ebf0d3dea', '2019-12-05 20:51:38', 'admin', '0:0:0:0:0:0:0:1', '/role/findString.do', 18, '[类名] cn.controller.RoleController[方法名] findString[方法的参数 ](0,5,admin,)');
INSERT INTO `syslog` VALUES ('fa26d59d-16c1-11ea-b69d-b06ebf0d3dea', '2019-12-05 02:14:54', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 67, '[类名] cn.controller.SysLogController[方法名] findAll[方法的参数 ](0,10,)');
INSERT INTO `syslog` VALUES ('fa92e515-1bdc-11ea-b8f6-b06ebf0d3dea', '2019-12-11 14:10:49', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 23, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('fab370e0-1581-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:04:18', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 0, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](1287ABF2A4C544568B8A7C69F36BF8B7,)');
INSERT INTO `syslog` VALUES ('fac33ae8-1a78-11ea-927a-b06ebf0d3dea', '2019-12-09 19:42:26', 'admin', '0:0:0:0:0:0:0:1', '/orders/findByIdOnlyOrder.do', 53, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('fb3702d0-28c1-11ea-a089-b06ebf0d3dea', '2019-12-28 00:00:16', 'admin', '0:0:0:0:0:0:0:1', '/user/findByIdOnlyUser.do', 14, '[类名] cn.controller.UserController[方法名] findByIdOnlyOrder[方法的参数 ](077cc486-27a6-11ea-acaa-005056c00001,)');
INSERT INTO `syslog` VALUES ('fb54840c-1e77-11ea-ac96-b06ebf0d3dea', '2019-12-14 21:45:25', 'admin', '127.0.0.1', '/permission/findAll.do', 4, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('fb7d4818-1582-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:11:29', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 130, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('fb869039-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:56:18', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 52, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('fbc8a464-292f-11ea-a089-b06ebf0d3dea', '2019-12-28 13:07:42', 'sss2', '0:0:0:0:0:0:0:1', '/product/findAll.do', 14, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('fc395a94-16b5-11ea-b69d-b06ebf0d3dea', '2019-12-05 00:49:03', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findString.do', 288, '[类名] cn.controller.SysLogController[方法名] findString[方法的参数 ](0,10,00e399c7,)');
INSERT INTO `syslog` VALUES ('fc3983f6-1a78-11ea-927a-b06ebf0d3dea', '2019-12-09 19:42:29', 'admin', '0:0:0:0:0:0:0:1', '/orders/alter.do', 4, '[类名] cn.controller.OrdersController[方法名] alter[方法的参数 ](Orders{id=\'null\', orderNum=\'null\', orderTime=null, orderTimeStr=\'null\', orderStatus=null, peopleCount=0, product=null, travellers=null, member=null, payType=null, payTypeStr=\'null\', orderDesc=\'null\'},)');
INSERT INTO `syslog` VALUES ('fc3d88bf-1581-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:04:21', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 17, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('fce1c233-2253-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:37:48', 'admin', '127.0.0.1', '/user/findAll.do', 10, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('fd0ed9e7-292f-11ea-a089-b06ebf0d3dea', '2019-12-28 13:07:44', 'sss2', '0:0:0:0:0:0:0:1', '/product/findById.do', 21, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,398d679d-12b4-11ea-9f31-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('fd26ab03-27a5-11ea-acaa-005056c00001', '2019-12-26 14:07:25', 'admin', '127.0.0.1', '/user/findAll.do', 8, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('fd427cf4-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:56:21', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('fd72deb8-1582-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:11:33', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 19, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('fda2d551-175d-11ea-927a-b06ebf0d3dea', '2019-12-05 20:51:44', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 29, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('fdc244e4-1e75-11ea-ac96-b06ebf0d3dea', '2019-12-14 21:31:10', 'admin', '127.0.0.1', '/permission/findAll.do', 3, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](1,10,)');
INSERT INTO `syslog` VALUES ('fe1bde05-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:56:22', 'admin', '0:0:0:0:0:0:0:1', '/product/findById.do', 20, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,398d679d-12b4-11ea-9f31-b06ebf0d3dea,)');
INSERT INTO `syslog` VALUES ('fea1a1f7-292f-11ea-a089-b06ebf0d3dea', '2019-12-28 13:07:47', 'sss2', '0:0:0:0:0:0:0:1', '/product/findAll.do', 19, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('fea97bc7-1581-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:04:25', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 22, '[类名] cn.controller.OrdersController[方法名] findAll[方法的参数 ](0,3,)');
INSERT INTO `syslog` VALUES ('fec5cca2-1e77-11ea-ac96-b06ebf0d3dea', '2019-12-14 21:45:31', 'admin', '127.0.0.1', '/product/findAll.do', 10, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('ff31db03-16c1-11ea-b69d-b06ebf0d3dea', '2019-12-05 02:15:02', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findString.do', 177, '[类名] cn.controller.SysLogController[方法名] findString[方法的参数 ](0,93,00e399c7,)');
INSERT INTO `syslog` VALUES ('ff3513d1-2875-11ea-a089-b06ebf0d3dea', '2019-12-27 14:56:24', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 21, '[类名] cn.controller.ProductController[方法名] findAll[方法的参数 ](0,4,)');
INSERT INTO `syslog` VALUES ('ff91b466-2253-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:37:52', 'admin', '127.0.0.1', '/permission/findAll.do', 19, '[类名] cn.controller.PermissionController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('ffa35004-292f-11ea-a089-b06ebf0d3dea', '2019-12-28 13:07:48', 'sss2', '0:0:0:0:0:0:0:1', '/product/findById.do', 24, '[类名] cn.controller.ProductController[方法名] findById[方法的参数 ](0,4,676C5BD1D35E429A8C2E114939C5685A,)');
INSERT INTO `syslog` VALUES ('ffb501f1-1a77-11ea-927a-b06ebf0d3dea', '2019-12-09 19:35:25', 'admin', '0:0:0:0:0:0:0:1', '/orders/findByIdOnlyOrder.do', 9, '[类名] cn.controller.OrdersController[方法名] findByIdOnlyOrder[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');
INSERT INTO `syslog` VALUES ('ffbfb963-2255-11ea-ac96-b06ebf0d3dea', '2019-12-19 19:52:12', 'admin', '127.0.0.1', '/user/findAll.do', 7, '[类名] cn.controller.UserController[方法名] findAll[方法的参数 ](0,5,)');
INSERT INTO `syslog` VALUES ('ffd4db58-1581-11ea-b69d-b06ebf0d3dea', '2019-12-03 12:04:27', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 85, '[类名] cn.controller.OrdersController[方法名] findById[方法的参数 ](0E7231DC797C486290E8713CA3C6ECCC,)');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `credentialsType` int(11) NULL DEFAULT NULL,
  `credentialsNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `travellerType` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', 0, '123456789009876543', 0);
INSERT INTO `traveller` VALUES ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', 0, '987654321123456789', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATUS` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('077cc486-27a6-11ea-acaa-005056c00001', '111222', 'text2', '$2a$10$a09Ffi/jW51epwsYMFC6reCebF796sTYh8T7s80jclrQTmwf6J3Ri', '1111111', 1);
INSERT INTO `users` VALUES ('1', '16577735@qq.com', 'admin', '$2a$10$BrvXGS3sQa6lzhW9n9Oqw.rrcqaVEgC/aw1J9l3RnGPz9NLw/htMe', '13625856659', 1);
INSERT INTO `users` VALUES ('2', '165773802@qq.com', 'user', '$2a$10$7MzdFTlGhRdV3/gxcyu/ielCXZFiElQridknQbD7OvKKpkfMwcv3K', '17255265556', 1);
INSERT INTO `users` VALUES ('609b0ded-2256-11ea-ac96-b06ebf0d3dea', '2532725086@qq.com', 'longlog', '$2a$10$yssU3P04UJlowWcToEE.Le8zELEhhkOxfIlMomwdRI8ajSleWcCq2', '13005602715', 1);
INSERT INTO `users` VALUES ('6c58d2aa-1760-11ea-927a-b06ebf0d3dea', '12342423423@qq.com', 'sss', '$2a$10$oYBjm8hpnWQvwxK9oyJnEetuE4qd4YrhzKe5JVnSH.WlpTMgAYzZq', '1453336256', 1);
INSERT INTO `users` VALUES ('775d58d6-2875-11ea-a089-b06ebf0d3dea', '1234243323423@qq.com', 'admin5', '$2a$10$NTMn8cXgiwCXqHw9wT6/c.rneg40jCc/4ZLtUtcMPw3Jkxe5QIqVW', '14522265865', 0);
INSERT INTO `users` VALUES ('a706dbcb-2911-11ea-a089-b06ebf0d3dea', '14522335@qq.com', 'sss2', '$2a$10$3OxbrcHf83Wg6Yj06m0eMeJLUey4f8W1AVC7OEuyzIyQZzDzxfJPu', '14522565865', 1);
INSERT INTO `users` VALUES ('d9635978-28d0-11ea-a089-b06ebf0d3dea', '2222222', 'text', '$2a$10$SpsyNP5b3ToVi1wCjjmi7eG5z5dL4tbNtcpaTAJvdFaFo8wPR8u6W', '2222222', 1);
INSERT INTO `users` VALUES ('f6f6c57a-0f46-11ea-a745-b06ebf0d3dea', '1658858452@qq.com', '123', '$2a$10$4GC4BdtmJKooBMWW3UNZzObfiohZl98eM4GVyqfHHKctovIhsEVvG', '17302265262', 1);

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role`  (
  `userId` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleId` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('1', '1111');
INSERT INTO `users_role` VALUES ('077cc486-27a6-11ea-acaa-005056c00001', '2222');
INSERT INTO `users_role` VALUES ('1', '2222');
INSERT INTO `users_role` VALUES ('2', '2222');
INSERT INTO `users_role` VALUES ('6c58d2aa-1760-11ea-927a-b06ebf0d3dea', '2222');
INSERT INTO `users_role` VALUES ('a706dbcb-2911-11ea-a089-b06ebf0d3dea', '2222');
INSERT INTO `users_role` VALUES ('d9635978-28d0-11ea-a089-b06ebf0d3dea', '2222');
INSERT INTO `users_role` VALUES ('2', '8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea');
INSERT INTO `users_role` VALUES ('a706dbcb-2911-11ea-a089-b06ebf0d3dea', '8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea');
INSERT INTO `users_role` VALUES ('f6f6c57a-0f46-11ea-a745-b06ebf0d3dea', '8c3cc0fb-0f96-11ea-a745-b06ebf0d3dea');

-- ----------------------------
-- Triggers structure for table member
-- ----------------------------
DROP TRIGGER IF EXISTS `default_uuid3`;
delimiter ;;
CREATE TRIGGER `default_uuid3` BEFORE INSERT ON `member` FOR EACH ROW begin
    if (new.id='' or new.id is null) then
         set new.id= uuid();  
    end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table orders
-- ----------------------------
DROP TRIGGER IF EXISTS `default_uuid2`;
delimiter ;;
CREATE TRIGGER `default_uuid2` BEFORE INSERT ON `orders` FOR EACH ROW begin
    if (new.id='' or new.id is null) then
         set new.id= uuid();  
    end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table permission
-- ----------------------------
DROP TRIGGER IF EXISTS `permission_uuid`;
delimiter ;;
CREATE TRIGGER `permission_uuid` BEFORE INSERT ON `permission` FOR EACH ROW begin
    if (new.id='' or new.id is null) then
         set new.id= uuid();  
    end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table product
-- ----------------------------
DROP TRIGGER IF EXISTS `default_uuid`;
delimiter ;;
CREATE TRIGGER `default_uuid` BEFORE INSERT ON `product` FOR EACH ROW begin
    if (new.id='' or new.id is null) then
         set new.id= uuid();  
    end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table role
-- ----------------------------
DROP TRIGGER IF EXISTS `role_uuid`;
delimiter ;;
CREATE TRIGGER `role_uuid` BEFORE INSERT ON `role` FOR EACH ROW begin
    if (new.id='' or new.id is null) then
         set new.id= uuid();  
    end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table syslog
-- ----------------------------
DROP TRIGGER IF EXISTS `sysLog_uuid`;
delimiter ;;
CREATE TRIGGER `sysLog_uuid` BEFORE INSERT ON `syslog` FOR EACH ROW begin
    if (new.id='' or new.id is null) then
         set new.id= uuid();  
    end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table traveller
-- ----------------------------
DROP TRIGGER IF EXISTS `default_uuid4`;
delimiter ;;
CREATE TRIGGER `default_uuid4` BEFORE INSERT ON `traveller` FOR EACH ROW begin
    if (new.id='' or new.id is null) then
         set new.id= uuid();  
    end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table users
-- ----------------------------
DROP TRIGGER IF EXISTS `users_uuid`;
delimiter ;;
CREATE TRIGGER `users_uuid` BEFORE INSERT ON `users` FOR EACH ROW begin
    if (new.id='' or new.id is null) then
         set new.id= uuid();  
    end if;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
