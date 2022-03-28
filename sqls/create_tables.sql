-- -------------------------------------------------------------
-- TablePlus 4.6.2(410)
--
-- https://tableplus.com/
--
-- Database: andpad_owner_test1
-- Generation Time: 2022-03-28 17:46:15.8680
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `message_documents`;
CREATE TABLE `message_documents` (
  `id` varchar(36) NOT NULL,
  `message_id` varchar(36) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `index_message_documents_on_message_id` (`message_id`),
  KEY `index_message_documents_created_at` (`created_at`),
  KEY `index_message_documents_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `message_photos`;
CREATE TABLE `message_photos` (
  `id` varchar(36) NOT NULL,
  `message_id` varchar(36) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `index_message_photos_on_message_id` (`message_id`),
  KEY `index_message_photos_created_at` (`created_at`),
  KEY `index_message_photos_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` varchar(36) NOT NULL,
  `body` text,
  `share_id` varchar(36) NOT NULL,
  `type` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `owner_id` varchar(36) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `index_messages_on_share_id` (`share_id`),
  KEY `index_messages_created_at` (`created_at`),
  KEY `index_messages_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `owners`;
CREATE TABLE `owners` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `index_reports_created_at` (`created_at`),
  KEY `index_reports_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `short_name` varchar(100) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_short_name` (`short_name`),
  KEY `index_permissions_created_at` (`created_at`),
  KEY `index_permissions_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `report_documents`;
CREATE TABLE `report_documents` (
  `id` varchar(36) NOT NULL,
  `report_id` varchar(36) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `index_report_documents_on_report_id` (`report_id`),
  KEY `index_report_documents_created_at` (`created_at`),
  KEY `index_report_documents_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `report_photos`;
CREATE TABLE `report_photos` (
  `id` varchar(36) NOT NULL,
  `report_id` varchar(36) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `index_report_photos_on_report_id` (`report_id`),
  KEY `index_report_photos_created_at` (`created_at`),
  KEY `index_report_photos_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `report_reactions`;
CREATE TABLE `report_reactions` (
  `id` varchar(36) NOT NULL,
  `report_id` varchar(36) NOT NULL,
  `owner_id` varchar(36) NOT NULL,
  `action` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `index_report_reactions_on_report_id` (`report_id`),
  KEY `index_report_reactions_created_at` (`created_at`),
  KEY `index_report_reactions_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `report_replies`;
CREATE TABLE `report_replies` (
  `id` varchar(36) NOT NULL,
  `body` text,
  `report_id` varchar(36) NOT NULL,
  `type` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `owner_id` varchar(36) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `index_report_replies_on_report_id` (`report_id`),
  KEY `index_report_replies_created_at` (`created_at`),
  KEY `index_report_replies_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports` (
  `id` varchar(36) NOT NULL,
  `body` text,
  `share_id` varchar(36) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `index_reports_on_share_id` (`share_id`),
  KEY `index_reports_created_at` (`created_at`),
  KEY `index_reports_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `role_bindings`;
CREATE TABLE `role_bindings` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  `share_owner_id` varchar(36) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_role_share_owner` (`role_id`,`share_owner_id`),
  KEY `index_role_bindings_on_share_owner_id` (`share_owner_id`),
  KEY `index_role_bindings_created_at` (`created_at`),
  KEY `index_role_bindings_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE `role_permissions` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  `permission_id` varchar(36) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_role_permission` (`role_id`,`permission_id`),
  KEY `index_role_permissions_on_permission_id` (`permission_id`),
  KEY `index_role_permissions_created_at` (`created_at`),
  KEY `index_role_permissions_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `index_roles_created_at` (`created_at`),
  KEY `index_roles_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `share_owners`;
CREATE TABLE `share_owners` (
  `id` varchar(36) NOT NULL,
  `share_id` varchar(36) NOT NULL,
  `owner_id` varchar(36) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `index_share_owners_on_share_id` (`share_id`),
  KEY `index_share_owners_created_at` (`created_at`),
  KEY `index_share_owners_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `shares`;
CREATE TABLE `shares` (
  `id` varchar(36) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `index_shares_on_order_id` (`order_id`),
  KEY `index_shares_created_at` (`created_at`),
  KEY `index_shares_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;