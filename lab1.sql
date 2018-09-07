CREATE DATABASE lab1;
CREATE TABLE users(
  id INT PRIMARY KEY ,
  firstname VARCHAR(50),
  lastname VARCHAR(50)
);
ALTER TABLE users ADD COLUMN isadmin INT;
SELECT * FROM users;
ALTER TABLE users ALTER isadmin TYPE bool USING isadmin::boolean;
ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;

CREATE TABLE tasks(
  id INT PRIMARY KEY ,
  name VARCHAR(50),
  user_id INT
);
SELECT * FROM tasks;
DROP TABLE tasks;
DROP DATABASE lab1;
