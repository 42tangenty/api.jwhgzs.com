-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2026-03-15 15:48:00.875591
-- 服务器版本： 5.7.43-log
-- PHP 版本： 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `jwhgzs_com`
--
CREATE DATABASE IF NOT EXISTS `jwhgzs_com` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `jwhgzs_com`;

-- --------------------------------------------------------

--
-- 表的结构 `action`
--

CREATE TABLE `action` (
  `id` bigint(20) NOT NULL,
  `parent` text NOT NULL,
  `type` int(11) NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  `pid` bigint(20) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `actionTime` bigint(20) NOT NULL,
  `userIP` text NOT NULL,
  `userUA` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `forum`
--

CREATE TABLE `forum` (
  `id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `classify` int(11) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) NOT NULL,
  `title` text,
  `content` text NOT NULL,
  `coverImg` text,
  `postTime` bigint(20) NOT NULL,
  `postIP` text NOT NULL,
  `postUA` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `phoneVerify`
--

CREATE TABLE `phoneVerify` (
  `id` bigint(20) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `verifyCode` int(11) NOT NULL,
  `sendTime` bigint(20) NOT NULL,
  `userIP` text NOT NULL,
  `userUA` text NOT NULL,
  `used` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `shortUrl`
--

CREATE TABLE `shortUrl` (
  `id` bigint(20) NOT NULL,
  `tag` text NOT NULL,
  `url` text NOT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `pass` text NOT NULL,
  `phone` bigint(20) NOT NULL,
  `signupTime` bigint(20) NOT NULL,
  `signupIP` text NOT NULL,
  `signupUA` text NOT NULL,
  `userGroup` text,
  `userAuth` text,
  `avatarVersion` bigint(20) NOT NULL DEFAULT '0',
  `selfIntroduce` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `userToken`
--

CREATE TABLE `userToken` (
  `id` bigint(20) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` text NOT NULL,
  `loginTime` bigint(20) NOT NULL,
  `loginIP` text NOT NULL,
  `loginUA` text NOT NULL,
  `onlineTime` bigint(20) DEFAULT NULL,
  `onlineIP` text,
  `onlineUA` text,
  `rand` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `xfcl`
--

CREATE TABLE `xfcl` (
  `id` bigint(20) NOT NULL,
  `time` bigint(20) NOT NULL,
  `score` text NOT NULL,
  `note` text,
  `forumTopicId` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `xnzx_class_table`
--

CREATE TABLE `xnzx_class_table` (
  `id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `PA_slogan` text NOT NULL,
  `PA_photosName` text NOT NULL,
  `PA_photosVersion` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `xnzx_student_PA`
--

CREATE TABLE `xnzx_student_PA` (
  `id` bigint(20) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `name` text NOT NULL,
  `detail` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `xnzx_student_table`
--

CREATE TABLE `xnzx_student_table` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `class` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `sex` int(11) NOT NULL,
  `uid` bigint(11) DEFAULT NULL,
  `disabled` int(11) NOT NULL DEFAULT '0',
  `PA_photosName` text NOT NULL,
  `PA_photosVersion` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `xnzx_weekly`
--

CREATE TABLE `xnzx_weekly` (
  `id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `term` text NOT NULL,
  `num` int(11) NOT NULL,
  `note` text,
  `nameInvisible` int(11) NOT NULL DEFAULT '0',
  `postTime` bigint(20) NOT NULL,
  `forceFinished` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `xnzx_weekly_article`
--

CREATE TABLE `xnzx_weekly_article` (
  `id` bigint(20) NOT NULL,
  `parentId` bigint(20) NOT NULL,
  `author` int(11) NOT NULL,
  `typist` int(11) NOT NULL,
  `title` text,
  `tiji` text,
  `content` text,
  `houji` text,
  `oriContent` text,
  `postUid` bigint(20) DEFAULT NULL,
  `postTime` bigint(20) DEFAULT NULL,
  `postIP` text,
  `postUA` text,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转储表的索引
--

--
-- 表的索引 `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `phoneVerify`
--
ALTER TABLE `phoneVerify`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `shortUrl`
--
ALTER TABLE `shortUrl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `userToken`
--
ALTER TABLE `userToken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `xfcl`
--
ALTER TABLE `xfcl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `xnzx_class_table`
--
ALTER TABLE `xnzx_class_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `xnzx_student_PA`
--
ALTER TABLE `xnzx_student_PA`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `xnzx_student_table`
--
ALTER TABLE `xnzx_student_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `xnzx_weekly`
--
ALTER TABLE `xnzx_weekly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `xnzx_weekly_article`
--
ALTER TABLE `xnzx_weekly_article`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
