-- Get team names with correlated subqueries

/* Instructions 1/2
Using a correlated subquery in the SELECT statement, match the team_api_id column from team to the hometeam_id from match.
*/

SELECT
    m.date,
   (SELECT team_long_name
    FROM team AS t
    -- Connect the team to the match table
    WHERE t.team_api_id = match.id) AS hometeam
FROM match AS m;

------------------------------------------------------------------------------------

/* Instructions 2/2
Create a second correlated subquery in SELECT, yielding the away team's name.
Select the home and away goal columns from match in the main query.
*/

SELECT
    m.date,
    (SELECT team_long_name
     FROM team AS t
     WHERE t.team_api_id = m.hometeam_id) AS hometeam,
    -- Connect the team to the match table
    (SELECT team_long_name
     FROM team AS t
     WHERE t.team_api_id = m.awayteam_id) AS awayteam,
    -- Select home and away goals
     m.home_goal,
     m.away_goal
FROM match AS m;