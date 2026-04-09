-- Sample Data

INSERT INTO room_type (type_name, price_per_night, capacity)VALUES ('Single', 10000, 1),('Double', 35000, 2),('Suite', 75000, 4);

INSERT INTO room (room_number, room_type_id)VALUES ('101',1), ('102',1),('201',2), ('202',2),('301',3),('302',3);

INSERT INTO customer (first_name, last_name, email, phone)VALUES ('Rohit','Sharma','rohit@gmail.com','+174123654'),('Riya','Verma','riya@gmail.com','+918523697410'),('Siya','Bhasin','siya01@yopmail.com','+913355668844');

INSERT INTO service (service_name, price)VALUES ('Food',500),('Laundry',200),('Spa',1000);

INSERT INTO staff (name, role, phone)VALUES ('Manager ABC','Manager','8585858585');

INSERT INTO booking (customer_id, room_id, staff_id, check_in, check_out)VALUES (2,3,1,'2026-04-11','2026-04-16');

UPDATE room SET status = 'BOOKED' WHERE room_id = 3;
