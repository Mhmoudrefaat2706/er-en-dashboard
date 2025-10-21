-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2025 at 04:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dashboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `last_login_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `password`, `role_id`, `status`, `last_login_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'Mahmoud Refaat27', 'mahmoudebnrefaat27406@gmail.com', '01115904684', '$2y$12$/91WAnABxou3hcvvh8Nlme6yTfK1TrTpLqn5jEZsrKa2aIVH/l7ri', 2, 'active', NULL, NULL, '2025-09-18 10:51:25', '2025-09-18 10:51:25'),
(7, 'Mahmoud Refaat27', 'mahmudrefaat7@gmail.com', '1234567890', '$2y$12$8viYQ7W4efsjAnKnY/KLHubdEZEiPWPnL8clXA68gayly0Lw3dI2q', 2, 'active', NULL, NULL, '2025-09-18 11:07:48', '2025-09-18 11:07:48'),
(9, 'Mahmoud Refaat27', 'mahmoudebnrefaat2706@gmail.com', '01115904684', '$2y$12$uxANPtZTvvY.b25DLV0hu.18.TgPgO6zIpgR9U93LFg7m6d0h1fM.', 3, 'active', NULL, NULL, '2025-09-20 04:40:55', '2025-09-20 04:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE `admin_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` text NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `blog_category_id`, `name`, `slug`, `image`, `views`, `content`, `tags`, `keywords`, `meta_description`, `created_at`, `updated_at`) VALUES
(7, 9, 'mahmoudkjhg', 'mahmoudkjhg', 'blogs/1758721574_WhatsApp Image 2025-09-23 at 17.43.22_fa7a57fa.jpg', 0, '<p>o98iu7y65tr4e</p>', '\"\\u062e\\u0647\\u0639\\u063a\\u0627\\u0641\\u0644\\u0642\\u0628\\u062b,iujyhtgrfedw,8i7u6ytgrfed,\\u062e\\u0647\\u0639\\u063a\\u0627\\u0641\\u0644\\u0642\\u0628\\u062b\\u064a\\u0633\"', '\"iuj7yhtgrfe,87u6y5tr4fedw,\"', 'o98i7u6yhgt5rf4edw', '2025-09-24 10:46:14', '2025-09-24 11:04:08'),
(12, 3, 'جحخهعغللب', 'ghkhhaaghllb', 'blogs/1758723488_WhatsApp Image 2025-09-23 at 17.43.25_fb3bb2ed.jpg', 0, '<p>dcftgyhuijko</p>', '\"\\u0624\\u0628\\u0631\\u0644\\u0627\\u0644\\u0627\\u062a\\u0649\\u0646\\u0629\\u0645, uiyjhtgrvfd\"', '\"\\u0624\\u0628\\u0631\\u0644\\u0627\\u0644\\u0627\\u062a\\u0649\\u0646\\u0629\\u0645, uiyjhtgrvfd, 8ij7uhy6tgrfedw, 8u76yg5t, 7juhytgrfed\"', 'p[oiuygtf', '2025-09-24 11:18:08', '2025-09-24 11:18:22'),
(13, 8, 'فلغعاتهنخم', 'flghaaathnkhm', NULL, 0, '<p>قبفلغاعتهنخم</p><p>&nbsp;</p>', '\"\\u0628\\u0642\\u0641\\u0644\\u063a\\u0627\\u0639\\u062a\\u0647\\u0646\"', '\"\\u064a\\u0628\\u0641\\u0644\\u063a\\u0627\\u0639\\u062a\"', NULL, '2025-09-24 11:21:04', '2025-09-24 11:21:04');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `lang` varchar(5) NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `description`, `image`, `status`, `lang`, `created_at`, `updated_at`) VALUES
(3, 'هعغفلقبثيص', 'haaghflkbthys', 'حخهتعغ', 'blog_categories/B69JqTaNqVnmObDPtrCl4wdOlZcsRmW9JWUId4oH.jpg', 'active', '', '2025-09-20 05:43:25', '2025-09-20 06:04:24'),
(8, 'هعغفلق', 'haaghflk', 'هعتغافلقب', 'blog_categories/dgpk0cJtnVf99UkJkYaNnts8si63d6NWV0DbJNmA.jpg', 'active', '', '2025-09-20 06:01:36', '2025-09-20 06:01:36'),
(9, 'هعغفق', 'haaghfk', 'هعتغافلقب', 'blog_categories/P2ZnyDHW3qiygowhWW3qemBEF96ljjN3lGtLSvT5.jpg', 'active', '', '2025-09-20 06:04:16', '2025-09-20 06:04:16');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `lang` varchar(5) NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `status`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'mmmmكمنت', 'mmmmkmnt', 'نخهتعاغلب', 'categories/1xCT0S9fgDL2niVinvDBAp9SUzf4Q9jSnW9VPCIO.jpg', 'active', 'en', '2025-09-18 12:07:29', '2025-09-18 12:21:58'),
(8, 'فالقبثي', 'falkbthy', 'اىلبرؤ', 'categories/G5iRSRN7QYGElogENvSh28rHlZmYRLpoYJQpZxIf.jpg', 'active', 'en', '2025-09-18 12:21:44', '2025-09-18 12:21:44'),
(12, 'عغفقث', 'aaghfkth', 'تالبيس', 'categories/eHURTQS1d75loTKHFEAwSLCCg1Y0wH8g8KiZClHi.jpg', 'active', 'en', '2025-09-18 12:36:07', '2025-09-18 12:36:07'),
(13, 'قثبيء', 'kthbyaa', 'قبيؤ', 'categories/BHZmJJaGKyvf9pobGNwSGHcC7HRoU6mM0Ue72bzX.jpg', 'active', 'en', '2025-09-18 12:36:34', '2025-09-18 12:42:18'),
(15, 'تنالبتهعالغب', 'tnalbthaaalghb', 'نتال', 'categories/xy7gjAIokLjBsI3PpR53vezU3joGlcpxNhZwmen5.jpg', 'active', 'en', '2025-09-18 12:47:11', '2025-09-18 12:50:19'),
(17, 'نخهتعاغل', 'nkhhtaaaghl', 'خهتعاغل', 'categories/ICWyi4OnAtpYsPeBQh2kLgEzloByvuOfIY8hNDvU.jpg', 'active', 'en', '2025-09-18 12:50:42', '2025-09-18 12:50:42'),
(18, 'تالرب', 'talrb', 'نتالالهتعالنتىا', 'categories/GtSqmU30aKmWiLSjb9MeRHhBXVPTQZtvBwHgSwaq.jpg', 'inactive', 'en', '2025-09-18 12:51:03', '2025-09-18 13:14:54'),
(19, 'منتالالرنتنمتالر', 'mntalalrntnmtalr', 'نخهتعاغ', 'categories/GVhMUEmsaMv3BJjjiHw4yAc5LHLY1zMSDHAF69qc.jpg', 'inactive', 'en', '2025-09-18 12:51:24', '2025-09-18 13:44:15'),
(20, 'koijuhygv', 'koijuhygv', 'koijuhg', 'categories/3ITP8OuH0IbUuWzGjb5aFda2P53na2aBpI2XHBFa.jpg', 'active', 'en', '2025-09-18 13:44:38', '2025-09-18 13:44:38');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `lang` varchar(5) NOT NULL DEFAULT 'en',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `lang`, `status`, `created_at`, `updated_at`) VALUES
(7, 'منتالبؤ', 'منتالبؤ', 'en', 'inactive', '2025-09-20 06:46:46', '2025-09-20 06:48:39'),
(8, 'تغافلقبيس', 'تغافلقبيس', 'en', 'active', '2025-09-20 06:48:33', '2025-09-20 06:48:33');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` enum('unread','read') NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `phone`, `body`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'oiuyhtgfds', 'jyhg@jyhg.jyhtgrfd', '123456789', 'ujyhtgrfd', 'hgfd', 'unread', NULL, '2025-09-21 13:28:10');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_13_080051_create_social_media_table', 1),
(5, '2025_08_13_080101_create_sections_table', 1),
(6, '2025_08_13_080116_create_permissions_table', 1),
(7, '2025_08_15_113922_create_settings_table', 1),
(8, '2025_08_15_115008_create_roles_table', 1),
(9, '2025_08_15_115009_create_admins_table', 1),
(10, '2025_08_15_115055_create_role_permission_table', 1),
(11, '2025_08_16_125440_create_messages_table', 1),
(12, '2025_08_16_125611_create_blog_categories_table', 1),
(13, '2025_08_16_125707_create_faqs_table', 1),
(14, '2025_08_16_130303_create_categories_table', 1),
(15, '2025_08_16_130535_create_blogs_table', 1),
(16, '2025_09_18_115317_create_admin_role_table', 1),
(17, '2025_09_18_120711_create_projects_table', 1),
(18, '2025_09_18_120712_create_reviews_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'نتلالقبثيصس', 'ntlalkbthyss', 'هنعتغافلب', '2025-09-18 09:45:02', '2025-09-18 13:55:42'),
(10, 'نهتعاغل', 'nhtaaaghl', 'نختهلاا', '2025-09-18 13:55:35', '2025-09-18 13:55:35');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `price` decimal(10,2) DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `views_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `slug`, `short_description`, `description`, `category_id`, `status`, `price`, `lang`, `views_count`, `created_at`, `updated_at`, `image`) VALUES
(14, 'poijuhygfvgyhujغ5فقثصسش', 'poijuhygfvgyhujgh5fkthsssh', 'gbhjnkml,فغلقبي', '<p>fghjmk</p>', 15, 'active', 5678.00, NULL, 0, '2025-09-20 11:13:58', '2025-09-24 10:07:01', 'projects/1758377638_IMG-20250914-WA0018.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `name`, `description`, `position`, `image`, `created_at`, `updated_at`) VALUES
(4, 'غفقثص', 'غلعاهتخنم', 'ع6غ5ف4ق3ثصض', 'reviews/a35HuWZQWbHBa2XjqI5MvylmLPcA660o7wSpZkA4.webp', '2025-09-21 12:42:20', '2025-09-21 12:42:20'),
(5, 'tgyhuijokpl', 'gyuhijokpl', 'vgyhuijokpl;', 'reviews/tafK7GMhgD4gR2GDxSpvIhlTwxCk28U8kSiQFR5J.webp', '2025-09-21 12:48:39', '2025-09-21 12:48:39'),
(6, 'عتهخنم', 'اهتخنحمك', 'اعهتخنم', 'reviews/bgRhtkZjkJCtEALs6l9CxPHNW5VWpeJCJ99Fu0i7.jpg', '2025-09-21 12:51:29', '2025-09-21 12:51:29');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(2, 'تهاعلغبفؤخهتعاغ', 'thaaalghbfokhhtaaagh', 'خهتعاغلل', '2025-09-18 10:06:46', '2025-09-18 10:06:46'),
(3, 'iuytre', 'iuytre', 'iuytre', '2025-09-18 10:11:52', '2025-09-18 10:11:52'),
(4, 'نخهتعاغل', 'nkhhtaaaghl', 'نخهتعاغ', '2025-09-18 13:26:26', '2025-09-18 13:26:26'),
(5, 'oijuhbg', 'oijuhbg', 'pkojiubhj', '2025-09-18 13:53:09', '2025-09-18 13:53:09');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(2, 3, 1, NULL, NULL),
(5, 5, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`content`)),
  `lang` varchar(5) NOT NULL DEFAULT 'en',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `slug`, `content`, `lang`, `status`, `created_at`, `updated_at`) VALUES
(1, 'homepage-hero', '{\"title\":\"Welcome to Our Site\",\"subtitle\":\"Best services for you\",\"image\":\"hero.jpg\"}', 'en', 'active', '2025-09-18 17:00:40', '2025-09-18 17:00:40'),
(2, 'about-us', '{\"title\":\"About Us\",\"text\":\"We provide amazing solutions.\"}', 'en', 'active', '2025-09-18 17:00:40', '2025-09-18 17:00:40'),
(3, 'contact', '{\"title\":\"Contact Us\",\"text\":\"Get in touch via email or phone.\"}', 'en', 'active', '2025-09-18 17:00:40', '2025-09-18 17:00:40');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('lg40ODqSRB0zi36wysWoSBF6vhrtUj3byEzv4dbq', 9, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidUJxRVRTWThURTZzckZoZG5KejQ2QmhjaEZac0NKSE90UFp6cDExNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9ibG9ncyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUyOiJsb2dpbl9hZG1pbl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjk7fQ==', 1758723669);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(255) NOT NULL,
  `about_us` text DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `google_analeteces` text DEFAULT NULL,
  `type_description` text DEFAULT NULL,
  `keywordes` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `facebook_pixel` text DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_name`, `about_us`, `lang`, `google_analeteces`, `type_description`, `keywordes`, `meta_description`, `url`, `maintenance_mode`, `facebook_pixel`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'dashboardت', 'This is a sample about us text for the website.', 'en', 'hgyfcdfgh', 'Website Type Description', 'keyword1, keyword2, keyword3', 'This is a meta description for SEO purposes.', 'https://www.example.com', 0, 'kjhgvf', 'admin/settings/SGGlY2wjRac44nR5SgSG3FbWFGJofo115hKQxdLu.png', '2025-09-18 17:02:18', '2025-09-20 05:52:24');

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `lang` varchar(255) NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `url`, `status`, `lang`, `created_at`, `updated_at`) VALUES
(3, 'منتالال', 'http://127.0.0.1:8000/admin/settings', 'active', 'en', '2025-09-18 13:28:14', '2025-09-18 13:28:14'),
(4, 'نىلاعالر', 'http://127.0.0.1:8000/admin/settings', 'active', 'en', '2025-09-18 13:49:46', '2025-09-18 13:49:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `email_verified_at`, `last_login_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'mahmoud', 'mahmoud@gmail.com', '34567890', '$2y$12$.W6/hMkcxZgZ71vlGAuw9ek/GMX.nnJqtkx63ReGkl2cp53i2myUK', NULL, NULL, NULL, '2025-09-18 11:24:01', '2025-09-18 11:32:27'),
(3, 'mahmoud', 'mahmoud129@gmail.com', '87654326543', '$2y$12$zvJvdl2ugkT1lfCNzxrRCuwNf4IG1X2AbI/0G6MOrFt2gBFsFYhrC', NULL, NULL, NULL, '2025-09-18 11:25:35', '2025-09-18 11:26:25'),
(5, 'نعتغافلب', 'mahmodud@gmail.com', '23456789', '$2y$12$hzGd1aTxOytjxPPccOyRdOGHOitmk.YdeGYLCILz.hlxc3W0DzRny', NULL, NULL, NULL, '2025-09-18 11:32:53', '2025-09-18 11:32:53'),
(6, 'الرتنال', 'mahmoud9129@gmail.com', '6543212345', '$2y$12$4DSGX1MY6Hq6eHxFWg2q3eVx9H/FRIi8NqVwGRJXeZjKH6NSnbiKO', NULL, NULL, NULL, '2025-09-18 13:30:04', '2025-09-18 13:47:55'),
(7, 'تنالال', 'mahmoud149@gmail.com', 'نتالال', '$2y$12$.O.ZFuDHLxOVHD6zoCVpfeI34fvnz64bCTOz3x7LKumEjIX8ndiJm', NULL, NULL, NULL, '2025-09-18 13:48:13', '2025-09-18 13:48:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD KEY `admins_role_id_foreign` (`role_id`);

--
-- Indexes for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_role_admin_id_foreign` (`admin_id`),
  ADD KEY `admin_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `blogs_blog_category_id_foreign` (`blog_category_id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_slug_unique` (`slug`),
  ADD KEY `projects_category_id_foreign` (`category_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_permission_role_id_permission_id_unique` (`role_id`,`permission_id`),
  ADD KEY `role_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_slug_unique` (`slug`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `admin_role`
--
ALTER TABLE `admin_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD CONSTRAINT `admin_role_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
