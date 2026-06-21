-- Analiz A: Window Function ilə "Hər ilin ən yaxşı filmi"
WITH ranked_movies AS (
    SELECT title, year, average_rating,
           ROW_NUMBER() OVER(PARTITION BY year ORDER BY average_rating DESC) as sira_no
    FROM imdb_movies
    WHERE num_votes >= 50000
)
SELECT title, year, average_rating
FROM ranked_movies
WHERE sira_no = 1
ORDER BY year DESC;


-- Analiz B: CTE və Subquery ilə "Reytinq kateqoriyalarına görə paylanma"
WITH categorized_movies AS (
    SELECT title, average_rating, num_votes,
           CASE
               WHEN average_rating >= 8.5 THEN 'Efsanevi'
               WHEN average_rating >= 7.5 AND average_rating < 8.5 THEN 'Cox yaxsi'
               WHEN average_rating >= 6.5 AND average_rating < 7.5 THEN 'Yaxsi'
               ELSE 'Orta/Zeif'
           END AS rating
    FROM imdb_movies
)
SELECT rating, COUNT(*) AS total_movies
FROM categorized_movies
WHERE num_votes >= 50000
  AND average_rating > (SELECT AVG(average_rating) FROM imdb_movies WHERE num_votes >= 50000) -- Daxili ortalama bərabərləşdirildi
GROUP BY rating
ORDER BY total_movies DESC;