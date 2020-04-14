/*ALLE CREATE TABLE SQL KOMANDOER*/


CREATE TABLE Customer(
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    address VARCHAR(50),
    postal_code VARCHAR(4),
    city VARCHAR(25),
    phone VARCHAR(8) NOT NULL,
    credit_limit INT NOT NULL
);
