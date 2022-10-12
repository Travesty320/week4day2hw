CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    isPremiumMEMB BOOLEAN,
    age INTEGER
);
CREATE TABLE tickets(
    ticket_count INTEGER PRIMARY KEY,
    child_ticket NUMERIC(2,2),
    general_ticket NUMERIC(2,2),
    senior_ticket NUMERIC(2,2),
    premium_ticket NUMERIC(2,2),
    customer_id INTEGER,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
CREATE TABLE concessions(
    concession_id SERIAL PRIMARY KEY,
    food_type VARCHAR(25),
    drink_type VARCHAR(25),
    quantity INTEGER,
    customer_id INTEGER,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
CREATE TABLE movies(
    movie_id SERIAL PRIMARY KEY,
    movie_name VARCHAR(50),
    rating VARCHAR(10),
    movie_length NUMERIC(3,2),
    ticket_count INTEGER,
    FOREIGN KEY(ticket_count) REFERENCES tickets(ticket_count)
);
ALTER TABLE tickets
DROP senior_ticket,
DROP child_ticket,
DROP general_ticket,
DROP premium_ticket;

ALTER TABLE tickets
ADD senior_ticket INTEGER;

ALTER TABLE tickets
ADD child_ticket INTEGER,
ADD general_ticket INTEGER,
ADD premium_ticket INTEGER;
