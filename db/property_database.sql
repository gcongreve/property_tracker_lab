DROP TABLE IF EXISTS property_tracker;

CREATE TABLE property_tracker (
  id SERIAL4 PRIMARY KEY,
  address VARCHAR(255),
  value INT,
  year_built INT,
  buy_let VARCHAR(255)
);
