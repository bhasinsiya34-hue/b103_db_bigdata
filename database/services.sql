SELECT b.booking_id, c.last_name, s.service_name, bs.quantity
FROM booking b
JOIN customer c ON b.customer_id = c.customer_id
JOIN booking_service bs ON b.booking_id = bs.booking_id
JOIN service s ON bs.service_id = s.service_id;