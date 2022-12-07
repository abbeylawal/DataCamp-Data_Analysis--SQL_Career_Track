/*
Basic CASE statements
Instructions
1 - Select the team's long name and API id from the teams_germany table.
2 -Filter the query for FC Schalke 04 and FC Bayern Munich using IN, giving you the team_api_IDs needed for the next step.
*/


SELECT
	-- Select the team long name and team API id
	team_long_name,
	team_api_id
	
FROM teams_germany
-- Only include FC Schalke 04 and FC Bayern Munich
WHERE team_long_name IN ('FC Schalke 04', 'FC Bayern Munich');