-- CREATE VIEW complaints_last_3_months_sum AS
-- SELECT
--     state,
--     product,
--     issue,
--     sub_product,
--     sub_issue,
--     COUNT(*) AS number_of_complaints
-- FROM
--     complaints_table 
-- WHERE
--     date_received >= DATE_SUB(NOW(), INTERVAL 3 MONTH) 
-- GROUP BY
--     state,
--     product,
--     issue,
--     sub_product,
--     sub_issue;




-- DELIMITER //
-- CREATE PROCEDURE migrate_complaints_to_last_3_months(IN date_param DATE)
-- BEGIN
--     DECLARE start_date DATE;
--     DECLARE end_date DATE;
--     SET end_date = DATE(date_param);
--     SET start_date = DATE_SUB(DATE(date_param), INTERVAL 3 MONTH);

--     CREATE TABLE IF NOT EXISTS complaints_last_3_months AS
--     SELECT *
--     FROM complaints_table
--     WHERE date_received BETWEEN start_date AND end_date;
-- END //
-- DELIMITER ;


-- DELIMITER //
-- CREATE TRIGGER update_complaints_last_3_months
-- AFTER INSERT ON complaints_table 
-- FOR EACH ROW
-- BEGIN
--     DECLARE start_date DATE;
--     DECLARE end_date DATE;
--     SET end_date = NEW.date_received;
--     SET start_date = DATE_SUB(NEW.date_received, INTERVAL 3 MONTH);
--     
--     INSERT INTO complaints_last_3_months
--     SELECT *
--     FROM complaints_table
--     WHERE date_received BETWEEN start_date AND end_date;
-- END //
-- DELIMITER ;


DELIMITER //
CREATE TRIGGER insert_complaint_trigger
AFTER INSERT ON complaints_table 
FOR EACH ROW
BEGIN
    DECLARE start_date DATE;
    DECLARE end_date DATE;
    SET end_date = NEW.date_received;
    SET start_date = DATE_SUB(NEW.date_received, INTERVAL 3 MONTH);
    IF NEW.date_received BETWEEN start_date AND end_date THEN
        INSERT INTO complaints_last_3_months
        SELECT * FROM complaints_table WHERE id = NEW.id; 
    END IF;
END //
DELIMITER ;

DROP TRIGGER update_complaints_last_3_months;



