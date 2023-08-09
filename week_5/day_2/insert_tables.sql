-- Inserting into the auditorium table
INSERT INTO auditorium(
	auditorium_id,
	seats,
	three_d_capable
)VALUES(
	1,
	80,
	FALSE
);

INSERT INTO auditorium(
	auditorium_id,
	seats,
	three_d_capable
)VALUES(
	2,
	100,
	TRUE
);
-- Inserting into film table
INSERT INTO film(
	film_id,
	title,
	release_date,
	film_length,
	mpaa_rating,
	language
)VALUES(
	1,
	'Doctor Strange in the Multiverse of Madness',
	'2022-05-06',
	126,
	'PG13',
	'English'
);

INSERT INTO film(
	film_id,
	title,
	release_date,
	film_length,
	mpaa_rating,
	language
)VALUES(
	2,
	'The Batman',
	'2022-03-04',
	176,
	'PG13',
	'English'
);
-- Inserting into the concession table
INSERT INTO concession(
	food_id,
	food_name,
	price
)VALUES(
	1,
	'Popcorn',
	8.99
);

INSERT INTO concession(
	food_id,
	food_name,
	price
)VALUES(
	2,
	'Junior Mints',
	10.00
);
-- Inserting into the customer table
INSERT INTO customers(
	customer_id,
	customer_name,
	sex
)VALUES(
	1,
	'Cosmo Kramer',
	'male'
);

INSERT INTO customers(
	customer_id,
	customer_name,
	sex
)VALUES(
	2,
	'George Costanza',
	'male'
);

INSERT INTO customers(
	customer_id,
	customer_name,
	sex
)VALUES(
	3,
	'Elaine Benes',
	'female'
);

INSERT INTO customers(
	customer_id,
	customer_name,
	sex
)VALUES(
	4,
	'Jerry Seinfeld',
	'male'
);
-- Inserting into the membership table
INSERT INTO membership(
	member_id,
	level,
	customer_id
)VALUES(
	1,
	'Festivus',
	1
);

INSERT INTO membership(
	member_id,
	level,
	customer_id
)VALUES(
	2,
	'Festivus',
	4
);
--Inserting into the ticket table
INSERT INTO ticket(
	ticket_id,
	sub_total,
	auditorium_number,
	film,
	concessions,
	customer_id
)VALUES(
	1,
	24.85,
	2,
	1,
	2,
	1
);

INSERT INTO ticket(
	ticket_id,
	sub_total,
	auditorium_number,
	film,
	customer_id
)VALUES(
	2,
	15.45,
	2,
	1,
	1
);