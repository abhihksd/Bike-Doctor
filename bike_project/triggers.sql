DELIMITER //

CREATE TRIGGER after_insert_rating
AFTER INSERT ON rating FOR EACH ROW
BEGIN
    DECLARE avg_rating FLOAT;

    -- Calculate average rating for the given service center
    SELECT AVG(Rating) INTO avg_rating
    FROM rating
    WHERE ServiceCenterID = NEW.ServiceCenterID;

    -- Update the average rating in the servicecenters table
    UPDATE servicecenters
    SET Rating = avg_rating
    WHERE ServiceCenterID = NEW.ServiceCenterID;

END //

DELIMITER ;
