CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ServiceCenters (
    ServiceCenterID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Rating FLOAT DEFAULT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
	bikeID INT,
    ServiceCenterID INT,
    AppointmentTime DATETIME NOT NULL,
    Status ENUM('Booked', 'Completed', 'Cancelled') NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ServiceCenterID) REFERENCES ServiceCenters(ServiceCenterID),
	FOREIGN KEY (bikeID) REFERENCES BIKE(bikeID)
	
);



CREATE TABLE `bills` (
  `BillID` int NOT NULL AUTO_INCREMENT,
  `AppointmentID` int DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Paid` enum('Yes','No') DEFAULT 'No',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BillID`),
  KEY `AppointmentID` (`AppointmentID`),
  CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`)
) 


CREATE TABLE `bike` (
  `bikeID` int NOT NULL AUTO_INCREMENT,
  `model` varchar(45) DEFAULT NULL,
  `numberplate` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  PRIMARY KEY (`bikeID`),
  UNIQUE KEY `numberplate_UNIQUE` (`numberplate`),
  KEY `FK_CustomerID_idx` (`CustomerID`),
  CONSTRAINT `FK_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) 





CREATE TABLE `rating` (
  `Rating_id` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `ServiceCenterID` int DEFAULT NULL,
  `Rating` float DEFAULT NULL,
  PRIMARY KEY (`Rating_id`),
  KEY `fk_customer_id_idx` (`CustomerID`),
  KEY `fk_servicecenter_id_idx` (`ServiceCenterID`),
  CONSTRAINT `fk_customer_id` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `fk_servicecenter_id` FOREIGN KEY (`ServiceCenterID`) REFERENCES `servicecenters` (`ServiceCenterID`)
) 

