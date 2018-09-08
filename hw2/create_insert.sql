CREATE TABLE bmh_movies (
    review_id serial NOT NULL PRIMARY KEY,
    reviewer VARCHAR,
    movie VARCHAR,
    score SMALLINT
);

\COPY bmh_movies(reviewer, movie, score) FROM 'movie_scores.csv' WITH DELIMITER ',' CSV HEADER;