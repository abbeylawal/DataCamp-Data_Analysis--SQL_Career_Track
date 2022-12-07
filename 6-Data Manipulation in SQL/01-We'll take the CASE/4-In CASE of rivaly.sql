-- In CASE of rivalry
/*
Instructions 1/2
1 - Complete the first CASE statement, identifying Barcelona or Real Madrid as the home team using the hometeam_id column.
2 - Complete the second CASE statement in the same way, using awayteam_id.
*/



SELECT 
	date,
	-- Identify the home team as Barcelona or Real Madrid
	CASE WHEN hometeam_id = 8634 THEN 'FC Barcelona' 
        ELSE 'Real Madrid CF' END AS home,
    -- Identify the away team as Barcelona or Real Madrid
	CASE WHEN awayteam_id = 8634 THEN 'FC Barcelona' 
        ELSE 'Real Madrid CF' END AS away
FROM matches_spain
WHERE (awayteam_id = 8634 OR hometeam_id = 8634)
      AND (awayteam_id = 8633 OR hometeam_id = 8633);



/*
Instructions 2/2
1.Construct the final CASE statement identifying who won each match. Note there are 3 possible outcomes, but 5 conditions that you need to identify.
2.Fill in the logical operators to identify Barcelona or Real Madrid as the winner.
*/


SELECT
	date,
	CASE WHEN hometeam_id = 8634 THEN 'FC Barcelona' 
         ELSE 'Real Madrid CF' END as home,
	CASE WHEN awayteam_id = 8634 THEN 'FC Barcelona' 
         ELSE 'Real Madrid CF' END as away,
	-- Identify all possible match outcomes
	CASE WHEN home_goal > away_goal AND hometeam_id = 8634 THEN 'Barcelona win!'
         WHEN home_goal > away_goal AND hometeam_id = 8633 THEN 'Real Madrid win!'
         WHEN home_goal < away_goal AND awayteam_id = 8634 THEN 'Barcelona win!'
         WHEN home_goal < away_goal AND awayteam_id = 8633 THEN 'Real Madrid win!'
         ELSE 'Tie!' END AS outcome
FROM matches_spain
WHERE (awayteam_id = 8634 OR hometeam_id = 8634)
      AND (awayteam_id = 8633 OR hometeam_id = 8633);