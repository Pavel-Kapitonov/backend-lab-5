CREATE TABLE Language (
    language_id INT PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL
);

INSERT INTO Language (language_name) VALUES ('Pascal'), ('C'), ('C++'), ('JavaScript'), ('PHP'), ('Python'), ('Java'), ('Haskell'), ('Clojure'), ('Prolog'), ('Scala');

CREATE TABLE Request (
    request_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    tel VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    dateborn DATE NOT NULL,
    gender ENUM('M','F') NOT NULL,
    bio TEXT,
    agreed BOOLEAN NOT NULL
);

CREATE TABLE Connection (
    request_id INT NOT NULL,
    language_id INT NOT NULL,
    PRIMARY KEY (request_id, language_id),
    FOREIGN KEY (request_id) REFERENCES Request(request_id) ON DELETE CASCADE,
    FOREIGN KEY (language_id) REFERENCES Language(language_id) ON DELETE CASCADE
);


CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    request_id INT NOT NULL,
    login VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    FOREIGN KEY (request_id) REFERENCES Request(request_id) ON DELETE CASCADE
);