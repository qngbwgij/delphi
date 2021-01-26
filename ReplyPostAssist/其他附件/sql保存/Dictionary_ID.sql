/*
 Navicat Premium Data Transfer

 Source Server         : Ding_TieZi
 Source Server Type    : SQLite
 Source Server Version : 3017000
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3017000
 File Encoding         : 65001

 Date: 10/11/2019 12:44:31
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for Dictionary_ID
-- ----------------------------
DROP TABLE IF EXISTS "Dictionary_ID";
CREATE TABLE "Dictionary_ID" (
  "Dictionary_ID" INTEGER NOT NULL,
  "DIctionary_ID_Value" TEXT NOT NULL,
  "Value" integer NOT NULL,
  "Name" TEXT NOT NULL,
  "ID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- ----------------------------
-- Records of "Dictionary_ID"
-- ----------------------------
INSERT INTO "Dictionary_ID" VALUES (1, 'Submit_Type', 0, '快捷键提交CTRL+ENTER', 1);
INSERT INTO "Dictionary_ID" VALUES (1, 'Submit_Type', 1, '鼠标点击', 2);
INSERT INTO "Dictionary_ID" VALUES (1, 'Submit_Type', 2, 'JS提交', 3);

-- ----------------------------
-- Auto increment value for Dictionary_ID
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 3 WHERE name = 'Dictionary_ID';

PRAGMA foreign_keys = true;
