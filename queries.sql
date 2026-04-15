-- best_selling_games
SELECT *
FROM game_sales
ORDER BY games_sold DESC
LIMIT 10;

-- critics_top_ten_years
SELECT 
    g.year,
    COUNT(g.name) AS num_games,
    ROUND(AVG(r.critic_score), 2) AS avg_critic_score
FROM game_sales AS g
JOIN reviews AS r
ON g.name = r.name
GROUP BY g.year
HAVING COUNT(g.name) >=4
ORDER BY avg_critic_score DESC
LIMIT 10;

-- golden_years
SELECT 	ac.year,
		ac.num_games,
		ac.avg_critic_score,
		au.avg_user_score,
		ac.avg_critic_score-au.avg_user_score AS diff
FROM critics_avg_year_rating AS ac
JOIN public.users_avg_year_rating AS au
ON ac.year = au.year
WHERE ac.avg_critic_score > 9 OR au.avg_user_score >9
ORDER BY ac.year ASC;
		