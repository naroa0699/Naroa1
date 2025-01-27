CREATE DATABASE ejercicio1;
USE ejercicio1;
CREATE TABLE users (
    id INT8 AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,           
    email VARCHAR(150) NOT NULL UNIQUE,  
    nick VARCHAR(50),                     
    login VARCHAR(50) NOT NULL UNIQUE,    
    password VARCHAR(255) NOT NULL,       
    birthdate DATE
);
CREATE TABLE games (
    id INT8 AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,     -- Especificamos una longitud razonable para el código del juego
    name VARCHAR(100) NOT NULL,
    description TEXT,
    rules TEXT
);
CREATE TABLE avatars (
    id INT8 AUTO_INCREMENT PRIMARY KEY,
    user_id INT8 NOT NULL,
    game_id INT8 NOT NULL,
    appearance TEXT,
    level INT4,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (game_id) REFERENCES games(id)
);
CREATE TABLE matches (
    id INT8 AUTO_INCREMENT PRIMARY KEY,
    game_id INT8 NOT NULL,
    name TEXT NOT NULL,
    password TEXT,
    created_at DATE,
    status TEXT,
    creator_avatar_id INT8,
    FOREIGN KEY (game_id) REFERENCES games(id),
    FOREIGN KEY (creator_avatar_id) REFERENCES avatars(id)
);
CREATE TABLE match_participants (
    match_id INT8 NOT NULL,
    avatar_id INT8 NOT NULL,
    PRIMARY KEY (match_id, avatar_id),
    FOREIGN KEY (match_id) REFERENCES matches(id),
    FOREIGN KEY (avatar_id) REFERENCES avatars(id)
);
CREATE TABLE confrontations (
    id INT8 AUTO_INCREMENT PRIMARY KEY,
    match_id INT8 NOT NULL,
    avatar1_id INT8 NOT NULL,
    avatar2_id INT8 NOT NULL,
    result TEXT,
    FOREIGN KEY (match_id) REFERENCES matches(id),
    FOREIGN KEY (avatar1_id) REFERENCES avatars(id),
    FOREIGN KEY (avatar2_id) REFERENCES avatars(id)
);

