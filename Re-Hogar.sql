-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema re_hogar
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema re_hogar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `re_hogar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `re_hogar` ;

-- -----------------------------------------------------
-- Table `re_hogar`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `re_hogar`.`addresses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `province` VARCHAR(255) NULL DEFAULT NULL,
  `country` VARCHAR(255) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `re_hogar`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `re_hogar`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `re_hogar`.`image_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `re_hogar`.`image_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `re_hogar`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `re_hogar`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `price` DECIMAL(12,2) NOT NULL,
  `discount` INT NULL DEFAULT '0',
  `description` VARCHAR(500) NOT NULL,
  `category_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `product_category_id_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `product_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `re_hogar`.`categories` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `re_hogar`.`images_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `re_hogar`.`images_product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file` VARCHAR(255) NOT NULL,
  `product_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `image_product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `image_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `re_hogar`.`products` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 67
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `re_hogar`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `re_hogar`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `re_hogar`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `re_hogar`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `surname` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `role_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  `image_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `user_role_id_idx` (`role_id` ASC) VISIBLE,
  INDEX `user_address_id_idx` (`address_id` ASC) VISIBLE,
  INDEX `user_image_id_idx` (`image_id` ASC) VISIBLE,
  CONSTRAINT `user_address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `re_hogar`.`addresses` (`id`),
  CONSTRAINT `user_image_id`
    FOREIGN KEY (`image_id`)
    REFERENCES `re_hogar`.`image_user` (`id`),
  CONSTRAINT `user_role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `re_hogar`.`roles` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `re_hogar`.`users`
(
`name`,
`surname`,
`email`,
`password`,
`role_id`,
`address_id`,
`image_id`
)
VALUES
(       
'Hernan',
'Escudero',
'hernanescudero2@gmail.com',
'$2a$10$bH70EZM8fFVad0y61uy3E.GkQ3LhJvripjShgjrT049WlQ5SncyDC',
1,
1,
1),
(
'Marisa',
'Ferrada',
'marisa@gmail.com',
'$2a$10$/lCLK7VxFU7fs7fvwJz8eO9fyqi1KYJS7mNuXhp1VWwVPRoSnn2Wq',
2,
2,
2),
(
'TestUser',
'Test',
'test@gmail.com',
'123123',
2,
2,
2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'user',NULL,NULL),(2,'admin',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
SET FOREIGN_KEY_CHECKS=0;
LOCK TABLES `products` WRITE;
INSERT INTO `products`
(`id`,
`name`,
`price`,
`discount`,
`description`,
`category_id`,
`created_at`,
`updated_at`)
VALUES
(1,'Anthurium',12500.00,15,' El Anturium necesita calor, humedad y buena luminosidad. Sale una flor en la axila de cada hoja en condiciones ideales.',6,NULL,NULL),
(2,'Santa Rita ',850.00,10,'Es un arbusto apoyante espinoso de follaje perenne, a veces caduco en zonas muy frías.',6,NULL,NULL),
(3,'Liagetes erecta jadora',76000.00,0,'Plantín estacional que se utiliza en huerta para ahuyentar los nematodes que afectan a las plantas de Tomate. ',6,NULL,NULL),
(4,'Codiaeum variegatum',11250.00,12,'Croton de hojas más pequeñas, muy oscuras en algunas partes. La luz solar mejora la coloración de las hojas. ',6,NULL,NULL),
(5,'malvón italiano',6000.00,13,'Crece hasta 30 cm de alto y ancho. Se comporta como una perenne. ',6,NULL,NULL),
(6,'dimorphoteca',55000.00,5,'Crece hasta 30 cm de alto y ancho. Se comporta como una perenne. Hay que podarla luego de la floración para que se mantenga prolija. ',6,NULL,NULL),
(7,'Clivia miniata',2500.00,0,'Invierno y Primavera. Varas de flores naranjas, o amarillas, seguidas por frutos rojos que duran hasta el Otoño siguiente.',14,NULL,NULL),
(27,'Codiaeum variegatum',49000.00,5,'Croton de hojas más pequeñas, muy oscuras en algunas partes. La luz solar mejora la coloración de las hojas. ',12,'2023-10-25 00:18:16','2023-10-25 00:18:16'),
(29,'Antirrhinum majus',43000.00,0,'Es un arbusto apoyante espinoso de follaje perenne, a veces caduco en zonas muy frías. Necesita una estructura de soporte para conducirse como trepadora.',13,'2023-10-25 00:21:34','2023-10-25 00:21:34'),
(30,'Lilium ´Stargazer´',135000.00,3,'Planta bulbosa. Plantar los bulbos durante el Otoño, y regar moderadamente. ',12,'2023-10-25 01:20:33','2023-10-25 01:20:33'),
(31,'Rhododendron japonicum',35000.00,0,'Forma un arbusto globoso de hojas perennes. Se puede podar luego de la floración.',7,'2023-10-25 01:21:35','2023-10-25 01:21:35');
UNLOCK TABLES;
LOCK TABLES `image_user` WRITE;
/*!40000 ALTER TABLE `image_user` DISABLE KEYS */;
INSERT INTO `image_user` VALUES (1,'1696631076554_users_.jpg',NULL,NULL),(2,'1696631134852_users_.png',NULL,NULL);
/*!40000 ALTER TABLE `image_user` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Baños y Cocinas',NULL,NULL,NULL),(2,'Electrodomésticos',NULL,NULL,NULL),(3,'Muebles de exterior',NULL,NULL,NULL),(4,'Textil',NULL,NULL,NULL),(5,'Organización y Limpieza',NULL,NULL,NULL),(6,'Herramientas',NULL,NULL,NULL),(7,'Iluminación y Deco',NULL,NULL,NULL),(8,'Jardíny y Aire Libre',NULL,NULL,NULL),(9,'Automotor',NULL,NULL,NULL),(10,'Pisos',NULL,NULL,NULL),(11,'Pinturas',NULL,NULL,NULL),(12,'Aberturas',NULL,NULL,NULL),(13,'Construcción',NULL,NULL,NULL),(14,'Maderas',NULL,NULL,NULL),(15,'Plomería',NULL,NULL,NULL),(16,'Electricidad',NULL,NULL,NULL),(17,'Ferretería',NULL,NULL,NULL),(18,'Otros',NULL,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `images_product` WRITE;
/*!40000 ALTER TABLE `images_product` DISABLE KEYS */;
INSERT INTO `images_product` VALUES (1,'1695947867474_products_.jpg',1,NULL,NULL),(2,'1695950120523_products_.jpg',2,NULL,NULL),(3,'1695950185484_products_.jpg',3,NULL,NULL),(4,'1695950258990_products_.jpg',4,NULL,NULL),(5,'1695950312911_products_.jpg',5,NULL,NULL),(6,'1695950441218_products_.jpg',6,NULL,NULL),(7,'1696002046650_products_.jpg',7,NULL,NULL),(8,'1696260043981_products_.jpg',7,NULL,NULL),(9,'1696260043982_products_.jpg',7,NULL,NULL),(10,'1696260043999_products_.jpg',7,NULL,NULL),(48,'1698193096910_products_.jpg',27,'2023-10-25 00:18:16','2023-10-25 00:18:16'),(49,'1698193096911_products_.jpg',27,'2023-10-25 00:18:16','2023-10-25 00:18:16'),(54,'1698193293995_products_.jpg',29,'2023-10-25 00:21:34','2023-10-25 00:21:34'),(56,'1698193293998_products_.jpg',29,'2023-10-25 00:21:34','2023-10-25 00:21:34'),(57,'1698196833522_products_.jpg',30,'2023-10-25 01:20:33','2023-10-25 01:20:33'),(58,'1698196833523_products_.jpg',30,'2023-10-25 01:20:33','2023-10-25 01:20:33'),(60,'1698196833524_products_.jpg',30,'2023-10-25 01:20:33','2023-10-25 01:20:33'),(61,'1698196895975_products_.jpg',31,'2023-10-25 01:21:36','2023-10-25 01:21:36'),(63,'1698196895987_products_.jpg',31,'2023-10-25 01:21:36','2023-10-25 01:21:36'),(65,'1698196895988_products_.jpg',31,'2023-10-25 01:21:36','2023-10-25 01:21:36');
/*!40000 ALTER TABLE `images_product` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Jose C. Paz','Buenos Aires','Argentina','Calle 123',NULL,NULL),(2,'Palermo','Buenos Aires','Argentina','Calle falsa 123',NULL,NULL);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
