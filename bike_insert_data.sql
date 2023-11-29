CREATE TABLE `bike` (
  `bikeID` int NOT NULL AUTO_INCREMENT,
  `model` varchar(45) DEFAULT NULL,
  `numberplate` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bikeID`),
  UNIQUE KEY `numberplate_UNIQUE` (`numberplate`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `bike` (`model`, `numberplate`, `type`, `color`) VALUES
('Hybrid Bike', 'JKL321', 'Mixed', 'Silver'),
('Electric Bike', 'MNO456', 'Electric', 'White'),
('BMX Bike', 'PQR789', 'Freestyle', 'Orange'),
('Folding Bike', 'STU987', 'Compact', 'Yellow'),
('Touring Bike', 'VWX123', 'Touring', 'Purple'),
('Kids Bike', 'YZA456', 'Kids', 'Pink'),
('Gravel Bike', 'BCD789', 'Gravel', 'Brown'),
('Triathlon Bike', 'EFG123', 'Triathlon', 'Aqua'),
('Tandem Bike', 'HIJ456', 'Tandem', 'Lime'),
('Fixed Gear Bike', 'KLM789', 'Fixed Gear', 'Turquoise');

select * from bike;