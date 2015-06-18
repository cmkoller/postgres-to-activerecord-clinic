DROP TABLE IF EXISTS dogs;
DROP TABLE IF EXISTS owners;

CREATE TABLE dogs (
  name varchar(255) NOT NULL,
  age integer NOT NULL,
  owner_id integer
);

CREATE TABLE owners (
  id integer NOT NULL,
  name varchar(255) NOT NULL
);

INSERT INTO owners (id, name) VALUES (1, 'Alex');
INSERT INTO owners (id, name) VALUES (1, 'Richard');
INSERT INTO owners (id, name) VALUES (1, 'Christina');
