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







