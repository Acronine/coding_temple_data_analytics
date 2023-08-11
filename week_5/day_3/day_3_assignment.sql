CREATE TABLE IF NOT EXISTS salesperson(
  employee_id INTEGER PRIMARY KEY,
  employee_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS customer(
  name VARCHAR(255) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS car(
  serial_number VARCHAR(17) PRIMARY KEY,
  make VARCHAR(100),
  model VARCHAR(100),
  year INTEGER,
  customer_sold_to VARCHAR(255),
  employee_sold_by INTEGER,
  CONSTRAINT sold_by
    FOREIGN KEY(employee_sold_by)
      REFERENCES salesperson(employee_id),
  CONSTRAINT sold_to
    FOREIGN KEY(customer_sold_to)
      REFERENCES customer(name)
);

CREATE TABLE IF NOT EXISTS invoice(
  ticket_number SERIAL PRIMARY KEY,
  given_to VARCHAR(255),
  written_by INTEGER,
  car_serial VARCHAR(17),
  CONSTRAINT written_by_whom
    FOREIGN KEY(written_by)
      REFERENCES salesperson(employee_id),
  CONSTRAINT customer_given
    FOREIGN KEY(given_to)
      REFERENCES customer(name)
);

CREATE TABLE IF NOT EXISTS service_record(
  car_serial_number VARCHAR(17) PRIMARY KEY,
  work_done TEXT
);

CREATE TABLE IF NOT EXISTS mechanic(
  employee_id INTEGER PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS parts(
  part_id INTEGER PRIMARY KEY,
  part_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS service_ticket(
  ticket_number SERIAL PRIMARY KEY,
  car_serial_number VARCHAR(17),
  parts_used INTEGER,
  written_to VARCHAR(255),
  CONSTRAINT wont_exec
    FOREIGN KEY (parts_used)
  	  REFERENCES parts(part_id),
  
  CONSTRAINT serial_service
    FOREIGN KEY(car_serial_number)
      REFERENCES car(serial_number),
  
  CONSTRAINT ticket_taken
	FOREIGN KEY(written_to)
	  REFERENCES customer(name)
);

CREATE TABLE IF NOT EXISTS who_worked_on(
  ticket_number BIGINT UNSIGNED,
  employee_id INTEGER,
  FOREIGN KEY(employee_id)
  REFERENCES mechanic(employee_id),
  FOREIGN KEY(ticket_number)
  REFERENCES service_ticket(ticket_number)
);

DELIMITER //
CREATE PROCEDURE car_bought(
 	IN serial_num VARCHAR(17),
	IN make VARCHAR(100),
	IN model VARCHAR(100),
	IN year INTEGER,
	IN customer_name VARCHAR(255),
	IN employee_id INTEGER
)
BEGIN
	INSERT IGNORE INTO customer(name)
	VALUES(customer_name);
	INSERT INTO car(serial_number,make,model,year,customer_sold_to,employee_sold_by)
	VALUES(serial_num,make,model,year,customer_name,employee_id);
	INSERT INTO invoice(given_to,written_by,car_serial)
    VALUES(customer_name,employee_id,serial_num);
	INSERT INTO service_record(car_serial_number,work_done)
    VALUES(serial_num,"NONE");
    COMMIT;
END //

INSERT IGNORE INTO salesperson(employee_id,employee_name)
VALUES(124,'John');

INSERT IGNORE INTO salesperson(employee_id,employee_name)
VALUES(452,'Marcus');

INSERT IGNORE INTO mechanic(employee_id,name)
VALUES(792,'Alex');

INSERT IGNORE INTO mechanic(employee_id,name)
VALUES(804,'Henry');

INSERT IGNORE INTO parts(part_id, part_name)
VALUES(195652,'red_hood_mazda');

INSERT IGNORE INTO parts(part_id, part_name)
VALUES(1752834,'black_hood_mazda');

CALL car_bought('Afh28u18UTH1MAZD6','Mazda','6',2007,'Harrison',452)
CALL car_bought('ADF82hdashd3TOYSI','Toyota','Sienna',2006,'Jimmy',124)

INSERT IGNORE INTO service_ticket(car_serial_number, parts_used,written_to)
VALUES('ADF82hdashd3TOYSI',NULL,'Jimmy');

INSERT IGNORE INTO service_ticket(car_serial_number, parts_used,written_to)
VALUES('Afh28u18UTH1MAZD6',195652,'Harrison');

INSERT IGNORE INTO who_worked_on(ticket_number, employee_id)
VALUES(1,792);
INSERT IGNORE INTO who_worked_on(ticket_number, employee_id)
VALUES(2,792);
INSERT IGNORE INTO who_worked_on(ticket_number, employee_id)
VALUES(2,804);


