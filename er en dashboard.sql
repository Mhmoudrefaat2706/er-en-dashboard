-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2025 at 07:52 PM
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
-- Database: `realesta`
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
  `updated_at` timestamp NULL DEFAULT NULL,
  `lang` varchar(5) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `blog_category_id`, `name`, `slug`, `image`, `views`, `content`, `tags`, `keywords`, `meta_description`, `created_at`, `updated_at`, `lang`) VALUES
(14, 12, 'erty', 'erty', 'blogs/1760797989_WhatsApp Image 2025-10-03 at 13.52.12_91ac24f9 - Copy.jpg', 0, '<p>9o8iu7ytgr</p>', '\"iuytgrfd\"', '\"97oi8uytrf\"', '98i7u6ytgre', '2025-10-18 11:33:09', '2025-10-18 11:34:53', 'en'),
(15, 11, 'عربي', 'aarby', 'blogs/1760798121_WhatsApp Image 2025-10-03 at 13.52.12_91ac24f9 - Copy.jpg', 0, '<p>هختعالا</p>', '\"\\u062d\\u062e\\u0647\\u062a\\u0627\\u0639\"', NULL, NULL, '2025-10-18 11:35:21', '2025-10-18 12:50:18', 'ar');

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
(3, 'العقارات الذكية والتقنيات الحديثة', 'alaakarat-althky-oaltknyat-alhdyth', 'تضم أحدث اتجاهات التكنولوجيا في عالم البناء والعقارات الذكية، مثل المنازل الذكية، والتحكم الذكي، والطاقة المستدامة.\r\nمثال للمقال المرتبط:', 'blog_categories/sSZ4indf2BiWjlgQvh0jqGcAFEWRNnYE29tTTeRR.jpg', 'active', '', '2025-09-20 05:43:25', '2025-10-18 05:59:08'),
(8, 'استثمار عقاري', 'astthmar-aakary', 'فئة مخصصة لكل ما يتعلق بالاستثمار العقاري — من تحليل السوق والعائدات إلى استراتيجيات تنمية رأس المال عبر العقارات.', 'blog_categories/dnqBNicLqAnwb6EaceHSjoCj6C9NFP52rnHUUVeR.jpg', 'active', '', '2025-09-20 06:01:36', '2025-10-18 05:58:47'),
(9, '. نصائح عقارية', 'nsayh-aakary', 'مقالات تقدم نصائح عملية للمشترين والمستثمرين حول كيفية اختيار العقار المناسب، التفاوض على الأسعار، وفهم السوق العقاري.', 'blog_categories/Ofbyq8vhpFt4QezRuqwqBQOHl9ViBngaON1fFbhy.jpg', 'active', '', '2025-09-20 06:04:16', '2025-10-18 05:58:12'),
(11, 'تالا', 'tala', 'خهنعتغفلقبثيس', 'blog_categories/R9QlCSgiSxVyoNZ5I4GeyNLVXMy6dq6fWAyf4Slp.jpg', 'active', 'ar', '2025-10-18 11:26:53', '2025-10-18 11:27:39'),
(12, 'piouyg', 'piouyg', '=o0iu', 'blog_categories/qUXcc5itJk0FNxVDMV1Jpsce98po2QRFgXOhEsbP.png', 'active', 'en', '2025-10-18 11:27:22', '2025-10-18 11:27:22');

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
(1, 'vi', 'vi', 'category Description', 'categories/1xCT0S9fgDL2niVinvDBAp9SUzf4Q9jSnW9VPCIO.jpg', 'active', 'en', '2025-09-18 12:07:29', '2025-10-16 07:53:04'),
(18, 'Penthouse', 'penthouse', 'Penthouse', 'categories/GtSqmU30aKmWiLSjb9MeRHhBXVPTQZtvBwHgSwaq.jpg', 'active', 'en', '2025-09-18 12:51:03', '2025-10-16 07:09:53'),
(19, 'Villa House', 'villa-house', 'Villa House', 'categories/GVhMUEmsaMv3BJjjiHw4yAc5LHLY1zMSDHAF69qc.jpg', 'inactive', 'en', '2025-09-18 12:51:24', '2025-10-16 07:09:26'),
(20, 'Appartment', 'appartment', 'Appartment', 'categories/3ITP8OuH0IbUuWzGjb5aFda2P53na2aBpI2XHBFa.jpg', 'active', 'en', '2025-09-18 13:44:38', '2025-10-16 07:09:11'),
(22, 'حخهتعالا', 'hkhhtaaala', '87u6yt', 'categories/Z9I609gLu5Cv5TNcIjLEWreIYPn37bsCFzXVrsRP.jpg', 'active', 'ar', '2025-10-18 11:13:46', '2025-10-18 11:24:45');

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
(13, 'Mahmoud Refaat27', 'mahmoudebnrefaat2706@gmail.com', NULL, 'خنهتى', 'ikujyhgtf', 'unread', '2025-10-13 06:17:13', '2025-10-13 06:17:13'),
(14, 'Mahmoud Refaat', 'mahmoudebnrefat2706@gmail.com', NULL, 'ujhgfd', 'jhgfd', 'unread', '2025-10-14 06:06:54', '2025-10-14 06:06:54'),
(15, 'Mahmoud Refaat27', 'mahmoudebnrefaat270@gmail.com', NULL, 'kijhugf', 'ikujyhgtf', 'unread', '2025-10-14 10:37:23', '2025-10-14 10:37:23'),
(16, 'Mahmoud Refaat27', 'mahmoudebnrefaat2706@gmail.com', NULL, 'حخهتعال', 'ikujyhgtf', 'unread', '2025-10-19 09:30:32', '2025-10-19 09:30:32');

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
(18, '2025_09_18_120712_create_reviews_table', 1),
(19, '2025_10_14_103323_add_details_columns_to_projects_table', 2),
(20, '2025_10_14_110428_change_image_to_images_in_projects_table', 3),
(21, '2025_10_18_142841_add_lang_to_blogs_table', 4);

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
  `parking` int(11) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `bathrooms` int(11) DEFAULT NULL,
  `bedrooms` int(11) DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `views_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`image`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `slug`, `short_description`, `description`, `category_id`, `status`, `price`, `parking`, `floor`, `area`, `bathrooms`, `bedrooms`, `lang`, `views_count`, `created_at`, `updated_at`, `image`) VALUES
(20, '18 Old Street Miami, OR 97219', '18-old-street-miami-or-97219', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor pack incididunt ut labore et dolore magna aliqua quised ipsum suspendisse.<br><br>When you need free CSS templates, you can simply type TemplateMo in any search engine website. In addition, you can type TemplateMo Portfolio, TemplateMo One Page Layouts, etc.</p>', 1, 'active', 3.00, 3, 3, 3, 3, 3, NULL, 0, '2025-10-14 08:24:15', '2025-10-16 10:27:46', '[\"projects\\/yZhJtCjh8BFktpl6vORbp9bm2BePIMTLSzQipqsI.jpg\",\"projects\\/BoKvRrwLSWU0KLK11TPGBR3cHS5oxdKUyDFWAfGw.jpg\"]'),
(22, '26 Mid Street Portland, OR 38540', '26-mid-street-portland-or-38540', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor pack incididunt ut labore et dolore magna aliqua quised ipsum suspendisse.<br><br>When you need free CSS templates, you can simply type TemplateMo in any search engine website. In addition, you can type TemplateMo Portfolio, TemplateMo One Page Layouts, etc.</p>', 19, 'active', 1.00, 1, 1, 11, 1, 1, NULL, 0, '2025-10-14 09:21:29', '2025-10-16 10:27:32', '[\"projects\\/22dZPF6WcuZp5hUqwgJDt9BC1tGe2gZx7hheYta3.jpg\",\"projects\\/VmEA7syUQGef9XLRlqtSrrtXVPdgH3lCYjtgHQZ2.jpg\"]'),
(23, '54 New Street Florida, OR 27001', '54-new-street-florida-or-27001', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor pack incididunt ut labore et dolore magna aliqua quised ipsum suspendisse.<br><br>When you need free CSS templates, you can simply type TemplateMo in any search engine website. In addition, you can type TemplateMo Portfolio, TemplateMo One Page Layouts, etc.</p>', 20, 'active', 3.00, 3, 33, 33, 3, 3, NULL, 0, '2025-10-14 09:25:30', '2025-10-16 10:27:17', '[\"projects\\/VFtyGBot3t0zzu2tJnHYF6oJrtDVUh7kCsW2B3Eo.jpg\",\"projects\\/1rQu9UfAUdkqvR7raCLBV7UCISgAzWoS5r83Tnkk.jpg\"]'),
(24, 'Extra Info About Property', 'extra-info-about-property', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor pack incididunt ut labore et dolore magna aliqua quised ipsum suspendisse.<br><br>When you need free CSS templates, you can simply type TemplateMo in any search engine website. In addition, you can type TemplateMo Portfolio, TemplateMo One Page Layouts, etc.</p>', 19, 'active', 2.00, 3, 2, 2, 1, 1, NULL, 0, '2025-10-16 06:32:46', '2025-10-16 07:44:59', '[\"projects\\/MQ8eqXZW7N6aIJNEc2bOEK5Rj2WoMnNTaq0iUAzZ.jpg\",\"projects\\/WYdAZns4jdO4z9nNjnFzuSMFTWZlRBbDdhCBSjrm.jpg\",\"projects\\/abPRK5mF49YJfojU3oOGW5RdiLWYPw9lvuH76XyW.jpg\",\"projects\\/KUE3QxL37Er67d1VTTeZVcyCO3XAFIIuWsCY7C47.jpg\",\"projects\\/LXYKDYvM5oiI40urmVUVtFUeEqc9W4HUhzPyi2Cy.jpg\"]'),
(25, '0i9u8y', '0i9u8y', '=0-i9uh', '<p>0-i9ui</p>', 1, 'active', 1.00, 1, 1, 1, 1, 1, NULL, 0, '2025-10-18 07:19:28', '2025-10-18 07:20:48', '[\"projects\\/yGpPieBLGMypdpxaSCSWbWkP5GMnWShyASHRd9wP.jpg\",\"projects\\/bvhkHxDgkhSfyifvoEGFsJua0mJ19wiLetr1KRtQ.jpg\",\"projects\\/VTZl2fKYYhzgdPJK5yKyNT8hQD5nKGom3tjBJkJk.jpg\",\"projects\\/047wMNmw4mvXbaKr7kz55iNXmli0MlmEW87FoUh4.jpg\"]'),
(26, 'aaaaaaaaaaa', 'aaaaaaaaaaa', 'aaaaaaaaaaaa', '<p>aaaaaaaaaa</p>', 1, 'active', 21.00, 22, 2, 3, 2, 1, 'en', 0, '2025-10-18 11:10:14', '2025-10-18 11:10:14', '[\"projects\\/OgUjTMBM3I4xNIYjQIi25sHPlyyevaa7vNKAYMjd.jpg\"]'),
(27, 'عربي', 'aarby', 'شششششششششش', '<p>شششششششششششش</p>', 22, 'active', 22.00, 2, 222, 2, 222, 2, 'ar', 0, '2025-10-18 11:18:39', '2025-10-19 10:57:58', '[\"projects\\/eF1d58xBZTLTK5lOSpfhbSlrcz9FTYSXRZBsfaWv.png\",\"projects\\/zcT1lZyQfv5GO8pIARAWQ0WqN7GEOuMqrEATjuX8.png\",\"projects\\/5Q3P4EPPsYYRAXhGz9yPB2rP9b0wG6z1cqlLRuMy.jpg\",\"projects\\/UzWqFX0Uii5QlhyhmwQnwCtge4pp38rzsldl63Yv.jpg\",\"projects\\/lPZe6w1DYI6UtBlXx6hqycIp9YQ5x2NKz6aPxJB2.jpg\"]');

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
(5, 'home_banner', '{\"title\":\"\\u062d\\u062e\\u0647\\u062a\\u0639\\u0627\\u062e\\u062d\\u0647\\u062apokij\",\"subtitle\":\"\\u062d\\u062e\\u0647\\u062a\\u0627\\u062a\\u0644\\u0627\",\"description\":\"\\u062e-0\\u0647\\u0639\",\"images\":[\"1760881659_xusyA.jpg\",\"1760881659_mh2Rk.jpg\"]}', 'ar', 'active', '2025-10-18 12:17:41', '2025-10-19 10:47:39'),
(9, 'home_banner', '{\"title\":\"\\u0639\\u0631\\u0628\\u064a\",\"subtitle\":\"0iuh\",\"description\":\"-o0ij\",\"images\":[\"1760859749_UovFW.jpg\",\"1760859749_MOnp9.jpg\"]}', 'en', 'active', '2025-10-18 12:21:21', '2025-10-19 04:42:29'),
(10, 'video', '{\"title\":\"oiug\",\"subtitle\":\"iohu\",\"Awwards_Won\":\"3\",\"Years_Experience\":\"12\",\"Buildings_Finished_Now\":\"3\",\"video_link\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/video\",\"image\":[\"1760801027_wO9Cz.jpg\"]}', 'en', 'active', '2025-10-18 12:23:47', '2025-10-18 12:23:47'),
(11, 'video', '{\"title\":\"\\u0639\\u0631\\u0628\\u064a\",\"subtitle\":\"\\u062e\\u0647\\u062a\\u0639\\u0627\\u0644\",\"Awwards_Won\":\"34\",\"Years_Experience\":\"234\",\"Buildings_Finished_Now\":\"45\",\"video_link\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/video\",\"image\":[\"1760801055_VJnyN.jpg\"]}', 'ar', 'active', '2025-10-18 12:24:15', '2025-10-18 12:57:33'),
(12, 'featured', '{\"title\":\"\\u0639\\u0631\\u0628\\u064a\",\"subtitle\":\"\\u062d\\u062e\\u0646\\u0647\\u062a\\u0627\",\"question_one\":\"\\u0646\\u062e\\u062a\\u0644\\u0627\\u0627\",\"answer_one\":\"\\u062d\\u0646\\u062e\\u062a\\u062d\\u062e\\u0646\",\"question_two\":\"\\u062d\\u062e\\u0647\\u062a\",\"answer_two\":\"\\u062d\\u062e\\u0647\\u062a\\u0644\\u0627\\u0627\",\"question_three\":\"\\u062e\\u062d\\u062a\\u0647\\u0644\\u0627\\u062a\",\"answer_three\":\"\\u062d\\u062e\\u0647\\u062a\\u0627\",\"address\":\"\\u062d\\u062e\\u0646\\u0647\\u062a\\u0644\\u0627\\u0627\\u0631\",\"space\":\"234\",\"price\":\"234\",\"image\":[\"1760801085_4TQiV.jpg\"]}', 'ar', 'active', '2025-10-18 12:24:45', '2025-10-18 12:57:23'),
(13, 'featured', '{\"title\":\"[pokijh\",\"subtitle\":\"pokjihbj987y\",\"question_one\":\"opih\",\"answer_one\":\"uytr\",\"question_two\":\"7u6ytr\",\"answer_two\":\"uytre\",\"question_three\":\"iuytruiytruytr\",\"answer_three\":\"i7uytre\",\"address\":\"o8iuytr\",\"space\":\"-098\",\"price\":\"65432\",\"image\":[\"1760801117_IWYeC.png\"]}', 'en', 'active', '2025-10-18 12:25:17', '2025-10-18 12:25:17');

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
('uMk7s82b2zyioEW6A4SIuUlAsaoPA5iw9X3hCI9j', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Mobile Safari/537.36 Edg/141.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibXBwamNYYlc0cDFYcVdUNEJqMmxYbTZmNTFZWmZkWHJUTXRkTEgyVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo2OiJsb2NhbGUiO3M6MjoiYXIiO30=', 1760885149),
('WCAaVO6Znyf9B3K1AxISO18drGJizQYsxg3Yc3CY', 9, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiY1I4SXd2bmY2TnI0TnRPNHBkWlhDSHZ4RWMxZDh5TnN1dTAzdjM4WiI7czo2OiJsb2NhbGUiO3M6MjoiYXIiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vcHJvamVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo5O30=', 1760891336);

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
(1, 'Villa', 'This is a sample about us text for the website.', 'en', 'hgyfcdfgh', 'Website Type Description', 'keyword1, keyword2, keyword3', 'This is a meta description for SEO purposes.', 'https://www.example.com', 0, 'kjhgvf', 'admin/settings/SoNi4Tu2dF4YxI197KsCD0VLcrb9I2BjvkRT2yOC.jpg', '2025-09-18 17:02:18', '2025-10-16 11:30:07'),
(2, 'فيلا', 'هذا نص تعريفي تجريبي لموقع الويب باللغة العربية.', 'ar', 'hgyfcdfgh', 'وصف نوع الموقع', 'كلمة مفتاحية 1, كلمة مفتاحية 2, كلمة مفتاحية 3', 'هذا وصف ميتا لتحسين محركات البحث (SEO).', 'https://www.example.com', 0, 'kjhgvf', 'admin/settings/A50cTVA67jQS9D9sADUuSUVkIcIEX5blaQHHV1LE.png', '2025-10-19 12:20:34', '2025-10-19 09:21:07');

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
(6, 'WhatsApp', 'http://127.0.0.1:8000/admin/settings', 'active', 'en', '2025-10-14 07:13:27', '2025-10-14 07:16:01'),
(9, 'Facebook', 'http://127.0.0.1:8000/admin/settings', 'active', 'en', '2025-10-14 07:13:54', '2025-10-16 10:49:58'),
(12, 'Email', 'info@company.com', 'active', 'en', '2025-10-16 11:04:38', '2025-10-16 11:04:38'),
(13, 'Location', 'Sunny Isles Beach, FL 33160', 'active', 'en', '2025-10-16 11:06:15', '2025-10-16 11:07:05'),
(14, 'Twitter', 'Sunny Isles Beach, FL 33160', 'active', 'en', '2025-10-16 11:07:27', '2025-10-16 11:07:27'),
(15, 'Instagram', 'Sunny Isles Beach, FL 33160', 'active', 'en', '2025-10-16 11:07:39', '2025-10-16 11:07:39'),
(16, 'TikTok', 'Sunny Isles Beach, FL 33160', 'active', 'en', '2025-10-16 11:07:53', '2025-10-16 11:07:53'),
(17, 'LinkedIn', 'Sunny Isles Beach, FL 33160', 'active', 'en', '2025-10-16 11:09:51', '2025-10-16 11:09:51'),
(18, 'LinkedIn', 'Sunny Isles Beach, FL 33160', 'active', 'en', '2025-10-16 11:10:17', '2025-10-16 11:10:17'),
(20, 'Phone', '01000000000', 'active', 'en', '2025-10-16 11:17:44', '2025-10-16 11:17:44'),
(21, 'Facebook', 'http://127.0.0.1:8000/admin/settings', 'active', 'ar', '2025-10-19 04:40:13', '2025-10-19 04:40:13'),
(22, 'Phone', '45678', 'active', 'ar', '2025-10-19 05:05:02', '2025-10-19 05:05:02'),
(23, 'Email', 'ثقفغعتناممكط', 'active', 'ar', '2025-10-19 05:05:37', '2025-10-19 05:05:37'),
(24, 'Instagram', 'http://127.0.0.1:8000/admin/settings', 'active', 'ar', '2025-10-19 07:25:52', '2025-10-19 07:25:52'),
(25, 'LinkedIn', 'http://127.0.0.1:8000/admin/settings', 'active', 'ar', '2025-10-19 07:26:01', '2025-10-19 07:26:01'),
(26, 'Location', 'http://127.0.0.1:8000/admin/settings', 'active', 'en', '2025-10-19 07:29:21', '2025-10-19 07:29:21'),
(27, 'Location', 'http://127.0.0.1:8000/admin/settings', 'active', 'ar', '2025-10-19 07:29:55', '2025-10-19 07:29:55');

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
  ADD UNIQUE KEY `sections_slug_lang_unique` (`slug`,`lang`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
