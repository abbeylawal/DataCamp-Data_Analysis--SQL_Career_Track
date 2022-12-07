-- Basic Correlated SUBQUERIES

/* Instructions
1. Select the country_id, date, home_goal, and away_goal columns in the main query.
2. Complete the AVG value in the subquery.
3. Complete the subquery column references, so that country_id is matched in the main and subquery.

*/


SELECT 
	-- Select country ID, date, home, and away goals from match
    main.country_id,
    date,
    main.home_goal, 
    main.away_goal
FROM match AS main
WHERE 
	-- Filter the main query by the subquery
	(home_goal + away_goal) > 
        (SELECT AVG((sub.home_goal + sub.away_goal) * 3)
         FROM match AS sub
         -- Join the main query to the subquery in WHERE
         WHERE main.country_id = sub.country_id);