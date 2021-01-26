/*
 Navicat Premium Data Transfer

 Source Server         : Ding_TieZi
 Source Server Type    : SQLite
 Source Server Version : 3017000
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3017000
 File Encoding         : 65001

 Date: 12/11/2019 14:39:36
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for SavedPoint
-- ----------------------------
DROP TABLE IF EXISTS "SavedPoint";
CREATE TABLE "SavedPoint" (
  "point_type" TEXT NOT NULL,
  "point_x" integer NOT NULL DEFAULT 0,
  "point_y" integer NOT NULL DEFAULT 0,
  "ID" integer NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- ----------------------------
-- Records of "SavedPoint"
-- ----------------------------
INSERT INTO "SavedPoint" VALUES ('test_scroll_start', 1575, 113, 3);
INSERT INTO "SavedPoint" VALUES ('test_scroll_end', 1577, 990, 4);

-- ----------------------------
-- Auto increment value for SavedPoint
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 4 WHERE name = 'SavedPoint';

PRAGMA foreign_keys = true;
