USE hopi_hari_db;

DESC hopi_hari_db.lines;
SELECT * FROM users; #5


SELECT * FROM rides; #8
SELECT * FROM hopi_hari_db.lines;

INSERT INTO hopi_hari_db.lines (rides_id, users_id) VALUES (8, 5);

SELECT waiting_time FROM rides WHERE id = 8;
SELECT COUNT(users_id) FROM hopi_hari_db.lines WHERE rides_id = 8;

DELIMITER $$
	CREATE TRIGGER after_insert_lines
    AFTER INSERT ON hopi_hari_db.lines
    FOR EACH ROW
    BEGIN

	DECLARE wait_time INT;
    DECLARE line_count INT;
    DECLARE total_wait INT;
    
    SELECT waiting_time INTO wait_time
    FROM rides
    WHERE id_ride = NEW.rides_id;
    
    SELECT COUNT(id) INTO line_count
    FROM hopi_hari_db.lines
    WHERE rides_id = NEW.rides_id;
    
    SET total_wait = wait_time * line_count;
DELIMITER ;