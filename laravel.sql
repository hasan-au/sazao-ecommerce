-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2025 at 05:54 AM
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
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Hasan', 'hasan@laravel.com', NULL, '$2y$10$YVqmsYDb8xNju3a5Ef0t0eoDTb9ymZrXEh3ONfMYqw4UvithfbvpW', '2025-05-20 23:31:02', '2025-05-20 23:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `english_name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `english_name`, `slug`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ملابس رجالية', 'Men Clothing', 'men-clothing', 'fa-solid fa-shirt', 1, '2025-05-20 23:31:02', '2025-05-20 23:31:02'),
(2, 'ملابس نسائية', 'Women Clothing', 'women-clothing', 'fa-solid fa-person-dress', 1, '2025-05-20 23:31:02', '2025-05-20 23:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `max_use` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `discount_type` enum('decimal','percentage') NOT NULL,
  `discount` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `total_used` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `code`, `quantity`, `max_use`, `start_date`, `end_date`, `discount_type`, `discount`, `status`, `total_used`, `created_at`, `updated_at`) VALUES
(1, 'كوبون نسبة', '10Per', 1000, 1, '2025-05-25', '2025-06-07', 'percentage', 10, 1, 0, '2025-05-25 16:44:31', '2025-05-25 16:48:50'),
(2, 'خصم 10 دولار', '10d', 1000, 1, '2025-05-28', '2025-06-07', 'decimal', 10, 1, 0, '2025-05-28 17:25:15', '2025-05-28 17:25:15');

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
-- Table structure for table `flash_sales`
--

CREATE TABLE `flash_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_sales`
--

INSERT INTO `flash_sales` (`id`, `banner`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, '2025-12-12', 0, '2025-05-20 23:31:02', '2025-05-20 23:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `flash_sale_items`
--

CREATE TABLE `flash_sale_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `show_at_home` tinyint(1) NOT NULL DEFAULT 0,
  `flash_sale_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2025_03_03_055336_create_admins_table', 1),
(7, '2025_03_05_073830_create_sliders_table', 1),
(8, '2025_03_13_124517_create_categories_table', 1),
(9, '2025_03_13_131413_create_sub_categories_table', 1),
(10, '2025_03_13_180704_create_products_table', 1),
(11, '2025_03_14_074938_create_flash_sales_table', 1),
(12, '2025_03_14_084146_create_flash_sale_items_table', 1),
(13, '2025_03_14_130817_create_product_image_galleries_table', 1),
(14, '2025_03_15_012309_create_variants_table', 1),
(15, '2025_03_15_064642_create_product_variant_items_table', 1),
(18, '2025_05_11_003835_create_shipping_addresses_table', 2),
(20, '2025_05_26_020245_create_coupons_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `english_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumb_image` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `short_description` text NOT NULL,
  `long_description` longtext NOT NULL,
  `vedio_link` text DEFAULT NULL,
  `sku` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `offer_price` double DEFAULT NULL,
  `offer_start_date` date DEFAULT NULL,
  `offer_end_date` date DEFAULT NULL,
  `product_type` enum('new_arrival','top_product','best_product','featured_product','none') NOT NULL,
  `status` tinyint(1) NOT NULL,
  `show_at_home` tinyint(1) NOT NULL DEFAULT 0,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `sub_category_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `english_name`, `slug`, `thumb_image`, `qty`, `short_description`, `long_description`, `vedio_link`, `sku`, `price`, `offer_price`, `offer_start_date`, `offer_end_date`, `product_type`, `status`, `show_at_home`, `seo_title`, `seo_description`, `category_id`, `sub_category_id`, `created_at`, `updated_at`) VALUES
(1, 'قميص رجالي كلاسيكي', 'Classic Men Shirt', 'classic-men-shirt', 'storage/products/classic men\'s dress shirt-1.jpg', 25, 'قميص رجالي أنيق مصنوع من القطن الطبيعي، يوفر راحة فائقة عند الارتداء ومناسب للاستخدام اليومي في العمل أو المناسبات.', 'هذا القميص الرجالي يتميز بخاماته الممتازة وتصميمه العصري. مصنوع من القطن بنسبة 100% مما يوفر نعومة وراحة على مدار اليوم. تم تصميمه ليناسب أجواء العمل والمناسبات الاجتماعية، بفضل أزراره المحكمة وخياطته المتقنة. يتوفر بعدة مقاسات وألوان تتناسب مع جميع الأذواق. كما يتميز بسهولة العناية به، حيث يمكن غسله في الغسالة دون أن يتأثر لونه أو شكله.', NULL, 'SKU-001', 129.99, 99.99, '2025-05-01', '2025-06-10', 'top_product', 1, 1, 'Classic Men Shirt | تسوق الآن', 'هذا القميص الرجالي يتميز بخاماته الممتازة وتصميمه العصري. مصنوع من القطن بنسبة 100% مما يوفر نعومة وراحة على مدار اليوم. تم تصميمه ليناسب أجواء العمل...', 1, 1, '2025-05-20 23:31:02', '2025-05-20 23:31:02'),
(2, 'فستان نسائي صيفي', 'Summer Dress', 'summer-dress', 'storage/products/Summer Dress-1.jpg', 13, 'فستان صيفي ناعم بخامة مريحة وتصميم زهور مبهج، مثالي للأجواء الحارة والمناسبات الخارجية النهارية.', 'فستان نسائي أنيق مصمم خصيصاً لفصل الصيف، يتميز بنقشات الورود الجذابة وقماش خفيف يسمح بمرور الهواء. تصميمه العصري يتضمن خصر مطاطي لراحة إضافية مع أكمام قصيرة مناسبة للأجواء الحارة. الطول المتوسط يجعله ملائمًا لمجموعة متنوعة من المناسبات، مثل النزهات، الخروجات العائلية، وحتى الشاطئ. الفستان متوفر بألوان مختلفة تتناسب مع جميع أذواق النساء الباحثات عن التميز والأناقة خلال الصيف.', NULL, 'SKU-002', 189, NULL, NULL, NULL, 'new_arrival', 1, 1, 'Summer Dress | تسوق الآن', 'فستان نسائي أنيق مصمم خصيصاً لفصل الصيف، يتميز بنقشات الورود الجذابة وقماش خفيف يسمح بمرور الهواء. تصميمه العصري يتضمن خصر مطاطي لراحة إضافية مع أكمام...', 2, 4, '2025-05-20 23:31:02', '2025-05-20 23:31:02'),
(3, 'جاكيت رجالي شتوي', 'Winter Jacket', 'winter-jacket', 'storage/products/Men Winter Jacket-1.jpg', 12, 'جاكيت رجالي شتوي بخامة عازلة للبرودة وتصميم عصري، يحافظ على الدفء في الأجواء الباردة جداً.', 'جاكيت شتوي رجالي فخم مصمم خصيصاً لفصل الشتاء القاسي. يتميز بطبقة خارجية مقاومة للماء والرياح، وبطانة داخلية ناعمة توفر دفء مضاعف حتى في أبرد الأيام. تصميمه يحتوي على سحاب قوي وأزرار إضافية للحماية من الهواء البارد، بالإضافة إلى جيوب متعددة للإضافة العملية. مثالي للرحلات الشتوية، أو حتى للاستخدام اليومي أثناء التنقل في الطقس البارد. متوفر بألوان متعددة ومقاسات تناسب الجميع.', NULL, 'SKU-003', 350, 320, '2025-11-01', '2025-11-20', 'featured_product', 1, 1, 'Winter Jacket | تسوق الآن', 'جاكيت شتوي رجالي فخم مصمم خصيصاً لفصل الشتاء القاسي. يتميز بطبقة خارجية مقاومة للماء والرياح، وبطانة داخلية ناعمة توفر دفء مضاعف حتى في أبرد الأيام. ت...', 1, 3, '2025-05-20 23:31:02', '2025-05-20 23:31:02'),
(4, 'قميص رجالي كم قصير', 'Men shirt short sleeve', 'men-shirt-short-sleeve', 'storage/products/1324132608_i want short sleeve summer shirt , the image should be 800px width and 900 hieght, no more.jpg', 100, 'قميص رجالي أنيق مصنوع من القطن الطبيعي، يوفر راحة فائقة عند الارتداء ومناسب للاستخدام اليومي في العمل أو المناسبات.', '<div class=\"pr_desc\" style=\"width: 491px; overflow: hidden; margin-bottom: 10px; min-height: 58px; max-height: 84px; color: rgb(104, 113, 136); font-family: Poppins, sans-serif;\"><p style=\"margin-bottom: 0px; line-height: 28px;\">قميص رجالي أنيق مصنوع من القطن الطبيعي، يوفر راحة فائقة عند الارتداء ومناسب للاستخدام اليومي في العمل أو المناسبات.</p></div><div class=\"list_product_action_box\" style=\"color: rgb(104, 113, 136); font-family: Poppins, sans-serif;\"><ul class=\"list_none pr_action_btn\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><div class=\"pr_desc\" style=\"width: 491px; overflow: hidden; margin-bottom: 10px; min-height: 58px; max-height: 84px; font-family: Poppins, sans-serif;\"><p style=\"margin-bottom: 0px; line-height: 28px;\">قميص رجالي أنيق مصنوع من القطن الطبيعي، يوفر راحة فائقة عند الارتداء ومناسب للاستخدام اليومي في العمل أو المناسبات.</p></div><div class=\"list_product_action_box\" style=\"font-family: Poppins, sans-serif;\"><ul class=\"list_none pr_action_btn\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px;\"><li class=\"add-to-cart\" style=\"margin: 0px 0px 0px 5px; padding: 0px; list-style: none; position: relative; display: inline-block; vertical-align: middle;\"></li></ul></div><li class=\"add-to-cart\" style=\"margin: 0px 0px 0px 5px; padding: 0px; list-style: none; position: relative; display: inline-block; vertical-align: middle;\"></li></ul></div>', NULL, 'BE45VGR0', 150, NULL, NULL, NULL, 'none', 1, 0, NULL, NULL, 1, 1, '2025-05-21 03:26:30', '2025-05-21 04:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `product_image_galleries`
--

CREATE TABLE `product_image_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_image_galleries`
--

INSERT INTO `product_image_galleries` (`id`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'storage/products/classic men\'s dress shirt-2.jpg', 1, NULL, NULL),
(2, 'storage/products/Summer Dress-2.jpg', 2, NULL, NULL),
(3, 'storage/products/Men Winter Jacket-2.jpg', 3, NULL, NULL),
(4, 'storage/products/4358060_i want short sleeve summer shirt , the image should be 800px width and 900 hieght, no more (1).jpg', 4, '2025-05-21 03:26:42', '2025-05-21 03:26:42');

-- --------------------------------------------------------

--
-- Table structure for table `product_variant_items`
--

CREATE TABLE `product_variant_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variant_items`
--

INSERT INTO `product_variant_items` (`id`, `name`, `price`, `is_default`, `status`, `variant_id`, `created_at`, `updated_at`) VALUES
(1, '#000000', 0, 1, 1, 1, '2025-05-20 23:59:28', '2025-05-20 23:59:28'),
(2, '#000080', 10, 0, 1, 1, '2025-05-20 23:59:46', '2025-05-20 23:59:46'),
(3, 'S', 0, 0, 1, 2, '2025-05-21 00:00:05', '2025-05-21 00:00:05'),
(4, 'M', 0, 1, 1, 2, '2025-05-21 00:00:24', '2025-05-21 00:00:24'),
(5, 'L', 0, 0, 1, 2, '2025-05-21 00:00:33', '2025-05-21 00:00:33'),
(6, '#000000', 0, 0, 1, 3, '2025-05-21 00:01:35', '2025-05-21 00:01:51'),
(7, '#FF0000', 5, 1, 1, 3, '2025-05-21 00:02:07', '2025-05-21 00:02:07'),
(8, 'M', 0, 1, 1, 4, '2025-05-21 00:03:10', '2025-05-21 00:03:10'),
(9, 'L', 0, 0, 1, 4, '2025-05-21 00:03:17', '2025-05-21 00:03:17'),
(10, 'XL', 0, 0, 1, 4, '2025-05-21 00:03:23', '2025-05-21 00:03:23'),
(11, '#FFFFFF', 0, 1, 1, 5, '2025-05-21 00:04:55', '2025-05-21 00:04:55'),
(12, '#808080', 0, 0, 1, 5, '2025-05-21 00:05:11', '2025-05-21 00:05:11'),
(13, 'L', 0, 1, 1, 6, '2025-05-21 00:05:31', '2025-05-21 00:05:31'),
(14, 'XL', 0, 0, 1, 6, '2025-05-21 00:05:39', '2025-05-21 00:05:39'),
(15, '2XL', 0, 0, 1, 6, '2025-05-21 00:05:48', '2025-05-21 00:05:48'),
(16, '#FFFFFF', 0, 1, 1, 7, '2025-05-21 03:27:59', '2025-05-21 03:27:59'),
(17, '#FAF0E6', 10, 0, 1, 7, '2025-05-21 03:28:14', '2025-05-21 03:28:14'),
(18, 'M', 0, 1, 1, 8, '2025-05-21 03:28:36', '2025-05-21 03:28:36');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `street_address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banner` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `button_url` varchar(255) DEFAULT NULL,
  `serial` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `english_name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `english_name`, `slug`, `icon`, `status`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'قمصان', 'Shirts', 'shirts', 'fa-solid fa-shirt', 1, 1, '2025-05-20 23:31:02', '2025-05-20 23:31:02'),
(2, 'بناطيل', 'Pants', 'pants', 'fa-solid fa-socks', 1, 1, '2025-05-20 23:31:02', '2025-05-20 23:31:02'),
(3, 'جاكيتات', 'Jackets', 'jackets', 'fa-solid fa-user-tie', 1, 1, '2025-05-20 23:31:02', '2025-05-20 23:31:02'),
(4, 'فساتين', 'Dresses', 'dresses', 'fa-solid fa-person-dress', 1, 2, '2025-05-20 23:31:02', '2025-05-20 23:31:02'),
(5, 'تنانير', 'Skirts', 'skirts', 'fa-solid fa-grip-lines', 1, 2, '2025-05-20 23:31:02', '2025-05-20 23:31:02'),
(6, 'بلوزات', 'Blouses', 'blouses', 'fa-solid fa-shirt', 1, 2, '2025-05-20 23:31:02', '2025-05-20 23:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `name`, `status`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'اللون', 1, 1, '2025-05-20 23:58:27', '2025-05-20 23:58:27'),
(2, 'المقاس', 1, 1, '2025-05-20 23:59:57', '2025-05-21 00:04:19'),
(3, 'اللون', 1, 2, '2025-05-21 00:00:50', '2025-05-21 00:00:50'),
(4, 'المقاس', 1, 2, '2025-05-21 00:02:57', '2025-05-21 00:03:55'),
(5, 'اللون', 1, 3, '2025-05-21 00:04:35', '2025-05-21 00:04:35'),
(6, 'المقاس', 1, 3, '2025-05-21 00:05:19', '2025-05-21 00:05:19'),
(7, 'اللون', 1, 4, '2025-05-21 03:26:53', '2025-05-21 03:26:53'),
(8, 'المقاس', 1, 4, '2025-05-21 03:28:23', '2025-05-21 03:28:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD UNIQUE KEY `categories_english_name_unique` (`english_name`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `flash_sales`
--
ALTER TABLE `flash_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_sale_items`
--
ALTER TABLE `flash_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flash_sale_items_product_id_foreign` (`product_id`),
  ADD KEY `flash_sale_items_flash_sale_id_foreign` (`flash_sale_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`);

--
-- Indexes for table `product_image_galleries`
--
ALTER TABLE `product_image_galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_image_galleries_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variant_items`
--
ALTER TABLE `product_variant_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variant_items_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipping_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sub_categories_name_unique` (`name`),
  ADD UNIQUE KEY `sub_categories_slug_unique` (`slug`),
  ADD UNIQUE KEY `sub_categories_english_name_unique` (`english_name`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variants_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_sales`
--
ALTER TABLE `flash_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flash_sale_items`
--
ALTER TABLE `flash_sale_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_image_galleries`
--
ALTER TABLE `product_image_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_variant_items`
--
ALTER TABLE `product_variant_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flash_sale_items`
--
ALTER TABLE `flash_sale_items`
  ADD CONSTRAINT `flash_sale_items_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flash_sale_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_image_galleries`
--
ALTER TABLE `product_image_galleries`
  ADD CONSTRAINT `product_image_galleries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variant_items`
--
ALTER TABLE `product_variant_items`
  ADD CONSTRAINT `product_variant_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD CONSTRAINT `shipping_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
