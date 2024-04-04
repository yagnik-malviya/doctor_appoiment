-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2024 at 08:49 PM
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
  `date_time` timestamp NULL DEFAULT NULL,
  `status` enum('pending','approve','reject') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appoiments`
--

INSERT INTO `appoiments` (`id`, `patient_id`, `category_id`, `doctor_id`, `date_time`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, '2024-04-04 18:35:00', 'pending', '2024-04-04 18:35:18', '2024-04-04 18:41:54', NULL);

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
(3, 5, '[\"1\",\"2\",\"3\"]', '2024-04-04 11:31:04', '2024-04-04 11:31:04', NULL);

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
(4, '296839e3-4113-4a6c-af14-9da676033663', 'database', 'default', '{\"uuid\":\"296839e3-4113-4a6c-af14-9da676033663\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":1:{s:10:\\\"\\u0000*\\u0000details\\\";a:15:{s:2:\\\"id\\\";i:1;s:4:\\\"name\\\";s:6:\\\"yagnik\\\";s:5:\\\"email\\\";s:27:\\\"yagnikfruxinfo121@gmail.com\\\";s:6:\\\"mobile\\\";s:10:\\\"7779058869\\\";s:17:\\\"email_verified_at\\\";N;s:8:\\\"password\\\";s:60:\\\"$2y$10$e9NNxcUc4zGZui0Z0NmSVuXGT2QylpT4kCzPoJisSJzBucZ8yR5f6\\\";s:13:\\\"text_password\\\";s:8:\\\"12345678\\\";s:4:\\\"role\\\";s:5:\\\"admin\\\";s:5:\\\"image\\\";N;s:14:\\\"remember_token\\\";s:100:\\\"9fA59RzAXIRcCN8rCHWU2bE8okapBZ8CcDroSwJZ2hyVDAzDPfy9N1YWrUbLGWa18XnQvxsCvZyGY4a1qTy05uoqMc83x4jC4amq\\\";s:10:\\\"created_at\\\";s:19:\\\"2024-03-25 07:06:46\\\";s:10:\\\"updated_at\\\";s:19:\\\"2024-04-03 18:45:55\\\";s:10:\\\"deleted_at\\\";N;s:4:\\\"link\\\";s:161:\\\"http:\\/\\/localhost\\/doctor_appoiment\\/superadmin\\/reset_password\\/?9fA59RzAXIRcCN8rCHWU2bE8okapBZ8CcDroSwJZ2hyVDAzDPfy9N1YWrUbLGWa18XnQvxsCvZyGY4a1qTy05uoqMc83x4jC4amq\\\";s:8:\\\"mailtype\\\";s:15:\\\"forgot_password\\\";}}\"}}', 'ErrorException: Undefined array key \"mail_type\" in D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php:26\nStack trace:\n#0 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(254): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 26)\n#1 D:\\xampp\\htdocs\\doctor_appoiment\\app\\Jobs\\SendEmailJob.php(26): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Undefined array...\', \'D:\\\\xampp\\\\htdocs...\', 26)\n#2 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendEmailJob->handle()\n#3 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#5 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#6 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#7 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#8 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#9 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#10 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#11 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendEmailJob), false)\n#12 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#13 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmailJob))\n#14 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendEmailJob))\n#16 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#17 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#18 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#19 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(333): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(137): Illuminate\\Queue\\Worker->runNextJob(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#22 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#23 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#24 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#25 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#26 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#27 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(208): Illuminate\\Container\\Container->call(Array)\n#28 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Command\\Command.php(326): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(177): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(1081): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(320): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\symfony\\console\\Application.php(174): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 D:\\xampp\\htdocs\\doctor_appoiment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(201): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\xampp\\htdocs\\doctor_appoiment\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}', '2024-04-03 13:15:57');

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
(1, 7, 1, '2024-04-04 12:09:32', '2024-04-04 17:43:02', NULL);

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
(1, 'yagnik', 'yagnikfruxinfo121@gmail.com', '7779058869', NULL, '$2y$10$rN33i.tyfKNrJHS6Gt45au.nf2fz/PmANv1UTxkAcJbiVfbO7JySu', '12345678', 'admin', NULL, NULL, '2024-03-25 01:36:46', '2024-04-03 13:20:44', NULL),
(3, 'yagnik', 'yagnik@gmail.com', '9874563210', NULL, '$2y$10$edBsxD.LUrKbHPHzf2hGvur7solEClQiZDgfBj3PnkdpUrpz3iw7O', '28298424', 'doctor', NULL, NULL, '2024-04-04 11:25:46', '2024-04-04 11:25:46', NULL),
(4, 'parth', 'parth@gmail.com', '9874563210', NULL, '$2y$10$EdbJT4lQQa6qt45NcD5IRO3bLnjam6/R8hMSY7n2.yD8jM.b.pJPC', '09588438', 'doctor', NULL, NULL, '2024-04-04 11:30:41', '2024-04-04 11:30:41', NULL),
(5, 'akash', 'akash@gmail.com', '98745632110', NULL, '$2y$10$FxTnljHpXPSFCL.ZeohEb.dtQVAFp5/T6Gq83oY1pMIY4g/EJWrmq', '76092805', 'doctor', NULL, NULL, '2024-04-04 11:31:04', '2024-04-04 11:31:04', NULL),
(7, 'yagnik', 'yagnikfruxinfo121@gmail.com', '9874563210', NULL, '$2y$10$ZE8Uea50zCLLYpq5V9xwNey.ae3hvrccMByQGpiSRZIuoWKoNykCC', '12345678', 'patient', NULL, NULL, '2024-04-04 12:09:32', '2024-04-04 12:09:32', NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
