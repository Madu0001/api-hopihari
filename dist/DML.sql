--Inserts de usuarios--
INSERT INTO `users` (`first_name`, `last_name`, `email`, `password`, `birth_date`) VALUES
('Julia','Riveira','julia@gmail.com','12345','2006-01-26');

INSERT INTO `users` (`first_name`, `last_name`, `email`, `password`, `birth_date`) VALUES
('Emanuele','Castro','Manu@gmail.com','54321','2005-08-26');

INSERT INTO `users` (`first_name`, `last_name`, `email`, `password`, `birth_date`) VALUES
('Jessica','Rocha','Jessica@gmail.com','13542','2002-06-11');

--Inserts de brinquedos--
INSERT INTO rides (name, waiting_time, status, area) VALUES
('Montanha Russa','5','disponivel','A');

INSERT INTO rides (name, waiting_time, status, area) VALUES
('Roda Gigante','7','disponivel','A');

INSERT INTO rides (name, waiting_time, status, area) VALUES
('Carrosel','4','disponivel','B');

--Inserts em lines--
INSERT INTO `lines` (rides_id, users_id) VALUES (8, 2);
INSERT INTO `lines` (rides_id, users_id) VALUES (8, 5);
INSERT INTO `lines` (rides_id, users_id) VALUES (9, 2);
INSERT INTO `lines` (rides_id, users_id) VALUES (9, 6);
INSERT INTO `lines` (rides_id, users_id) VALUES (10, 5);
INSERT INTO `lines` (rides_id, users_id) VALUES (10, 6);

--Query--
SELECT 
    users.first_name AS nome, rides.`name` AS atrações, `lines`.*
FROM
    `lines`
        INNER JOIN
    rides ON rides.id = `lines`.rides_id
		INNER JOIN
    users ON users.id = `lines`.users_id;
