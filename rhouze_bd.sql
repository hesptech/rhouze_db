CREATE TABLE users
(
    id                int auto_increment PRIMARY KEY,
    username          varchar(25)  NOT NULL,
    email             varchar(255) NOT NULL,
    password          varchar(255) NOT NULL,
    active            tinyint(1)            DEFAULT 0,
    activation_code   varchar(255) NOT NULL,
);