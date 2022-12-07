-- Filtering your CASE statements

/*Instructions 1.3
Identify Bologna's team ID listed in the teams_italy table by selecting the team_long_name and team_api_id.*/

-- Select team_long_name and team_api_id from team
SELECT
	team_long_name,
	team_api_id
FROM teams_italy
-- Filter for team long name
WHERE team_long_name = 'Bologna';

------------------------------------------------------------------------------------------------------

/*
Instruction 2/3
1.Select the home_goal and away_goal for each match.
2.Use the CASE statement in the WHERE clause to filter all NULL values generated by the statement in the previous step.
*/

-- Select the season and date columns
SELECT 
	season,
	date,
    -- Identify when Bologna won a match
	CASE WHEN hometeam_id = 9857 
          AND home_goal > away_goal 
         THEN 'Bologna Win'
         WHEN awayteam_id = 9857 
          AND away_goal > home_goal 
         THEN 'Bologna Win' 
          END AS outcome
FROM matches_italy;

------------------------------------------------------------------------------------------------------

/*
Instruction 3/3
1.Select the season and date that a match was played.
2.Complete the CASE statement so that only Bologna's home and away wins are identified.
*/


-- Select the season, date, home_goal, and away_goal columns
SELECT 
	season,
    date,
	home_goal,
	away_goal
FROM matches_italy
WHERE 
-- Exclude games not won by Bologna
	CASE WHEN hometeam_id = 9857 AND home_goal > away_goal THEN 'Bologna Win'
		WHEN awayteam_id = 9857 AND away_goal > home_goal THEN 'Bologna Win' 
		END IS NOT NULL;