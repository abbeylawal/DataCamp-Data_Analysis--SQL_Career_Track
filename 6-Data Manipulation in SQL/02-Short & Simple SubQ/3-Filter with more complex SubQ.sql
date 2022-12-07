-- Filtering with more complex subquery conditions
/*
Instructions
1. Create a subquery in WHERE clause that retrieves all hometeam_ID values from match with a home_goal score greater than or equal to 8.
2. Select the team_long_name and team_short_name from the team table. Include all values from the subquery in the main query
*/


SELECT
	-- Select the team long and short names
	team_long_name,
	team_short_name
FROM team
-- Filter for teams with 8 or more home goals
WHERE team_api_id IN
	  (SELECT hometeam_ID 
       FROM match
       WHERE home_goal >= 8);