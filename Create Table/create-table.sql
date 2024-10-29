CREATE TABLE cities(
    name VARCHAR(50),
    country VARCHAR(50),
    population INTEGER,
    area INTEGER
)

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

-- create an index on the users table
CREATE INDEX user_index
ON users (id);

CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url varchar(255),
    user_id INTEGER REFERENCES users(id)
);
-- Create an index on the photos table
CREATE INDEX photo_index
ON photos (id, user_id);

-- u could also create the foreign key constraint like this
ALTER TABLE photos
ADD CONSTRAINT fk_user_id
FOREIGN KEY (user_id)
REFERENCES users(id);
