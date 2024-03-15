Select
	r.date,
    staff.first_name,
    staff.last_name,
    staff.hourly_pay,
    sh.start_time,
    sh.end_time,
    HOUR(TIMEDIFF(sh.end_time, sh.start_time)) + ROUND(MINUTE(TIMEDIFF(sh.end_time, sh.start_time))/60, 1) AS hours_in_shift,
    (HOUR(TIMEDIFF(sh.end_time, sh.start_time)) + ROUND(MINUTE(TIMEDIFF(sh.end_time, sh.start_time))/60, 1))*staff.hourly_pay AS staff_cost
From rotations r
Left Join staff
	On r.staff_id = staff.staff_id
Left Join shifts sh
	On r.shift_id = sh.shift_id