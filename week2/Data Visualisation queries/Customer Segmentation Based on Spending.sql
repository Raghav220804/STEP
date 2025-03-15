SELECT u.user_id, u.name, 
       (COALESCE(SUM(b.total_cost), 0) + COALESCE(SUM(fo.total_cost), 0)) AS total_spent,
       CASE 
           WHEN (COALESCE(SUM(b.total_cost), 0) + COALESCE(SUM(fo.total_cost), 0)) >= 5000 THEN 'High Spender'
           WHEN (COALESCE(SUM(b.total_cost), 0) + COALESCE(SUM(fo.total_cost), 0)) BETWEEN 2000 AND 4999 THEN 'Medium Spender'
           ELSE 'Low Spender'
       END AS spending_category
FROM User u
LEFT JOIN Booking b ON u.user_id = b.user_id
LEFT JOIN FoodOrder fo ON u.user_id = fo.booking_id
GROUP BY u.user_id, u.name
ORDER BY total_spent DESC;
