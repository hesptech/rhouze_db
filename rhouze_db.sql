

CREATE TABLE `users`
(
    `id_user`           int auto_increment PRIMARY KEY,
    `username`          varchar(40)  NOT NULL,
    `email`             varchar(255) NOT NULL,
    `password`          varchar(255) NOT NULL,
    `active`            tinyint(1)   DEFAULT 0,
    `activation_code`   int(4)       NOT NULL
);


CREATE TABLE `mls_guesses`
(
    `id_mls_guess`      int auto_increment PRIMARY KEY,
    `id_user`           int,
    `mlsNumber`         varchar(20)  NOT NULL,
    `guess_price`       int(20)     NOT NULL,
    `expiryDate`        datetime     NOT NULL,
    `notified`          tinyint(1)   DEFAULT 0
);


CREATE TABLE `favorites`
(
    `id_favorite`      int auto_increment PRIMARY KEY,
    `id_user`          int,
    `mlsNumber`        varchar(20)  NOT NULL 
);

