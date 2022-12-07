-- Joining Subqueries in FROM
/*
Instruction 1/2
1. Create the subquery to be used in the next step, which selects the country ID and match ID (id) from the match table.
2. Filter the query for matches with greater than or equal to 10 goals.
*/

SELECT 
	-- Select the country ID and match ID
	country_id, 
    Id 
FROM match 
-- Filter for matches with 10 or more goals in total
WHERE (home_goal + away_goal) >= 10;

--------------------------------------------------------------------------


/*
Instruction 2/2
1. Construct a subquery that selects only matches with 10 or more total goals.
2. Inner join the subquery onto country in the main query.
3. Select name from country and count the id column from match.
*/

SELECT
	-- Select country name and the count match IDs
    c.name AS country_name,
    COUNT(sub.id) AS matches
FROM country AS c
-- Inner join the subquery onto country
-- Select the country id and match id columns
INNER JOIN (SELECT country_id, Id 
           FROM match
           -- Filter the subquery by matches with 10+ goals
           WHERE (home_goal + away_goal) >= 10) AS sub
ON c.Id = sub.country_id
GROUP BY country_name;