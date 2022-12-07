-- ALL the subqueries EVERYWHERE

/*Instructions
1. Extract the average number of home and away team goals in two SELECT subqueries.
2. Calculate the average home and away goals for the specific stage in the main query.
3. Filter both subqueries and the main query so that only data from the 2012/2013 season is included.
4. Group the query by the m.stage column.

*/

SELECT 
	-- Select the stage and average goals for each stage
	m.stage,
    ROUND(AVG(m.home_goal + m.away_goal),2) AS avg_goals,
    -- Select the average overall goals for the 2012/2013 season
    ROUND((SELECT AVG(home_goal + away_goal) 
           FROM match 
           WHERE season = '2012/2013'),2) AS overall
FROM match AS m
-- Filter for the 2012/2013 season
WHERE season = '2012/2013'
-- Group by stage
GROUP BY stage;