DROP TABLE IF EXISTS tracks;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS budget;

CREATE TABLE budgets; (
  id SERIAL PRIMARY KEY,
  amount INT
);


CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) not null
);

CREATE TABLE merchants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tracks (
  id SERIAL PRIMARY KEY,
  amount INT,
  category_id INT REFERENCES categories(id) ON DELETE CASCADE,
  merchant_id INT REFERENCES merchants(id) ON DELETE CASCADE
);
