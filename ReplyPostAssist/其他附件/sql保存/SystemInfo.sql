/*
 Navicat Premium Data Transfer

 Source Server         : Ding_TieZi
 Source Server Type    : SQLite
 Source Server Version : 3017000
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3017000
 File Encoding         : 65001

 Date: 12/11/2019 14:40:12
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for SystemInfo
-- ----------------------------
DROP TABLE IF EXISTS "SystemInfo";
CREATE TABLE "SystemInfo" (
  "b_Debug" integer(1) NOT NULL DEFAULT 0,
  "Submit_Type" integer(1) NOT NULL DEFAULT 0,
  "TaskInterval_H" integer NOT NULL DEFAULT 0,
  "TaskInterval_M" integer NOT NULL DEFAULT 0,
  "TaskInterval_S" integer NOT NULL DEFAULT 0,
  "AskInputPoint" integer(1) NOT NULL DEFAULT 0,
  "AskSubmitPoint" integer(1) NOT NULL DEFAULT 0,
  "Version" integer(1) NOT NULL DEFAULT 0,
  "MacAddress" TEXT NOT NULL DEFAULT 0,
  "ExpiredTime" TEXT NOT NULL DEFAULT 0
);

-- ----------------------------
-- Records of "SystemInfo"
-- ----------------------------
INSERT INTO "SystemInfo" VALUES (0, 0, 0, 30, 0, 0, -1, 0, '98-3B-8F-E9-19-3D', 99999999999999);

PRAGMA foreign_keys = true;
