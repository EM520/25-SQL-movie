-- question 1 --
SELECT * FROM movies;

-- question 2 --
SELECT id,title FROM movies
WHERE id <= 10;

-- question 3 --
SELECT id,title FROM movies
WHERE id = 485;

-- question 4 --
SELECT id FROM movies
WHERE title = 'Made in America (1993)';

-- question 5 --
SELECT id,title FROM movies
WHERE id<=10
ORDER BY title ASC;

-- question 6 --
SELECT title FROM movies
WHERE title LIKE '%(2002)';

-- question 7 --
SELECT title FROM movies
WHERE title LIKE 'Godfather%';

-- question 8 --
SELECT title,genres FROM movies
WHERE genres LIKE 'Comedy%';

-- question 9 --
SELECT title,genres FROM movies
WHERE title LIKE '%(2000)'AND genres LIKE  'Comedy%' ;

-- question 10 --  Find any movies that are about death and are a comedy
SELECT * FROM movies
WHERE title LIKE '%death%' AND genres LIKE  'Comedy%' ;

-- question 11 --
SELECT  title FROM movies
WHERE title LIKE '%super%(2001)' OR '%super%(2002)';

-- question 12 --
SELECT ratings.rating , movies.title
FROM ratings
INNER JOIN movies
ON ratings.movie_id=movies.id
WHERE title LIKE '%Godfather%'

-- question 13 --
SELECT ratings.rating , movies.title 
FROM ratings
INNER JOIN movies
ON ratings.movie_id=movies.id
WHERE title LIKE '%Godfather%'
ORDER BY ratings.timestamp DESC

-- question 14 --
SELECT movies.title , links.imdb_id
FROM movies
INNER JOIN links
ON movies.id = links.movie_id
WHERE movies.title LIKE '%(2005)' AND movies.genres LIKE 'Comedy%'

-- question 15 --
SELECT movies.title, ratings.rating
FROM movies
LEFT JOIN ratings
ON movies.id = ratings.movie_id
WHERE ratings.rating IS NULL

-- question 16 --
SELECT AVG(rating) ,movie_id
FROM ratings
GROUP BY movie_id

-- question 17 --
SELECT SUM(rating) ,movie_id
FROM ratings
GROUP BY movie_id

-- question 18 --
SELECT COUNT(title) ,genres
FROM movies
GROUP BY genres

-- question 19 --
SELECT AVG(rating) ,user_id
FROM ratings
GROUP BY user_id

-- question 20 --
SELECT COUNT(rating) ,user_id
FROM ratings
GROUP BY user_id
ORDER BY COUNT(rating) DESC;

-- question 21 --
SELECT AVG(rating) ,user_id
FROM ratings
GROUP BY user_id
ORDER BY AVG(rating) DESC
LIMIT 1 ;

-- question 22 --
SELECT AVG(rating) ,COUNT(rating),user_id
FROM ratings
GROUP BY user_id
HAVING COUNT(rating)>50
ORDER BY AVG(rating) DESC
LIMIT 1;

-- question 23 --
SELECT AVG(rating) ,title
FROM ratings
INNER JOIN movies
ON ratings.movie_id = movies.id
WHERE rating >4
GROUP BY movie_id
ORDER BY AVG(rating) DESC