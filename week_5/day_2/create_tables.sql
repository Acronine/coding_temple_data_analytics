-- Creating auditorium table
CREATE TABLE IF NOT EXISTS auditorium(
	auditorium_id SERIAL PRIMARY KEY,
	seats INTEGER,
	three_d_capable BOOL
);
-- Creating the film table
CREATE TABLE IF NOT EXISTS film(
	film_id SERIAL PRIMARY KEY,
	title VARCHAR(150),
	release_date DATE,
	film_length INTEGER,
	mpaa_rating VARCHAR(5),
	language VARCHAR(20)
);
-- Creating concession table
CREATE TABLE IF NOT EXISTS concession(
	food_id SERIAL PRIMARY KEY,
	food_name VARCHAR(50),
	price NUMERIC(5,2)
);
-- Creating the customers table
CREATE TABLE IF NOT EXISTS customers(
	customer_id SERIAL PRIMARY KEY,
	customer_name VARCHAR(150),
	sex VARCHAR(10)
);
-- Creating the membership table
CREATE TABLE IF NOT EXISTS membership(
	member_id SERIAL PRIMARY KEY,
	level VARCHAR(20),
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
-- Creating the ticket table
CREATE TABLE IF NOT EXISTS ticket(
	ticket_id SERIAL PRIMARY KEY,
	sub_total NUMERIC(5,2),
	auditorium_number INTEGER,
	film INTEGER,
	concessions INTEGER,
	customer_id INTEGER,
	FOREIGN KEY(auditorium_number) REFERENCES auditorium(auditorium_id),
	FOREIGN KEY(film) REFERENCES film(film_id),
	FOREIGN KEY(concessions) REFERENCES concession(food_id),
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);