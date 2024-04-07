-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2024 at 10:30 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctor_appoiment`
--

-- --------------------------------------------------------

--
-- Table structure for table `appoiments`
--

CREATE TABLE `appoiments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) DEFAULT NULL,
  `category_id` int(20) DEFAULT NULL,
  `doctor_id` bigint(20) DEFAULT NULL,
  `date_time` date DEFAULT NULL,
  `slot_id` varchar(255) DEFAULT NULL,
  `status` enum('pending','approve','reject') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appoiments`
--

INSERT INTO `appoiments` (`id`, `patient_id`, `category_id`, `doctor_id`, `date_time`, `slot_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, '2024-04-05', NULL, 'pending', '2024-04-04 18:35:18', '2024-04-04 18:41:54', NULL),
(2, 2, 2, 3, '2024-04-08', '6', 'pending', '2024-04-07 15:53:25', '2024-04-07 19:36:58', NULL),
(6, 1, NULL, 1, '2024-04-04', NULL, 'reject', '2024-04-07 11:22:56', '2024-04-07 14:55:44', NULL),
(7, 1, NULL, 1, '2024-04-04', '1', 'approve', '2024-04-07 11:26:13', '2024-04-07 14:57:50', NULL),
(8, 1, NULL, 1, '2024-04-04', '2', 'approve', '2024-04-07 11:26:37', '2024-04-07 14:58:03', NULL),
(9, 1, NULL, 1, '2024-04-06', '1', 'pending', '2024-04-07 11:40:45', '2024-04-07 11:40:45', NULL),
(10, 1, NULL, 1, '2024-04-06', '2', 'pending', '2024-04-07 11:40:58', '2024-04-07 11:40:58', NULL),
(11, 2, 1, 1, '2024-04-10', NULL, 'pending', '2024-04-07 19:23:47', '2024-04-07 19:23:47', NULL),
(12, 2, 1, 1, '2024-04-08', NULL, 'approve', '2024-04-07 19:27:51', '2024-04-07 14:51:43', NULL),
(13, 2, 1, 1, '2024-04-08', NULL, 'pending', '2024-04-07 19:28:05', '2024-04-07 19:28:05', NULL),
(14, 2, 1, 1, '2024-04-08', NULL, 'pending', '2024-04-07 19:32:37', '2024-04-07 19:32:37', NULL),
(15, 2, 1, 1, '2024-04-08', NULL, 'pending', '2024-04-07 19:32:41', '2024-04-07 19:32:41', NULL),
(16, 2, 1, 1, '2024-04-08', '10', 'pending', '2024-04-07 19:33:15', '2024-04-07 19:33:15', NULL),
(17, 2, NULL, 1, '2024-04-10', '2', 'pending', '2024-04-07 14:29:49', '2024-04-07 14:29:49', NULL),
(18, 1, NULL, 1, '2024-05-01', '2', 'pending', '2024-04-07 14:30:53', '2024-04-07 14:30:53', NULL),
(19, 1, NULL, 1, '2024-05-01', '4', 'pending', '2024-04-07 14:31:25', '2024-04-07 14:31:25', NULL),
(20, 1, NULL, 1, '2024-05-01', '7', 'pending', '2024-04-07 14:32:27', '2024-04-07 14:32:27', NULL),
(21, 1, NULL, 1, '2024-05-01', '3', 'pending', '2024-04-07 14:32:53', '2024-04-07 14:32:53', NULL),
(22, 1, NULL, 1, '2024-05-01', '5', 'pending', '2024-04-07 14:35:31', '2024-04-07 14:35:31', NULL),
(23, 1, NULL, 1, '2024-05-01', '11', 'pending', '2024-04-07 14:36:40', '2024-04-07 14:36:40', NULL),
(24, 1, NULL, 1, '2024-05-01', '12', 'pending', '2024-04-07 14:38:43', '2024-04-07 14:38:43', NULL),
(25, 1, NULL, 1, '2024-05-01', '12', 'pending', '2024-04-07 14:39:26', '2024-04-07 14:39:26', NULL),
(26, 1, NULL, 1, '2024-05-01', '12', 'pending', '2024-04-07 14:40:12', '2024-04-07 14:40:12', NULL),
(27, 1, NULL, 1, '2024-05-01', '12', 'pending', '2024-04-07 14:40:31', '2024-04-07 14:40:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Aurtho', '2024-04-04 11:24:55', '2024-04-04 11:24:55', NULL),
(2, 'MD', '2024-04-04 11:25:12', '2024-04-04 11:25:12', NULL),
(3, 'MBBS', '2024-04-04 11:25:19', '2024-04-04 11:25:19', NULL),
(4, 'MS', '2024-04-04 11:25:25', '2024-04-04 11:25:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `degrees`
--

CREATE TABLE `degrees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `category_id` varchar(255) NOT NULL DEFAULT '[]',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `user_id`, `category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, '[\"1\",\"2\"]', '2024-04-04 11:25:46', '2024-04-04 11:25:46', NULL),
(2, 4, '[\"1\",\"3\",\"4\"]', '2024-04-04 11:30:41', '2024-04-04 11:30:41', NULL),
(3, 5, '[\"1\",\"2\",\"3\"]', '2024-04-04 11:31:04', '2024-04-04 11:31:04', NULL),
(4, 8, '[\"2\"]', '2024-04-07 10:17:04', '2024-04-07 10:17:04', NULL);

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

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'a1fb18eb-28bc-45bd-b808-25f8be60f875', 'database', 'default', '{\"uuid\":\"a1fb18eb-28bc-45bd-b808-25f8be60f875\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":1:{s:10:\\\"\\u0000*\\u0000details\\\";a:15:{s:2:\\\"id\\\";i:1;s:4:\\\"name\\\";s:6:\\\"yagnik\\\";s:5:\\\"email\\\";s:27:\\\"yagnikfruxinfo121@gmail.com\\\";s:6:\\\"mobile\\\";s:10:\\\"7779058869\\\";s:17:\\\"email_verified_at\\\";N;s:8:\\\"password\\\";s:60:\\\"$2y$10$e9NNxcUc4zGZui0Z0NmSVuXGT2QylpT4kCzPoJisSJzBucZ8yR5f6\\\";s:13:\\\"text_password\\\";s:8:\\\"12345678\\\";s:4:\\\"role\\\";s:5:\\\"admin\\\";s:5:\\\"image\\\";N;s:14:\\\"remember_token\\\";s:100:\\\"wXz37oU2HbO8u0s4qJj9eYxJxBnzW84WK17WLnmmt2hqLR1zsaw2Q5GK96apDXLdLUXvQ9S6eV4o3ahAimVHHPlziCz7UUrf3D6u\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-03-25 07:06:46\\\";s:10:\\\"updated_at\\\";s:19:\\\"2024-04-03 18:42:32\\\";s:10:\\\"deleted_at\\\";N;s:4:\\\"link\\\";s:161:\\\"http:\\/\\/localhost\\/doctor_appoiment\\/superadmin\\/reset_password\\/?wXz37oU2HbO8u0s4qJj9eYxJxBnzW84WK17WLnmmt2hqLR1zsaw2Q5GK96apDXLdLUXvQ9S6eV4o3ahAimVHHPlziCz7UUrf3D6u\\\";s:8:\\\"mailtype\\\";s:15:\\\"forgot_password\\\";}}\"}}', 'ErrorException: Undefined array key \"mail_type\" in D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php:26\nStack trace:\n#0 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(254): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 26)\n#1 D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php(26): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 26)\n#2 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendEmailJob->handle()\n#3 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#5 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#6 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#7 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#8 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#9 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#10 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#11 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendEmailJob), false)\n#12 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#13 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#14 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendEmailJob))\n#16 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#17 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#18 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#19 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(137): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#22 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#23 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#24 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#25 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#26 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#27 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(208): Illuminate\\Container\\Container->call(Array)\n#28 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Command\\Command.php(326): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(177): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(1081): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(320): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(174): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(201): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\xampp\\htdocs\\doctor_appoiment\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}', '2024-04-03 13:12:34'),
(2, '5bb7f929-e3dd-4597-a5e1-941d1638d876', 'database', 'default', '{\"uuid\":\"5bb7f929-e3dd-4597-a5e1-941d1638d876\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":1:{s:10:\\\"\\u0000*\\u0000details\\\";a:15:{s:2:\\\"id\\\";i:1;s:4:\\\"name\\\";s:6:\\\"yagnik\\\";s:5:\\\"email\\\";s:27:\\\"yagnikfruxinfo121@gmail.com\\\";s:6:\\\"mobile\\\";s:10:\\\"7779058869\\\";s:17:\\\"email_verified_at\\\";N;s:8:\\\"password\\\";s:60:\\\"$2y$10$e9NNxcUc4zGZui0Z0NmSVuXGT2QylpT4kCzPoJisSJzBucZ8yR5f6\\\";s:13:\\\"text_password\\\";s:8:\\\"12345678\\\";s:4:\\\"role\\\";s:5:\\\"admin\\\";s:5:\\\"image\\\";N;s:14:\\\"remember_token\\\";s:100:\\\"zGymNwidgwwqKowcdTkGPLdsQdpO0BGGGycXtgkUkKjNiUPDkLjkqYxgkLEaO8pzrfmSOHqeEash7gitPzxqUWU3YnAZ9HQLkfoG\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-03-25 07:06:46\\\";s:10:\\\"updated_at\\\";s:19:\\\"2024-04-03 18:43:53\\\";s:10:\\\"deleted_at\\\";N;s:4:\\\"link\\\";s:161:\\\"http:\\/\\/localhost\\/doctor_appoiment\\/superadmin\\/reset_password\\/?zGymNwidgwwqKowcdTkGPLdsQdpO0BGGGycXtgkUkKjNiUPDkLjkqYxgkLEaO8pzrfmSOHqeEash7gitPzxqUWU3YnAZ9HQLkfoG\\\";s:8:\\\"mailtype\\\";s:15:\\\"forgot_password\\\";}}\"}}', 'ErrorException: Undefined array key \"mail_type\" in D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php:26\nStack trace:\n#0 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(254): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 26)\n#1 D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php(26): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 26)\n#2 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendEmailJob->handle()\n#3 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#5 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#6 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#7 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#8 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#9 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#10 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#11 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendEmailJob), false)\n#12 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#13 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#14 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendEmailJob))\n#16 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#17 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#18 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#19 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(137): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#22 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#23 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#24 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#25 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#26 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#27 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(208): Illuminate\\Container\\Container->call(Array)\n#28 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Command\\Command.php(326): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(177): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(1081): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(320): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(174): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(201): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\xampp\\htdocs\\doctor_appoiment\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}', '2024-04-03 13:13:55'),
(3, '77ffd9e5-7f0a-41ee-b643-1cf84f36d392', 'database', 'default', '{\"uuid\":\"77ffd9e5-7f0a-41ee-b643-1cf84f36d392\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":1:{s:10:\\\"\\u0000*\\u0000details\\\";a:15:{s:2:\\\"id\\\";i:1;s:4:\\\"name\\\";s:6:\\\"yagnik\\\";s:5:\\\"email\\\";s:27:\\\"yagnikfruxinfo121@gmail.com\\\";s:6:\\\"mobile\\\";s:10:\\\"7779058869\\\";s:17:\\\"email_verified_at\\\";N;s:8:\\\"password\\\";s:60:\\\"$2y$10$e9NNxcUc4zGZui0Z0NmSVuXGT2QylpT4kCzPoJisSJzBucZ8yR5f6\\\";s:13:\\\"text_password\\\";s:8:\\\"12345678\\\";s:4:\\\"role\\\";s:5:\\\"admin\\\";s:5:\\\"image\\\";N;s:14:\\\"remember_token\\\";s:100:\\\"gz2oCG2Ymr1xwk4bsLO8k3rPeK5OpFHrf78relqt6HRydOMHmwS2rGn2lF8wunzS0wwraOCEVM9AWDwHpPBLlOrrb4qZm059fvbJ\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-03-25 07:06:46\\\";s:10:\\\"updated_at\\\";s:19:\\\"2024-04-03 18:45:17\\\";s:10:\\\"deleted_at\\\";N;s:4:\\\"link\\\";s:161:\\\"http:\\/\\/localhost\\/doctor_appoiment\\/superadmin\\/reset_password\\/?gz2oCG2Ymr1xwk4bsLO8k3rPeK5OpFHrf78relqt6HRydOMHmwS2rGn2lF8wunzS0wwraOCEVM9AWDwHpPBLlOrrb4qZm059fvbJ\\\";s:8:\\\"mailtype\\\";s:15:\\\"forgot_password\\\";}}\"}}', 'ErrorException: Undefined array key \"mail_type\" in D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php:26\nStack trace:\n#0 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(254): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 26)\n#1 D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php(26): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 26)\n#2 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendEmailJob->handle()\n#3 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#5 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#6 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#7 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#8 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#9 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#10 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#11 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendEmailJob), false)\n#12 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#13 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#14 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendEmailJob))\n#16 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#17 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#18 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#19 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(137): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#22 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#23 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#24 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#25 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#26 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#27 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(208): Illuminate\\Container\\Container->call(Array)\n#28 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Command\\Command.php(326): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(177): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(1081): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(320): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(174): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(201): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\xampp\\htdocs\\doctor_appoiment\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}', '2024-04-03 13:15:18'),
(4, '296839e3-4113-4a6c-af14-9da676033663', 'database', 'default', '{\"uuid\":\"296839e3-4113-4a6c-af14-9da676033663\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":1:{s:10:\\\"\\u0000*\\u0000details\\\";a:15:{s:2:\\\"id\\\";i:1;s:4:\\\"name\\\";s:6:\\\"yagnik\\\";s:5:\\\"email\\\";s:27:\\\"yagnikfruxinfo121@gmail.com\\\";s:6:\\\"mobile\\\";s:10:\\\"7779058869\\\";s:17:\\\"email_verified_at\\\";N;s:8:\\\"password\\\";s:60:\\\"$2y$10$e9NNxcUc4zGZui0Z0NmSVuXGT2QylpT4kCzPoJisSJzBucZ8yR5f6\\\";s:13:\\\"text_password\\\";s:8:\\\"12345678\\\";s:4:\\\"role\\\";s:5:\\\"admin\\\";s:5:\\\"image\\\";N;s:14:\\\"remember_token\\\";s:100:\\\"9fA59RzAXIRcCN8rCHWU2bE8okapBZ8CcDroSwJZ2hyVDAzDPfy9N1YWrUbLGWa18XnQvxsCvZyGY4a1qTy05uoqMc83x4jC4amq\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-03-25 07:06:46\\\";s:10:\\\"updated_at\\\";s:19:\\\"2024-04-03 18:45:55\\\";s:10:\\\"deleted_at\\\";N;s:4:\\\"link\\\";s:161:\\\"http:\\/\\/localhost\\/doctor_appoiment\\/superadmin\\/reset_password\\/?9fA59RzAXIRcCN8rCHWU2bE8okapBZ8CcDroSwJZ2hyVDAzDPfy9N1YWrUbLGWa18XnQvxsCvZyGY4a1qTy05uoqMc83x4jC4amq\\\";s:8:\\\"mailtype\\\";s:15:\\\"forgot_password\\\";}}\"}}', 'ErrorException: Undefined array key \"mail_type\" in D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php:26\nStack trace:\n#0 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(254): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 26)\n#1 D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php(26): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 26)\n#2 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendEmailJob->handle()\n#3 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#5 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#6 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#7 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#8 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#9 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#10 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#11 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendEmailJob), false)\n#12 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#13 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#14 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendEmailJob))\n#16 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#17 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#18 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#19 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(137): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#22 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#23 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#24 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#25 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#26 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#27 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(208): Illuminate\\Container\\Container->call(Array)\n#28 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Command\\Command.php(326): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(177): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(1081): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(320): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(174): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(201): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\xampp\\htdocs\\doctor_appoiment\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}', '2024-04-03 13:15:57'),
(5, 'a80c85dc-58ee-4a94-9da8-b9fad6883362', 'database', 'default', '{\"uuid\":\"a80c85dc-58ee-4a94-9da8-b9fad6883362\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":1:{s:10:\\\"\\u0000*\\u0000details\\\";a:10:{s:10:\\\"patient_id\\\";s:1:\\\"2\\\";s:9:\\\"doctor_id\\\";s:1:\\\"1\\\";s:9:\\\"date_time\\\";s:10:\\\"2024-04-10\\\";s:7:\\\"slot_id\\\";s:1:\\\"2\\\";s:6:\\\"status\\\";s:7:\\\"pending\\\";s:10:\\\"updated_at\\\";s:19:\\\"2024-04-07 19:59:49\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-04-07 19:59:49\\\";s:2:\\\"id\\\";i:17;s:4:\\\"name\\\";O:15:\\\"App\\\\Models\\\\User\\\":32:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:5:\\\"users\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:13:{s:2:\\\"id\\\";i:9;s:4:\\\"name\\\";s:3:\\\"jay\\\";s:5:\\\"email\\\";s:13:\\\"jay@gmail.com\\\";s:6:\\\"mobile\\\";s:10:\\\"7896354288\\\";s:17:\\\"email_verified_at\\\";N;s:8:\\\"password\\\";s:60:\\\"$2y$10$QPEXE61fDP3DkI.oGZ8ZO.\\/SQFZjCb.sp06DA7SUIOG05g1zJZMW2\\\";s:13:\\\"text_password\\\";s:6:\\\"224466\\\";s:4:\\\"role\\\";s:7:\\\"patient\\\";s:5:\\\"image\\\";N;s:14:\\\"remember_token\\\";s:100:\\\"pbhXX2bdPz7now1v94ilPbbLPWL9aRITraCSiE8nC2AkRp1lN8tyL7kYLZJNFh9TePBNCbsklIbi8TsrKvYvyifw5MDsSKWZ14ED\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-04-07 15:51:15\\\";s:10:\\\"updated_at\\\";s:19:\\\"2024-04-07 19:44:44\\\";s:10:\\\"deleted_at\\\";N;}s:11:\\\"\\u0000*\\u0000original\\\";a:13:{s:2:\\\"id\\\";i:9;s:4:\\\"name\\\";s:3:\\\"jay\\\";s:5:\\\"email\\\";s:13:\\\"jay@gmail.com\\\";s:6:\\\"mobile\\\";s:10:\\\"7896354288\\\";s:17:\\\"email_verified_at\\\";N;s:8:\\\"password\\\";s:60:\\\"$2y$10$QPEXE61fDP3DkI.oGZ8ZO.\\/SQFZjCb.sp06DA7SUIOG05g1zJZMW2\\\";s:13:\\\"text_password\\\";s:6:\\\"224466\\\";s:4:\\\"role\\\";s:7:\\\"patient\\\";s:5:\\\"image\\\";N;s:14:\\\"remember_token\\\";s:100:\\\"pbhXX2bdPz7now1v94ilPbbLPWL9aRITraCSiE8nC2AkRp1lN8tyL7kYLZJNFh9TePBNCbsklIbi8TsrKvYvyifw5MDsSKWZ14ED\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-04-07 15:51:15\\\";s:10:\\\"updated_at\\\";s:19:\\\"2024-04-07 19:44:44\\\";s:10:\\\"deleted_at\\\";N;}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:2:{s:17:\\\"email_verified_at\\\";s:8:\\\"datetime\\\";s:8:\\\"password\\\";s:6:\\\"hashed\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:2:{i:0;s:8:\\\"password\\\";i:1;s:14:\\\"remember_token\\\";}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:5:{i:0;s:4:\\\"name\\\";i:1;s:5:\\\"email\\\";i:2;s:6:\\\"mobile\\\";i:3;s:4:\\\"role\\\";i:4;s:8:\\\"password\\\";}s:10:\\\"\\u0000*\\u0000guarded\\\";a:1:{i:0;s:1:\\\"*\\\";}s:20:\\\"\\u0000*\\u0000rememberTokenName\\\";s:14:\\\"remember_token\\\";s:14:\\\"\\u0000*\\u0000accessToken\\\";N;}s:9:\\\"mail_type\\\";s:9:\\\"appoiment\\\";}}\"}}', 'ErrorException: Undefined array key \"email\" in D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php:36\nStack trace:\n#0 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(254): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 36)\n#1 D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php(36): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 36)\n#2 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendEmailJob->handle()\n#3 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#5 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#6 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#7 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#8 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#9 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#10 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#11 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendEmailJob), false)\n#12 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#13 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#14 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendEmailJob))\n#16 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#17 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#18 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#19 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(137): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#22 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#23 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#24 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#25 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#26 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#27 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(208): Illuminate\\Container\\Container->call(Array)\n#28 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Command\\Command.php(326): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(177): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(1081): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(320): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(174): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(201): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\xampp\\htdocs\\doctor_appoiment\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}', '2024-04-07 14:29:51');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(6, '04b4edc3-aade-4e1d-a478-f854668ec57d', 'database', 'default', '{\"uuid\":\"04b4edc3-aade-4e1d-a478-f854668ec57d\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":1:{s:10:\\\"\\u0000*\\u0000details\\\";a:10:{s:10:\\\"patient_id\\\";s:1:\\\"1\\\";s:9:\\\"doctor_id\\\";s:1:\\\"1\\\";s:9:\\\"date_time\\\";s:10:\\\"2024-05-01\\\";s:7:\\\"slot_id\\\";s:1:\\\"4\\\";s:6:\\\"status\\\";s:7:\\\"pending\\\";s:10:\\\"updated_at\\\";s:19:\\\"2024-04-07 20:01:25\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-04-07 20:01:25\\\";s:2:\\\"id\\\";i:19;s:4:\\\"name\\\";s:6:\\\"yagnik\\\";s:9:\\\"mail_type\\\";s:9:\\\"appoiment\\\";}}\"}}', 'ErrorException: Undefined array key \"email\" in D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php:36\nStack trace:\n#0 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(254): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 36)\n#1 D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php(36): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 36)\n#2 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendEmailJob->handle()\n#3 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#5 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#6 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#7 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#8 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#9 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#10 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#11 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendEmailJob), false)\n#12 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#13 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#14 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendEmailJob))\n#16 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#17 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#18 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#19 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(137): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#22 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#23 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#24 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#25 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#26 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#27 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(208): Illuminate\\Container\\Container->call(Array)\n#28 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Command\\Command.php(326): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(177): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(1081): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(320): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(174): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(201): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\xampp\\htdocs\\doctor_appoiment\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}', '2024-04-07 14:31:28'),
(7, 'abc5511e-b5c3-4a20-948e-7ceb4f31683d', 'database', 'default', '{\"uuid\":\"abc5511e-b5c3-4a20-948e-7ceb4f31683d\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":1:{s:10:\\\"\\u0000*\\u0000details\\\";a:10:{s:10:\\\"patient_id\\\";s:1:\\\"1\\\";s:9:\\\"doctor_id\\\";s:1:\\\"1\\\";s:9:\\\"date_time\\\";s:10:\\\"2024-05-01\\\";s:7:\\\"slot_id\\\";s:1:\\\"7\\\";s:6:\\\"status\\\";s:7:\\\"pending\\\";s:10:\\\"updated_at\\\";s:19:\\\"2024-04-07 20:02:27\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-04-07 20:02:27\\\";s:2:\\\"id\\\";i:20;s:4:\\\"name\\\";s:6:\\\"yagnik\\\";s:9:\\\"mail_type\\\";s:9:\\\"appoiment\\\";}}\"}}', 'ErrorException: Undefined array key \"email\" in D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php:36\nStack trace:\n#0 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(254): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 36)\n#1 D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php(36): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 36)\n#2 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendEmailJob->handle()\n#3 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#5 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#6 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#7 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#8 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#9 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#10 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#11 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendEmailJob), false)\n#12 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#13 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#14 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendEmailJob))\n#16 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#17 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#18 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#19 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(137): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#22 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#23 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#24 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#25 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#26 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#27 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(208): Illuminate\\Container\\Container->call(Array)\n#28 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Command\\Command.php(326): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(177): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(1081): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(320): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(174): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(201): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\xampp\\htdocs\\doctor_appoiment\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}', '2024-04-07 14:32:30'),
(8, 'ba92b62a-d364-4798-897d-c484aa88ff43', 'database', 'default', '{\"uuid\":\"ba92b62a-d364-4798-897d-c484aa88ff43\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":1:{s:10:\\\"\\u0000*\\u0000details\\\";a:10:{s:10:\\\"patient_id\\\";s:1:\\\"1\\\";s:9:\\\"doctor_id\\\";s:1:\\\"1\\\";s:9:\\\"date_time\\\";s:10:\\\"2024-05-01\\\";s:7:\\\"slot_id\\\";s:1:\\\"3\\\";s:6:\\\"status\\\";s:7:\\\"pending\\\";s:10:\\\"updated_at\\\";s:19:\\\"2024-04-07 20:02:53\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-04-07 20:02:53\\\";s:2:\\\"id\\\";i:21;s:4:\\\"name\\\";s:6:\\\"yagnik\\\";s:9:\\\"mail_type\\\";s:9:\\\"appoiment\\\";}}\"}}', 'ErrorException: Undefined array key \"email\" in D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php:36\nStack trace:\n#0 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(254): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 36)\n#1 D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php(36): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 36)\n#2 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendEmailJob->handle()\n#3 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#5 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#6 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#7 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#8 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#9 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#10 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#11 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendEmailJob), false)\n#12 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#13 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#14 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendEmailJob))\n#16 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#17 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#18 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#19 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(137): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#22 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#23 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#24 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#25 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#26 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#27 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(208): Illuminate\\Container\\Container->call(Array)\n#28 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Command\\Command.php(326): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(177): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(1081): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(320): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(174): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(201): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\xampp\\htdocs\\doctor_appoiment\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}', '2024-04-07 14:32:55'),
(9, '0efb44a5-7d13-4ede-96aa-e7e45269a80a', 'database', 'default', '{\"uuid\":\"0efb44a5-7d13-4ede-96aa-e7e45269a80a\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":1:{s:10:\\\"\\u0000*\\u0000details\\\";a:13:{s:2:\\\"id\\\";i:5;s:10:\\\"patient_id\\\";i:1;s:11:\\\"category_id\\\";N;s:9:\\\"doctor_id\\\";i:1;s:9:\\\"date_time\\\";s:10:\\\"2024-04-04\\\";s:7:\\\"slot_id\\\";s:1:\\\"1\\\";s:6:\\\"status\\\";s:7:\\\"pending\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-04-07 16:52:43\\\";s:10:\\\"updated_at\\\";s:19:\\\"2024-04-07 17:21:21\\\";s:10:\\\"deleted_at\\\";N;s:4:\\\"name\\\";s:6:\\\"yagnik\\\";s:5:\\\"email\\\";s:27:\\\"yagnikfruxinfo121@gmail.com\\\";s:9:\\\"mail_type\\\";s:16:\\\"appoiment_remove\\\";}}\"}}', 'Error: Class \"App\\Jobs\\AppoimentDelete\" not found in D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php:41\nStack trace:\n#0 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendEmailJob->handle()\n#1 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#2 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#3 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#4 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#5 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#6 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#7 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#8 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#9 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendEmailJob), false)\n#10 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#11 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#12 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#13 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendEmailJob))\n#14 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#15 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#16 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#17 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#18 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(137): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#20 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#21 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#23 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#24 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#25 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(208): Illuminate\\Container\\Container->call(Array)\n#26 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Command\\Command.php(326): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#27 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(177): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(1081): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(320): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(174): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(201): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 D:\\xampp\\htdocs\\doctor_appoiment\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 {main}', '2024-04-07 14:46:23');

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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
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
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `doctor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `user_id`, `doctor_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 7, 1, '2024-04-04 12:09:32', '2024-04-04 17:43:02', NULL),
(2, 9, 3, '2024-04-07 10:21:15', '2024-04-07 19:33:31', NULL),
(3, 10, 3, '2024-04-07 10:24:44', '2024-04-07 15:55:32', NULL);

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
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appoiment_id` bigint(20) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `appoiment_id`, `text`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 'dolo', '2024-04-07 10:35:17', '2024-04-07 10:35:17', NULL),
(2, 3, 'no medicine', '2024-04-07 10:35:27', '2024-04-07 10:35:27', NULL),
(3, 2, 'moye moye', '2024-04-07 10:35:36', '2024-04-07 10:35:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slots`
--

CREATE TABLE `slots` (
  `id` int(11) NOT NULL,
  `slot` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slots`
--

INSERT INTO `slots` (`id`, `slot`, `created_at`, `updated_at`) VALUES
(1, '10:00 AM To 10:30 AM', '2024-04-07 16:46:52', NULL),
(2, '10:31 AM To 11:00 AM', '2024-04-07 16:46:52', NULL),
(3, '11:01 AM To 11:30 AM', '2024-04-07 16:46:52', NULL),
(4, '11:31 AM To 12:00 PM', '2024-04-07 16:46:52', NULL),
(5, '12:01 PM To 12:30 PM', '2024-04-07 16:46:52', NULL),
(6, '12:31 PM To 01:00 PM', '2024-04-07 16:46:52', NULL),
(7, '03:00 PM To 03:30 PM', '2024-04-07 16:46:52', NULL),
(8, '03:31 PM To 04:00 PM', '2024-04-07 16:46:52', NULL),
(9, '04:01 PM To 04:30 PM', '2024-04-07 16:46:52', NULL),
(10, '04:31 PM To 05:00 PM', '2024-04-07 16:46:52', NULL),
(11, '05:01 PM To 05:30 PM', '2024-04-07 16:46:52', NULL),
(12, '05:31 PM To 06:00 PM', '2024-04-07 16:46:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `text_password` varchar(255) DEFAULT NULL,
  `role` enum('admin','doctor','patient') DEFAULT 'patient',
  `image` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `email_verified_at`, `password`, `text_password`, `role`, `image`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'yagnik', 'yagnikfruxinfo121@gmail.com', '7779058869', NULL, '$2y$10$SflZDds76FtLNKX9rVpBiOx51KB0UyX0JRa4URX9Ic7DBAALxGF8i', '123456', 'admin', NULL, 'MT8csmodLKmpY4wFTMVsu0GNALQmOoDJ841vYcfkEdXcEH3Ckm4nwFCtHx8noPaUQ5oyAA78DtB8XcriOWJPAk22JKJQPo0rg3RQ', '2024-03-25 01:36:46', '2024-04-07 14:17:42', NULL),
(3, 'yagnik', 'yagnik@gmail.com', '9874563210', NULL, '$2y$10$edBsxD.LUrKbHPHzf2hGvur7solEClQiZDgfBj3PnkdpUrpz3iw7O', '28298424', 'doctor', NULL, 'tOYSj57iTWgCbRLIUYJLlJusOy0hQDv3PGVIfhQtoRxZmoBKx83yQ5WCB5Bb9plPbqJOm2s7S0l9zu7U34ybt13NggmEW3YkGMzZ', '2024-04-04 11:25:46', '2024-04-07 14:18:22', NULL),
(4, 'parth', 'parth@gmail.com', '9874563210', NULL, '$2y$10$EdbJT4lQQa6qt45NcD5IRO3bLnjam6/R8hMSY7n2.yD8jM.b.pJPC', '09588438', 'doctor', NULL, NULL, '2024-04-04 11:30:41', '2024-04-04 11:30:41', NULL),
(5, 'akash', 'akash@gmail.com', '98745632110', NULL, '$2y$10$FxTnljHpXPSFCL.ZeohEb.dtQVAFp5/T6Gq83oY1pMIY4g/EJWrmq', '76092805', 'doctor', NULL, NULL, '2024-04-04 11:31:04', '2024-04-04 11:31:04', NULL),
(7, 'yagnik', 'yagnikfruxinfo121@gmail.com', '9874563210', NULL, '$2y$10$ZE8Uea50zCLLYpq5V9xwNey.ae3hvrccMByQGpiSRZIuoWKoNykCC', '12345678', 'patient', NULL, NULL, '2024-04-04 12:09:32', '2024-04-04 12:09:32', NULL),
(8, 'vansh', 'vansh@gmail.com', '123456', NULL, '$2y$10$qnhqEam8F8Yc40txdVN6neoWQ8V0laohHQ.bpa54D3hFkfMPHE8EO', '82568247', 'doctor', NULL, 'b0tcLaoTBeQjs8aaVc8lqMNlRcmKYAZ3FTUtaqxieIheC4aA8cPZHA3oXT7qPsWdm9fhYQVDeLYE8YFMcfA2gp01hcY8pXORYMPV', '2024-04-07 10:17:04', '2024-04-07 10:19:03', NULL),
(9, 'jay', 'jay@gmail.com', '7896354288', NULL, '$2y$10$QPEXE61fDP3DkI.oGZ8ZO./SQFZjCb.sp06DA7SUIOG05g1zJZMW2', '224466', 'patient', NULL, 'pbhXX2bdPz7now1v94ilPbbLPWL9aRITraCSiE8nC2AkRp1lN8tyL7kYLZJNFh9TePBNCbsklIbi8TsrKvYvyifw5MDsSKWZ14ED', '2024-04-07 10:21:15', '2024-04-07 14:14:44', NULL),
(10, 'dixita', 'dixita@gmail.com', '7896541230', NULL, '$2y$10$FTYF5eZMxhhaE9uq.0UKFOBjlqcE0iMrsbYy97Dw2AWDUfFqshmme', '113355', 'patient', NULL, NULL, '2024-04-07 10:24:44', '2024-04-07 10:24:44', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appoiments`
--
ALTER TABLE `appoiments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `degrees`
--
ALTER TABLE `degrees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

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
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slots`
--
ALTER TABLE `slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appoiments`
--
ALTER TABLE `appoiments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `degrees`
--
ALTER TABLE `degrees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `slots`
--
ALTER TABLE `slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
