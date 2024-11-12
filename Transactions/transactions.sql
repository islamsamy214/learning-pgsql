BEGIN;

INSERT INTO users (name, email) VALUES ('John Doe', 'ss@ss.com');

UPDATE users_count SET count = count + 1 WHERE id = 1;

COMMIT;

-- incase of an error just run the ROLLBACK command
ROLLBACK;