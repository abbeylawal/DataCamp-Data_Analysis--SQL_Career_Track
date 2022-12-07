-- Add a subquery to the SELECT clause

/*Instructions
1. In the subquery, select the average total goals by adding home_goal and away_goal.
2. Filter the results so that only the average of goals in the 2013/2014 season is calculated.
3. In the main query, select the average total goals by adding home_goal and away_goal. This calculates the average goals for each league.
4. Filter the results in the main query the same way you filtered the subquery. Group the query by the league name.
*/


SELECT 
	l.name AS league,
    -- Select and round the league's total goals
    ROUND(AVG(m.home_goal + m.away_goal), 2) AS avg_goals,
    -- Select & round the average total goals for the season
    (SELECT ROUND(AVG(home_goal + away_goal), 2) 
     FROM match
     WHERE season = '2013/2014') AS overall_avg
FROM league AS l
LEFT JOIN match AS m
ON l.country_id = m.country_id
-- Filter for the 2013/2014 season
WHERE season = '2013/2014'
GROUP BY l.name;