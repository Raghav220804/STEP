SELECT m.title, SUM(b.total_cost) AS total_revenue
FROM Movie m
JOIN Show s ON m.movie_id = s.movie_id
JOIN Booking b ON s.show_id = b.show_id
GROUP BY m.movie_id, m.title
ORDER BY total_revenue DESC;
