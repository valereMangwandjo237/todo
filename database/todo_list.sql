-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 29 mars 2024 à 20:17
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `todo_list`
--

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 2),
(6, '2024_03_28_230803_create_todos_table', 3);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `todos`
--

DROP TABLE IF EXISTS `todos`;
CREATE TABLE IF NOT EXISTS `todos` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_do` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `todos_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `todos`
--

INSERT INTO `todos` (`id`, `title`, `description`, `is_do`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'une nouvelle tache', 'je suis une tache de test numero 1. je suis creé juste pour un test', 0, 1, '2024-03-28 21:44:19', '2024-03-29 01:02:45'),
(2, 'Autre tache 2', 'voici. je suis une tache de test numero 2. je suis creé juste pour un test', 0, 1, '2024-03-28 21:56:19', '2024-03-29 01:03:20'),
(3, 'Temporibus aspernatur quia aut ad officia voluptatem quia.', 'Earum neque omnis corrupti animi distinctio nihil. Sit aspernatur totam consequatur non.', 1, 1, '2024-01-03 00:10:58', '2023-07-18 16:11:27'),
(4, 'Vel architecto adipisci iste cumque voluptatum.', 'Est assumenda et nam. Et repellat animi officia quis qui. Velit culpa voluptatem ipsa voluptas enim labore facilis. Eveniet maiores laborum tenetur consequatur harum.', 1, 1, '2023-07-22 00:11:16', '2023-09-11 14:00:46'),
(5, 'Eligendi nam non et.', 'Laboriosam repellat rem a. Quibusdam at quisquam voluptas perferendis rerum earum. Ea expedita ut sed sed aut id labore. Consectetur eligendi atque doloribus corrupti ut inventore optio aut.', 0, 1, '2024-01-06 19:13:03', '2024-03-29 01:02:54'),
(6, 'Eum deserunt officiis earum perferendis dignissimos.', 'Et omnis repudiandae dolorem nulla. Deleniti corporis repellendus molestiae voluptas perferendis. Molestias doloribus quia ullam est sapiente rerum. Commodi ea qui ab.', 0, 1, '2023-09-23 17:57:19', '2023-05-11 08:48:51'),
(7, 'Et aut beatae ex rerum inventore.', 'Non eveniet distinctio quo quisquam libero. Excepturi nihil accusamus modi ea voluptas impedit sunt non. Aliquid et in deserunt ipsum fugit laboriosam harum.', 1, 1, '2023-05-27 05:13:11', '2024-01-21 21:48:07'),
(8, 'Hic dolor expedita vel similique neque aliquid.', 'Quas nemo saepe natus cumque. Mollitia eaque quis quo consectetur et architecto qui fugiat. Enim est numquam placeat perspiciatis aut qui ut. Est voluptatum veritatis quam repellat in dolor laborum. Odio id laudantium impedit suscipit labore.', 1, 1, '2023-04-01 16:05:31', '2024-01-29 08:10:01'),
(9, 'Veritatis et aut deserunt rem sapiente et facilis quisquam.', 'Est quis et pariatur ex amet id quod. Illo magni et mollitia dolores ducimus similique vel. Perferendis repudiandae sint doloribus quisquam. Blanditiis distinctio ea quasi quam molestiae.', 0, 1, '2023-07-13 03:35:19', '2023-11-24 18:33:42'),
(10, 'Ea aliquid eos asperiores quos.', 'Recusandae qui quas velit sapiente aut cupiditate. Et eligendi qui libero facilis alias incidunt porro.', 1, 1, '2024-01-27 03:00:01', '2023-07-24 06:45:19'),
(11, 'Ut mollitia tempore voluptate et debitis non labore.', 'Et aliquid optio eos nemo odit. Deleniti qui nesciunt sit dignissimos praesentium sequi iste. Sapiente recusandae eum omnis ab autem.', 0, 1, '2023-04-25 19:31:17', '2023-09-30 22:43:01'),
(12, 'Accusamus ad nemo nemo sed.', 'Sit rem unde qui totam expedita praesentium esse et. Quo quis veritatis voluptatem fugit quia. Quia odit unde tempora.', 0, 1, '2023-12-28 08:34:44', '2023-07-10 05:08:06'),
(13, 'un test', 'je suis un test, je verfie si tout marche', 1, 1, '2024-03-29 17:11:11', '2024-03-29 18:18:04');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'valere', 'vmangwandjo@gmail.com', NULL, '$2y$10$9JSvVXAkk.2PhCQ50..kB.MpDJYYZL17.0Dzu4rWxIhYDfnwC7Lpa', NULL, '2024-03-28 21:44:19', '2024-03-28 21:44:19');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
