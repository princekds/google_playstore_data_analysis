-- Section 1: Market Overview

-- 1. Total Applications
SELECT 
COUNT(*) AS total_apps
FROM apps;

-- 2. Number of Developers
SELECT 
COUNT (DISTINCT developer) AS total_developers
FROM apps;

--3. Average Rating
SELECT ROUND(CAST(AVG(score)AS numeric),2)
AS average_rating FROM apps;

-- 4. Total Estimated Installs
SELECT SUM(estimated_installs) AS total_installs FROM apps;


-- Section 2: App Success Analysis

-- Top 10 Apps by Installs
SELECT title,estimated_installs FROM apps
ORDER BY estimated_installs DESC  LIMIT 10;

-- Most Reviewed Apps
SELECT title,reviews FROM apps
ORDER BY reviews DESC;

-- High Engagement Apps
SELECT title, estimated_installs,reviews FROM apps
ORDER BY reviews DESC
LIMIT 10;

-- Section 3: Category Analysis
-- 1. Number of Apps in Each Genre
SELECT 
genre, COUNT(*) AS total_apps
FROM apps
GROUP BY genre ORDER BY total_apps DESC;

-- 2. Top Genres by Average Installs
SELECT
genre, AVG(estimated_installs) AS average_installs
FROM apps
GROUP BY genre ORDER BY average_installs DESC;

-- 3. Genres with Most Reviews
SELECT
genre, SUM(reviews) AS total_reviews
FROM apps
GROUP BY genre ORDER BY total_reviews DESC;

-- 4. Genres with Apps Rated Above 4.5
SELECT
genre, COUNT(*) AS high_rated_apps
FROM apps
WHERE score > 4.5 GROUP BY genre ORDER BY high_rated_apps DESC;

-- 5. Free Apps by Genre
SELECT
genre, COUNT(*) AS free_apps
FROM apps WHERE free = TRUE
GROUP BY genre ORDER BY free_apps DESC;

-- 6. Paid Apps by Genre
SELECT
genre, COUNT(*) AS paid_apps
FROM apps
WHERE free = FALSE
GROUP BY genre ORDER BY paid_apps DESC;

-- Section 4: Monetization Analysis
-- 1. Average Installs: Free vs Paid Apps
SELECT
CASE WHEN free = TRUE THEN 'Free' ELSE 'Paid'
END AS app_type,
AVG(estimated_installs) AS average_installs
FROM apps
GROUP BY app_type;


-- 2. Most Expensive Apps
SELECT
title, price
FROM apps
WHERE free = FALSE
ORDER BY price DESC
LIMIT 10;

-- 3. Paid Apps Rated Above 4.5
SELECT
title,price,score
FROM apps
WHERE free = FALSE
AND score > 4.5
ORDER BY score DESC;

-- Section 5: Developer Analysis
-- 1. Top Developers by Number of Apps
SELECT
developer, COUNT(*) AS total_apps
FROM apps
GROUP BY developer ORDER BY total_apps DESC
LIMIT 10;

-- 2. Developers with High Rated Apps
SELECT
developer,
COUNT(*) AS high_rated_apps
FROM apps
WHERE score >= 4.5
GROUP BY developer ORDER BY high_rated_apps DESC
LIMIT 10;

-- Section 6: Country Analysis
-- 1. Number of Countries in Dataset
SELECT
COUNT(DISTINCT country) AS total_countries
FROM country_stats;

-- 2. Countries with Most Reviews
SELECT
country,
SUM(reviews) AS total_reviews
FROM country_stats
GROUP BY country
ORDER BY total_reviews DESC
LIMIT 10;



-- select * from apps limit 10