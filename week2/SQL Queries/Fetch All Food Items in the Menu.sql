SELECT f.item_id, f.name, fs.rate 
FROM FoodItem f 
JOIN FoodItemSize fs ON f.item_id = fs.item_id;
