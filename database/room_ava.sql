SELECT r.room_id, rt.type_name, r.room_number
FROM room r
JOIN room_type rt ON r.room_type_id = rt.room_type_id
WHERE r.status = 'AVAILABLE'
AND r.room_id NOT IN (
    SELECT room_id FROM booking 
    WHERE (check_in <= '2026-04-16' AND check_out >= '2026-04-11')
    AND status != 'CANCELLED'
);