CREATE PROCEDURE `book_appointment` (in p_custid int, in sc_id int, in appointTime datetime)
BEGIN
	insert into appointment( cust_id,sc_id,appoitmentTime,status) values(p_custid,sc_id,appointTime,'booked');
SELECT 'appoitment booked';
    
END
/*DELIMITER //
CREATE PROCEDURE BookAppointment(IN p_customerID INT, IN p_serviceCenterID INT, IN p_appointmentTime DATETIME)
BEGIN
    INSERT INTO Appointments(CustomerID, ServiceCenterID, AppointmentTime, Status) VALUES(p_customerID, p_serviceCenterID, p_appointmentTime, 'Booked');
    SELECT 'Appointment booked successfully';
END //
DELIMITER ;*/