-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.2.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for gocmdb
DROP DATABASE IF EXISTS `gocmdb`;
CREATE DATABASE IF NOT EXISTS `gocmdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gocmdb`;

-- Dumping structure for table gocmdb.cmdb_sequence
DROP TABLE IF EXISTS `cmdb_sequence`;
CREATE TABLE IF NOT EXISTS `cmdb_sequence` (
  `ord` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `issue_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ord`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table gocmdb.cmdb_users
DROP TABLE IF EXISTS `cmdb_users`;
CREATE TABLE IF NOT EXISTS `cmdb_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` text DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `locked` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `role` enum('agent','user','admin') NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cmdb_users`
--

LOCK TABLES `cmdb_users` WRITE;
/*!40000 ALTER TABLE `cmdb_users` DISABLE KEYS */;
INSERT INTO `cmdb_users` (username, password, role) VALUES ('clubpc','$2a$10$Rwh9Ix7Q9.5ST49GngEUJu/VOAYdWG4wnMA9ArSv4qVWQ6nRkyPme','agent');
/*!40000 ALTER TABLE `cmdb_users` ENABLE KEYS */;
UNLOCK TABLES;

-- Dumping structure for procedure gocmdb.proc_usbci_insert_checkins
DROP PROCEDURE IF EXISTS `proc_usbci_insert_checkins`;
DELIMITER //
CREATE PROCEDURE `proc_usbci_insert_checkins`(
	IN `host_name_in` VARCHAR(255),
	IN `vendor_id_in` VARCHAR(4),
	IN `product_id_in` VARCHAR(4),
	IN `serial_number_in` VARCHAR(127),
	IN `vendor_name_in` VARCHAR(127),
	IN `product_name_in` VARCHAR(127),
	IN `product_ver_in` VARCHAR(255),
	IN `firmware_ver_in` VARCHAR(255),
	IN `software_id_in` VARCHAR(255),
	IN `bus_number_in` INT(10),
	IN `bus_address_in` INT(10),
	IN `port_number_in` INT(10),
	IN `buffer_size_in` INT(10),
	IN `max_pkt_size_in` INT(10),
	IN `usb_spec_in` VARCHAR(5),
	IN `usb_class_in` VARCHAR(127),
	IN `usb_subclass_in` VARCHAR(127),
	IN `usb_protocol_in` VARCHAR(127),
	IN `device_speed_in` VARCHAR(127),
	IN `device_ver_in` VARCHAR(5),
	IN `device_sn_in` VARCHAR(127),
	IN `factory_sn_in` VARCHAR(127),
	IN `descriptor_sn_in` VARCHAR(127),
	IN `object_type_in` VARCHAR(255),
	IN `object_json_in` JSON,
	IN `remote_addr_in` VARCHAR(255)
)
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
	INSERT INTO usbci_checkins (
		host_name,
		vendor_id,
		product_id,
		serial_number,
		vendor_name,
		product_name,
		product_ver,
		firmware_ver,
		software_id,
		port_number,
		bus_number,
		bus_address,
		buffer_size,
		max_pkt_size,
		usb_spec,
		usb_class,
		usb_subclass,
		usb_protocol,
		device_speed,
		device_ver,
		device_sn,
		factory_sn,
		descriptor_sn,
		object_type,
		object_json,
		remote_addr
	)
	VALUES (
		host_name_in,
		vendor_id_in,
		product_id_in,
		serial_number_in,
		vendor_name_in,
		product_name_in,
		product_ver_in,
		firmware_ver_in,
		software_id_in,
		port_number_in,
		bus_number_in,
		bus_address_in,
		buffer_size_in,
		max_pkt_size_in,
		usb_spec_in,
		usb_class_in,
		usb_subclass_in,
		usb_protocol_in, 
		device_speed_in,
		device_ver_in,
		device_sn_in,
		factory_sn_in,
		descriptor_sn_in,
		object_type_in,
		object_json_in,
		remote_addr_in
	);
END//
DELIMITER ;

-- Dumping structure for procedure gocmdb.proc_usbci_insert_serialized
DROP PROCEDURE IF EXISTS `proc_usbci_insert_serialized`;
DELIMITER //
CREATE PROCEDURE `proc_usbci_insert_serialized`(
	IN `host_name_in` VARCHAR(255),
	IN `vendor_id_in` VARCHAR(4),
	IN `product_id_in` VARCHAR(4),
	IN `serial_number_in` VARCHAR(127),
	IN `vendor_name_in` VARCHAR(127),
	IN `product_name_in` VARCHAR(127),
	IN `product_ver_in` VARCHAR(255),
	IN `firmware_ver_in` VARCHAR(255),
	IN `software_id_in` VARCHAR(255),
	IN `bus_number_in` INT(10),
	IN `bus_address_in` INT(10),
	IN `port_number_in` INT(10),
	IN `buffer_size_in` INT(10),
	IN `max_pkt_size_in` INT(10),
	IN `usb_spec_in` VARCHAR(5),
	IN `usb_class_in` VARCHAR(127),
	IN `usb_subclass_in` VARCHAR(127),
	IN `usb_protocol_in` VARCHAR(127),
	IN `device_speed_in` VARCHAR(127),
	IN `device_ver_in` VARCHAR(5),
	IN `device_sn_in` VARCHAR(127),
	IN `factory_sn_in` VARCHAR(127),
	IN `descriptor_sn_in` VARCHAR(127),
	IN `object_type_in` VARCHAR(255),
	IN `object_json_in` JSON,
	IN `remote_addr_in` VARCHAR(255),
	IN `checkin_date_in` DATETIME
)
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
	INSERT INTO usbci_serialized (
		host_name,
		vendor_id,
		product_id,
		serial_number,
		vendor_name,
		product_name,
		product_ver,
		firmware_ver,
		software_id,
		port_number,
		bus_number,
		bus_address,
		buffer_size,
		max_pkt_size,
		usb_spec,
		usb_class,
		usb_subclass,
		usb_protocol,
		device_speed,
		device_ver,
		device_sn,
		factory_sn,
		descriptor_sn,
		object_type,
		object_json,
		remote_addr,
		first_seen,
		last_seen
	)
	VALUES (
		host_name_in,
		vendor_id_in,
		product_id_in,
		serial_number_in,
		vendor_name_in,
		product_name_in,
		product_ver_in,
		firmware_ver_in,
		software_id_in,
		port_number_in,
		bus_number_in,
		bus_address_in,
		buffer_size_in,
		max_pkt_size_in,
		usb_spec_in,
		usb_class_in,
		usb_subclass_in,
		usb_protocol_in, 
		device_speed_in,
		device_ver_in,
		device_sn_in,
		factory_sn_in,
		descriptor_sn_in,
		object_type_in,
		object_json_in,
		remote_addr_in,
		checkin_date_in,
		checkin_date_in
	)
	ON DUPLICATE KEY UPDATE
		-- host_name = host_name_in,
		-- vendor_id = vendor_id_in,
		-- product_id = product_id_in,
		vendor_name = vendor_name_in,
		product_name = product_name_in,
		product_ver = product_ver_in,
		firmware_ver = firmware_ver_in,
		software_id = software_id_in,
		port_number = port_number_in,
		bus_number = bus_number_in,
		bus_address = bus_address_in,
		buffer_size = buffer_size_in,
		max_pkt_size = max_pkt_size_in,
		usb_spec = usb_spec_in,
		usb_class = usb_class_in,
		usb_subclass = usb_subclass_in,
		usb_protocol = usb_protocol_in,
		device_speed = device_speed_in,
		device_ver = device_ver_in,
		device_sn = device_sn_in,
		factory_sn = factory_sn_in,
		descriptor_sn = descriptor_sn_in,
		object_type = object_type_in,
		object_json = object_json_in,
		remote_addr = remote_addr_in,
		last_seen = checkin_date_in,
		checkins = checkins + 1;
END//
DELIMITER ;

-- Dumping structure for procedure gocmdb.proc_usbci_insert_unserialized
DROP PROCEDURE IF EXISTS `proc_usbci_insert_unserialized`;
DELIMITER //
CREATE PROCEDURE `proc_usbci_insert_unserialized`(
	IN `host_name_in` VARCHAR(255),
	IN `vendor_id_in` VARCHAR(4),
	IN `product_id_in` VARCHAR(4),
	IN `serial_number_in` VARCHAR(127),
	IN `vendor_name_in` VARCHAR(127),
	IN `product_name_in` VARCHAR(127),
	IN `product_ver_in` VARCHAR(255),
	IN `firmware_ver_in` VARCHAR(255),
	IN `software_id_in` VARCHAR(255),
	IN `bus_number_in` INT(10),
	IN `bus_address_in` INT(10),
	IN `port_number_in` INT(10),
	IN `buffer_size_in` INT(10),
	IN `max_pkt_size_in` INT(10),
	IN `usb_spec_in` VARCHAR(5),
	IN `usb_class_in` VARCHAR(127),
	IN `usb_subclass_in` VARCHAR(127),
	IN `usb_protocol_in` VARCHAR(127),
	IN `device_speed_in` VARCHAR(127),
	IN `device_ver_in` VARCHAR(5),
	IN `device_sn_in` VARCHAR(127),
	IN `factory_sn_in` VARCHAR(127),
	IN `descriptor_sn_in` VARCHAR(127),
	IN `object_type_in` VARCHAR(255),
	IN `object_json_in` JSON,
	IN `remote_addr_in` VARCHAR(255),
	IN `checkin_date_in` DATETIME
)
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
	INSERT INTO usbci_unserialized (
		host_name,
		vendor_id,
		product_id,
		serial_number,
		vendor_name,
		product_name,
		product_ver,
		firmware_ver,
		software_id,
		port_number,
		bus_number,
		bus_address,
		buffer_size,
		max_pkt_size,
		usb_spec,
		usb_class,
		usb_subclass,
		usb_protocol,
		device_speed,
		device_ver,
		device_sn,
		factory_sn,
		descriptor_sn,
		object_type,
		object_json,
		remote_addr,
		first_seen,
		last_seen
	)
	VALUES (
		host_name_in,
		vendor_id_in,
		product_id_in,
		serial_number_in,
		vendor_name_in,
		product_name_in,
		product_ver_in,
		firmware_ver_in,
		software_id_in,
		port_number_in,
		bus_number_in,
		bus_address_in,
		buffer_size_in,
		max_pkt_size_in,
		usb_spec_in,
		usb_class_in,
		usb_subclass_in,
		usb_protocol_in, 
		device_speed_in,
		device_ver_in,
		device_sn_in,
		factory_sn_in,
		descriptor_sn_in,
		object_type_in,
		object_json_in,
		remote_addr_in,
		checkin_date_in,
		checkin_date_in
	)
	ON DUPLICATE KEY UPDATE
		-- host_name = host_name_in,
		-- vendor_id = vendor_id_in,
		-- product_id = product_id_in,
		vendor_name = vendor_name_in,
		product_name = product_name_in,
		product_ver = product_ver_in,
		firmware_ver = firmware_ver_in,
		software_id = software_id_in,
		-- port_number = port_number_in,
		-- bus_number = bus_number_in,
		bus_address = bus_address_in,
		buffer_size = buffer_size_in,
		max_pkt_size = max_pkt_size_in,
		usb_spec = usb_spec_in,
		usb_class = usb_class_in,
		usb_subclass = usb_subclass_in,
		usb_protocol = usb_protocol_in,
		device_speed = device_speed_in,
		device_ver = device_ver_in,
		device_sn = device_sn_in,
		factory_sn = factory_sn_in,
		descriptor_sn = descriptor_sn_in,
		object_type = object_type_in,
		object_json = object_json_in,
		remote_addr = remote_addr_in,
		last_seen = checkin_date_in,
		checkins = checkins + 1;
END//
DELIMITER ;

-- Dumping structure for procedure gocmdb.proc_usbci_list_columns
DROP PROCEDURE IF EXISTS `proc_usbci_list_columns`;
DELIMITER //
CREATE PROCEDURE `proc_usbci_list_columns`(
	IN `table_name_in` VARCHAR(64)
)
    DETERMINISTIC
BEGIN
	SELECT column_name
	FROM information_schema.columns
	WHERE table_name = table_name_in
	AND table_schema = 'gocmdb';
END//
DELIMITER ;

-- Dumping structure for procedure gocmdb.proc_usbci_list_tables
DROP PROCEDURE IF EXISTS `proc_usbci_list_tables`;
DELIMITER //
CREATE PROCEDURE `proc_usbci_list_tables`()
    DETERMINISTIC
BEGIN
	SELECT table_name
	FROM information_schema.tables
	WHERE table_schema = 'gocmdb';
END//
DELIMITER ;

-- Dumping structure for table gocmdb.usbci_changes
DROP TABLE IF EXISTS `usbci_changes`;
CREATE TABLE IF NOT EXISTS `usbci_changes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_name` varchar(255) NOT NULL,
  `vendor_id` varchar(4) NOT NULL,
  `product_id` varchar(4) NOT NULL,
  `serial_number` varchar(127) NOT NULL,
  `changes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `audit_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `host_name` (`host_name`),
  KEY `vendor_id` (`vendor_id`),
  KEY `product_id` (`product_id`),
  KEY `serial_number` (`serial_number`),
  CONSTRAINT `CONSTRAINT_1` CHECK (json_valid(`changes`))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table gocmdb.usbci_checkins
DROP TABLE IF EXISTS `usbci_checkins`;
CREATE TABLE IF NOT EXISTS `usbci_checkins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_name` varchar(255) NOT NULL,
  `vendor_id` varchar(4) NOT NULL,
  `product_id` varchar(4) NOT NULL,
  `serial_number` varchar(127) NOT NULL,
  `vendor_name` varchar(127) NOT NULL,
  `product_name` varchar(127) NOT NULL,
  `product_ver` varchar(255) NOT NULL,
  `firmware_ver` varchar(255) NOT NULL,
  `software_id` varchar(255) NOT NULL,
  `port_number` int(10) unsigned NOT NULL,
  `bus_number` int(10) unsigned NOT NULL,
  `bus_address` int(10) unsigned NOT NULL,
  `buffer_size` int(10) unsigned NOT NULL,
  `max_pkt_size` int(10) unsigned NOT NULL,
  `usb_spec` varchar(5) NOT NULL,
  `usb_class` varchar(127) NOT NULL,
  `usb_subclass` varchar(127) NOT NULL,
  `usb_protocol` varchar(127) NOT NULL,
  `device_speed` varchar(127) NOT NULL,
  `device_ver` varchar(5) NOT NULL,
  `device_sn` varchar(127) NOT NULL,
  `factory_sn` varchar(127) NOT NULL,
  `descriptor_sn` varchar(127) NOT NULL,
  `object_type` varchar(255) NOT NULL,
  `object_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `remote_addr` varchar(255) NOT NULL,
  `checkin_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `host_name` (`host_name`),
  KEY `serial_number` (`serial_number`),
  KEY `vendor_id` (`vendor_id`),
  KEY `product_id` (`product_id`),
  KEY `software_id` (`software_id`),
  KEY `firmware_ver` (`firmware_ver`),
  KEY `device_sn` (`device_sn`),
  KEY `factory_sn` (`factory_sn`),
  KEY `product_ver` (`product_ver`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table gocmdb.usbci_snrequests
DROP TABLE IF EXISTS `usbci_snrequests`;
CREATE TABLE IF NOT EXISTS `usbci_snrequests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_name` varchar(255) NOT NULL,
  `vendor_id` varchar(4) NOT NULL,
  `product_id` varchar(4) NOT NULL,
  `serial_number` varchar(127) NOT NULL,
  `vendor_name` varchar(127) NOT NULL,
  `product_name` varchar(127) NOT NULL,
  `product_ver` varchar(255) NOT NULL,
  `firmware_ver` varchar(255) NOT NULL,
  `software_id` varchar(255) NOT NULL,
  `port_number` int(10) unsigned NOT NULL,
  `bus_number` int(10) unsigned NOT NULL,
  `bus_address` int(10) unsigned NOT NULL,
  `buffer_size` int(10) unsigned NOT NULL,
  `max_pkt_size` int(10) unsigned NOT NULL,
  `usb_spec` varchar(5) NOT NULL,
  `usb_class` varchar(127) NOT NULL,
  `usb_subclass` varchar(127) NOT NULL,
  `usb_protocol` varchar(127) NOT NULL,
  `device_speed` varchar(127) NOT NULL,
  `device_ver` varchar(5) NOT NULL,
  `device_sn` varchar(127) NOT NULL,
  `factory_sn` varchar(127) NOT NULL,
  `descriptor_sn` varchar(127) NOT NULL,
  `object_type` varchar(255) NOT NULL,
  `object_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `remote_addr` varchar(255) NOT NULL,
  `request_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `host_name` (`host_name`),
  KEY `serial_number` (`serial_number`),
  KEY `vendor_id` (`vendor_id`),
  KEY `product_id` (`product_id`),
  KEY `software_id` (`software_id`),
  KEY `firmware_ver` (`firmware_ver`),
  KEY `device_sn` (`device_sn`),
  KEY `factory_sn` (`factory_sn`),
  KEY `product_ver` (`product_ver`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table gocmdb.usbci_serialized
DROP TABLE IF EXISTS `usbci_serialized`;
CREATE TABLE IF NOT EXISTS `usbci_serialized` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_name` varchar(255) NOT NULL,
  `vendor_id` varchar(4) NOT NULL,
  `product_id` varchar(4) NOT NULL,
  `serial_number` varchar(127) NOT NULL,
  `vendor_name` varchar(127) NOT NULL,
  `product_name` varchar(127) NOT NULL,
  `product_ver` varchar(255) NOT NULL,
  `firmware_ver` varchar(255) NOT NULL,
  `software_id` varchar(255) NOT NULL,
  `port_number` int(10) unsigned NOT NULL,
  `bus_number` int(10) unsigned NOT NULL,
  `bus_address` int(10) unsigned NOT NULL,
  `buffer_size` int(10) unsigned NOT NULL,
  `max_pkt_size` int(10) unsigned NOT NULL,
  `usb_spec` varchar(5) NOT NULL,
  `usb_class` varchar(127) NOT NULL,
  `usb_subclass` varchar(127) NOT NULL,
  `usb_protocol` varchar(127) NOT NULL,
  `device_speed` varchar(127) NOT NULL,
  `device_ver` varchar(5) NOT NULL,
  `device_sn` varchar(127) NOT NULL,
  `factory_sn` varchar(127) NOT NULL,
  `descriptor_sn` varchar(127) NOT NULL,
  `object_type` varchar(255) NOT NULL,
  `object_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `remote_addr` varchar(255) NOT NULL,
  `first_seen` datetime NOT NULL,
  `last_seen` datetime NOT NULL,
  `checkins` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`vendor_id`,`product_id`,`serial_number`),
  KEY `software_id` (`software_id`),
  KEY `device_sn` (`device_sn`),
  KEY `factory_sn` (`factory_sn`),
  KEY `product_ver` (`product_ver`),
  KEY `host_name` (`host_name`),
  KEY `firmware_ver` (`firmware_ver`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table gocmdb.usbci_unserialized
DROP TABLE IF EXISTS `usbci_unserialized`;
CREATE TABLE IF NOT EXISTS `usbci_unserialized` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_name` varchar(255) NOT NULL,
  `vendor_id` varchar(4) NOT NULL,
  `product_id` varchar(4) NOT NULL,
  `serial_number` varchar(127) DEFAULT NULL,
  `vendor_name` varchar(127) DEFAULT NULL,
  `product_name` varchar(127) DEFAULT NULL,
  `product_ver` varchar(255) NOT NULL,
  `firmware_ver` varchar(255) NOT NULL,
  `software_id` varchar(255) NOT NULL,
  `port_number` int(10) unsigned NOT NULL,
  `bus_number` int(10) unsigned NOT NULL,
  `bus_address` int(10) unsigned NOT NULL,
  `buffer_size` int(10) unsigned NOT NULL,
  `max_pkt_size` int(10) unsigned NOT NULL,
  `usb_spec` varchar(5) NOT NULL,
  `usb_class` varchar(127) NOT NULL,
  `usb_subclass` varchar(127) NOT NULL,
  `usb_protocol` varchar(127) NOT NULL,
  `device_speed` varchar(127) NOT NULL,
  `device_ver` varchar(5) NOT NULL,
  `device_sn` varchar(127) NOT NULL,
  `factory_sn` varchar(127) NOT NULL,
  `descriptor_sn` varchar(127) NOT NULL,
  `object_type` varchar(255) NOT NULL,
  `object_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `remote_addr` varchar(255) NOT NULL,
  `first_seen` datetime NOT NULL,
  `last_seen` datetime NOT NULL,
  `checkins` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`host_name`,`vendor_id`,`product_id`,`port_number`,`bus_number`),
  KEY `software_id` (`software_id`),
  KEY `firmware_ver` (`firmware_ver`),
  KEY `device_sn` (`device_sn`),
  KEY `factory_sn` (`factory_sn`),
  KEY `product_ver` (`product_ver`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table gocmdb.usbmeta_class
DROP TABLE IF EXISTS `usbmeta_class`;
CREATE TABLE IF NOT EXISTS `usbmeta_class` (
  `class_id` varchar(2) NOT NULL,
  `class_desc` varchar(255) NOT NULL,
  `last_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `unique_id` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table gocmdb.usbmeta_product
DROP TABLE IF EXISTS `usbmeta_product`;
CREATE TABLE IF NOT EXISTS `usbmeta_product` (
  `vendor_id` varchar(4) NOT NULL,
  `product_id` varchar(4) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `last_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `unique_id` (`vendor_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table gocmdb.usbmeta_protocol
DROP TABLE IF EXISTS `usbmeta_protocol`;
CREATE TABLE IF NOT EXISTS `usbmeta_protocol` (
  `class_id` varchar(2) NOT NULL DEFAULT '0',
  `subclass_id` varchar(2) NOT NULL DEFAULT '0',
  `protocol_id` varchar(2) NOT NULL DEFAULT '0',
  `protocol_desc` varchar(255) NOT NULL DEFAULT '0',
  `last_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `unique_id` (`class_id`,`subclass_id`,`protocol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table gocmdb.usbmeta_subclass
DROP TABLE IF EXISTS `usbmeta_subclass`;
CREATE TABLE IF NOT EXISTS `usbmeta_subclass` (
  `class_id` varchar(2) NOT NULL DEFAULT '0',
  `subclass_id` varchar(2) NOT NULL DEFAULT '0',
  `subclass_desc` varchar(255) NOT NULL DEFAULT '0',
  `last_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `unique_id` (`class_id`,`subclass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table gocmdb.usbmeta_vendor
DROP TABLE IF EXISTS `usbmeta_vendor`;
CREATE TABLE IF NOT EXISTS `usbmeta_vendor` (
  `vendor_id` varchar(4) NOT NULL,
  `vendor_name` varchar(255) NOT NULL,
  `last_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `unique_id` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for view gocmdb.view_usbci_changes
DROP VIEW IF EXISTS `view_usbci_changes`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_usbci_changes` (
	`host_name` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`vendor_id` VARCHAR(4) NOT NULL COLLATE 'latin1_swedish_ci',
	`product_id` VARCHAR(4) NOT NULL COLLATE 'latin1_swedish_ci',
	`serial_number` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`changes` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin'
) ENGINE=MyISAM;

-- Dumping structure for view gocmdb.view_usbci_checkins
DROP VIEW IF EXISTS `view_usbci_checkins`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_usbci_checkins` (
	`host_name` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`vendor_id` VARCHAR(4) NOT NULL COLLATE 'latin1_swedish_ci',
	`product_id` VARCHAR(4) NOT NULL COLLATE 'latin1_swedish_ci',
	`serial_number` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`vendor_name` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`product_name` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`product_ver` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`firmware_ver` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`software_id` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`port_number` INT(10) UNSIGNED NOT NULL,
	`bus_number` INT(10) UNSIGNED NOT NULL,
	`bus_address` INT(10) UNSIGNED NOT NULL,
	`buffer_size` INT(10) UNSIGNED NOT NULL,
	`max_pkt_size` INT(10) UNSIGNED NOT NULL,
	`usb_spec` VARCHAR(5) NOT NULL COLLATE 'latin1_swedish_ci',
	`usb_class` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`usb_subclass` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`usb_protocol` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`device_speed` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`device_ver` VARCHAR(5) NOT NULL COLLATE 'latin1_swedish_ci',
	`device_sn` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`factory_sn` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`descriptor_sn` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`object_type` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`object_json` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`remote_addr` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view gocmdb.view_usbci_devices
DROP VIEW IF EXISTS `view_usbci_devices`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_usbci_devices` (
	`vendor_id` VARCHAR(4) NOT NULL COLLATE 'latin1_swedish_ci',
	`product_id` VARCHAR(4) NOT NULL COLLATE 'latin1_swedish_ci',
	`vendor_name` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`product_name` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view gocmdb.view_usbci_serialized
DROP VIEW IF EXISTS `view_usbci_serialized`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_usbci_serialized` (
	`host_name` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`vendor_id` VARCHAR(4) NOT NULL COLLATE 'latin1_swedish_ci',
	`product_id` VARCHAR(4) NOT NULL COLLATE 'latin1_swedish_ci',
	`serial_number` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`vendor_name` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`product_name` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`product_ver` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`firmware_ver` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`software_id` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`port_number` INT(10) UNSIGNED NOT NULL,
	`bus_number` INT(10) UNSIGNED NOT NULL,
	`bus_address` INT(10) UNSIGNED NOT NULL,
	`buffer_size` INT(10) UNSIGNED NOT NULL,
	`max_pkt_size` INT(10) UNSIGNED NOT NULL,
	`usb_spec` VARCHAR(5) NOT NULL COLLATE 'latin1_swedish_ci',
	`usb_class` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`usb_subclass` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`usb_protocol` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`device_speed` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`device_ver` VARCHAR(5) NOT NULL COLLATE 'latin1_swedish_ci',
	`device_sn` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`factory_sn` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`descriptor_sn` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`object_type` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`object_json` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`remote_addr` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view gocmdb.view_usbci_snrequests
DROP VIEW IF EXISTS `view_usbci_snrequests`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_usbci_snrequests` (
	`host_name` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`vendor_id` VARCHAR(4) NOT NULL COLLATE 'latin1_swedish_ci',
	`product_id` VARCHAR(4) NOT NULL COLLATE 'latin1_swedish_ci',
	`serial_number` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`vendor_name` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`product_name` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`product_ver` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`firmware_ver` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`software_id` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`port_number` INT(10) UNSIGNED NOT NULL,
	`bus_number` INT(10) UNSIGNED NOT NULL,
	`bus_address` INT(10) UNSIGNED NOT NULL,
	`buffer_size` INT(10) UNSIGNED NOT NULL,
	`max_pkt_size` INT(10) UNSIGNED NOT NULL,
	`usb_spec` VARCHAR(5) NOT NULL COLLATE 'latin1_swedish_ci',
	`usb_class` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`usb_subclass` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`usb_protocol` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`device_speed` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`device_ver` VARCHAR(5) NOT NULL COLLATE 'latin1_swedish_ci',
	`device_sn` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`factory_sn` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`descriptor_sn` VARCHAR(127) NOT NULL COLLATE 'latin1_swedish_ci',
	`object_type` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`object_json` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`remote_addr` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view gocmdb.view_usbci_changes
DROP VIEW IF EXISTS `view_usbci_changes`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_usbci_changes`;
CREATE ALGORITHM=UNDEFINED VIEW `view_usbci_changes` AS SELECT
	host_name,
	vendor_id,
	product_id,
	serial_number,
	changes
FROM
	usbci_changes ;

-- Dumping structure for view gocmdb.view_usbci_checkins
DROP VIEW IF EXISTS `view_usbci_checkins`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_usbci_checkins`;
CREATE ALGORITHM=UNDEFINED VIEW `view_usbci_checkins` AS SELECT
	host_name,
	vendor_id,
	product_id,
	serial_number,
	vendor_name,
	product_name,
	product_ver,
	firmware_ver,
	software_id,
	port_number,
	bus_number,
	bus_address,
	buffer_size,
	max_pkt_size,
	usb_spec,
	usb_class,
	usb_subclass,
	usb_protocol,
	device_speed,
	device_ver,
	device_sn,
	factory_sn,
	descriptor_sn,
	object_type,
	object_json,
	remote_addr
FROM
	usbci_checkins ;

-- Dumping structure for view gocmdb.view_usbci_devices
DROP VIEW IF EXISTS `view_usbci_devices`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_usbci_devices`;
CREATE ALGORITHM=UNDEFINED VIEW `view_usbci_devices` AS SELECT DISTINCT
	vendor_id,
	product_id,
	vendor_name,
	product_name
FROM
	usbci_checkins
ORDER BY
	vendor_id,
	product_id ;

-- Dumping structure for view gocmdb.view_usbci_serialized
DROP VIEW IF EXISTS `view_usbci_serialized`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_usbci_serialized`;
CREATE ALGORITHM=UNDEFINED VIEW `view_usbci_serialized` AS SELECT
	host_name,
	vendor_id,
	product_id,
	serial_number,
	vendor_name,
	product_name,
	product_ver,
	firmware_ver,
	software_id,
	port_number,
	bus_number,
	bus_address,
	buffer_size,
	max_pkt_size,
	usb_spec,
	usb_class,
	usb_subclass,
	usb_protocol,
	device_speed,
	device_ver,
	device_sn,
	factory_sn,
	descriptor_sn,
	object_type,
	object_json,
	remote_addr
FROM
	usbci_serialized ;

-- Dumping structure for view gocmdb.view_usbci_snrequests
DROP VIEW IF EXISTS `view_usbci_snrequests`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_usbci_snrequests`;
CREATE ALGORITHM=UNDEFINED VIEW `view_usbci_snrequests` AS SELECT
	host_name,
	vendor_id,
	product_id,
	serial_number,
	vendor_name,
	product_name,
	product_ver,
	firmware_ver,
	software_id,
	port_number,
	bus_number,
	bus_address,
	buffer_size,
	max_pkt_size,
	usb_spec,
	usb_class,
	usb_subclass,
	usb_protocol,
	device_speed,
	device_ver,
	device_sn,
	factory_sn,
	descriptor_sn,
	object_type,
	object_json,
	remote_addr
FROM
	usbci_snrequests ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
