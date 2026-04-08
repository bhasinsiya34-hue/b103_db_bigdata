CREATE DATABASE hotel_management;

USE hotel_management;

CREATE TABLE customer (
    customer_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE room_type (
    room_type_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(50) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    capacity INT NOT NULL
);

CREATE TABLE room (
    room_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type_id BIGINT,
    status ENUM('AVAILABLE','BOOKED','MAINTENANCE') DEFAULT 'AVAILABLE',
    FOREIGN KEY (room_type_id) REFERENCES room_type(room_type_id)
);

CREATE TABLE staff (
    staff_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150),
    role VARCHAR(50),
    phone VARCHAR(20)
);

CREATE TABLE booking (
    booking_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    customer_id BIGINT NOT NULL,
    room_id BIGINT NOT NULL,
    staff_id BIGINT,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    status ENUM('CONFIRMED','CANCELLED','COMPLETED') DEFAULT 'CONFIRMED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (room_id) REFERENCES room(room_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE payment (
    payment_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    booking_id BIGINT UNIQUE,
    amount DECIMAL(10,2),
    payment_method ENUM('CASH','CARD','UPI'),
    payment_status ENUM('PENDING','PAID') DEFAULT 'PENDING',
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);

CREATE TABLE service (
    service_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    service_name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE booking_service (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    booking_id BIGINT,
    service_id BIGINT,
    quantity INT DEFAULT 1,
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
    FOREIGN KEY (service_id) REFERENCES service(service_id)
);



-- Sample Data

INSERT INTO room_type (type_name, price_per_night, capacity)VALUES ('Single', 10000, 1),('Double', 35000, 2),('Suite', 75000, 4);

INSERT INTO room (room_number, room_type_id)VALUES ('101',1), ('102',1),('201',2), ('202',2),('301',3),('302',3);

INSERT INTO customer (first_name, last_name, email, phone)VALUES ('Rohit','Sharma','rohit@gmail.com','+174123654'),('Riya','Verma','riya@gmail.com','+918523697410'),('Siya','Bhasin','siya01@yopmail.com','+913355668844');

INSERT INTO service (service_name, price)VALUES ('Food',500),('Laundry',200),('Spa',1000);

INSERT INTO staff (name, role, phone)VALUES ('Manager ABC','Manager','8585858585');

INSERT INTO booking (customer_id, room_id, staff_id, check_in, check_out)VALUES (2,3,1,'2026-04-11','2026-04-16');

UPDATE room SET status = 'BOOKED' WHERE room_id = 3;




