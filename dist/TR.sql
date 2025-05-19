DELIMITER $$
	create  trigger after_insert_lines
    after insert on hopi_hari_db.lines
    for each row 
    begin
    
		declare wait_time int;
        declare line_count int;
        declare total_wait int;
    

	select waiting_time into wait_time
    from rides 
    where id = NEW.rides_id;
    

select count(users_id) into line_count
from hopi_hari_db.lines
 where rides_id = NEW .rides_id;
 
 set total_wait = wait_time * line_count;
 
insert into notifications (description, status, rides_id, users_id)
values (concat(total_wait, "minutos de espera para o brinquedo"), true,  NEW .rides_id,  NEW .users_id);
END $$
DELIMITER ;