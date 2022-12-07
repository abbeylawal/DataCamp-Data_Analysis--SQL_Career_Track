-- Filtering using Subqueries

/*
Instruction 1/2
Calculate triple the average home + away goals scored across all matches. This will become your subquery in the next step. Note that this column does not have an alias, so it will be called ?column? in your results.

*/


SELECT 
-- Select the average of home + away goals, multiplied by 3
	3 * AVG(home_goal + away_goal)
FROM matches_2013_2014;

-------------------------------------------------------------------------------
/*
Instruction 2/2
1. Select the date, home goals, and away goals in the main query.
2. Filter the main query for matches where the total goals scored exceed the value in the subquery.
*/


SELECT 
	-- Select the date, home goals, and away goals scored
    Date,
	home_goal,
	away_goal
FROM  matches_2013_2014
-- Filter for matches where total goals exceeds 3x the average
WHERE (home_goal + away_goal) > 
       (SELECT 3 * AVG(home_goal + away_goal)
        FROM matches_2013_2014)