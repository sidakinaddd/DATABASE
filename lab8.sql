CREATE DATABASE lab8;

CREATE TABLE salesman (
  salesman_id INTEGER PRIMARY KEY,
  name        VARCHAR(255),
  city        VARCHAR(255),
  commission  FLOAT
);

CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  cust_name   VARCHAR(255),
  city        VARCHAR(255),
  grade       INTEGER,
  salesman_id INTEGER REFERENCES salesman
);

CREATE TABLE orders (
  ord_no      INTEGER,
  purch_amt   FLOAT,
  ord_data    CHAR(10),
  customer_id INTEGER REFERENCES customers,
  salesman_id INTEGER REFERENCES salesman
);

CREATE ROLE junior_dev
  LOGIN;

CREATE VIEW new_yorkers AS
  SELECT *
  FROM salesman
  WHERE city = 'New-York';


CREATE VIEW orders_by_name AS
  SELECT o.ord_no, c.cust_name, s.name
  FROM (orders o
      JOIN customers c USING (customer_id, salesman_id))
         JOIN salesman s USING (salesman_id);

GRANT ALL PRIVILEGES ON orders_by_name TO junior_dev;

CREATE VIEW top_customers AS
  SELECT cust_name
  FROM customers
  WHERE grade = (SELECT grade FROM customers ORDER BY grade DESC LIMIT 1);

GRANT SELECT ON top_customers TO junior_dev;

CREATE VIEW salesman_by_cities AS
  SELECT city, count(*)
  FROM salesman
  WHERE city IS NOT NULL
  GROUP BY city;

CREATE VIEW popular_salesmen AS
  SELECT name
  FROM salesman
  WHERE salesman_id = (SELECT salesman_id FROM customers GROUP BY salesman.salesman_id HAVING count(*) > 1);

CREATE ROLE intern;

GRANT intern TO junior_dev;