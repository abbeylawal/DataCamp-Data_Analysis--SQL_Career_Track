-- Nest a subquery in FROM

/* Instructions 1/3
Generate a list of matches where at least one team scored 5 or more goals.
*/

-- Select matches where a team scored 5+ goals
SELECT
	country_id,
    season,
	id
FROM match
WHERE home_goal >= 5 
	OR away_goal >= 5;

----------------------------------------------------
/* Instruction 2/3
Turn the query from the previous step into a subquery in the FROM statement.
COUNT the match ids generated in the previous step, and group the query by country_id and season.
*/


-- Count match ids
SELECT
    country_id,
    season,
    COUNT(subquery.id) AS matches
-- Set up and alias the subquery
FROM (
	SELECT
    	country_id,
    	season,
    	id
	FROM match
	WHERE home_goal >= 5 OR away_goal >= 5)
    AS subquery
-- Group by country_id and season
GROUP BY country_id, season;


----------------------------------------------------------------------

/* Instructions 3/3
1. Finally, declare the same query from step 2 as a subquery in FROM with the alias outer_s.
2. Left join it to the country table using the outer query's country_id column.
3. Calculate an AVG of high scoring matches per country in the main query.
*/


SELECT
	c.name AS country,
    -- Calculate the average matches per season
	AVG(outer_s.country_id) AS avg_seasonal_high_scores
FROM country AS c
-- Left join outer_s to country
LEFT JOIN (
  SELECT country_id, season,
         COUNT(id) AS matches
  FROM (
    SELECT country_id, season, id
	FROM match
	WHERE home_goal >= 5 OR away_goal >= 5) AS inner_s
  -- Close parentheses and alias the subquery
  GROUP BY country_id, season) AS outer_s
ON c.id = outer_s.country_id
GROUP BY country;




