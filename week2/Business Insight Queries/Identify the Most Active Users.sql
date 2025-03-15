SELECT u.user_id, u.name, COUNT(b.booking_id) AS total_bookings
FROM User u
JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;
