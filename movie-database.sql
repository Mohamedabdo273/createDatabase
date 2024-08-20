-- Create the 'actor' table
CREATE TABLE actor (
    act_id int PRIMARY KEY,
    act_fname CHAR(20),
    act_lname CHAR(20),
    act_gender CHAR(1)
);

-- Create the 'director' table
CREATE TABLE director (
    dir_id int PRIMARY KEY,
    dir_fname CHAR(20),
    dir_lname CHAR(20)
);

-- Create the 'movie' table
CREATE TABLE movie (
    mov_id int PRIMARY KEY,
    mov_title CHAR(50),
    mov_year int,
    mov_time int,
    mov_lang CHAR(50),
    mov_dt_rel DATE,
    mov_rel_country CHAR(5)
);

-- Create the 'movie_cast' table
CREATE TABLE movie_cast (
    act_id int,
    mov_id int,
    role CHAR(30),
    PRIMARY KEY (act_id, mov_id),
    FOREIGN KEY (act_id) REFERENCES actor(act_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

-- Create the 'genres' table
CREATE TABLE genres (
    gen_id int PRIMARY KEY,
    gen_title CHAR(20)
);

-- Create the 'movie_genres' table
CREATE TABLE movie_genres (
    mov_id int,
    gen_id int,
    PRIMARY KEY (mov_id, gen_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
);

-- Create the 'reviewer' table
CREATE TABLE reviewer (
    rev_id int PRIMARY KEY,
    rev_name CHAR(30)
);

-- Create the 'rating' table
CREATE TABLE rating (
    mov_id int,
    rev_id int,
    rev_stars int,
    num_o_ratings int,
    PRIMARY KEY (mov_id, rev_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)
);


-- Create the 'movie_direction' table
CREATE TABLE movie_direction (
    dir_id int,
    mov_id int,
    PRIMARY KEY (dir_id, mov_id),
    FOREIGN KEY (dir_id) REFERENCES director(dir_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);
