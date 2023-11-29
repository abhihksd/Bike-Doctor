DELIMITER //
CREATE PROCEDURE giveBikeDetails(in b_model varchar(45),in b_numberplate varchar(45), in b_type varchar(45))
BEGIN
    IF EXISTS (SELECT * FROM BIKE WHERE numberplate = b_numberplate ) THEN
        SELECT 'Bike already registered!!';
    ELSE
        INSERT INTO BIKE(model,numberplate,type) VALUES(b_model,b_numberplate,b_type);
        SELECT 'Bike registered successfully :)';
    END IF;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE CreateCustomer(IN p_username VARCHAR(50), IN p_password VARCHAR(255))
BEGIN
    IF EXISTS (SELECT * FROM Customers WHERE Username = p_username) THEN
        SELECT 'Account already created for this username';
    ELSE
        INSERT INTO Customers(Username, Password) VALUES(p_username, p_password);
        SELECT 'Account created successfully for this username';
    END IF;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE CreateServiceCenter(IN p_username VARCHAR(50), IN p_password VARCHAR(255))
BEGIN
    IF EXISTS (SELECT * FROM ServiceCenters WHERE Username = p_username) THEN
        SELECT 'Account already created for this username';
    ELSE
        INSERT INTO ServiceCenters(Username, Password) VALUES(p_username, p_password);
        SELECT 'Account created successfully for this username';
    END IF;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE BookAppointment(IN p_customerID INT, IN p_serviceCenterID INT, IN p_appointmentTime DATETIME)
BEGIN
    INSERT INTO Appointments(CustomerID, ServiceCenterID, AppointmentTime, Status) VALUES(p_customerID, p_serviceCenterID, p_appointmentTime, 'Booked');
    SELECT 'Appointment booked successfully';
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE CompleteAppointment(IN p_appointmentID INT, IN p_amount DECIMAL(10, 2))
BEGIN
    UPDATE Appointments SET Status = 'Completed' WHERE AppointmentID = p_appointmentID;
    INSERT INTO Bills(AppointmentID, Amount) VALUES(p_appointmentID, p_amount);
    SELECT 'Appointment completed and bill generated successfully';
END //
DELIMITER ;

/* Yet to update in database*/

DELIMITER //
CREATE PROCEDURE GiveRating(IN P_ServiceCenterID INT, IN P_Rating FLOAT)
BEGIN
	IF EXISTS (SELECT ServiceCenterID FROM ServiceCenters WHERE ServiceCenterID = P_ServiceCenterID) THEN
		IF P_Rating >=0 AND P_Rating<=5 THEN
			UPDATE ServiceCenters SET Rating = P_Rating WHERE ServiceCenterID=P_ServiceCenterID;
		ELSE
			SELECT 'INVALID ENTER RATING BETWEEN 1 TO 5';
		END IF;
    ELSE
        SELECT 'INVALID ServiceCenterID !!!!';
    END IF;
END //
DELIMITER ;

DELIMITER //
create procedure checkBill(IN P_CustomerID int)
BEGIN
	select concat("Your Total bill is: ",b.amount )
	from bills b, Appointments a 
	where b.AppointmentID=a.AppointmentID and a.CustomerID=P_CustomerID;
END //
DELIMITER ;


/* give rating procedure */
CREATE PROCEDURE GiveRating(In p_customerID INT, IN P_ServiceCenterID INT, IN P_Rating FLOAT)
BEGIN
	IF EXISTS (SELECT ServiceCenterID FROM ServiceCenters WHERE ServiceCenterID = P_ServiceCenterID) THEN
		IF P_Rating >=0 AND P_Rating<=5 THEN
			INSERT into rating (customerID,ServiceCenterID,Rating) values(p_customerID,P_ServiceCenterID,P_Rating);
		ELSE
			SELECT 'INVALID ENTER RATING BETWEEN 1 TO 5';
		END IF;
    ELSE
        SELECT 'INVALID ServiceCenterID !!!!';
    END IF;
END
