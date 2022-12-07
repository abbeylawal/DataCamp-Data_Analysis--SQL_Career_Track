-- Correlated subquery with multiple conditions

/* Instructions
1. Select the country_id, date, home_goal, and away_goal columns in the main query.
2. Complete the subquery: Select the matches with the highest number of total goals.
3. Match the subquery to the main query using country_id and season.
4. Fill in the correct logical operator so that total goals equals the max goals recorded in the subquery.
*/

SELECT 
	-- Select country ID, date, home, and away goals from match
	main.country_id,
    main.date,
    main.home_goal,
    main.away_goal
FROM match AS main
WHERE 
	-- Filter for matches with the highest number of goals scored
	(home_goal + away_goal) = 
        (SELECT MAX(sub.home_goal + sub.away_goal)
         FROM match AS sub
         WHERE main.country_id = sub.country_id
               AND main.season = sub.season);