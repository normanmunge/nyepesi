-- phpMyAdmin SQL Dump
-- version 4.3.8deb0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 09, 2017 at 12:11 AM
-- Server version: 5.5.54-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nyepesi`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add register agent', 1, 'add_registeragent'),
(2, 'Can change register agent', 1, 'change_registeragent'),
(3, 'Can delete register agent', 1, 'delete_registeragent'),
(4, 'Can add register customer', 2, 'add_registercustomer'),
(5, 'Can change register customer', 2, 'change_registercustomer'),
(6, 'Can delete register customer', 2, 'delete_registercustomer'),
(7, 'Can add log entry', 3, 'add_logentry'),
(8, 'Can change log entry', 3, 'change_logentry'),
(9, 'Can delete log entry', 3, 'delete_logentry'),
(10, 'Can add permission', 4, 'add_permission'),
(11, 'Can change permission', 4, 'change_permission'),
(12, 'Can delete permission', 4, 'delete_permission'),
(13, 'Can add user', 5, 'add_user'),
(14, 'Can change user', 5, 'change_user'),
(15, 'Can delete user', 5, 'delete_user'),
(16, 'Can add group', 6, 'add_group'),
(17, 'Can change group', 6, 'change_group'),
(18, 'Can delete group', 6, 'delete_group'),
(19, 'Can add content type', 7, 'add_contenttype'),
(20, 'Can change content type', 7, 'change_contenttype'),
(21, 'Can delete content type', 7, 'delete_contenttype'),
(22, 'Can add session', 8, 'add_session'),
(23, 'Can change session', 8, 'change_session'),
(24, 'Can delete session', 8, 'delete_session'),
(25, 'Can add grant', 9, 'add_grant'),
(26, 'Can change grant', 9, 'change_grant'),
(27, 'Can delete grant', 9, 'delete_grant'),
(28, 'Can add access token', 10, 'add_accesstoken'),
(29, 'Can change access token', 10, 'change_accesstoken'),
(30, 'Can delete access token', 10, 'delete_accesstoken'),
(31, 'Can add refresh token', 11, 'add_refreshtoken'),
(32, 'Can change refresh token', 11, 'change_refreshtoken'),
(33, 'Can delete refresh token', 11, 'delete_refreshtoken'),
(34, 'Can add application', 12, 'add_application'),
(35, 'Can change application', 12, 'change_application'),
(36, 'Can delete application', 12, 'delete_application');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$30000$Nxhk52DIYaFh$Rr6RZuI+rQvI5HRwAHpsz30EmxlGg6fWNlMeaatFGX0=', '2017-03-06 11:29:19', 1, 'nyepesi', '', '', 'n@s.com', 1, 1, '2017-03-06 11:29:10'),
(2, 'pbkdf2_sha256$30000$k0LVKOZM8PUs$GyUB5kaRW5zaaxVCltr1rRbkd+7Y/k2H4sC1vX8n2Dk=', NULL, 0, 'brian', '', '', '', 0, 1, '2017-03-07 13:48:26');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2017-03-06 12:05:19', '1', 'Norman Munge', 1, '[{"added": {}}]', 1, 1),
(2, '2017-03-06 12:05:38', '1', 'Mark Thairu', 1, '[{"added": {}}]', 2, 1),
(3, '2017-03-07 13:48:27', '2', 'brian', 1, '[{"added": {}}]', 5, 1),
(4, '2017-03-08 17:02:15', '2', 'Michael Mungai', 1, '[{"added": {}}]', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(3, 'admin', 'logentry'),
(6, 'auth', 'group'),
(4, 'auth', 'permission'),
(5, 'auth', 'user'),
(7, 'contenttypes', 'contenttype'),
(10, 'oauth2_provider', 'accesstoken'),
(12, 'oauth2_provider', 'application'),
(9, 'oauth2_provider', 'grant'),
(11, 'oauth2_provider', 'refreshtoken'),
(1, 'registerAgent', 'registeragent'),
(2, 'registerCustomer', 'registercustomer'),
(8, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-03-06 11:28:16'),
(2, 'auth', '0001_initial', '2017-03-06 11:28:19'),
(3, 'admin', '0001_initial', '2017-03-06 11:28:19'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-03-06 11:28:19'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-03-06 11:28:20'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-03-06 11:28:20'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-03-06 11:28:20'),
(8, 'auth', '0004_alter_user_username_opts', '2017-03-06 11:28:20'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-03-06 11:28:21'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-03-06 11:28:21'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-03-06 11:28:21'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-03-06 11:28:21'),
(13, 'registerAgent', '0001_initial', '2017-03-06 11:28:21'),
(14, 'registerAgent', '0002_auto_20170306_1112', '2017-03-06 11:28:22'),
(15, 'registerCustomer', '0001_initial', '2017-03-06 11:28:22'),
(16, 'registerCustomer', '0002_auto_20170306_1112', '2017-03-06 11:28:23'),
(17, 'sessions', '0001_initial', '2017-03-06 11:28:23'),
(18, 'oauth2_provider', '0001_initial', '2017-03-07 13:46:23'),
(19, 'oauth2_provider', '0002_08_updates', '2017-03-07 13:46:24'),
(20, 'oauth2_provider', '0003_auto_20160316_1503', '2017-03-07 13:46:25'),
(21, 'oauth2_provider', '0004_auto_20160525_1623', '2017-03-07 13:46:26'),
(22, 'registerAgent', '0003_auto_20170308_2028', '2017-03-08 20:51:26');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ms6ig11s1y6fwfcev0hjumoj9124693q', 'OWY0MWY4MGJhNDI2YmI2NTc1M2RkYzIzYTBlZDQ2MDhlMDgzMmE1NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUyZThlMWU4YWFiNzM1NmFiY2QyNWY0YjhlMGEyMTU0OWZiYTNmZjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-03-20 11:29:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth2_provider_accesstoken`
--

CREATE TABLE IF NOT EXISTS `oauth2_provider_accesstoken` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires` datetime NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

INSERT INTO `oauth2_provider_accesstoken` (`id`, `token`, `expires`, `scope`, `application_id`, `user_id`) VALUES
(1, 'NFl0hsHPOqCYsJ1oGrgTuEEr1Nsxgt', '2017-03-08 17:09:56', 'read write', 1, 2),
(2, 'wTTIQuXADSZnXaqsLrcaLk41KkcvxS', '2017-03-08 17:09:56', 'read write', 1, 2),
(3, 'b01dcvIwdjLuirWaMceZvR27xVxnTV', '2017-03-08 17:25:01', 'read write', 1, 2),
(4, '9tuvpbdHSmBgXEhkyj05SLozj9b0zB', '2017-03-08 17:25:01', 'read write', 1, 2),
(5, 'YMgEg6CQWzh74vpqznsZKuQ3kJNdYw', '2017-03-08 17:26:03', 'read write', 1, 2),
(6, 'xMZ9VTsHD5jLPO54NhivZapRS8Y566', '2017-03-08 17:26:03', 'read write', 1, 2),
(7, 'qRvi7b8TzzEaH2ODX68GKVUBnCCa3I', '2017-03-08 17:27:18', 'read write', 1, 2),
(8, 'EUSCxpQfmZirP6WwUuleWrvGLBguJv', '2017-03-08 17:27:18', 'read write', 1, 2),
(9, 'mMhLvReOvJth3vj2wIdNpE9PwcuDck', '2017-03-08 17:29:14', 'read write', 1, 2),
(10, 'pO9Tq3YKC9GtzjVMueWDYZwTM1uVHk', '2017-03-08 17:29:14', 'read write', 1, 2),
(11, 'y38qGnenam9vE454bDWWj9j6aUZq8P', '2017-03-08 17:31:26', 'read write', 1, 2),
(12, 'gO4DkPJwaZHTjU4LTOIKxganjaBl1t', '2017-03-08 17:31:26', 'read write', 1, 2),
(13, 'yZvs9LBQwlyybu97gwghfQ7nXpEBqi', '2017-03-09 02:14:54', 'read write', 1, 2),
(14, '8YoLyvsb6svqy3h41qE2f6lbvgyBdv', '2017-03-09 02:14:54', 'read write', 1, 2),
(15, 'I1aHEPn2OzsXo5C4EHNQvfte1gcPfF', '2017-03-09 02:22:16', 'read write', 1, 2),
(16, 'aCbGRY6G7T8e5qvj7JsgQKYLqrBcix', '2017-03-09 02:22:16', 'read write', 1, 2),
(17, 'GALmLtTmPkVBiHe7mt3WLmdUlLIvPl', '2017-03-09 02:26:22', 'read write', 1, 2),
(18, 'qh0ZSBHqGvNbsC6PO017X6cHH9bhtH', '2017-03-09 02:26:22', 'read write', 1, 2),
(19, '0dPweWmuJwsnwCtNwFdkHqVPHQAsgN', '2017-03-09 02:27:22', 'read write', 1, 2),
(20, 'tMLhQ8xaVgqPlM8ZBdWAcks8QE1JrX', '2017-03-09 02:27:22', 'read write', 1, 2),
(21, 'xPcnB5jc2R7QyMu8YX8PBY7nLNkZvC', '2017-03-09 02:29:26', 'read write', 1, 2),
(22, 'c2tA43E7kVccHv5wWZrv5eKJRs7yYm', '2017-03-09 02:29:26', 'read write', 1, 2),
(23, 'W8uuuTkSZd8HyVD5kPq6ck33LBLyOz', '2017-03-09 02:33:19', 'read write', 1, 2),
(24, 'PddyEXRPEOYpyt5eUrkEdtoglw12jm', '2017-03-09 02:33:19', 'read write', 1, 2),
(25, 'xmfpXJlJhL5wMUNcDkbh6nh7I5HJHe', '2017-03-09 02:37:03', 'read write', 1, 2),
(26, '0Nx9gyP7Em5JjpPVlDqhPrSn9cyUpD', '2017-03-09 02:37:03', 'read write', 1, 2),
(27, 'eHo03zZJPpLA60HAfrfyxnjI9hoqdq', '2017-03-09 02:41:24', 'read write', 1, 2),
(28, 'Sg4hqtlfbajCI6MuOzEY6vU1RUmRpE', '2017-03-09 02:41:24', 'read write', 1, 2),
(29, '3XFdwm26R12M7k9L3KAHS8PgZPO9kx', '2017-03-09 02:42:09', 'read write', 1, 2),
(30, '59LsGgTNp5HjKkfngCdIv193NLp21r', '2017-03-09 02:42:09', 'read write', 1, 2),
(31, 'MriYbeQg060QqrcNzmTEtCIAYYXkI4', '2017-03-09 02:43:49', 'read write', 1, 2),
(32, 'rJylc9Ejrjadi3llLas8lxTmBdKJvx', '2017-03-09 02:43:49', 'read write', 1, 2),
(33, 'k7Go3KgicWbGWCKsI06AOOMg8WFmIA', '2017-03-09 02:44:55', 'read write', 1, 2),
(34, 'i2Oq7CtswDxT9twSwuMQwmvTqzgYXs', '2017-03-09 02:44:55', 'read write', 1, 2),
(35, '0atgQ0diadfpppxkMfnpmLEgpnSEGE', '2017-03-09 02:46:39', 'read write', 1, 2),
(36, '8kwunWTBivg5mQJjXmLAofn0FUNlLF', '2017-03-09 02:46:39', 'read write', 1, 2),
(37, 'xwPWetAzx2SAoDeBqbaVbVatFIU2Pj', '2017-03-09 02:48:13', 'read write', 1, 2),
(38, 'BrIcTKqmI9x2n0JG7cNhe3yjxT2Dm2', '2017-03-09 02:48:13', 'read write', 1, 2),
(39, 'xIhG92BK40PYGUXr5rXzRV5BFn0yvt', '2017-03-09 02:49:24', 'read write', 1, 2),
(40, 'GUBw3U95RRHkaCwBa8m3wreBLN5gnT', '2017-03-09 02:49:24', 'read write', 1, 2),
(41, 'IYXhJ5OzKcJfxeNmDhwhy7AuqvP6eN', '2017-03-09 02:50:20', 'read write', 1, 2),
(42, 'SLWmcpTtnMLfq8I49vDmg0Saj5Mpgm', '2017-03-09 02:50:20', 'read write', 1, 2),
(43, 'ew5OtXfinmxWZL9AUPGBPd9sEgpE3n', '2017-03-09 02:52:15', 'read write', 1, 2),
(44, 'eeBDutDfaKxr2tzp1RX4NvS6fTCHYt', '2017-03-09 02:52:15', 'read write', 1, 2),
(45, 'wgwWRlrBtf64Rded1VzUe7oC5jq875', '2017-03-09 02:52:56', 'read write', 1, 2),
(46, 'nJNjALlLoEze5IrHtujxIfib5wx7H8', '2017-03-09 02:52:56', 'read write', 1, 2),
(47, 'Rpq2MI9lkEY4JYOOjCq6xnYffFm4Ow', '2017-03-09 02:53:48', 'read write', 1, 2),
(48, 'qQpIUU1yTKITQpdjyKfOZ5qUHGGjPI', '2017-03-09 02:53:48', 'read write', 1, 2),
(49, 'oD8xBLrPwMU7zTdFcriZsrvKR6XPXf', '2017-03-09 02:54:46', 'read write', 1, 2),
(50, 'LQ4qR6Vp4C3bn5WiWOUPy4hkQFF9Cd', '2017-03-09 02:54:46', 'read write', 1, 2),
(51, '7octnsCMYNvfYBi7VblD7eKz9AfBFN', '2017-03-09 02:57:02', 'read write', 1, 2),
(52, '4GOAUx6pIjC5sFcFFnr5AYNtdH3nyr', '2017-03-09 02:57:02', 'read write', 1, 2),
(53, 'fAskV1q3F4pp3eoEYwuydOvnzalS97', '2017-03-09 02:57:32', 'read write', 1, 2),
(54, 'jwmf1M21ZN0Gd8uGpGyuECTPdsv5gW', '2017-03-09 02:57:32', 'read write', 1, 2),
(55, 'CstRG9dM0zBmxy4yUzDbujrCquke3O', '2017-03-09 02:58:12', 'read write', 1, 2),
(56, 'AL6WP2zuTyu31PT631k9JUPlZ3rOBt', '2017-03-09 02:58:12', 'read write', 1, 2),
(57, '6HustIAY5hO2118JBMwCqWObpwg0uD', '2017-03-09 02:59:10', 'read write', 1, 2),
(58, '4dAy0saFmTRiH5qGuHCP5PKXcFUSBs', '2017-03-09 02:59:10', 'read write', 1, 2),
(59, 'T2El9dsqrxbwZLvMdWxnDd1EXFXMs3', '2017-03-09 02:59:52', 'read write', 1, 2),
(60, '296D0JnKjsesjwE2nQtRld9nnH6SMh', '2017-03-09 02:59:52', 'read write', 1, 2),
(61, 'qFUlP7XRadVIAsiPjsY6ZUQkyG8Xir', '2017-03-09 03:01:38', 'read write', 1, 2),
(62, 'etA5CClljGL5OkU4QzZRoSft4YSRlD', '2017-03-09 03:01:38', 'read write', 1, 2),
(63, '0m4z8CO1YRYqeoYtXoKrxrLBqq8hVg', '2017-03-09 03:02:33', 'read write', 1, 2),
(64, 'e9ilaW6aTq0oj2bk99Vl0CiyvKG2ai', '2017-03-09 03:02:33', 'read write', 1, 2),
(65, 'w1i4a4fVuDsF1qssFZX4ug7AbgXM2K', '2017-03-09 03:05:08', 'read write', 1, 2),
(66, '09SYYYjgJhibywUvP7ZCuIvrb0NG89', '2017-03-09 03:05:08', 'read write', 1, 2),
(67, 'dN6j2LjXuJ9y4ygvy8ApWlu042MAWM', '2017-03-09 03:06:49', 'read write', 1, 2),
(68, 'AxdkrnwAXDj18Loqmg1RXOQYuXHwmj', '2017-03-09 03:06:49', 'read write', 1, 2),
(69, 'VIOczzgHg4D9Tl9TBAgbLFeJmrtpgV', '2017-03-09 03:14:17', 'read write', 1, 2),
(70, 'Ycxk4Hl9Eom7Cecz5z3clDY3gRErgZ', '2017-03-09 03:14:17', 'read write', 1, 2),
(71, 'fZLWa7uRwv0k7GZt9E2Hm3vSVlM1sE', '2017-03-09 03:15:25', 'read write', 1, 2),
(72, 'lgs5QeFwnzFdwmDN7MxcpAk5lkDOuG', '2017-03-09 03:15:25', 'read write', 1, 2),
(73, 'HG3Q9i8femvIe24WR2h4b9jVfutUKl', '2017-03-09 03:16:39', 'read write', 1, 2),
(74, '08pc78rkoxc93vklOeJkgovysfXlMS', '2017-03-09 03:16:39', 'read write', 1, 2),
(75, 'TwiZURfRnpywt7Z9xF0PRxNWu5C81f', '2017-03-09 03:18:23', 'read write', 1, 2),
(76, 'ix03rg2EQXwvaZdBhFat2nVlcI9fXG', '2017-03-09 03:18:23', 'read write', 1, 2),
(77, 'gc8QjbmSENPF1uBeEyStosXJ3BAnWG', '2017-03-09 03:19:54', 'read write', 1, 2),
(78, 'wg0Jhj2BVqLfzRLEv0ZRezQsLXT2e4', '2017-03-09 03:19:54', 'read write', 1, 2),
(79, 'o9QJ6kr5qmNwsgiiTIu78dUHNvNgn0', '2017-03-09 03:25:07', 'read write', 1, 2),
(80, 'XTUCuQwpyEpI2jKx5iVOwjJ0RX4y7L', '2017-03-09 03:25:07', 'read write', 1, 2),
(81, 'OtpAYUJ5cIkLs82wkfhss0HZcU4L5l', '2017-03-09 03:26:28', 'read write', 1, 2),
(82, 'F5d2XUR7ZdRgHyFbJdcS7uweSsZB71', '2017-03-09 03:26:28', 'read write', 1, 2),
(83, 'WNW064YtutckOVHQMGdoxRiXIQmN19', '2017-03-09 03:27:45', 'read write', 1, 2),
(84, 'T8sVbDBerkvopiKG1IimRqbPKwB8qV', '2017-03-09 03:27:45', 'read write', 1, 2),
(85, 'Q9GhCSm6j17giQi5cELhkcUhyg7bZi', '2017-03-09 03:48:43', 'read write', 1, 2),
(86, 'Qlk1O9zlN7B2Z9X6oHrTQZ2pkkx7gt', '2017-03-09 03:48:43', 'read write', 1, 2),
(87, 'hA1SJXhcgbbT5xiv9kmTJeFRhcPxUI', '2017-03-09 04:07:47', 'read write', 1, 2),
(88, 'lFC1M4tWpyvVsiiadQpWqpzl4IqGHQ', '2017-03-09 04:07:47', 'read write', 1, 2),
(89, 'PNjeWu4iXG90Ys5MBwrA1TjpSb7tdH', '2017-03-09 05:47:16', 'read write', 1, 2),
(90, '13QuNTws5EGuSNcPEVrItLYgfYBDxp', '2017-03-09 05:47:16', 'read write', 1, 2),
(91, 'K2w4Ya20z3vDD6GsNL3c0vJSdBIxMz', '2017-03-09 05:52:07', 'read write', 1, 2),
(92, 'xCEjz32caPZKujvurVfmmx26J4Dy8r', '2017-03-09 05:52:07', 'read write', 1, 2),
(93, 'd4f735WdWP1Xi3gVhDbGQDnpLztliO', '2017-03-09 05:52:50', 'read write', 1, 2),
(94, 'N6IIBMoafCyLVNCTQJQAXCPx2qhby6', '2017-03-09 05:52:50', 'read write', 1, 2),
(95, 'rfh9D6yiwWAkpc5ZFrLX9V5PpRVfzz', '2017-03-09 05:56:44', 'read write', 1, 2),
(96, '4LQwTxMfik9KpWjDAm5zdaeBWQAtLW', '2017-03-09 05:56:44', 'read write', 1, 2),
(97, '8RY9YDvmonvhsUU1XLSdYEsdkJNxnJ', '2017-03-09 05:57:55', 'read write', 1, 2),
(98, '2iTRcTK43AZDFh6fLloCuZmHs6Z1qI', '2017-03-09 05:57:56', 'read write', 1, 2),
(99, 'kiDrdBo4K0FNAJqfDGgNoyEmg8lcGc', '2017-03-09 05:58:36', 'read write', 1, 2),
(100, 'X45V8EwfnVfckCW1ljN6njDBDbcj0R', '2017-03-09 05:58:36', 'read write', 1, 2),
(101, 'ieqiP6p99Wb3vQQr6cPykLvSrUTtc2', '2017-03-09 05:59:25', 'read write', 1, 2),
(102, 'B11aM3ZY5drWkFE1wVRLveM1cp0kyd', '2017-03-09 05:59:25', 'read write', 1, 2),
(103, 'ABP6XfQRtc7cPRTNJAYYUvA7mDmK7p', '2017-03-09 06:01:06', 'read write', 1, 2),
(104, 'ZiFeGZwloHclIkMCR1iJnM47Arz73K', '2017-03-09 06:01:06', 'read write', 1, 2),
(105, 'xYvywzPeJsrEgFEOo9SYRJ0jIB6oHy', '2017-03-09 06:02:52', 'read write', 1, 2),
(106, 'iuGhWhyU4zDx4YL1q3IrAuNjk5qY6Q', '2017-03-09 06:02:52', 'read write', 1, 2),
(107, 'X9GFRtvuWi5ouYxob1MX2dIK5azrMj', '2017-03-09 06:03:27', 'read write', 1, 2),
(108, 'oVxHWq30FF7pZcBbOOpLQfPGYtEC6E', '2017-03-09 06:03:27', 'read write', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth2_provider_application`
--

CREATE TABLE IF NOT EXISTS `oauth2_provider_application` (
  `id` int(11) NOT NULL,
  `client_id` varchar(100) NOT NULL,
  `redirect_uris` longtext NOT NULL,
  `client_type` varchar(32) NOT NULL,
  `authorization_grant_type` varchar(32) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth2_provider_application`
--

INSERT INTO `oauth2_provider_application` (`id`, `client_id`, `redirect_uris`, `client_type`, `authorization_grant_type`, `client_secret`, `name`, `user_id`, `skip_authorization`) VALUES
(1, 'vqUG5XpzODxbtwFFY9qrOvhOxjPabJBEj5zcSjZL', '', 'public', 'password', '3hrgatoPkHluTrgJ01XCFdywJJ0dHHkpNAWAdlqYnZeQM04CKCHCiY9v5d6Jmx2XtajcXnwFUdsYXQABYBaCoDS00DbqjH7I61Wc55IFBCbnSme0JJ3RjXdDcxlGtzeN', 'nyepesi', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oauth2_provider_grant`
--

CREATE TABLE IF NOT EXISTS `oauth2_provider_grant` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `expires` datetime NOT NULL,
  `redirect_uri` varchar(255) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

CREATE TABLE IF NOT EXISTS `oauth2_provider_refreshtoken` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `access_token_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

INSERT INTO `oauth2_provider_refreshtoken` (`id`, `token`, `access_token_id`, `application_id`, `user_id`) VALUES
(1, 'L3klw20r2eBaPo5NaS6QTBvs8KFT5E', 1, 1, 2),
(2, 'lig8monAfwsd81RcakCRvIQLAdgOzh', 2, 1, 2),
(3, 'VjQWTcCgNA1hvdmCkBQWRRaYjckWBJ', 3, 1, 2),
(4, 'ul425ghFBgGMa5QtvoRU4iZVFugSoW', 4, 1, 2),
(5, 'c0WNJBcQUZja4vmeC2YRkd5OST02Et', 5, 1, 2),
(6, 'N80DBB72i25LHf001AsGWaDMQchYMl', 6, 1, 2),
(7, 'XF1iXKY8Ho2zvbPKQtPB3IY6TQObQK', 7, 1, 2),
(8, 'ITaVEzqdWbLqtddWCzt73jtkjT7QJw', 8, 1, 2),
(9, 'kddLhxrsPItHxd5O4e5ZokOZNHIjVc', 9, 1, 2),
(10, 'HhE9EtTZUGyMaiSzb7Gxema3MfjS7M', 10, 1, 2),
(11, 'EzAZ0w1ZjzGTuf5gpEbBUQm6COUzHD', 11, 1, 2),
(12, 'lrDRsPMmXHQEoEkdc9Kj6e3jgNPJfx', 12, 1, 2),
(13, 'PAy50shqGWBka6dIm7FC1ctwi9kktL', 13, 1, 2),
(14, 'SnziZssWgJZgnF7beVzHYgErlhR8rm', 14, 1, 2),
(15, 'Laj5lkE2xgEeQY1JlZtuBwU6kU62AB', 15, 1, 2),
(16, 'tWQMcYEcnR1VftQVj0qchAAYOUQYiw', 16, 1, 2),
(17, 'N3vENztyyU6M9neQOhBFb35O3N1D0x', 17, 1, 2),
(18, '3VX4hW2xtj4dkBslqRrivr5hkqu0jz', 18, 1, 2),
(19, '4BMLtWwnN0LEgcYI300BYvCYc454i2', 19, 1, 2),
(20, 'FZGPgNF5GxCbYq3x1HPmFlUzu2wrl8', 20, 1, 2),
(21, 'kkL9z6VZJBEcKeWnTbxqgKpLYvxx7M', 21, 1, 2),
(22, 'Lpa9efRTEnyNcmC7bsYd3vo8JqCvwu', 22, 1, 2),
(23, '23YbGwWIs4P3K95d5snrnoDQ2IUDGc', 24, 1, 2),
(24, 'BqAdDlInRY5dAn14VF6Y5AmfQqC2FY', 23, 1, 2),
(25, 'tjYy03vSP1NlTicSfevmcViRJZ4UTy', 25, 1, 2),
(26, 'fbLelYqpRugUwQj6I6vAa37D79RkaF', 26, 1, 2),
(27, 'eQpu0QZIUbCHrcN1xDO7HssypsTbSl', 28, 1, 2),
(28, 'E1HJdXeuo6IVpPK3YfYsrGTzWv4Pw4', 27, 1, 2),
(29, 'MmCjfWYTX3nBCY4JNS6Vv0dBFMWfPt', 29, 1, 2),
(30, 'QxcITJfdKiarTv4zq8FN9l4nt7GlaW', 30, 1, 2),
(31, 'KOqQdXO0ZzwsySQc23T9Ap8D3ziqEH', 31, 1, 2),
(32, 'q1rr5T1XMLZPrn48K31XoxdtuI2Aio', 32, 1, 2),
(33, 'EE8SM3EYOPAJdff9AaJwYUD8gBUvAV', 33, 1, 2),
(34, 'cTSi4ubKBh8rxsg2S6VDMRo95UWFsO', 34, 1, 2),
(35, 'RNDlEsJR6h6P9eVZ3fp0xE3MhGIA93', 35, 1, 2),
(36, 'oM4JE7UkhfWvqKoSX0I9CLizJ1EuoQ', 36, 1, 2),
(37, 'kcNSO2QuyIjyYqru6QmeUDAFt98cJc', 37, 1, 2),
(38, 'CtCLD9rsTc2DiXCIuOHAwln5ElujJb', 38, 1, 2),
(39, '8d31EoTJVoqEl9qBjFoQ0jpXrfMKyN', 39, 1, 2),
(40, 'VEMOyZ9Yg621Tb0tp0aPc9vjTzrR1j', 40, 1, 2),
(41, 'NiKhFkv05hlEpvgU0dzqKyUJo1q9Cq', 41, 1, 2),
(42, 'L3xhU8wfOxpTcgB3ALEN3dKo8NJPIo', 42, 1, 2),
(43, 'eLXkmJGZRPUdwuE25XjYtLNGadXihW', 43, 1, 2),
(44, 'RSpwqT72AW1G8kRLUwMGxENbaigv7E', 44, 1, 2),
(45, 'nV8QHsrAoug2JPV89FWHWpbVEjzVeA', 45, 1, 2),
(46, '9AJxmFfYmbOF3963AOmwycRjYraF2r', 46, 1, 2),
(47, 'OrPm714fVz9E9C0pOQlgnsr89ocZes', 47, 1, 2),
(48, '9sek9EThQLIzOQjOfzAnCUXtSqX5sg', 48, 1, 2),
(49, 'YE2r2oNnlCmmuU8pvTfGe3E2jXAaRf', 49, 1, 2),
(50, 'HCwVHTICcWF6dgEquQ8nOqAJSMICgo', 50, 1, 2),
(51, '4igv3dtinkEgnkN5DHzHHAFMckCu1X', 51, 1, 2),
(52, 'xV4xyn66pZEpRc0Ht23Xn69HwhFlme', 52, 1, 2),
(53, 'GzafTX1QI6zFxxqPIxtwIKXpplI6OB', 53, 1, 2),
(54, 'Jsdzwmj9kXNoH7KNs4dmeOqFsZdvpB', 54, 1, 2),
(55, '9GQ6h8GQMKBTt44BWo60uqZvXe0xrM', 55, 1, 2),
(56, 'gQVDNra5dYEBwNrj3QL5TR3UN7zu7K', 56, 1, 2),
(57, 'XYCUB9P25hQ3P6x5kO7BBiaxgjXTQu', 57, 1, 2),
(58, 'uwQOseWgbQ5eWT1doU7KU6rEH2s51y', 58, 1, 2),
(59, '0tOWCCFSl4ndSFNBdjFQxfdvGUlN6B', 59, 1, 2),
(60, 'AjMa87GC1PT2LfGycrYptDgGqGxjDZ', 60, 1, 2),
(61, 'eiNhLglZNR3wmaf9e0yXXOpppfhRU8', 61, 1, 2),
(62, '82zuUWkqYRUiTwrJuHeE6bTqkgOr1t', 62, 1, 2),
(63, '7pEDsVVE5oH6JXuZXG9kppZfG9Ds13', 64, 1, 2),
(64, 'jgWqdf1RyHu1xuVOFJXlVtckZwGVI8', 63, 1, 2),
(65, 'MY9siCPyznFZLetTPUdxQ6A1KRgALe', 65, 1, 2),
(66, 'LD1ZC8LJUT6JKE3mtUIRIpbM2vxXdk', 66, 1, 2),
(67, '52Gh4UKh1ISV5DHpMopusBShPOhrvI', 67, 1, 2),
(68, 'KCWlaUiH5GmiQILf7sTXVTE82HjYtr', 68, 1, 2),
(69, '7OXLtDdz2W6Y76HOQb7lr9yjFFmMlv', 70, 1, 2),
(70, 'sTZ8ru8hf5JkqSjVwjZ0eyIxLasOrJ', 69, 1, 2),
(71, 'W6Abk9zdF27Zkj2FJB61qERPPLNkTM', 71, 1, 2),
(72, '6Xu6V1uldzymJYg9DgLNDEmJd0b8mM', 72, 1, 2),
(73, 'yc65pvluFTd7w4KiCCSFmzy7b6uvpN', 73, 1, 2),
(74, 'FlAQhtRGRR5f4IdsOhMl6GiVW7X8xG', 74, 1, 2),
(75, 'QmPS4rnDuVJo15hKEi7LIY19xXKjSl', 75, 1, 2),
(76, 'sg7ftHp2QYsHNnDQ7elVkS2tDdYh2P', 76, 1, 2),
(77, 'NiRneQve9JLu9O2lzoPgkFyEF9ss2C', 77, 1, 2),
(78, 'FbBZGK3yziZ5Od2W0cnH3Ow8HKu4B8', 78, 1, 2),
(79, 'dTG01W8BuLLq4bhyJLNbx1wY4PsUQU', 79, 1, 2),
(80, 'N5qtAX4kI6Ja9EbjUMOKPyjX6q9BjA', 80, 1, 2),
(81, 'z7o7caxgwyB5UP8kk1XVqTd6Bkjm1w', 81, 1, 2),
(82, '2VUx88TZQnqj6KkAbMkMt9h4GiUx5o', 82, 1, 2),
(83, 'P9NM403r3rBUMcWoiaTXarbWlgTZLu', 83, 1, 2),
(84, 'rxW2ZVXhVVg8xNKlk3th8CKK6vhddD', 84, 1, 2),
(85, 'sYXMe1YtgmI9L7oD1bcdx1XrJLGUL0', 85, 1, 2),
(86, 'bGCK9F0usqD6KD98W9XyKwmNBmuebF', 86, 1, 2),
(87, 'xAag4lA3vSkGMxv3FrwQSrEU96jimn', 87, 1, 2),
(88, 'hQb6yr7BUc2RZULQKQD46EQzxpRfKr', 88, 1, 2),
(89, 'QRX8heG7zqGWJCPqXW6ybZCS68lYpK', 89, 1, 2),
(90, 'h9gHhyAVRmbkwJTIYodEmrZEf3AOB9', 90, 1, 2),
(91, 'jqB7OHMSe58rsi1zDbxtsbWIEzYkao', 91, 1, 2),
(92, 'hD8XqlQ0zQh2GNKwNqQyBUlHRciNQ2', 92, 1, 2),
(93, 'ff375gQ0UNacsUnWvOLciyuJxmjaoH', 93, 1, 2),
(94, 'DqngSHTtS1smDxHKJ2yYmdGdDxrsv9', 94, 1, 2),
(95, 'tlQ5uw5qRA94htRwnkrR6NKAzkdlV6', 95, 1, 2),
(96, 'TivvL70GLheeNalc8Es0F6XvPOo0KE', 96, 1, 2),
(97, 'RDCzXPLPedbMr9iGSpQaAtk8GQ1tR0', 97, 1, 2),
(98, 'oxdfitIlCyCZxEHKkxomuE8tuRNrI0', 98, 1, 2),
(99, 'SQD0Cj3qshHEOuw6LY1nD1ZKRanywJ', 99, 1, 2),
(100, 'vD7NZuyoqZnuYHQgfBkrlCoHCTjbwt', 100, 1, 2),
(101, 'ZsJEYQ7E7jE3c4mx3uvdnp6VBal2Xl', 101, 1, 2),
(102, 'sb7dXJzAtxnbh845N6W3sO84Ri0opT', 102, 1, 2),
(103, '7A6pHVCTqcv7ofSBYXTTJS1mcYpha8', 103, 1, 2),
(104, '9G586PNbxhRGW26Kr7buxS8VV9UdDV', 104, 1, 2),
(105, 'aBn3YytQZxKdGfFNo2AoEiU4EabazG', 105, 1, 2),
(106, 'dbNPkrosXOlF3kEPK8dUUeA8FzfG8J', 106, 1, 2),
(107, 'RzxU4LHsEWAZ5h0IyqczUKqXZ17KXr', 107, 1, 2),
(108, '5xZ4vDtt2LbAxQY3tCGBlVrxSHOn1U', 108, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `registerAgent_registeragent`
--

CREATE TABLE IF NOT EXISTS `registerAgent_registeragent` (
  `id` int(11) NOT NULL,
  `F_Name` varchar(250) NOT NULL,
  `L_Name` varchar(250) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Phonenumber_id` int(11) NOT NULL,
  `County` varchar(250) NOT NULL,
  `Constituency` varchar(250) NOT NULL,
  `Locality` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registerCustomer_registercustomer`
--

CREATE TABLE IF NOT EXISTS `registerCustomer_registercustomer` (
  `id` int(11) NOT NULL,
  `L_Name` varchar(250) NOT NULL,
  `Phonenumber` varchar(250) NOT NULL,
  `F_Name` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registerCustomer_registercustomer`
--

INSERT INTO `registerCustomer_registercustomer` (`id`, `L_Name`, `Phonenumber`, `F_Name`) VALUES
(1, 'Thairu', '0712658102', 'Mark'),
(2, 'Mungai', '0723284699', 'Michael');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`), ADD KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`), ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`), ADD KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`), ADD KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`), ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`), ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Indexes for table `oauth2_provider_accesstoken`
--
ALTER TABLE `oauth2_provider_accesstoken`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `oauth2_provider_accesstoken_token_8af090f8_uniq` (`token`), ADD KEY `oauth2_application_id_b22886e1_fk_oauth2_provider_application_id` (`application_id`), ADD KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `oauth2_provider_application`
--
ALTER TABLE `oauth2_provider_application`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `client_id` (`client_id`), ADD KEY `oauth2_provider_application_9d667c2b` (`client_secret`), ADD KEY `oauth2_provider_application_user_id_79829054_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `oauth2_provider_grant`
--
ALTER TABLE `oauth2_provider_grant`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `oauth2_provider_grant_code_49ab4ddf_uniq` (`code`), ADD KEY `oauth2_application_id_81923564_fk_oauth2_provider_application_id` (`application_id`), ADD KEY `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `oauth2_provider_refreshtoken`
--
ALTER TABLE `oauth2_provider_refreshtoken`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `access_token_id` (`access_token_id`), ADD UNIQUE KEY `oauth2_provider_refreshtoken_token_d090daa4_uniq` (`token`), ADD KEY `oauth2_application_id_2d1c311b_fk_oauth2_provider_application_id` (`application_id`), ADD KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `registerAgent_registeragent`
--
ALTER TABLE `registerAgent_registeragent`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `registerAgent_registeragent_Phonenumber_id_b1c10b48_uniq` (`Phonenumber_id`);

--
-- Indexes for table `registerCustomer_registercustomer`
--
ALTER TABLE `registerCustomer_registercustomer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `oauth2_provider_accesstoken`
--
ALTER TABLE `oauth2_provider_accesstoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT for table `oauth2_provider_application`
--
ALTER TABLE `oauth2_provider_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oauth2_provider_grant`
--
ALTER TABLE `oauth2_provider_grant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth2_provider_refreshtoken`
--
ALTER TABLE `oauth2_provider_refreshtoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT for table `registerAgent_registeragent`
--
ALTER TABLE `registerAgent_registeragent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `registerCustomer_registercustomer`
--
ALTER TABLE `registerCustomer_registercustomer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
ADD CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `oauth2_provider_accesstoken`
--
ALTER TABLE `oauth2_provider_accesstoken`
ADD CONSTRAINT `oauth2_application_id_b22886e1_fk_oauth2_provider_application_id` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
ADD CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `oauth2_provider_application`
--
ALTER TABLE `oauth2_provider_application`
ADD CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `oauth2_provider_grant`
--
ALTER TABLE `oauth2_provider_grant`
ADD CONSTRAINT `oauth2_application_id_81923564_fk_oauth2_provider_application_id` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
ADD CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `oauth2_provider_refreshtoken`
--
ALTER TABLE `oauth2_provider_refreshtoken`
ADD CONSTRAINT `oauth2_application_id_2d1c311b_fk_oauth2_provider_application_id` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
ADD CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
ADD CONSTRAINT `oauth_access_token_id_775e84e8_fk_oauth2_provider_accesstoken_id` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`);

--
-- Constraints for table `registerAgent_registeragent`
--
ALTER TABLE `registerAgent_registeragent`
ADD CONSTRAINT `registerAgent_registerag_Phonenumber_id_b1c10b48_fk_auth_user_id` FOREIGN KEY (`Phonenumber_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
