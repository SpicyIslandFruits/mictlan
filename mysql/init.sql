CREATE TABLE IF NOT EXISTS accounts
(
    id       SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS roles
(
    id        SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS account_roles
(
    account_id BIGINT UNSIGNED NOT NULL,
    role_id    BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (account_id, role_id),
    FOREIGN KEY (account_id) REFERENCES accounts (id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE
);

CREATE TABLE if not exists profiles
(
    display_name   VARCHAR(255)                NOT NULL,
    account_id     BIGINT UNSIGNED PRIMARY KEY NOT NULL,
    FOREIGN KEY (account_id) REFERENCES accounts (id) ON DELETE CASCADE
);

-- Insert role into roles table if it does not exist
INSERT INTO roles (role_name)
VALUES ('admin')
ON DUPLICATE KEY UPDATE id=id;

-- Insert role into roles table if it does not exist
INSERT INTO roles (role_name)
VALUES ('user')
ON DUPLICATE KEY UPDATE id=id;
