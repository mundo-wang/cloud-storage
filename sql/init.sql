-- noinspection SqlNoDataSourceInspectionForFile

-- noinspection SqlDialectInspectionForFile

-- ----------------------------
-- Table structure for file_folder
-- ----------------------------
DROP TABLE IF EXISTS `file_folder`;
CREATE TABLE `file_folder` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '文件夹ID',
  `file_folder_name` VARCHAR(255) NOT NULL COMMENT '文件夹名称',
  `parent_folder_id` INT NOT NULL DEFAULT 0 COMMENT '父文件夹ID',
  `file_store_id` INT NOT NULL COMMENT '所属文件仓库ID',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  INDEX `idx_file_store_id` (`file_store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for file_store
-- ----------------------------
DROP TABLE IF EXISTS `file_store`;
CREATE TABLE `file_store` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '文件仓库ID',
  `user_id` INT NOT NULL COMMENT '用户ID',
  `current_size` INT NOT NULL DEFAULT 0 COMMENT '当前容量（单位KB）',
  `max_size` INT NOT NULL DEFAULT 1048576 COMMENT '最大容量（单位KB）',
  INDEX `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for my_file
-- ----------------------------
DROP TABLE IF EXISTS `my_file`;
CREATE TABLE `my_file` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '文件ID',
  `file_name` VARCHAR(255) NOT NULL COMMENT '文件名',
  `file_hash` VARCHAR(64) NOT NULL COMMENT '文件哈希值',
  `file_store_id` INT NOT NULL COMMENT '文件仓库ID',
  `file_path` VARCHAR(255) NOT NULL DEFAULT '/' COMMENT '文件存储路径',
  `download_num` INT NOT NULL DEFAULT 0 COMMENT '下载次数',
  `upload_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `parent_folder_id` INT NOT NULL COMMENT '父文件夹ID',
  `size` INT NOT NULL COMMENT '文件大小（字节）',
  `type` INT NOT NULL COMMENT '文件类型',
  `postfix` VARCHAR(50) NOT NULL COMMENT '文件后缀',
  INDEX `idx_file_store_id` (`file_store_id`),
  INDEX `idx_file_hash` (`file_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '分享ID',
  `code` VARCHAR(10) NOT NULL COMMENT '分享码',
  `file_id` INT NOT NULL COMMENT '文件ID',
  `username` VARCHAR(100) NOT NULL COMMENT '分享用户',
  `hash` VARCHAR(64) NOT NULL COMMENT '文件哈希',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  INDEX `idx_file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
  `open_id` VARCHAR(255) NOT NULL UNIQUE COMMENT '用户的openid',
  `file_store_id` INT NOT NULL COMMENT '文件仓库ID',
  `user_name` VARCHAR(50) NOT NULL COMMENT '用户名',
  `register_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `image_path` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '头像地址',
  INDEX `idx_file_store_id` (`file_store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;