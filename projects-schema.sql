DROP TABLE project_category;
DROP TABLE category;
DROP TABLE step;
DROP TABLE materials;
DROP TABLE projects;
CREATE TABLE `projects` (
  `project_id` int NOT NULL,
  `project_name` varchar(128) NOT NULL,
  `estimated_hours` decimal(7,2) DEFAULT NULL,
  `actual_hours` decimal(7,2) DEFAULT NULL,
  `difficulty` int DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `materials` (
  `material_id` int NOT NULL,
  `project_id` int NOT NULL,
  `material_name` varchar(128) NOT NULL,
  `num_required` int DEFAULT NULL,
  `cost` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`material_id`),
  KEY `project_id_idx` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `steps` (
  `step_id` int NOT NULL,
  `project_id` int NOT NULL,
  `step_text` text NOT NULL,
  `step_order` int NOT NULL,
  PRIMARY KEY (`step_id`),
  KEY `project_id_idx` (`project_id`),
  CONSTRAINT `project_id` FOREIGN KEY (`project_id`) REFERENCES `materials` (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `category` (
  `category_id` int NOT NULL,
  `category_name` varchar(128) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `product_category` (
  `project_id` int NOT NULL,
  `category_id` int NOT NULL,
  UNIQUE KEY `project_id_UNIQUE` (`project_id`,`category_id`),
  UNIQUE KEY `category_id_UNIQUE` (`category_id`,`project_id`),
  KEY `idx_project_id` (`project_id`),
  KEY `idx_category_id` (`category_id`),
  CONSTRAINT `FK_category_id` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`category_id`),
  CONSTRAINT `FK_project_id` FOREIGN KEY (`project_id`) REFERENCES `product_category` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
