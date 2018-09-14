CREATE  DATABASE  lab2;
CREATE TABLE countrie(
  country_id SERIAL,
  country_name VARCHAR(255),
  region_id INT,
  population INT,
  CONSTRAINT  pKey PRIMARY KEY (country_id)
);
SELECT *FROM countrie;
INSERT INTO countrie VALUES  (DEFAULT ,'Kazakhstan',01,17000000);
INSERT INTO  countrie (country_id,country_name) VALUES (DEFAULT ,'Russia');
INSERT INTO  countrie VALUES (DEFAULT ,'Uzbekistan',NULL ,200000000);
INSERT INTO countrie (country_id,country_name,region_id,population) VALUES (DEFAULT ,'Kyrgyzstan',3,17000000),(DEFAULT ,'Katar',4,15000000),(DEFAULT ,'Chia',6,500000000);
ALTER TABLE  countrie ALTER COLUMN  country_name SET  DEFAULT 'Kazakhstan';
INSERT INTO countrie VALUES  (DEFAULT ,DEFAULT ,08,17000000);
INSERT INTO countrie VALUES (DEFAULT );
CREATE  TABLE  countries_new (
  like  countrie
);
INSERT INTO  countries_new SELECT *FROM  countrie RETURNING*;
UPDATE  countrie SET  region_id=1 WHERE region_id ISNULL ;
UPDATE countrie SET population=population*1.1 RETURNING  country_name,population as "New Population";
DELETE  FROM  countrie WHERE  population <100000000;
DELETE  FROM  countrie AS  c USING  countries_new AS n WHERE  c.country_id=n.country_id returning *;
DELETE FROM countrie;
SELECT *FROM countrie;